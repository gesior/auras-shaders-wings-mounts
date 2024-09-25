function onUse(cid, item, frompos, item2, topos)
    if getPlayerLevel(cid) < 50 then
        doPlayerSendCancel(cid, 'You need 50 level to use this rune.')
        return false
    end
    local vocations = { 7, 8, 3, 4 }
    if isInArray(vocations, getPlayerVocation(cid)) then
        doSendMagicEffect(topos, 13)
        doCreatureSay(cid, "HEAL", 19)

        local minHP = (getPlayerLevel(cid) * 4.0 + getPlayerMagLevel(cid) * 4) + 100
        local maxHP = (getPlayerLevel(cid) * 4.1 + getPlayerMagLevel(cid) * 5) + 140
        local amountHP = math.random(minHP, maxHP)

        local minMP = (getPlayerLevel(cid) * 2.6 + getPlayerMagLevel(cid) * 4) + 100
        local maxMP = (getPlayerLevel(cid) * 2.7 + getPlayerMagLevel(cid) * 5) + 140
        local amountMP = math.random(minMP, maxMP)

        if doCreatureAddHealth(cid, amountHP) == LUA_ERROR or doPlayerAddMana(cid, amountMP) == LUA_ERROR then
            return false
        end
    else
        doPlayerSendCancel(cid, 'This rune is only useable by paladins or knights.')
    end
    return true
end