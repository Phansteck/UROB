--------------------------------------------------------------------------------
-- File: data.lua
-- Purpose: Entry point for loading all UR0B prototype definitions.
--------------------------------------------------------------------------------

require("data.prototypes.shared.item-groups")
require("data.prototypes.shared.subgroups")
require("data.prototypes.shared.categories")

-- Tier 0
require("data.prototypes.items.ore-processing.crushed.crushed")
require("data.prototypes.recipes.ore-processing.tier-0-crushing")
require("data.prototypes.entities.ore-processing.crushers.crusher-mk1")

-- Tier 1
require("data.prototypes.items.ore-processing.chunks.chunks")
require("data.prototypes.recipes.ore-processing.tier-1-sorting")
require("data.prototypes.entities.ore-processing.sorters.sorter-mk1")
