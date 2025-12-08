-- File: control.lua
-- Starting items logic for UR0B (safe, startup-based, Factorio 2.0 compliant)

local function give_starting_items(event)
    local player = game.get_player(event.player_index)
    if not player or not player.valid then return end

    -- Prevents giving items on late joins in singleplayer
    if not game.is_multiplayer() and player.index ~= 1 then return end

    -- Safe access: startup settings are always available
    local crusher_setting = settings.startup["urob-start-with-burner-crusher"]
    local give_crusher = crusher_setting and crusher_setting.value

    -- Give the player the burner ore crusher
    if give_crusher then
        if player.insert({ name = "burner-ore-crusher", count = 1 }) > 0 then
            -- Put in quickbar slot 1 if empty
            local quickbar = player.get_quick_bar()
            if quickbar and quickbar[1] == nil then
                player.set_quick_bar_slot(1, "burner-ore-crusher")
            end
        end
    end

    -- Confirmation message
    player.print({ "message.urob-start-equipment" })
end

script.on_event(defines.events.on_player_created, give_starting_items)
