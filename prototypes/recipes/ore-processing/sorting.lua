--------------------------------------------------------------------------------
-- File: prototypes/recipes/ore-processing/sorting.lua
-- Purpose: Tier-1 sorting recipes: crushed ore -> chunks (+ stone byproduct).
--------------------------------------------------------------------------------

data:extend({
  {
    type = "recipe",
    name = "urob-sorting-iron",
    category = "urob-sorting",
    energy_required = 2,
    ingredients = {{"urob-crushed-iron", 2}},
    results = {
      {"urob-iron-chunk", 1},
      {"stone", 1}
    },
    enabled = false
  },
  {
    type = "recipe",
    name = "urob-sorting-copper",
    category = "urob-sorting",
    energy_required = 2,
    ingredients = {{"urob-crushed-copper", 2}},
    results = {
      {"urob-copper-chunk", 1},
      {"stone", 1}
    },
    enabled = false
  }
})
