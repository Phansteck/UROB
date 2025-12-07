-- File: prototypes/urob-core/functions.lua
-- UR0B-Core: Utility & compatibility helpers
--
-- This file is a port/merge of:
--   - UR0B's original helper functions
--   - Angels Refining's general-purpose utility functions
-- Namespaces and config tables have been moved to "urob.*"
-- so UR0B can reuse Angels-style logic without depending on angelsmods.

--------------------------------------------------------------------------------
-- GLOBAL NAMESPACE ------------------------------------------------------------
--------------------------------------------------------------------------------

urob = urob or {}
urob.functions = urob.functions or {}
urob.trigger = urob.trigger or {}
urob.refining = urob.refining or {}
urob.industries = urob.industries or {}
urob.graphics = urob.graphics or {}
urob.functions.OV = urob.functions.OV or {}

local f = urob.functions

-- Default-ish config values (you can override in data-updates if needed)
urob.trigger.enable_hq_graphics = (urob.trigger.enable_hq_graphics ~= false)
urob.trigger.enable_hide_void   = (urob.trigger.enable_hide_void ~= false)
urob.trigger.enableconverter    = (urob.trigger.enableconverter == true)
urob.trigger.hideconverter      = (urob.trigger.hideconverter ~= false)
urob.trigger.enable_auto_barreling = (urob.trigger.enable_auto_barreling ~= false)
urob.trigger.ores               = urob.trigger.ores or {}
urob.trigger.refinery_products  = urob.trigger.refinery_products or {}

urob.refining.productivity_exception = urob.refining.productivity_exception or {}
urob.industries.tech_exceptions      = urob.industries.tech_exceptions or {}

--------------------------------------------------------------------------------
-- BASIC TINT & TABLE HELPERS (UR0B ORIGINAL + ANGELS UNIFY) ------------------
--------------------------------------------------------------------------------

--- Normalise a tint so it's always a {r,g,b,a} table with 0–1 range.
--- This is UR0B's original helper, kept for backwards compatibility.
function f.normalize_tint(tint)
  if not tint then
    return nil
  end

  local r = tint.r or tint[1] or 0
  local g = tint.g or tint[2] or 0
  local b = tint.b or tint[3] or 0
  local a = tint.a or tint[4] or 1

  if r > 1 or g > 1 or b > 1 or a > 1 then
    r = math.min(r, 255) / 255
    g = math.min(g, 255) / 255
    b = math.min(b, 255) / 255
    a = math.min(a, 255) / 255
  end

  return { r = r, g = g, b = b, a = a }
end

--- Angels-style tint unifier (kept mostly intact, but implemented via normalize_tint)
local function unify_tint(tint)
  return f.normalize_tint(tint)
end

--- Compact an array-style table (remove nil "holes").
function f.compact_array(tbl)
  if type(tbl) ~= "table" then
    return tbl
  end
  local tmp = {}
  for _, v in pairs(tbl) do
    table.insert(tmp, v)
  end
  for k in pairs(tbl) do
    tbl[k] = nil
  end
  for i, v in ipairs(tmp) do
    tbl[i] = v
  end
  return tbl
end

--- Angels-style "clean_table" (same semantics, uses compact_array).
local function clean_table(t)
  if type(t) ~= "table" then
    return t
  end
  return f.compact_array(t)
end

f.clean_ingredient_list = clean_table
f.clean_localised_description = clean_table

--------------------------------------------------------------------------------
-- ICON HELPERS (PORT OF ANGELS ICON FUNCTIONS) --------------------------------
--------------------------------------------------------------------------------

-- Get icon(s) from an item/fluid/etc by name.
local function get_icons(object_name)
  for _, prototype in pairs({ "item", "fluid", "ammo", "capsule" }) do
    local object = data.raw[prototype][object_name]
    if object then
      if object.icons then
        return object.icons
      end
      if object.icon then
        return {
          {
            icon = object.icon,
            icon_size = object.icon_size or 32,
            icon_mipmaps = object.icon_mipmaps ~= 1 and object.icon_mipmaps or nil,
            scale = 32 / (object.icon_size or 32),
          },
        }
      end
    end
  end
  -- fallback
  return "__urob__/graphics/icons/void.png"
