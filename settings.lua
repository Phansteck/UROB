-- File: settings.lua
-- UR0B startup settings

data:extend({
  {
    type = "bool-setting",
    name = "urob-start-with-burner-crusher",
    setting_type = "startup",
    default_value = true,
    order = "a",
  },
})
