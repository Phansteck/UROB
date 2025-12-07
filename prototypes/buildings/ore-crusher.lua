--------------------------------------------------------------------------------
-- File: prototypes/buildings/ore-crusher.lua
-- Mod: UR0B (Unified Refining Oversight Bureau)
-- Purpose:
--   Defines the full family of ore crushers:
--     • burner-ore-crusher  (Tier 0 - burner)
--     • ore-crusher         (Tier 1 - electric)
--     • ore-crusher-2       (Tier 2 - electric)
--     • ore-crusher-3       (Tier 3 - electric)
-- Notes:
--   - Uses UR0B-Core functions (urob.functions.*) for icon layering.
--   - All machines use the "urob-crushing" recipe category.
--   - Graphics paths assume UR0B provides copies of Angels-style sprites.
--------------------------------------------------------------------------------

local F = urob.functions

--------------------------------------------------------------------------------
-- ICON HELPERS -----------------------------------------------------------------
--------------------------------------------------------------------------------

-- Base icon for all ore crushers (change path if you split icons later).
local function base_crusher_icon()
  return {
    {
      icon = "__UR0B__/graphics/icons/ore-crusher.png",
      icon_size = 64,
    }
  }
end

-- Builds the final icon for a given tier.
-- tier:
--   nil / "burner" => no number overlay (burner machine)
--   1 / 2 / 3      => numeric tier overlay using UR0B-Core.
local function crusher_icon_for_tier(tier)
  local icon = base_crusher_icon()

  if tier == nil or tier == "burner" then
    -- Burner crusher: plain icon, no number overlay.
    return icon
  end

  -- Electric tiers: use number overlay (1, 2, 3).
  -- You can change the tints here later if you want a machine color scheme.
  local number_tint  = {r = 1, g = 1, b = 1, a = 1} -- white number
  local outline_tint = {r = 0, g = 0, b = 0, a = 1} -- black outline

  return F.add_number_icon_layer(icon, tier, number_tint, outline_tint)
end

--------------------------------------------------------------------------------
-- COMMON ENTITY TEMPLATE ------------------------------------------------------
--------------------------------------------------------------------------------