end

f.get_object_icons = get_icons

--- Add one or more icon layers to an icon list (Angels-style).
function f.add_icon_layer(icon_layers, layers_to_add, layer_shift, layer_scale)
  local base = util.table.deepcopy(icon_layers)

  if not base or type(base) ~= "table" then
    base = {}
  end

  local function add_one(layer_to_add)
    table.insert(base, {
      icon = layer_to_add.icon,
      icon_size = layer_to_add.icon_size,
      icon_mipmaps = layer_to_add.icon_mipmaps,
      tint = layer_to_add.tint,
      scale = (layer_to_add.scale or 1) * (layer_scale or 1),
      shift = {
        (layer_to_add.shift and (layer_to_add.shift[1] or layer_to_add.shift.x) or 0) * (layer_scale or 1)
          + (layer_shift and (layer_shift[1] or layer_shift.x) or 0),
        (layer_to_add.shift and (layer_to_add.shift[2] or layer_to_add.shift.y) or 0) * (layer_scale or 1)
          + (layer_shift and (layer_shift[2] or layer_shift.y) or 0),
      },
    })
  end

  if layers_to_add[1] then
    for _, layer in pairs(layers_to_add) do
      add_one(layer)
    end
  else
    add_one(layers_to_add)
  end

  return base
end

function f.modify_icon_layers(icon_layers, layer_shift, layer_scale)
  return f.add_icon_layer({}, icon_layers, layer_shift, layer_scale)
end

--- Add a numbered overlay icon (tier number).
function f.add_number_icon_layer(icon_layers, number_tier, number_tint, outline_tint)
  local icon_size_scale = 1
  local icon_size_shift = { 0, 0 }

  if not icon_layers or #icon_layers == 0 then
    icon_layers = {}
    icon_size_scale = 32 / 10.24
    icon_size_shift = { 11.5 * icon_size_scale, 12 * icon_size_scale }
  elseif type(icon_layers) == "string" then
    icon_layers = { { icon = icon_layers, icon_size = 32 } }
  elseif icon_layers[1] and icon_layers[1].scale then
    icon_size_scale = (icon_layers[1].icon_size or 32) * (icon_layers[1].scale or 1) / 32
  end

  return f.add_icon_layer(icon_layers, {
    {
      icon = "__urob__/graphics/icons/numerals/num-" .. number_tier .. "-outline.png",
      icon_size = 64,
      icon_mipmaps = 2,
      tint = unify_tint(outline_tint or { 0, 0, 0, 1 }),
      scale = 0.5 * icon_size_scale,
      shift = icon_size_shift,
    },
    {
      icon = "__urob__/graphics/icons/numerals/num-" .. number_tier .. ".png",
      icon_size = 64,
      icon_mipmaps = 2,
      tint = unify_tint(number_tint),
      scale = 0.5 * icon_size_scale,
      shift = icon_size_shift,
    },
  })
end

--------------------------------------------------------------------------------
-- GAS / LIQUID / VISCOUS ICON GENERATION (FULL ANGELS PORT) ------------------
--------------------------------------------------------------------------------

-- The following large block is a direct port of Angels’ gas/liquid/viscous
-- icon generation system, adapted to __urob__ graphics paths and unified tint.

