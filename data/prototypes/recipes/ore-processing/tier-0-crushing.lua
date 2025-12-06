--------------------------------------------------------------------------------
-- File: data/prototypes/recipes/ore-processing/tier-0-crushing.lua
-- Purpose: Defines the entry-level UR0B processing recipes — turning raw ore
--          into crushed variants. These are the first playable refinement steps.
-- Notes: Enabled by technology later; disabled by default.
--------------------------------------------------------------------------------

data:extend({
  {
    type = "recipe",
    name = "urob-crushing-iron",
    category = "urob-crushing",    -- Recipe only runs in UR0B crushers
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
