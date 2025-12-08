-- File: data.lua
-- UR0B Core Data Loading Order
-- Ensures all prototype files load in the correct dependency sequence.

----------------------------
-- 0) Shared Utilities / Commons
----------------------------
require("commons")                        -- Shared tables, tints, globals
require("prototypes.urob-core.functions") -- UR0B port of Angels utility functions

----------------------------
-- 1) Categories
----------------------------
require("prototypes.categories.recipe-categories")

----------------------------
-- 2) Item Groups / Subgroups
----------------------------
require("prototypes.groups.item-groups")

----------------------------
-- 3) Item Prototypes
----------------------------
require("prototypes.items.crushed-ores")

----------------------------
-- 4) Building Prototypes
----------------------------
require("prototypes.buildings.ore-crusher")

----------------------------
-- 5) Recipes
----------------------------
require("prototypes.recipes.crushing")
require("prototypes.recipes.smelting-crushed")
require("prototypes.recipes.crushed-stone-processing")

----------------------------
-- 6) Technology
----------------------------
require("prototypes.technology.crushing-tech")

----------------------------
-- 7) Overrides & Removals
----------------------------
require("prototypes.overrides.disable-vanilla-smelting") -- FIXED PATH
require("prototypes.overrides.remove-stone")             -- FIXED PATH
