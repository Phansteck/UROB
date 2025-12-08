-- File: control.lua
-- UR0B startup logic: give the player a burner crusher on new game creation.

local function give_starting_items(event)
    local player = game.get_player(event.player_index)
    if not player or not player.valid then return end

    -- Give the burner crusher only in NEW games, not when players join later.
    -- burner-ore-crusher matches your prototype name
    if game.is_multiplayer() == false or player == game.players[1] then
        if player.insert({ name = "burner-ore-crusher", count = 1 }) > 0 then
            player.print({"", "[UR0B] Burner crusher issued: good luck, commander."})
        end
    end
end

script.on_event(defines.events.on_player_created, give_starting_items)
