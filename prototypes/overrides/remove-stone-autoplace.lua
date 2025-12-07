-- UR0B: Disable stone resource generation and hide it from the map gen GUI.

local stone = data.raw.resource["stone"]

if stone then
  -- Remove all autoplace definitions so the resource can't spawn.
  stone.autoplace = nil

  -- Remove from map generation preset UI.
  if stone.map_generator_settings then
    stone.map_generator_settings.autoplace = nil
  end

  -- Some mods/placeholders define variant autoplace tables.
  -- We nuke them just to be thorough.
  if stone.autoplace_settings then
    stone.autoplace_settings = nil
  end
end