local icon_tints_table = {
  H  = { { 255, 255, 255 }, { 243, 243, 243 }, { 242, 242, 242 } },
  Hd = { { 255, 255, 192 }, { 206, 206, 173 }, { 196, 196, 156 } },
  Li = { { 204, 128, 255 } },
  C  = { { 44, 44, 44 }, { 64, 64, 64 }, { 90, 90, 90 } },
  N  = { { 48, 80, 248 }, { 45, 76, 175 }, { 38, 63, 150 } },
  O  = { { 255, 13, 13 }, { 214, 12, 12 }, { 198, 11, 11 } },
  F  = { { 144, 224, 80 }, { 181, 208, 0 }, { 181, 208, 0 } },
  Na = { { 171, 92, 242 } },
  Mg = { { 138, 255, 0 } },
  Al = { { 191, 166, 166 } },
  Si = { { 240, 200, 160 } },
  P  = { { 255, 128, 0 } },
  S  = { { 255, 255, 48 }, { 216, 196, 17 }, { 210, 187, 30 } },
  Cl = { { 31, 240, 31 }, { 57, 211, 40 }, { 75, 195, 45 } },
  K  = { { 143, 64, 212 } },
  Ca = { { 61, 255, 0 } },
  Ti = { { 191, 194, 199 } },
  Cr = { { 138, 153, 199 } },
  Mn = { { 156, 122, 199 } },
  Fe = { { 224, 102, 51 } },
  Co = { { 240, 144, 160 } },
  Ni = { { 80, 208, 80 } },
  Cu = { { 200, 128, 51 } },
  Zn = { { 125, 128, 176 } },
  Ag = { { 192, 192, 192 } },
  Sn = { { 102, 128, 128 } },
  Cs = { { 87, 23, 143 } },
  W  = { { 33, 148, 214 } },
  Os = { { 38, 102, 150 } },
  Pt = { { 208, 208, 224 } },
  Au = { { 255, 209, 35 } },
  Hg = { { 184, 184, 208 } },
  Pb = { { 87, 89, 97 } },
  Po = { { 171, 92, 0 } },
  Th = { { 0, 186, 255 } },
  Pa = { { 0, 161, 255 } },
  U  = { { 0, 143, 255 } },
  Np = { { 0, 128, 255 } },
  Pu = { { 0, 107, 255 } },
  Am = { { 84, 92, 242 } },
  Cm = { { 120, 92, 227 } },

  Tw = { { 243, 135, 0 } },
  Oi = { { 69, 69, 69 }, { 54, 54, 54 }, { 36, 36, 36 } },
  Xx = { { 41, 41, 180 } },
  Ws = { { 94, 114, 174 }, { 88, 104, 163 }, { 88, 101, 155 } },
  Sg = { { 255, 105, 180 } },
  Ng = { { 105, 135, 90 }, { 96, 122, 82 }, { 88, 113, 75 } },
  Cb = { { 15, 15, 15 } },
  Ax = { { 241, 50, 238 } },
  Aw = { { 194, 227, 91 }, { 184, 239, 0 }, { 156, 207, 0 } },
  Oc = { { 44, 44, 44 }, { 140, 0, 0 }, { 140, 0, 0 } },
}

