-- File: control.lua
-- UR0B: Starting equipment logic (Factorio 2.0 compliant)

local function give_starting_items(event)
    local player = game.get_player(event.player_index)
    if not player or not player.valid then return end

    ----------------------------------------------------------------------
    -- 1) Ensure we only give items to the *first* spawn of each player.
    --    This avoids duplicates when the character is rebuilt in 2.0.
    ----------------------------------------------------------------------
    if player.was_given_start_items then return end

    ----------------------------------------------------------------------
    -- 2) Ensure the player actually has a character entity.
    --    In 2.0, the player can exist before the body exists.
    ----------------------------------------------------------------------
    if not player.character then
        -- Delay the item insertion slightly until character is created
        script.raise_event(defines.events.on_player_changed_position, event)
        return
    end

    ----------------------------------------------------------------------
    -- 3) Read startup setting (always exists in 2.0)
    ----------------------------------------------------------------------
    local crusher_setting = settings.startup["urob-start-with-burner-crusher"]
    local give_crusher = crusher_setting and crusher_setting.value

    ----------------------------------------------------------------------
    -- 4) Insert items into the character inventory safely
    ----------------------------------------------------------------------
    if give_crusher then
        local inv = player.get_main_inventory()
        if inv then
            inv.insert({ name = "burner-ore-crusher", count = 1 })
        end

        -- Put it into quickbar slot 1 if empty
        local qbar = player.get_quick_bar()
        if qbar and qbar[1] == nil then
            player.set_quick_bar_slot(1, "burner-ore-crusher")
        end
    end

    ----------------------------------------------------------------------
    -- 5) Mark player as processed (prevents duplicate starts)
    ----------------------------------------------------------------------
    player.was_given_start_items = true

    ----------------------------------------------------------------------
    -- 6) Send localized message
    ----------------------------------------------------------------------
    player.print({ "message.urob-start-equipment" })
end

script.on_event(defines.events.on_player_created, give_starting_items)
