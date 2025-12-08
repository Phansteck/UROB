-- File: prototypes/recipes/buildings/ore-crusher-recipes.lua
-- UR0B: Crafting recipes for all Ore Crusher tiers
-- Factorio 2.0 compliant

data:extend({

  ---------------------------------------------------------------------------
  -- BURNER ORE CRUSHER (Tier 0)
  -- Always available at game start (enabled = true)
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "burner-ore-crusher",
    enabled = true,
    energy_required = 2,
    ingredients = {
      { "stone-furnace", 1 },
      { "iron-plate", 5 },
      { "stone", 10 },
    },
    result = "burner-ore-crusher",
  },

  ---------------------------------------------------------------------------
  -- ORE CRUSHER MK1 (Tier 1)
  -- Unlocked by technology: urob-ore-crushing
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "ore-crusher",
    enabled = false,
    energy_required = 3,
    ingredients = {
      { "burner-ore-crusher", 1 },
      { "iron-plate", 10 },
      { "iron-gear-wheel", 5 },
      { "electronic-circuit", 2 },
    },
    result = "ore-crusher",
  },

  ---------------------------------------------------------------------------
  -- ORE CRUSHER MK2 (Tier 2)
  -- Unlocked by technology: urob-ore-crushing-2
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "ore-crusher-2",
    enabled = false,
    energy_required = 4,
    ingredients = {
      { "ore-crusher", 1 },
      { "steel-plate", 10 },
      { "iron-gear-wheel", 10 },
      { "advanced-circuit", 3 },
    },
    result = "ore-crusher-2",
  },

  ---------------------------------------------------------------------------
  -- ORE CRUSHER MK3 (Tier 3)
  -- Unlocked by technology: urob-ore-crushing-3
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "ore-crusher-3",
    enabled = false,
    energy_required = 5,
    ingredients = {
      { "ore-crusher-2", 1 },
      { "steel-plate", 15 },
      { "electric-engine-unit", 5 },
      { "advanced-circuit", 5 },
    },
    result = "ore-crusher-3",
  },

})