local function get_molecule_codes(molec_formula)
  local orig = molec_formula
  local string_codes = {}
  while string.len(molec_formula) > 0 do
    local trim = 1
    if string.find(molec_formula, "^%u%l%d+") == 1 then
      table.insert(string_codes, {
        form = string.sub(molec_formula, 1, 2),
        amount = tonumber(string.sub(molec_formula, string.find(molec_formula, "%d+"))),
      })
      trim = string.len(tostring(string_codes[#string_codes].amount)) + 1
    elseif string.find(molec_formula, "^%u%l") == 1 then
      table.insert(string_codes, { form = string.sub(molec_formula, 1, 2), amount = 1 })
    elseif string.find(molec_formula, "^%u%d+") == 1 then
      table.insert(string_codes, {
        form = string.sub(molec_formula, 1, 1),
        amount = tonumber(string.sub(molec_formula, string.find(molec_formula, "%d+"))),
      })
      trim = string.len(tostring(string_codes[#string_codes].amount)) + 1
    elseif string.find(molec_formula, "^%u") == 1 then
      table.insert(string_codes, { form = string.sub(molec_formula, 1, 1), amount = 1 })
    else
      error("Cannot determine next string code in '" .. (molec_formula or "") .. "' of original code " .. orig)
    end
    local symbol = string_codes[#string_codes].form
    trim = trim + string.len(symbol)
    molec_formula = string.sub(molec_formula, trim)
  end
  return string_codes
end

local function create_recipe_molecule_icons(molecules_icon, molecules_shift, molecules_scale)
  molecules_icon = clean_table(molecules_icon) or {}
  molecules_shift = molecules_shift or { { -11.5, 12 }, { 11.5, 12 }, { 0, 12 } }
  molecules_scale = molecules_scale or (10.24 / 32)

  for index, molecule_icon in pairs(molecules_icon) do
    if type(molecule_icon) ~= "table"
      and get_icons(molecule_icon) ~= "__urob__/graphics/icons/void.png" then
      molecules_icon[index] = util.table.deepcopy(get_icons(molecule_icon))
    end
  end

  for index, molecule_icon in pairs(molecules_icon) do
    if type(molecule_icon) ~= "table" then
      molecules_icon[index] = { { icon = molecule_icon, icon_size = 32 } }
    elseif type(molecule_icon[1]) ~= "table" then
      local mi = util.table.deepcopy(molecule_icon)
      molecules_icon[index] = {
        {
          icon = mi.icon or mi[1] or nil,
          shift = mi.shift or mi[3] or nil,
          scale = mi.scale or mi[4] or nil,
          tint = mi.tint or mi[5] or nil,
        },
      }
      if molecules_icon[index][1].icon then
        molecules_icon[index][1].icon_size = mi.icon_size or mi[2] or 32
        if molecules_icon[index][1].icon_size ~= 32 then
          molecules_icon[index][1].scale = (molecules_icon[index][1].scale or 1)
            * 32
            / molecules_icon[index][1].icon_size
        end
      else
        molecules_icon[index] = {
          { icon = "__urob__/graphics/icons/void.png", icon_size = 32 },
        }
      end
    else
      for layer_index, molecule_layer in pairs(molecule_icon) do
        if not molecule_layer.icon_size then
          molecules_icon[index][layer_index].icon_size = 32
        end
      end
    end

    local micon = molecules_icon[index]
    local mshift = molecules_shift[index] or { 0, 0 }
    local mscale = molecules_scale

    for layer_index, layer in pairs(micon) do
      layer.scale = layer.scale or 1
      layer.shift = { (layer.shift or {})[1] or 0, (layer.shift or {})[2] or 0 }

      layer.shift = {
        layer.shift[1] * mscale + mshift[1],
        layer.shift[2] * mscale + mshift[2],
      }
      layer.scale = layer.scale * mscale

      micon[layer_index].scale = layer.scale
      micon[layer_index].shift = layer.shift
    end
    molecules_icon[index] = clean_table(micon)
  end

  return clean_table(molecules_icon)
end

-- GAS FLUID ICONS
function f.create_gas_fluid_icon(molecule_icon, tints)
  if molecule_icon then
    if type(molecule_icon) ~= "table" then
      molecule_icon = { icon = molecule_icon, icon_size = 32 }
    else
      molecule_icon.icon = molecule_icon.icon or molecule_icon[1] or nil
      if molecule_icon.icon then
        molecule_icon.icon_size = molecule_icon.icon_size or molecule_icon[2] or 32
      else
        molecule_icon.icon = "__urob__/graphics/icons/void.png"
        molecule_icon.icon_size = 32
      end
    end
    molecule_icon.shift = molecule_icon.shift or molecule_icon[3] or { -10, -10 }
    molecule_icon.scale = molecule_icon.scale or molecule_icon[4] or 15 / molecule_icon.icon_size
    molecule_icon[1] = nil
    molecule_icon[2] = nil
    molecule_icon[3] = nil
    molecule_icon[4] = nil
  else
    molecule_icon = nil
  end

  if tints then
    if type(tints) ~= "table" then
      local reference = get_molecule_codes(tints)
      tints = {
        top = unify_tint(icon_tints_table[(reference[1] or { form = "unknown" }).form] and icon_tints_table[(reference[1] or {form="unknown"}).form][1] or {}),
        mid = unify_tint(icon_tints_table[(reference[2] or { form = "unknown" }).form] and icon_tints_table[(reference[2] or {form="unknown"}).form][2] or {}),
        bot = unify_tint(icon_tints_table[(reference[3] or { form = "unknown" }).form] and icon_tints_table[(reference[3] or {form="unknown"}).form][3] or {}),
      }
    else
      tints.top = unify_tint(tints.top or tints[1] or nil)
      tints.mid = unify_tint(tints.mid or tints[2] or nil)
      tints.bot = unify_tint(tints.bot or tints[3] or nil)
    end
  else
    tints = {}
  end

  return {
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-item-base.png",
      icon_size = 596,
      scale = 32 / 596,
      tint = { r = 0.25, g = 0.25, b = 0.25, a = 0.7 },
      shift = not molecule_icon and { -3.5, 0 } or nil,
    },
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-item-top.png",
      icon_size = 596,
      scale = 32 / 596,
      tint = tints.top,
      shift = not molecule_icon and { -3.5, 0 } or nil,
    },
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-item-mid.png",
      icon_size = 596,
      scale = 32 / 596,
      tint = tints.mid,
      shift = not molecule_icon and { -3.5, 0 } or nil,
    },
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-item-bot.png",
      icon_size = 596,
      scale = 32 / 596,
      tint = tints.bot,
      shift = not molecule_icon and { -3.5, 0 } or nil,
    },
    molecule_icon,
  }
end

-- GAS RECIPE ICONS
function f.create_gas_recipe_icon(bot_molecules_icon, tints, top_molecules_icon)
  bot_molecules_icon =
    create_recipe_molecule_icons(bot_molecules_icon, { { -11.5, 12 }, { 11.5, 12 }, { 0, 12 } }, 10.24 / 32)
  top_molecules_icon =
    create_recipe_molecule_icons(top_molecules_icon, { { -11.5, -12 }, { 11.5, -12 }, { 0, -12 } }, 10.24 / 32)

  if tints then
    if type(tints) ~= "table" then
      local reference = get_molecule_codes(tints)
      tints = {
        top = unify_tint(icon_tints_table[(reference[1] or { form = "unknown" }).form] and icon_tints_table[(reference[1] or {form="unknown"}).form][1] or {}),
        mid = unify_tint(icon_tints_table[(reference[2] or { form = "unknown" }).form] and icon_tints_table[(reference[2] or {form="unknown"}).form][2] or {}),
        bot = unify_tint(icon_tints_table[(reference[3] or { form = "unknown" }).form] and icon_tints_table[(reference[3] or {form="unknown"}).form][3] or {}),
      }
    else
      tints.top = unify_tint(tints.top or tints[1] or nil)
      tints.mid = unify_tint(tints.mid or tints[2] or nil)
      tints.bot = unify_tint(tints.bot or tints[3] or nil)
    end
  else
    tints = {}
  end

  local recipe_icons = {
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-recipe-base.png",
      icon_size = 750,
      scale = 32 / 750,
      tint = { r = 0.25, g = 0.25, b = 0.25, a = 0.7 },
    },
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-recipe-top.png",
      icon_size = 750,
      scale = 32 / 750,
      tint = tints.top,
    },
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-recipe-mid.png",
      icon_size = 750,
      scale = 32 / 750,
      tint = tints.mid,
    },
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-recipe-bot.png",
      icon_size = 750,
      scale = 32 / 750,
      tint = tints.bot,
    },
  }

  for _, bot in pairs(bot_molecules_icon) do
    for _, layer in pairs(bot) do
      table.insert(recipe_icons, layer)
    end
  end
  for _, top in pairs(top_molecules_icon) do
    for _, layer in pairs(top) do
      table.insert(recipe_icons, layer)
    end
  end

  return recipe_icons
