--------------------------------------------------------------------------------
-- File: prototypes/recipes/buildings/crusher-mk1.lua
-- Purpose: Crafting recipe for the UR0B Crusher Mk1.
-- Notes: Uses Angel-style component costs.
--------------------------------------------------------------------------------

data:extend({
  {
    type = "recipe",
    name = "urob-crusher-mk1",
    enabled = true, -- TODO: gate behind technology later
    ingredients = {
      {"iron-gear-wheel", 5},
      {"basic-circuit-board", 3},
      {"stone-brick", 10}
    },
    results = {
      {type = "item", name = "urob-crusher-mk1", amount = 1}
    }
  }
})