-- Returns a base table for an ore crusher assembling-machine.
-- This is cloned and then tier-specific fields are overridden.
local function make_crusher_entity(name, tier)
  -- Decide stats per tier.
  local crafting_speed
  local energy_usage
  local module_slots

  if name == "burner-ore-crusher" then
    crafting_speed = 0.5
    energy_usage   = "90kW"
    module_slots   = 0 -- burner stage: no modules
  elseif name == "ore-crusher" then
    crafting_speed = 0.75
    energy_usage   = "100kW"
    module_slots   = 2
  elseif name == "ore-crusher-2" then
    crafting_speed = 1.25
    energy_usage   = "200kW"
    module_slots   = 3
  elseif name == "ore-crusher-3" then
    crafting_speed = 2.0
    energy_usage   = "400kW"
    module_slots   = 4
  else
    -- Fallback defaults (shouldn’t happen if we cover all names above).
    crafting_speed = 1.0
    energy_usage   = "150kW"
    module_slots   = 2
  end

  local entity = {
    type = "assembling-machine",
    name = name,
    icons = crusher_icon_for_tier(tier),
    icon_size = 64,

    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.3, result = name},
    max_health = 200,

    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",

    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},

    crafting_categories = {"urob-crushing"},
    crafting_speed = crafting_speed,

    -- Energy source is filled per tier (burner vs electric) below.
    energy_source = nil,
    energy_usage = energy_usage,
    emissions_per_minute = 2,

    module_specification = {
      module_slots = module_slots
    },
    allowed_effects = {"speed", "productivity", "consumption", "pollution"},

    animation = {
      layers = {
        {
          filename = "__UR0B__/graphics/entity/ore-crusher/ore-crusher-base.png",
          width = 128,
          height = 128,
          frame_count = 32,
          line_length = 8,
          animation_speed = 0.5,
          shift = {0, 0}
        },
        {
          filename = "__UR0B__/graphics/entity/ore-crusher/ore-crusher-shadow.png",
          width = 160,
          height = 128,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          animation_speed = 0.5,
          shift = {0.5, 0.2}
        }
      }
    },

    working_sound = {
      sound = {filename = "__base__/sound/stone-crusher.ogg", volume = 0.75},
      idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.5},
      apparent_volume = 1.5
    }
  }

  -- Tier-specific energy source:
  if name == "burner-ore-crusher" then
    entity.energy_source = {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = 4,
      smoke = {
        {
          name = "smoke",
          frequency = 10,
          position = {0.0, -1.2},
          deviation = {0.1, 0.1},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
    }
  else
    entity.energy_source = {
      type = "electric",
      usage_priority = "secondary-input"
    }
  end

  return entity
end

--------------------------------------------------------------------------------
-- ITEM DEFINITIONS ------------------------------------------------------------
--------------------------------------------------------------------------------

local items = {
  {
    -- Tier 0: Burner Crusher
    type = "item",
    name = "burner-ore-crusher",
    icons = crusher_icon_for_tier("burner"),
    icon_size = 64,
    subgroup = "urob-buildings",
    order = "a[ore-crusher]-a[burner]",
    place_result = "burner-ore-crusher",
    stack_size = 20
  },
  {
    -- Tier 1: Ore Crusher
    type = "item",
    name = "ore-crusher",
    icons = crusher_icon_for_tier(1),
    icon_size = 64,
    subgroup = "urob-buildings",
    order = "a[ore-crusher]-b[ore-crusher]",
    place_result = "ore-crusher",
    stack_size = 20
  },
  {
    -- Tier 2: Ore Crusher 2
    type = "item",
    name = "ore-crusher-2",
    icons = crusher_icon_for_tier(2),
    icon_size = 64,
    subgroup = "urob-buildings",
    order = "a[ore-crusher]-c[ore-crusher-2]",
    place_result = "ore-crusher-2",
    stack_size = 20
  },
  {
    -- Tier 3: Ore Crusher 3
    type = "item",
    name = "ore-crusher-3",
    icons = crusher_icon_for_tier(3),
    icon_size = 64,
    subgroup = "urob-buildings",
    order = "a[ore-crusher]-d[ore-crusher-3]",
    place_result = "ore-crusher-3",
    stack_size = 20
  }
}

--------------------------------------------------------------------------------
-- RECIPE DEFINITIONS ----------------------------------------------------------
--------------------------------------------------------------------------------
-- NOTE:
--   These are placeholder recipes. Once UR0B's component / smelting system
--   is defined, you can replace the ingredients with more thematic parts.

local recipes = {
  {
    -- Burner Crusher (Tier 0) - very cheap, no circuits
    type = "recipe",
    name = "burner-ore-crusher",
    enabled = true, -- may be gated behind "basic crushing" tech later
    ingredients = {
      {type = "item", name = "stone",      amount = 10},
      {type = "item", name = "iron-gear-wheel", amount = 5}
    },
    results = {
      {type = "item", name = "burner-ore-crusher", amount = 1}
    }
  },
  {
    -- Ore Crusher (Tier 1)
    type = "recipe",
    name = "ore-crusher",
    enabled = false, -- unlock via tech later
    ingredients = {
      {type = "item", name = "burner-ore-crusher", amount = 1},
      {type = "item", name = "iron-plate",         amount = 5},
      {type = "item", name = "electronic-circuit", amount = 3}
    },
    results = {
      {type = "item", name = "ore-crusher", amount = 1}
    }
  },
  {
    -- Ore Crusher 2 (Tier 2)
    type = "recipe",
    name = "ore-crusher-2",
    enabled = false,
    ingredients = {
      {type = "item", name = "ore-crusher",        amount = 1},
      {type = "item", name = "steel-plate",        amount = 10},
      {type = "item", name = "advanced-circuit",   amount = 5}
    },
    results = {
      {type = "item", name = "ore-crusher-2", amount = 1}
    }
  },
  {
    -- Ore Crusher 3 (Tier 3)
    type = "recipe",
    name = "ore-crusher-3",
    enabled = false,
    ingredients = {
      {type = "item", name = "ore-crusher-2",      amount = 1},
      {type = "item", name = "steel-plate",        amount = 20},
      {type = "item", name = "processing-unit",    amount = 5}
    },
    results = {
      {type = "item", name = "ore-crusher-3", amount = 1}
    }
  }
}

--------------------------------------------------------------------------------
-- ENTITY DEFINITIONS ----------------------------------------------------------
--------------------------------------------------------------------------------

local entities = {
  make_crusher_entity("burner-ore-crusher", "burner"),
  make_crusher_entity("ore-crusher", 1),
  make_crusher_entity("ore-crusher-2", 2),
  make_crusher_entity("ore-crusher-3", 3)
}

--------------------------------------------------------------------------------
-- REGISTER WITH FACTORIO ------------------------------------------------------
--------------------------------------------------------------------------------

data:extend(items)
data:extend(recipes)
data:extend(entities)
