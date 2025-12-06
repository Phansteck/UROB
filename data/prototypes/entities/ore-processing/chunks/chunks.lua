--------------------------------------------------------------------------------
-- File: data/prototypes/items/ore-processing/chunks/chunks.lua
-- Purpose: Defines Tier-1 processed items: sorted "chunks" of iron and copper.
-- Notes: These are the first step upward from crushed ore, produced in the
--        Tier-1 sorting machine. Icons are placeholders for now.
--------------------------------------------------------------------------------

data:extend({
  {
    type = "item",
    name = "urob-iron-chunk",
    icon = "__base__/graphics/icons/iron-ore.png", -- Placeholder (to be recoloured)
    icon_size = 64,
    subgroup = "urob-tier-1-sorting",
    order = "a[iron-chunk]",
    stack_size = 200
  },
  {
    type = "item",
    name = "urob-copper-chunk",
    icon = "__base__/graphics/icons/copper-ore.png", -- Placeholder
    icon_size = 64,
    subgroup = "urob-tier-1-sorting",
    order = "b[copper-chunk]",
    stack_size = 200
  }
})
