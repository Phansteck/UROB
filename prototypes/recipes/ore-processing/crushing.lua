--------------------------------------------------------------------------------
-- File: prototypes/recipes/ore-processing/crushing.lua
-- Purpose: Entry-level UR0B processing recipes: ore -> crushed ore.
--------------------------------------------------------------------------------

data:extend({
  {
    type = "recipe",
    name = "urob-crushing-iron",
    category = "urob-crushing",
    energy_required = 1,
    ingredients = {{"iron-ore", 1}},
    results = {{"urob-crushed-iron", 1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "urob-crushing-copper",
    category = "urob-crushing",
    energy_required = 1,
    ingredients = {{"copper-ore", 1}},
    results = {{"urob-crushed-copper", 1}},
    enabled = false
  }
})
