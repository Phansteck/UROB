-- File: prototypes/recipes/buildings/ore-crusher-recipes.lua
-- Crafting recipes for all Ore Crusher tiers

data:extend({

  -- Burner Ore Crusher
  {
    type = "recipe",
    name = "burner-ore-crusher",
    enabled = true,
    energy_required = 2,
    ingredients = {
      { "stone-furnace", 1 },
      { "iron-plate", 5 },
    },
    result = "burner-ore-crusher",
  },

  -- Ore Crusher (MK1)
  {
    type = "recipe",
    name = "ore-crusher",
    enabled = false,
    energy_required = 3,
    ingredients = {
      { "burner-ore-crusher", 1 },
      { "iron-plate", 10 },
      { "iron-gear-wheel", 5 },
    },
    result = "ore-crusher",
  },

  -- Ore Crusher (MK2)
  {
    type = "recipe",
    name = "ore-crusher-2",
    enabled = false,
    energy_required = 3,
    ingredients = {
      { "ore-crusher", 1 },
      { "steel-plate", 10 },
      { "iron-gear-wheel", 5 },
    },
    result = "ore-crusher-2",
  },

  -- Ore Crusher (MK3)
  {
    type = "recipe",
    name = "ore-crusher-3",
    enabled = false,
    energy_required = 3,
    ingredients = {
      { "ore-crusher-2", 1 },
      { "steel-plate", 15 },
      { "advanced-circuit", 5 },
    },
    result = "ore-crusher-3",
  },

})
