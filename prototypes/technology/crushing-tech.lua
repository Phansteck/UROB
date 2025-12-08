-- File: prototypes/technology/crushing-tech.lua
-- UR0B Technology Tree (Crushing Tier)
-- Mirrors Angels structure but simplified for vanilla ores and UR0B progression.
-- Burner crusher, crushing recipes, and crushed smelting are unlocked at game start.

data:extend({

  -----------------------------------------------------------------------------
  -- CRUSHING 1 (Electric Crusher MK1)
  -- Player begins with burner crusher & crushing enabled, so this is first step.
  -----------------------------------------------------------------------------
  {
    type = "technology",
    name = "urob-crushing-1",
    icon = "__urob__/graphics/technology/crushing-1.png",
    icon_size = 128,
    order = "a-a",
    prerequisites = { "automation" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "ore-crusher"   -- Electric Crusher MK1
      }
      -- Crushing recipes + crushed smelting = enabled from start
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
  -- CRUSHING 2 (Electric Crusher MK2)
  -----------------------------------------------------------------------------
  {
    type = "technology",
    name = "urob-crushing-2",
    icon = "__urob__/graphics/technology/crushing-2.png",
    icon_size = 128,
    order = "a-b",
    prerequisites = { "urob-crushing-1", "logistics" },
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
  -- CRUSHING 3 (Electric Crusher MK3)
  -----------------------------------------------------------------------------
  {
    type = "technology",
    name = "urob-crushing-3",
    icon = "__urob__/graphics/technology/crushing-3.png",
    icon_size = 128,
    order = "a-c",
    prerequisites = { "urob-crushing-2" },
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
