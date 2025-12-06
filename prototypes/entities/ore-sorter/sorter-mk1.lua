--------------------------------------------------------------------------------
-- File: prototypes/entities/ore-sorter/sorter-mk1.lua
-- Purpose: Placeholder entity for UR0B Sorter Mk1.
-- Notes: Uses Assembling Machine 1 graphics for now.
--------------------------------------------------------------------------------

local sorter = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])

sorter.name = "urob-sorter-mk1"
sorter.icon = "__base__/graphics/icons/assembling-machine-1.png"
sorter.icon_size = 64

sorter.minable.result = "urob-sorter-mk1"

sorter.crafting_categories = {"urob-sorting"}
sorter.crafting_speed = 0.75

data:extend({sorter})

--------------------------------------------------------------------------------
-- Item to place the sorter
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
