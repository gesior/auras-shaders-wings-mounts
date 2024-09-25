local shop = {
    [2051] = {id = 2494, cost = 10000, count = 1},
    [2052] = {id = 2495, cost = 1000, count = 1},
    [2053] = {id = 2496, cost = 1000, count = 1},
    [2054] = {id = 2497, cost = 10000, count = 1},
    [2055] = {id = 2498, cost = 10000, count = 1},
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local ShopItem = shop[item.uid]
    local itemType = ItemType(ShopItem.id)
    if ShopItem then
        if(not player:removeMoney(ShopItem.cost)) then
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'You need '..ShopItem.cost..' to buy '.. itemType:getName() .. '.')
            return false
        end     
        player:addItem(ShopItem.id, ShopItem.count)
        player:removeMoney(ShopItem.cost)
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought a '.. itemType:getName() .. '.')
        player:getPosition():sendMagicEffect(13) 
    end
    return true
end