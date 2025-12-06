--------------------------------------------------------------------------------
-- File: data/prototypes/entities/ore-processing/crushers/crusher-mk1.lua
-- Purpose: Placeholder entity definition for the UR0B Crusher Mk1.
--          This machine performs Tier-0 crushing recipes.
-- Notes: Reuses Assembling Machine 1 as a temporary model until an Angels
--        crusher sprite is assigned.
--------------------------------------------------------------------------------

local crusher = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])

-- Basic entity identity
crusher.name = "urob-crusher-mk1"
crusher.icon = "__base__/graphics/icons/assembling-machine-1.png"
crusher.icon_size = 64

-- Placement and mining
crusher.minable.result = "urob-crusher-mk1"

-- UR0B processing
crusher.crafting_categories = {"urob-crushing"} -- Only performs crushing tier
crusher.crafting_speed = 0.5

data:extend({crusher})

--------------------------------------------------------------------------------
-- Item definition for placing the crusher
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
