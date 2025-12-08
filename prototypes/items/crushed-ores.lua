-- File: prototypes/items/crushed-ores.lua
-- Purpose: Crushed ore item definitions for UR0B.
-- Uses a neutral greyscale crushed ore icon tinted via urob_colors (commons.lua).

local colors = urob_colors

local base_icon = "__urob__/graphics/icons/crushed-ore.png"

local function crushed(name, tint, order)
  return {
    type = "item",
    name = "urob-crushed-" .. name,
    icons = {{
      icon = base_icon,
      icon_size = 32,
      tint = tint
    }},
    subgroup = "urob-ore-crushed",
    order = order,
    stack_size = 200
  }
end

data:extend({

  ---------------------------------------------------------------------------
  -- Crushed Iron
  ---------------------------------------------------------------------------
  crushed("iron", colors.iron, "a[iron]"),

  ---------------------------------------------------------------------------
  -- Crushed Copper
  ---------------------------------------------------------------------------
  crushed("copper", colors.copper, "b[copper]"),

  ---------------------------------------------------------------------------
  -- Crushed Stone (no tint – stays neutral grey)
  ---------------------------------------------------------------------------
  crushed("stone", nil, "c[stone]"),

  ---------------------------------------------------------------------------
  -- Crushed Uranium
  ---------------------------------------------------------------------------
  crushed("uranium", colors.uranium, "d[uranium]"),

})
