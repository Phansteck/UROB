-- File: prototypes/recipes/crushing.lua
-- UR0B: Vanilla ore → crushed ore recipes (Angels-style ratios).
-- Ratios: 2 raw ore → 2 crushed ore + 1 crushed stone

local icons = {
  iron   = "__urob__/graphics/icons/crushed-ore.png",
  copper = "__urob__/graphics/icons/crushed-ore.png",
  stone  = "__urob__/graphics/icons/crushed-ore.png",
  uranium= "__urob__/graphics/icons/crushed-ore.png",
}

data:extend({

  ---------------------------------------------------------------------------
  -- Iron Ore Crushing
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "urob-crushing-iron",
    category = "urob-crushing",
    subgroup = "urob-ore-crushing",
    order = "a[iron]",
    icons = {
      { icon = icons.iron,   icon_size = 32 } -- base crushed ore icon
    },
    energy_required = 1,
    enabled = false, -- unlocked by crushing tech
    ingredients = {
      { type = "item", name = "iron-ore", amount = 2 }
    },
    results = {
      { type = "item", name = "urob-crushed-iron",   amount = 2 },
      { type = "item", name = "urob-crushed-stone",  amount = 1 },
    }
  },

  ---------------------------------------------------------------------------
  -- Copper Ore Crushing
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "urob-crushing-copper",
    category = "urob-crushing",
    subgroup = "urob-ore-crushing",
    order = "b[copper]",
    icons = {
      { icon = icons.copper, icon_size = 32 }
    },
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "copper-ore", amount = 2 }
    },
    results = {
      { type = "item", name = "urob-crushed-copper", amount = 2 },
      { type = "item", name = "urob-crushed-stone",  amount = 1 },
    }
  },

  ---------------------------------------------------------------------------
  -- Stone Crushing (Angels never did this; UR0B does NOT include it)
  -- Stone is ONLY generated from ore crushing, like Angels slag.
  ---------------------------------------------------------------------------

  ---------------------------------------------------------------------------
  -- Uranium Ore Crushing
  ---------------------------------------------------------------------------
  {
    type = "recipe",
    name = "urob-crushing-uranium",
    category = "urob-crushing",
    subgroup = "urob-ore-crushing",
    order = "d[uranium]",
    icons = {
      { icon = icons.uranium, icon_size = 32 }
    },
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "uranium-ore", amount = 2 }
    },
    results = {
      { type = "item", name = "urob-crushed-uranium", amount = 2 },
      { type = "item", name = "urob-crushed-stone",   amount = 1 },
    }
  },

})
