--------------------------------------------------------------------------------
-- File: prototypes/recipes/buildings/sorter-mk1.lua
-- Purpose: Crafting recipe for the UR0B Sorter Mk1.
-- Notes: Uses Angel-style component costs.
--------------------------------------------------------------------------------

data:extend({
  {
    type = "recipe",
    name = "urob-sorter-mk1",
    enabled = true, -- TODO: gate behind technology later
    ingredients = {
      {"iron-gear-wheel", 10},
      {"basic-circuit-board", 5},
      {"steel-plate", 2}
    },
    result = "urob-sorter-mk1"
  }
})
