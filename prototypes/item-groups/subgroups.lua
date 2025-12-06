--------------------------------------------------------------------------------
-- File: prototypes/item-groups/subgroups.lua
-- Purpose: Defines item subgroups for each UR0B refining tier.
--------------------------------------------------------------------------------

data:extend({
  { type = "item-subgroup", name = "urob-tier-0-crushing",    group = "urob-processing", order = "a" },
  { type = "item-subgroup", name = "urob-tier-1-sorting",     group = "urob-processing", order = "b" },
  { type = "item-subgroup", name = "urob-tier-2-refining",    group = "urob-processing", order = "c" },
  { type = "item-subgroup", name = "urob-tier-3-purifying",   group = "urob-processing", order = "d" },
  { type = "item-subgroup", name = "urob-tier-4-pelletizing", group = "urob-processing", order = "e" },
  { type = "item-subgroup", name = "urob-tier-5-smelting",    group = "urob-processing", order = "f" }
})
