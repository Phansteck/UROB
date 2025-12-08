-- File: prototypes/recipes/buildings/ore-crusher-recipes.lua
-- UR0B: Crafting recipes for all Ore Crusher tiers
-- Fully Factorio 2.0 + Quality mod compliant

data:extend({

  ---------------------------------------------------------------------------
  -- BURNER ORE CRUSHER (Tier 0)
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "burner-ore-crusher",
    enabled = true,
    energy_required = 2,
    ingredients = {
      { type = "item", name = "stone-furnace", amount = 1 },
      { type = "item", name = "iron-plate", amount = 5 },
      { type = "item", name = "stone", amount = 10 },
    },
    results = {
      { type = "item", name = "burner-ore-crusher", amount = 1 },
    }
  },

  ---------------------------------------------------------------------------
  -- ORE CRUSHER MK1 (Tier 1)
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "ore-crusher",
    enabled = false,
    energy_required = 3,
    ingredients = {
      { type = "item", name = "burner-ore-crusher", amount = 1 },
      { type = "item", name = "iron-plate", amount = 10 },
      { type = "item", name = "iron-gear-wheel", amount = 5 },
      { type = "item", name = "electronic-circuit", amount = 2 },
    },
    results = {
      { type = "item", name = "ore-crusher", amount = 1 },
    }
  },

  ---------------------------------------------------------------------------
  -- ORE CRUSHER MK2 (Tier 2)
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "ore-crusher-2",
    enabled = false,
    energy_required = 4,
    ingredients = {
      { type = "item", name = "ore-crusher", amount = 1 },
      { type = "item", name = "steel-plate", amount = 10 },
      { type = "item", name = "iron-gear-wheel", amount = 10 },
      { type = "item", name = "advanced-circuit", amount = 3 },
    },
    results = {
      { type = "item", name = "ore-crusher-2", amount = 1 },
    }
  },

  ---------------------------------------------------------------------------
  -- ORE CRUSHER MK3 (Tier 3)
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "ore-crusher-3",
    enabled = false,
    energy_required = 5,
    ingredients = {
      { type = "item", name = "ore-crusher-2", amount = 1 },
      { type = "item", name = "steel-plate", amount = 15 },
      { type = "item", name = "electric-engine-unit", amount = 5 },
      { type = "item", name = "advanced-circuit", amount = 5 },
    },
    results = {
      { type = "item", name = "ore-crusher-3", amount = 1 },
    }
  },

})
