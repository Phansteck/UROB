--------------------------------------------------------------------------------
-- UR0B: Unified Refining Oversight Bureau
-- Data stage loader
--------------------------------------------------------------------------------

------------------------------
-- Core utilities
------------------------------
require("prototypes.urob-core.functions")

------------------------------
-- Groups & shared constants
------------------------------
require("prototypes.groups.item-groups")
require("prototypes.commons")  -- shared colors, globals, etc.

------------------------------
-- Categories
------------------------------
require("prototypes.categories.crushing")

------------------------------
-- Items
------------------------------
require("prototypes.items.crushed-ores")
-- Add later:
-- require("prototypes.items.ores")
-- require("prototypes.items.intermediates")
-- require("prototypes.items.pure-ores")

------------------------------
-- Buildings
------------------------------
require("prototypes.buildings.ore-crusher")
-- Add later:
-- require("prototypes.buildings.ore-washer")
-- require("prototypes.buildings.sorter")

------------------------------
-- Recipes
------------------------------
-- Crushing tier recipes
-- require("prototypes.recipes.crushing")

-- Refining chain (Angel-style)
-- require("prototypes.recipes.ore-processing.crushing")
-- require("prototypes.recipes.ore-processing.washing")
-- require("prototypes.recipes.ore-processing.sorting")

------------------------------
-- Technology (future)
------------------------------
-- require("prototypes.technology.crushing")
-- require("prototypes.technology.refining")

--------------------------------------------------------------------------------
-- END OF DATA STAGE
--------------------------------------------------------------------------------