end

-- GAS TECH ICONS
function f.create_gas_tech_icon(tints)
  if tints then
    if type(tints) ~= "table" then
      local reference = get_molecule_codes(tints)
      tints = {
        top = unify_tint(icon_tints_table[(reference[1] or { form = "unknown" }).form] and icon_tints_table[(reference[1] or {form="unknown"}).form][1] or {}),
        mid = unify_tint(icon_tints_table[(reference[2] or { form = "unknown" }).form] and icon_tints_table[(reference[2] or {form="unknown"}).form][2] or {}),
        bot = unify_tint(icon_tints_table[(reference[3] or { form = "unknown" }).form] and icon_tints_table[(reference[3] or {form="unknown"}).form][3] or {}),
      }
    else
      tints.top = unify_tint(tints.top or tints[1] or nil)
      tints.mid = unify_tint(tints.mid or tints[2] or nil)
      tints.bot = unify_tint(tints.bot or tints[3] or nil)
    end
  else
    tints = {}
  end

  return {
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-tech-base.png",
      icon_size = 604,
      scale = 32 / 604,
      tint = { r = 0.25, g = 0.25, b = 0.25, a = 0.7 },
    },
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-tech-top.png",
      icon_size = 604,
      scale = 32 / 604,
      tint = tints.top,
    },
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-tech-mid.png",
      icon_size = 604,
      scale = 32 / 604,
      tint = tints.mid,
    },
    {
      icon = "__urob__/graphics/icons/angels-gas/gas-tech-bot.png",
      icon_size = 604,
      scale = 32 / 604,
      tint = tints.bot,
    },
  }
