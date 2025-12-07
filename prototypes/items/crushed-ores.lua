--------------------------------------------------------------------------------
-- File: prototypes/items/crushed-ores.lua
-- Purpose: Crushed ore item definitions for UR0B.
-- Using 32x32 base icon with ore-specific tints from commons.lua.
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
      tint = urob_colors.iron
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
      tint = urob_colors.copper
    }},
    icon_size = 32,
    stack_size = 200
  }

  -- Add more crushed ores as needed:
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
