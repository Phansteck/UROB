-- File: control.lua
-- Starting items logic for UR0B

local function give_starting_items(event)
    local player = game.get_player(event.player_index)
    if not player or not player.valid then return end

    -- Prevents giving items on multiplayer late-joins
    if not game.is_multiplayer() and player.index ~= 1 then return end

    -- Settings
    local give_crusher = settings.global["urob-start-with-burner-crusher"].value
    local give_coal = settings.global["urob-start-with-coal"].value

    -- Burner Crusher
    if give_crusher then
        if player.insert({ name = "burner-ore-crusher", count = 1 }) > 0 then
            -- Place in hotbar slot 1 if empty
            if player.get_quick_bar()[1] == nil then
                player.set_quick_bar_slot(1, "burner-ore-crusher")
            end
        end
    end

    -- Starting Coal
    if give_coal then
        player.insert({ name = "coal", count = 10 })
    end

    -- Localized message
    player.print({ "message.urob-start-equipment" })
end

script.on_event(defines.events.on_player_created, give_starting_items)
