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
                "Command requires 2 parameters split by comma ex. /addshader Player Name,1"
        )
        return false
    end

    local toPlayer = Player(split[1])
    if not toPlayer then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Player with name '" .. split[1] .. "' not found.")
        return false
    end

    local shaderId = tonumber(split[2])
    if not shaderId then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Second parameter is not a number.")
        return false
    end

    local shader = Game.getShader(shaderId)
    if not shader then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Shader with ID " .. shaderId .. " does not exist.")
        return false
    end

    if toPlayer:hasShader(shaderId) then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "This player already has shader with ID: " .. shaderId)
        return false
    end

    if not toPlayer:addShader(shaderId) then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Failed to add shader to player.")
        return false
    end

    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Added shader ID " .. shaderId .. " to player")
    toPlayer:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You received shader by GM action. Shader ID: " .. shaderId)

    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    toPlayer:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)

    return false
end
