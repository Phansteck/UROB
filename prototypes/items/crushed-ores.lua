--------------------------------------------------------------------------------
-- File: prototypes/items/crushed-ores.lua
-- Purpose: Crushed ore item definitions for UR0B.
-- These use a single base icon with ore-specific tints defined in commons.lua.
--------------------------------------------------------------------------------

data:extend({

  -- ========================================================================
  -- Crushed Iron
  -- ========================================================================
  {
    type = "item",
    name = "urob-crushed-iron",
    icons = {{
      icon = "__UR0B__/graphics/icons/crushed-ore.png",
      tint = urob_colors.iron   -- Realistic Ores tint
    }},
    icon_size = 32,
    stack_size = 200
  },

  -- ========================================================================
  -- Crushed Copper
  -- ========================================================================
  {
    type = "item",
    name = "urob-crushed-copper",
    icons = {{
      icon = "__UR0B__/graphics/icons/crushed-ore.png",
      tint = urob_colors.copper  -- Realistic Ores tint
    }},
    icon_size = 32,
    stack_size = 200
  }

  -- Add more crushed ores here when needed:
  -- {
  --   type = "item",
  --   name = "urob-crushed-tin",
  --   icons = {{
  --     icon = "__UR0B__/graphics/icons/crushed-ore.png",
  --     tint = urob_colors.tin
  --   }},
  --   icon_size = 32,
  --   stack_size = 200
  -- },

})
