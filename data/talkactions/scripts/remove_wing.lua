function onSay(player, words, param)
    if not player:getGroup():getAccess() then
        return true
    end

    if player:getAccountType() < ACCOUNT_TYPE_GOD then
        return false
    end

    local split = param:splitTrimmed(",")
    if #split ~= 2 then
        player:sendTextMessage(
                MESSAGE_STATUS_CONSOLE_BLUE,
                "Command requires 2 parameters split by comma ex. /removewing Player Name,1"
        )
        return false
    end

    local toPlayer = Player(split[1])
    if not toPlayer then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Player with name '" .. split[1] .. "' not found.")
        return false
    end

    local wingId = tonumber(split[2])
    if not wingId then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Second parameter is not a number.")
        return false
    end

    local wing = Game.getWing(wingId)
    if not wing then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "wing with ID " .. wingId .. " does not exist.")
        return false
    end

    if not toPlayer:hasWing(wingId) then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "This player does not have wing with ID: " .. wingId)
        return false
    end

    if not toPlayer:removeWing(wingId) then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Failed to remove wing from player.")
        return false
    end

    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Removed wing ID " .. wingId .. " from player.")
    toPlayer:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You lost wing by GM action. wing ID: " .. wingId)

    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    toPlayer:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)

    return false
end
