-- File: data.lua
-- UR0B Core Data Loading Order
-- Ensures categories, groups, items, buildings, recipes, and technologies
-- load in the correct sequence (Angels-style structure).

---------
-- 1) Categories (MUST load before machines and recipes)
---------
require("prototypes.categories.recipe-categories")

---------
-- 2) Item groups & subgroups
---------
require("prototypes.groups.item-groups")

---------
-- 3) Items
---------
require("prototypes.items.crushed-ores")

---------
-- 4) Buildings (machines)
---------
require("prototypes.buildings.ore-crusher")

---------
-- 5) Recipes
---------
require("prototypes.recipes.crushing")
require("prototypes.recipes.smelting-crushed")

---------
-- 6) Technologies
---------
require("prototypes.technology.crushing-tech")
