-- File: prototypes/groups/item-groups.lua
-- UR0B - Item groups & subgroups
--
-- This file defines the tabs at the top of the crafting GUI (item-groups)
-- and the rows inside those tabs (item-subgroups) for the UR0B mod.
--
-- Updated: Refining group now uses Angels-style layered icon.

data:extend({
  ------------------------------------------------------------------------------
  -- MAIN ITEM GROUPS
  ------------------------------------------------------------------------------

  {
    type = "item-group",
    name = "urob-refining",
    order = "u-a[urob-refining]",
    order_in_recipe = "u-a[urob-refining]",

    -- Angels-style ICONS block (multi-layer)
    icons = {
      {
        -- Main tech-style icon (scaled down, just like Angels)
        icon = "__UR0B__/graphics/technology/mechanical-refining.png",
        icon_size = 256,
        icon_mipmaps = 4,
        scale = 0.25,
      },
      {
        -- Corner overlay icon (Angels uses void.png)
        icon = "__UR0B__/graphics/icons/void.png",
        icon_size = 32,
        scale = (64/32) * 0.35,
        shift = { 20, -20 },
      },
    },
  },

  {
    type = "item-group",
    name = "urob-buildings",
    order = "u-b[urob-buildings]",
    order_in_recipe = "u-b[urob-buildings]",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 64,
  },

  ------------------------------------------------------------------------------
  -- REFINING CHAIN SUBGROUPS (materials, inside urob-refining)
  ------------------------------------------------------------------------------

  {
    type = "item-subgroup",
    name = "urob-ore-raw",
    group = "urob-refining",
    order = "a[ore-raw]",
  },

  {
    type = "item-subgroup",
    name = "urob-ore-crushed",
    group = "urob-refining",
    order = "b[ore-crushed]",
  },

  {
    type = "item-subgroup",
    name = "urob-ore-chunk",
    group = "urob-refining",
    order = "c[ore-chunk]",
  },

  {
    type = "item-subgroup",
    name = "urob-ore-crystal",
    group = "urob-refining",
    order = "d[ore-crystal]",
  },

  {
    type = "item-subgroup",
    name = "urob-ore-pure",
    group = "urob-refining",
    order = "e[ore-pure]",
  },

  {
    type = "item-subgroup",
    name = "urob-slag-processing",
    group = "urob-refining",
    order = "f[slag-processing]",
  },

  {
    type = "item-subgroup",
    name = "urob-geode-processing",
    group = "urob-refining",
    order = "g[geode-processing]",
  },

  {
    type = "item-subgroup",
    name = "urob-water-treatment",
    group = "urob-refining",
    order = "h[water-treatment]",
  },

  {
    type = "item-subgroup",
    name = "urob-intermediates",
    group = "urob-refining",
    order = "z[intermediates]",
  },

  ------------------------------------------------------------------------------
  -- BUILDINGS SUBGROUPS (machines, inside urob-buildings)
  ------------------------------------------------------------------------------

  {
    type = "item-subgroup",
    name = "urob-buildings-crushers",
    group = "urob-buildings",
    order = "a[buildings-crushers]",
  },

  {
    type = "item-subgroup",
    name = "urob-buildings-refining",
    group = "urob-buildings",
    order = "b[buildings-refining]",
  },

  {
    type = "item-subgroup",
    name = "urob-buildings-fluids",
    group = "urob-buildings",
    order = "c[buildings-fluids]",
  },

  {
    type = "item-subgroup",
    name = "urob-buildings-support",
    group = "urob-buildings",
    order = "d[buildings-support]",
  },

  {
    type = "item-subgroup",
    name = "urob-buildings-misc",
    group = "urob-buildings",
    order = "z[buildings-misc]",
  },
})
