--------------------------------------------------------------------------------
-- UR0B: Unified Refining Oversight Bureau
-- Data stage loader
-- Loads core utilities and all prototype definitions.
--------------------------------------------------------------------------------

-- Core functions (must load first — used by many files later)
require("prototypes.urob-core.functions")

-- Shared color definitions (for ore tints, machine tints, etc.)
require("prototypes.commons")

-- Items
require("prototypes.items.crushed-ores")

-- Buildings (future: crusher, sorting facility, refinery, smelter, etc.)
-- require("prototypes.buildings.crusher")
-- require("prototypes.buildings.sorting-facility")
-- require("prototypes.buildings.refinery")

-- Recipes (crushing, sorting, refining, smelting, etc.)
-- require("prototypes.recipes.crushing")
-- require("prototypes.recipes.sorting")
-- require("prototypes.recipes.refining")

-- Technologies (future)
-- require("prototypes.technology.crushing")
-- require("prototypes.technology.refining")

