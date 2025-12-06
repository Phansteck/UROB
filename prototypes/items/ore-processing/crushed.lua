--------------------------------------------------------------------------------
-- File: prototypes/items/ore-processing/crushed.lua
-- Purpose: Defines Tier-0 processed items: crushed variants of iron and copper.
--------------------------------------------------------------------------------

data:extend({
  {
    type = "item",
    name = "urob-crushed-iron",
    icon = "__base__/graphics/icons/iron-ore.png",
    icon_size = 64,
    subgroup = "urob-tier-0-crushing",
    order = "a[crushed-iron]",
    stack_size = 200
  },
  {
    type = "item",
    name = "urob-crushed-copper",
    icon = "__base__/graphics/icons/copper-ore.png",
    icon_size = 64,
    subgroup = "urob-tier-0-crushing",
    order = "b[crushed-copper]",
    stack_size = 200
  }
})
