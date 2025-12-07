--------------------------------------------------------------------------------
-- File: prototypes/urob-core/functions.lua
-- Purpose: Core utility helpers for the UR0B (Unified Refining Oversight Bureau) mod.
-- Notes:
--   - Inspired by Angels' utility functions, but rewritten and simplified
--     for Factorio 2.0 and for UR0B's needs only.
--   - This module should contain ONLY generic helpers that are useful across
--     multiple UR0B systems (crushing, sorting, refining, smelting, etc).
--------------------------------------------------------------------------------

-- Global namespace for UR0B helpers.
urob = urob or {}
urob.functions = urob.functions or {}

local f = urob.functions

--------------------------------------------------------------------------------
-- TINT HANDLING ---------------------------------------------------------------
--------------------------------------------------------------------------------

--- Normalise a tint so it's always a {r,g,b,a} table with 0–1 range.
--- Accepts:
---   - {r=..., g=..., b=..., a=?}
---   - {r,g,b[,a]}
---   - or 0–255 values (will be scaled to 0–1)
--- Returns:
---   - {r,g,b,a} or nil if input is nil.
function f.normalize_tint(tint)
  if not tint then
    return nil
  end

  local r = tint.r or tint[1] or 0
  local g = tint.g or tint[2] or 0
  local b = tint.b or tint[3] or 0
  local a = tint.a or tint[4] or 1

  -- If any channel is > 1, assume 0–255 range and scale down.
  if r > 1 or g > 1 or b > 1 or a > 1 then
    r = math.min(r, 255) / 255
    g = math.min(g, 255) / 255
    b = math.min(b, 255) / 255
    a = math.min(a, 255) / 255
  end

  return { r = r, g = g, b = b, a = a }
end

--------------------------------------------------------------------------------
-- TABLE HELPERS ---------------------------------------------------------------
--------------------------------------------------------------------------------

--- Compact a table into a sequence (remove "holes" / nil entries).
--- Returns the same table reference, cleaned.
function f.compact_array(tbl)
  if type(tbl) ~= "table" then
    return tbl
  end

  local tmp = {}
  for _, v in pairs(tbl) do
    table.insert(tmp, v)
  end

  -- overwrite original in-place
  for k in pairs(tbl) do
    tbl[k] = nil
  end
  for i, v in ipairs(tmp) do
    tbl[i] = v
  end

  return tbl
end

--------------------------------------------------------------------------------
-- ICON HELPERS ----------------------------------------------------------------
--------------------------------------------------------------------------------

--- Add one or more icon layers to an icon list.
--- icon_layers : array of icon definitions (or nil to start new)
--- new_layers  : array of icon definitions
--- Returns a new table (does not modify original argument tables).
function f.add_icon_layer(icon_layers, new_layers)
  local result = {}

  if type(icon_layers) == "table" then
    for _, layer in ipairs(icon_layers) do
      table.insert(result, layer)
    end
  elseif type(icon_layers) == "string" then
    -- Allow passing a bare icon path as "icon_layers"
    table.insert(result, { icon = icon_layers, icon_size = 32 })
  end

  if type(new_layers) == "table" then
    -- allow single layer or array of layers
    if new_layers.icon then
      table.insert(result, new_layers)
    else
      for _, layer in ipairs(new_layers) do
        table.insert(result, layer)
      end
    end
  end

  return result
end

--- Add a numbered overlay icon (for machine tiers etc).
--- Parameters:
---   icon_layers : existing icon layers (or nil / string)
---   number      : integer tier (1,2,3,...)
---   number_tint : tint for the number foreground
---   outline_tint: optional tint for the outline (default black)
---
--- NOTE:
---   - This expects UR0B numeral graphics at:
---       __UR0B__/graphics/icons/numerals/num-<n>-outline.png
---       __UR0B__/graphics/icons/numerals/num-<n>.png
function f.add_number_icon_layer(icon_layers, number, number_tint, outline_tint)
  local layers = icon_layers
  local scale_factor = 1
  local base_shift = { 0, 0 }

  -- Normalise base icon-layout information.
  if not layers then
    layers = {}
    -- If there is no base icon, assume 32px and scale the number accordingly.
    scale_factor = 32 / 10.24
    base_shift = { 11.5 * scale_factor, 12 * scale_factor }
  elseif type(layers) == "string" then
    layers = { { icon = layers, icon_size = 32 } }
  elseif layers[1] and layers[1].icon_size then
    local icon_size = layers[1].icon_size or 32
    local base_scale = layers[1].scale or 1
    scale_factor = (icon_size * base_scale) / 32
  end

  local fg_tint = f.normalize_tint(number_tint or { 1, 1, 1, 1 })
  local outline = f.normalize_tint(outline_tint or { 0, 0, 0, 1 })

  local numeral_layers = {
    {
      icon = "__UR0B__/graphics/icons/numerals/num-" .. number .. "-outline.png",
      icon_size = 64,
      scale = 0.5 * scale_factor,
      shift = base_shift,
      tint = outline,
    },
    {
      icon = "__UR0B__/graphics/icons/numerals/num-" .. number .. ".png",
      icon_size = 64,
      scale = 0.5 * scale_factor,
      shift = base_shift,
      tint = fg_tint,
    },
  }

  return f.add_icon_layer(layers, numeral_layers)
end

--------------------------------------------------------------------------------
-- PRODUCTIVITY HELPERS --------------------------------------------------------
--------------------------------------------------------------------------------

--- Allow productivity modules to apply to a given recipe.
--- NOTE:
---   - This uses only base module data; no external exception lists.
---   - If you later want exceptions (like Angels does), we can add a
---     urob.productivity_exception table and respect it here.
function f.allow_productivity(recipe_name)
  local recipe = data.raw.recipe[recipe_name]
  if not recipe then
    return
  end

  for _, module in pairs(data.raw.module) do
    if module.effect and module.effect.productivity and module.limitation then
      table.insert(module.limitation, recipe_name)
    end
  end
end
