--------------------------------------------------------------------------------
-- File: data-final-fixes.lua
-- Purpose:
--   - Disable vanilla ore-smelting recipes (iron/copper plates).
--   - Remove stone resource patches from map generation entirely.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Disable vanilla ore → plate smelting
--------------------------------------------------------------------------------

local recipes_to_disable = {
  "iron-plate",
  "copper-plate"
}

for _, recipe_name in pairs(recipes_to_disable) do
  local recipe = data.raw.recipe[recipe_name]
  if recipe then
    recipe.enabled = false
    recipe.hidden = true
  end
end

--------------------------------------------------------------------------------
-- Disable stone resource patches
-- Removes stone from world generation; stone must now come from UR0B processes.
--------------------------------------------------------------------------------

local stone = data.raw.resource and data.raw.resource["stone"]
if stone and stone.autoplace then
  stone.autoplace = nil
end
