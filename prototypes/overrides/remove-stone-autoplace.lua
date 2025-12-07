-- UR0B: Prevent stone patches from generating and hide them from map gen.

local stone = data.raw.resource["stone"]

if stone then
  -- Replace autoplace with a zero-probability dummy autoplace.
  -- This keeps Nauvis planet setup satisfied but prevents any spawning.
  stone.autoplace = {
    probability_expression = 0,   -- Stone will never spawn
  }

  -- Hide stone from the map generation GUI (2.0 uses this).
  stone.map_generator_settings = {
    autoplace = {
      controls = {
        frequency = "none",
        size = "none",
        richness = "none"
      }
    },
    order = "z",  -- doesn't matter, but required structure
    hidden = true -- hide from UI
  }

  -- Ensure no alternative autoplace tables exist.
  stone.autoplace_settings = nil
end
