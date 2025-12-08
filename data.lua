-- File: data.lua
-- UR0B Core Data Loading Order
-- Ensures all prototype files load in the correct dependency sequence.

----------------------------
-- 0) Shared Utilities / Commons
----------------------------
require("commons")                        
require("prototypes.urob-core.functions") 

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

-- 🔥 NEW: Crusher crafting recipes (burner, mk1, mk2, mk3)
require("prototypes.recipes.buildings.ore-crusher-recipes")

----------------------------
-- 6) Technology
----------------------------
require("prototypes.technology.crushing-tech")

----------------------------
-- 7) Overrides & Removals
----------------------------
require("prototypes.overrides.disable-vanilla-smelting")
require("prototypes.overrides.remove-stone")
