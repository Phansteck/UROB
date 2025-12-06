--------------------------------------------------------------------------------
-- File: data.lua
-- Purpose: Entry point for loading all UR0B prototype definitions.
--------------------------------------------------------------------------------

-- Categories and groups
require("prototypes.categories.categories")
require("prototypes.item-groups.item-groups")
require("prototypes.item-groups.subgroups")

-- Items
require("prototypes.items.ore-processing.crushed")
require("prototypes.items.ore-processing.chunks")

-- Ore processing recipes
require("prototypes.recipes.ore-processing.crushing")
require("prototypes.recipes.ore-processing.sorting")
require("prototypes.recipes.ore-processing.refining")
require("prototypes.recipes.ore-processing.purifying")
require("prototypes.recipes.ore-processing.pelletizing")
require("prototypes.recipes.ore-processing.smelting")

-- Building crafting recipes
require("prototypes.recipes.buildings.crusher-mk1")
require("prototypes.recipes.buildings.sorter-mk1")

-- Entities
require("prototypes.entities.ore-crusher.crusher-mk1")
require("prototypes.entities.ore-sorter.sorter-mk1")
