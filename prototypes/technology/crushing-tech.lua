-- File: prototypes/technology/crushing-tech.lua
-- UR0B Crushing Technology Tree
-- Mirrors Angels' "ore-crushing" tier but adapted for vanilla ore refining.
-- Burner crusher, crushing recipes, and crushed smelting are enabled at start.

data:extend({

  -----------------------------------------------------------------------------
  -- TIER 1 : ORE CRUSHING (Electric Crusher MK1)
  -----------------------------------------------------------------------------
  {
    type = "technology",
    name = "urob-ore-crushing",
    icon = "__urob__/graphics/technology/mechanical-refining.png",
    icon_size = 256,
    icon_mipmaps = 4,
    order = "a-a",
    prerequisites = { "automation" },
    effects = {
      -- Burner crusher, crushing recipes, and smelting are available from start.
      {
        type = "unlock-recipe",
        recipe = "ore-crusher" -- Electric Crusher MK1
      }
    },
    unit = {
      count = 40,
      ingredients = {
        { "automation-science-pack", 1 }
      },
      time = 10
    }
  },

  -----------------------------------------------------------------------------
  -- TIER 2 : ORE CRUSHING MK2 (Electric Crusher MK2)
  -----------------------------------------------------------------------------
  {
    type = "technology",
    name = "urob-ore-crushing-2",
    icon = "__urob__/graphics/technology/mechanical-refining.png", -- same icon
    icon_size = 256,
    icon_mipmaps = 4,
    order = "a-b",
    prerequisites = { "urob-ore-crushing", "logistics" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "ore-crusher-2"
      }
    },
    unit = {
      count = 80,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 }
      },
      time = 20
    }
  },

  -----------------------------------------------------------------------------
  -- TIER 3 : ORE CRUSHING MK3 (Electric Crusher MK3)
  -----------------------------------------------------------------------------
  {
    type = "technology",
    name = "urob-ore-crushing-3",
    icon = "__urob__/graphics/technology/mechanical-refining.png", -- same icon
    icon_size = 256,
    icon_mipmaps = 4,
    order = "a-c",
    prerequisites = { "urob-ore-crushing-2" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "ore-crusher-3"
      }
    },
    unit = {
      count = 120,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 }
      },
      time = 30
    }
  },

})