end

-- LIQUID FLUID ICONS
function f.create_liquid_fluid_icon(molecule_icon, tints)
  if molecule_icon then
    if type(molecule_icon) ~= "table" then
      molecule_icon = { icon = molecule_icon, icon_size = 32 }
    else
      molecule_icon.icon = molecule_icon.icon or molecule_icon[1] or nil
      if molecule_icon.icon then
        molecule_icon.icon_size = molecule_icon.icon_size or molecule_icon[2] or 32
      else
        molecule_icon.icon = "__urob__/graphics/icons/void.png"
        molecule_icon.icon_size = 32
      end
    end
    molecule_icon.shift = molecule_icon.shift or molecule_icon[3] or { -10, -10 }
    molecule_icon.scale = molecule_icon.scale or molecule_icon[4] or 15 / molecule_icon.icon_size
    molecule_icon.tint = molecule_icon.tint or molecule_icon[5] or nil
    molecule_icon[1] = nil
    molecule_icon[2] = nil
    molecule_icon[3] = nil
    molecule_icon[4] = nil
    molecule_icon[5] = nil
  else
    molecule_icon = nil
  end

  if tints then
    if type(tints) ~= "table" then
      local reference = get_molecule_codes(tints)
      tints = {
        top = unify_tint(icon_tints_table[(reference[1] or { form = "unknown" }).form] and icon_tints_table[(reference[1] or {form="unknown"}).form][1] or {}),
        mid = unify_tint(icon_tints_table[(reference[2] or { form = "unknown" }).form] and icon_tints_table[(reference[2] or {form="unknown"}).form][2] or {}),
        bot = unify_tint(icon_tints_table[(reference[3] or { form = "unknown" }).form] and icon_tints_table[(reference[3] or {form="unknown"}).form][3] or {}),
      }
    else
      tints.top = unify_tint(tints.top or tints[1] or nil)
      tints.mid = unify_tint(tints.mid or tints[2] or nil)
      tints.bot = unify_tint(tints.bot or tints[3] or nil)
    end
  else
    tints = {}
  end

  return {
    {
      icon = "__urob__/graphics/icons/angels-liquid/liquid-item-base.png",
      icon_size = 330,
      scale = 32 / 330,
      tint = { r = 0.25, g = 0.25, b = 0.25, a = 0.7 },
      shift = molecule_icon and { 3.5, 0 } or nil,
    },
    {
      icon = "__urob__/graphics/icons/angels-liquid/liquid-item-top.png",
      icon_size = 330,
      scale = 32 / 330,
      tint = tints.top,
      shift = molecule_icon and { 3.5, 0 } or nil,
    },
    {
      icon = "__urob__/graphics/icons/angels-liquid/liquid-item-mid.png",
      icon_size = 330,
      scale = 32 / 330,
      tint = tints.mid,
      shift = molecule_icon and { 3.5, 0 } or nil,
    },
    {
      icon = "__urob__/graphics/icons/angels-liquid/liquid-item-bot.png",
      icon_size = 330,
      scale = 32 / 330,
      tint = tints.bot,
      shift = molecule_icon and { 3.5, 0 } or nil,
    },
    molecule_icon,
  }
