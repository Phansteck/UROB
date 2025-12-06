--------------------------------------------------------------------------------
-- File: data/prototypes/shared/item-groups.lua
-- Purpose: Defines the primary item group used by the Unified Refining
--          Oversight Bureau (UR0B). All refining items and machines will live
--          under this group in the crafting GUI.
-- Notes: Uses a placeholder icon until an Angels/vanilla image is assigned.
--------------------------------------------------------------------------------

data:extend({
  {
    type = "item-group",
    name = "urob-processing",            -- Main group for UR0B items
    order = "z",                         -- Placed near the end of the crafting menu
    icon = "__urob__/graphics/icons/urob-group.png",
    icon_size = 64
  }
})
