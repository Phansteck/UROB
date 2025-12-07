--------------------------------------------------------------------------------
-- UR0B: Completely disable stone as a worldgen resource.
-- This file:
--  • Prevents stone patches from generating
--  • Provides dummy autoplace so planet setup does not error
--  • Hides stone from the map generation UI
--  • Hides the autoplace control so sliders do not appear
--------------------------------------------------------------------------------

-- 1. Modify the stone resource itself
local stone = data.raw.resource["stone"]

if stone then
  -- Provide a valid autoplace block with zero probability so Nauvis doesn't error.
  stone.autoplace = {
    probability_expression = 0,  -- ensures stone never spawns anywhere
  }

  -- Hide from the map generation GUI (new 2.0 structure)
  stone.map_generator_settings = {
    autoplace = {
      controls = {
        frequency = "none",
        size = "none",
        richness = "none"
      }
    },
    hidden = true,
    order = "z",
  }

  -- Clean up any additional autoplace settings
  stone.autoplace_settings = nil
end


-- 2. Hide the autoplace-control so the slider does not appear in the map gen screen
local ctrl = data.raw["autoplace-control"]["stone"]

if ctrl then
  ctrl.hidden = true           -- completely removes stone from map gen UI
  ctrl.localised_name = ""     -- prevents empty labels from appearing
  ctrl.order = "zzz"           -- push it to end, though hidden anyway
end
