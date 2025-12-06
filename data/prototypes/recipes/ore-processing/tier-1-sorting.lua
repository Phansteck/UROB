--------------------------------------------------------------------------------
-- File: data/prototypes/recipes/ore-processing/tier-1-sorting.lua
-- Purpose: Defines sorting recipes that convert crushed ore into "chunks".
-- Notes: These represent more refined ore fractions than crushed ore.
--        Disabled until unlocked by UR0B technology.
--------------------------------------------------------------------------------

data:extend({
  {
    type = "recipe",
    name = "urob-sorting-iron",
    category = "urob-sorting",     -- Tier-1 machine category
    energy_required = 2,
    ingredients = {{"urob-crushed-iron", 2}},
    results = {
      {"urob-iron-chunk", 1},
      {"stone", 1}                 -- Optional byproduct, Angel-style
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
