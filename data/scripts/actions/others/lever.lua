local config = {
    itemRequired = 1111,
    amountRequired = 1,
    
    itemGiven = 2222,
    amountGiven = 1,
    
    leverLeft = 1945,
    leverRight = 1946,
    leverActionId = 45001
}


local actions_leverShop = Action()

function actions_leverShop.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getItemCount(config.itemRequired) < config.amountRequired then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You require " .. config.amountRequired .. " " .. ItemType(config.itemRequired):getName() .. " to buy this item.")
        return true
    end
    
    player:removeItem(config.itemRequired, config.amountRequired)
    player:addItem(config.itemGiven, config.amountGiven, true)
    
    item:transform(item:getId() == config.leverLeft and config.leverRight or config.leverLeft)
    return true
end

actions_leverShop:aid(config.leverActionId)
actions_leverShop:register()