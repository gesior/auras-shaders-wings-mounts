local config = {
    storage = 535923,
    effect = CONST_ME_FIREWORK_RED,
    text1 = "You have gained emerald crusader outfit!",
    text2 = "You already have this outfit!",
    looktype = 383
}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(config.storage) < 1 then
        player:addOutfit(config.looktype)
        player:sendTextMessage(MESSAGE_INFO_DESCR, config.text1)
        player:setStorageValue(config.storage, 1)
        player:getPosition():sendMagicEffect(config.effect)
        item:remove()
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, config.text2)
    end
    return true
end