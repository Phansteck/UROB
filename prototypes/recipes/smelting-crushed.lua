-- File: prototypes/recipes/smelting-crushed.lua
-- Early-game Angels-style smelting of crushed ores (fallback tier)
-- Ratio: 2 crushed → 1 plate

data:extend({

  ---------------------------------------------------------------------------
  -- Iron Plate from Crushed Iron
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "urob-smelting-crushed-iron",
    category = "smelting",
    subgroup = "urob-smelting",
    order = "a[iron]",
    energy_required = 3.2, -- vanilla smelting time
    enabled = true, -- enable early game
    ingredients = {
      { type = "item", name = "urob-crushed-iron", amount = 2 }
    },
    results = {
      { type = "item", name = "iron-plate", amount = 1 }
    },
    icons = {
      { icon = "__base__/graphics/icons/iron-plate.png", icon_size = 64 }
    }
  },

  ---------------------------------------------------------------------------
  -- Copper Plate from Crushed Copper
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "urob-smelting-crushed-copper",
    category = "smelting",
    subgroup = "urob-smelting",
    order = "b[copper]",
    energy_required = 3.2,
    enabled = true,
    ingredients = {
      { type = "item", name = "urob-crushed-copper", amount = 2 }
    },
    results = {
      { type = "item", name = "copper-plate", amount = 1 }
    },
    icons = {
      { icon = "__base__/graphics/icons/copper-plate.png", icon_size = 64 }
    }
  },

  ---------------------------------------------------------------------------
  -- Uranium ore has no smelting fallback in Angels
  ---------------------------------------------------------------------------

})
