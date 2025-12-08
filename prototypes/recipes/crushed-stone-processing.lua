-- File: prototypes/recipes/crushed-stone-processing.lua
-- Angels-style crushed stone → stone conversion
-- 2 crushed stone = 1 stone
-- Can be crafted by hand and in assembling machines.

data:extend({
  {
    type = "recipe",
    name = "urob-crushed-stone-to-stone",
    category = "crafting",          -- hand crafting + early assemblers
    subgroup = "urob-ore-crushed",
    order = "e[stone]",
    enabled = true,
    energy_required = 0.5,
    ingredients = {
      { type = "item", name = "urob-crushed-stone", amount = 2 },
    },
    results = {
      { type = "item", name = "stone", amount = 1 },
    },
    icons = {
      { icon = "__base__/graphics/icons/stone.png", icon_size = 64 }
    }
  },
})
