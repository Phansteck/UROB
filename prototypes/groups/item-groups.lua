-- File: prototypes/groups/item-groups.lua
-- UR0B - Item groups & subgroups
--
-- This file defines the tabs at the top of the crafting GUI (item-groups)
-- and the rows inside those tabs (item-subgroups) for the UR0B mod.
--
-- Philosophy:
-- - One main group for all ore/refining chains.
-- - A separate group for UR0B buildings (crushers, washers, sorters, etc.).
-- - Subgroups follow an Angel-ish flow: crushed → chunks → crystals → pure,
--   plus utility chains like slag/geodes and buildings.
--
-- NOTE:
-- - It’s safe if some subgroups are unused at first; Factorio doesn’t mind.
-- - You can add/remove subgroups later as the mod evolves.

data:extend({
  ------------------------------------------------------------------------------
  -- MAIN ITEM GROUPS
  ------------------------------------------------------------------------------

  {
    type = "item-group",
    name = "urob-refining",              -- All ore + intermediate materials
    order = "u-a[urob-refining]",        -- Sorted early among modded groups
    order_in_recipe = "u-a[urob-refining]",
    -- Re-use a base icon so we don't rely on custom graphics yet.
    icon = "__base__/graphics/icons/iron-ore.png",
    icon_size = 64,
  },

  {
    type = "item-group",
    name = "urob-buildings",             -- All UR0B machines & structures
    order = "u-b[urob-buildings]",
    order_in_recipe = "u-b[urob-buildings]",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 64,
  },

  ------------------------------------------------------------------------------
  -- REFINING CHAIN SUBGROUPS (materials, inside urob-refining)
  ------------------------------------------------------------------------------

  -- Raw mined stuff from UR0B (if you have custom ores later, put them here)
  {
    type = "item-subgroup",
    name = "urob-ore-raw",
    group = "urob-refining",
    order = "a[ore-raw]",
  },

  -- Crushed ores (output of the first crusher tier)
  {
    type = "item-subgroup",
    name = "urob-ore-crushed",
    group = "urob-refining",
    order = "b[ore-crushed]",
  },

  -- Chunks (second step in the Angel-style chain)
  {
    type = "item-subgroup",
    name = "urob-ore-chunk",
    group = "urob-refining",
    order = "c[ore-chunk]",
  },

  -- Crystals (third step in the chain)
  {
    type = "item-subgroup",
    name = "urob-ore-crystal",
    group = "urob-refining",
    order = "d[ore-crystal]",
  },

  -- Pure ores / final refined intermediates before smelting or direct use
  {
    type = "item-subgroup",
    name = "urob-ore-pure",
    group = "urob-refining",
    order = "e[ore-pure]",
  },

  -- Slag, by-products, and their processing chain
  {
    type = "item-subgroup",
    name = "urob-slag-processing",
    group = "urob-refining",
    order = "f[slag-processing]",
  },

  -- Geodes / crystals / weird side products (Angel-style)
  {
    type = "item-subgroup",
    name = "urob-geode-processing",
    group = "urob-refining",
    order = "g[geode-processing]",
  },

  -- Fluids and water treatment related to UR0B (mineralized water etc.)
  {
    type = "item-subgroup",
    name = "urob-water-treatment",
    group = "urob-refining",
    order = "h[water-treatment]",
  },

  -- Generic “other intermediates” (catalysts, filter media, etc.)
  {
    type = "item-subgroup",
    name = "urob-intermediates",
    group = "urob-refining",
    order = "z[intermediates]",
  },

  ------------------------------------------------------------------------------
  -- BUILDINGS SUBGROUPS (machines, inside urob-buildings)
  ------------------------------------------------------------------------------

  -- Crushers (mk1–mk3 etc., following the Angels naming scheme for entities)
  {
    type = "item-subgroup",
    name = "urob-buildings-crushers",
    group = "urob-buildings",
    order = "a[buildings-crushers]",
  },

  -- Ore sorters / washing / flotation / leaching machines and similar
  {
    type = "item-subgroup",
    name = "urob-buildings-refining",
    group = "urob-buildings",
    order = "b[buildings-refining]",
  },

  -- Water treatment / filtration, clarifiers, etc.
  {
    type = "item-subgroup",
    name = "urob-buildings-fluids",
    group = "urob-buildings",
    order = "c[buildings-fluids]",
  },

  -- Any support structures (warehouses, depots, special chests, etc.)
  {
    type = "item-subgroup",
    name = "urob-buildings-support",
    group = "urob-buildings",
    order = "d[buildings-support]",
  },

  -- Catch-all for anything UR0B-building-ish you haven’t sorted yet
  {
    type = "item-subgroup",
    name = "urob-buildings-misc",
    group = "urob-buildings",
    order = "z[buildings-misc]",
  },
})
