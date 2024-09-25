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
                "Command requires 2 parameters split by comma ex. /addaura Player Name,1"
        )
        return false
    end

    local toPlayer = Player(split[1])
    if not toPlayer then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Player with name '" .. split[1] .. "' not found.")
        return false
    end

    local auraId = tonumber(split[2])
    if not auraId then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Second parameter is not a number.")
        return false
    end

    local aura = Game.getAura(auraId)
    if not aura then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Aura with ID " .. auraId .. " does not exist.")
        return false
    end

    if toPlayer:hasAura(auraId) then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "This player already has aura with ID: " .. auraId)
        return false
    end

    if not toPlayer:addAura(auraId) then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Failed to add aura to player.")
        return false
    end

    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Added aura ID " .. auraId .. " to player.")
    toPlayer:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You received aura by GM action. Aura ID: " .. auraId)

    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    toPlayer:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)

    return false
end