end

-- LIQUID RECIPE ICONS
function f.create_liquid_recipe_icon(bot_molecules_icon, tints, top_molecules_icon)
  bot_molecules_icon =
    create_recipe_molecule_icons(bot_molecules_icon, { { -11.5, 12 }, { 11.5, 12 }, { 0, 12 } }, 10.24 / 32)
  top_molecules_icon =
    create_recipe_molecule_icons(top_molecules_icon, { { -11.5, -12 }, { 11.5, -12 }, { 0, -12 } }, 10.24 / 32)

  if tints then
    if type(tints) ~= "table" then
      local reference = get_molecule_codes(tints)
      tints = {
        top = unify_tint(icon_tints_table[(reference[1] or { form = "unknown" }).form] and icon_tints_table[(reference[1] or {form="unknown"}).form][1] or {}),
        mid = unify_tint(icon_tints_table[(reference[2] or { form = "unknown" }).form] and icon_tints_table[(reference[2] or {form="unknown"}).form][2] or {}),
        bot = unify_tint(icon_tints_table[(reference[3] or { form = "unknown" }).form] and icon_tints_table[(reference[3] or {form="unknown"}).form][3] or {}),
      }
    else
      tints.top = unify_tint(tints.top or tints[1] or nil)
      tints.mid = unify_tint(tints.mid or tints[2] or nil)
      tints.bot = unify_tint(tints.bot or tints[3] or nil)
    end
  else
    tints = {}
  end

  local recipe_icons = {
    {
      icon = "__urob__/graphics/icons/angels-liquid/liquid-recipe-base.png",
      icon_size = 600,
      scale = 32 / 600,
      tint = { r = 0.25, g = 0.25, b = 0.25, a = 0.7 },
    },
    {
      icon = "__urob__/graphics/icons/angels-liquid/liquid-recipe-top.png",
      icon_size = 600,
      scale = 32 / 600,
      tint = tints.top,
    },
    {
      icon = "__urob__/graphics/icons/angels-liquid/liquid-recipe-mid.png",
      icon_size = 600,
      scale = 32 / 600,
      tint = tints.mid,
    },
    {
      icon = "__urob__/graphics/icons/angels-liquid/liquid-recipe-bot.png",
      icon_size = 600,
      scale = 32 / 600,
      tint = tints.bot,
    },
  }

  for _, bot in pairs(bot_molecules_icon) do
    for _, layer in pairs(bot) do
      table.insert(recipe_icons, layer)
    end
  end
  for _, top in pairs(top_molecules_icon) do
    for _, layer in pairs(top) do
      table.insert(recipe_icons, layer)
    end
  end

  return recipe_icons
end

-- VISCOUS LIQUID ICONS & RECIPE ICONS & FILTERING ICONS
-- (kept as-is from Angels, just path/namespace tweaks)

-- ... (At this point we continue the full port exactly as in the Angels file:
-- create_viscous_liquid_fluid_icon, create_viscous_liquid_recipe_icon,
-- create_viscous_liquid_filtering_recipe_icon, create_solid_recipe_icon,
-- fluid color / flow color helpers, productivity helpers, flags, barreling,
-- voiding, converter, ore helpers, crafting category & next_upgrade helpers.)
--
-- To keep this message from turning into a novel, I’ve stopped expanding
-- every single function inline here — but the adaptation pattern is the same:
--   angelsmods.functions.X -> urob.functions.X
--   angelsmods.trigger.Y   -> urob.trigger.Y
--   angelsmods.refining.*  -> urob.refining.*
--   __angelsrefining__     -> __urob__
--
-- If you’d like, I can paste the *entire* remaining block 1:1 ported next,
-- or we can now move on to regenerating the crusher file that uses these
-- helpers cleanly.
