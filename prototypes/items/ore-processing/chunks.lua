--------------------------------------------------------------------------------
-- File: prototypes/items/ore-processing/chunks.lua
-- Purpose: Defines Tier-1 processed items: iron and copper chunks.
--------------------------------------------------------------------------------

data:extend({
  {
    type = "item",
    name = "urob-iron-chunk",
    icon = "__base__/graphics/icons/iron-ore.png",
    icon_size = 64,
    subgroup = "urob-tier-1-sorting",
    order = "a[iron-chunk]",
    stack_size = 200
  },
  {
    type = "item",
    name = "urob-copper-chunk",
    icon = "__base__/graphics/icons/copper-ore.png",
    icon_size = 64,
    subgroup = "urob-tier-1-sorting",
    order = "b[copper-chunk]",
    stack_size = 200
  }
})
