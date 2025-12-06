--------------------------------------------------------------------------------
-- File: prototypes/entities/ore-crusher/crusher-mk1.lua
-- Purpose: Placeholder entity for UR0B Crusher Mk1.
-- Notes: Uses Assembling Machine 1 graphics for now.
--------------------------------------------------------------------------------

local crusher = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])

crusher.name = "urob-crusher-mk1"
crusher.icon = "__base__/graphics/icons/assembling-machine-1.png"
crusher.icon_size = 64

crusher.minable.result = "urob-crusher-mk1"

crusher.crafting_categories = {"urob-crushing"}
crusher.crafting_speed = 0.5

data:extend({crusher})

--------------------------------------------------------------------------------
-- Item to place the crusher
--------------------------------------------------------------------------------

data:extend({
  {
    type = "item",
    name = "urob-crusher-mk1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64,
    place_result = "urob-crusher-mk1",
    stack_size = 50,
    subgroup = "production-machine",
    order = "x[urob-crusher-mk1]"
  }
})
