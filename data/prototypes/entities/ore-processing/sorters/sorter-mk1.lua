--------------------------------------------------------------------------------
-- File: data/prototypes/entities/ore-processing/sorters/sorter-mk1.lua
-- Purpose: Placeholder machine for performing Tier-1 sorting.
--------------------------------------------------------------------------------

local sorter = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])

sorter.name = "urob-sorter-mk1"
sorter.icon = "__base__/graphics/icons/assembling-machine-1.png"
sorter.icon_size = 64

sorter.minable.result = "urob-sorter-mk1"

sorter.crafting_categories = {"urob-sorting"}
sorter.crafting_speed = 0.75

data:extend({ sorter })

--------------------------------------------------------------------------------
-- Item that places the sorter
--------------------------------------------------------------------------------

data:extend({
  {
    type = "item",
    name = "urob-sorter-mk1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64,
    place_result = "urob-sorter-mk1",
    stack_size = 50,
    subgroup = "production-machine",
    order = "x[urob-sorter-mk1]"
  }
})
