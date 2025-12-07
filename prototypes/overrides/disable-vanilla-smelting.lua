-- Disable vanilla smelting of iron ore and copper ore.

local recipes_to_disable = {
  "iron-plate",   -- iron smelting recipe
  "copper-plate"  -- copper smelting recipe
}

for _, recipe_name in ipairs(recipes_to_disable) do
  local r = data.raw.recipe[recipe_name]
  if r then
    -- Disable crafting entirely
    r.enabled = false
    r.hidden = true

    -- Some recipes have "normal" and "expensive" variations.
    -- We disable those too for safety.
    if r.normal then
      r.normal.enabled = false
      r.normal.hidden = true
    end
    if r.expensive then
      r.expensive.enabled = false
      r.expensive.hidden = true
    end
  end
end
