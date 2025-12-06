--------------------------------------------------------------------------------
-- File: data/prototypes/shared/categories.lua
-- Purpose: Defines UR0B recipe categories. These categories determine which
--          machines can perform which refining steps.
-- Notes: Each category corresponds to one refining tier.
--------------------------------------------------------------------------------

data:extend({
  { type = "recipe-category", name = "urob-crushing" },
  { type = "recipe-category", name = "urob-sorting" },
  { type = "recipe-category", name = "urob-refining" },
  { type = "recipe-category", name = "urob-purifying" },
  { type = "recipe-category", name = "urob-pelletizing" },
  { type = "recipe-category", name = "urob-smelting" }
})
