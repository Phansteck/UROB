-- File: prototypes/groups/item-groups.lua
-- UR0B - Item groups & subgroups
-- Angels-style hierarchical ordering for the entire ore → refining → smelting chain.

data:extend({

  ------------------------------------------------------------------------------
  -- MAIN ITEM GROUPS
  ------------------------------------------------------------------------------

  {
    type = "item-group",
    name = "urob-refining",
    order = "u-a[urob-refining]",
    order_in_recipe = "u-a[urob-refining]",
    icons = {
      {
        icon = "__UR0B__/graphics/technology/mechanical-refining.png",
        icon_size = 256,
        icon_mipmaps = 4,
        scale = 0.25,
      },
      {
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
  -- REFINING SUBGROUPS (Angels-style ore chain)
  ------------------------------------------------------------------------------

  -- Stage 0: Raw ores
  {
    type = "item-subgroup",
    name = "urob-ore-raw",
    group = "urob-refining",
    order = "a[ore-raw]",
  },

  -- Stage 1: Crushing
  {
    type = "item-subgroup",
    name = "urob-ore-crushing",
    group = "urob-refining",
    order = "a-b[ore-crushing]",
  },

  -- Stage 2: Crushed ores
  {
    type = "item-subgroup",
    name = "urob-ore-crushed",
    group = "urob-refining",
    order = "b[ore-crushed]",
  },

  -- Stage 3: Ore chunks
  {
    type = "item-subgroup",
    name = "urob-ore-chunk",
    group = "urob-refining",
    order = "c[ore-chunk]",
  },

  -- Stage 4: Ore crystals
  {
    type = "item-subgroup",
    name = "urob-ore-crystal",
    group = "urob-refining",
    order = "d[ore-crystal]",
  },

  -- Stage 5: Pure ores
  {
    type = "item-subgroup",
    name = "urob-ore-pure",
    group = "urob-refining",
    order = "e[ore-pure]",
  },

  -- Stage 6: Smelting (NEW subgroup)
  {
    type = "item-subgroup",
    name = "urob-smelting",
    group = "urob-refining",
    order = "e-b[smelting]",
  },

  -- Stage 7: Slag processing
  {
    type = "item-subgroup",
    name = "urob-slag-processing",
    group = "urob-refining",
    order = "f[slag-processing]",
  },

  -- Stage 8: Geode processing
  {
    type = "item-subgroup",
    name = "urob-geode-processing",
    group = "urob-refining",
    order = "g[geode-processing]",
  },

  -- Stage 9: Water treatment
  {
    type = "item-subgroup",
    name = "urob-water-treatment",
    group = "urob-refining",
    order = "h[water-treatment]",
  },

  -- Stage 10: Misc intermediates
  {
    type = "item-subgroup",
    name = "urob-intermediates",
    group = "urob-refining",
    order = "z[intermediates]",
  },

  ------------------------------------------------------------------------------
  -- BUILDINGS SUBGROUPS
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
