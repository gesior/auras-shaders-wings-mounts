local rewardChests = {
    [17440] = {

        [46050] = {
            {itemid = 2160, count = 5},
            {itemid = 11263, count = 1},
            {itemid = 2457, count = 1},
        },

        [27441] = {
            {itemid = 2323, count = 1},
            {itemid = 8870, count = 1},
            {itemid = 8900, count = 1},
            {itemid = 2183, count = 1}
        },

        [27442] = {
            {itemid = 2491, count = 1},
            {itemid = 2515, count = 1},
            {itemid = 2664, count = 1},
            {itemid = 7438, count = 1}
        },

        [27443] = {
            {itemid = 2491, count = 1},
            {itemid = 2515, count = 1},
            {itemid = 2486, count = 1},
            {itemid = 2438, count = 1},
            {itemid = 3962, count = 1},
            {itemid = 7437, count = 1}
        },

        container = 1988,
        storage = 17440
    },
}

local yala_style_chest = Action()
function yala_style_chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local rewardChest = rewardChests[item:getActionId()]
    local rewardItems = rewardChest[item:getUniqueId()]

    if not rewardItems then
        return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Missing configuration, please report to a gamemaster.")
    end

    local storage = rewardChest.storage
    if player:getStorageValue(storage) == 1 then
        return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
    end

    local rewards = {}
    local virtualContainer = Game.createItem(rewardChest.container)

    for i = 1, #rewardItems do
        local reward = rewardItems[i]
        local newItem = ItemType(reward.itemid)

        if newItem:getId() ~= 0 then
            virtualContainer:addItem(newItem:getId(), reward.count)
            rewards[#rewards + 1] = (newItem:isStackable() and reward.count or newItem:getArticle()) .. " " .. newItem:getName()
        end
    end

    local containerWeight = virtualContainer:getWeight()
    if containerWeight > player:getFreeCapacity() then
        return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, ("You have found a %s that weights %.2f oz. It's too heavy."):format(virtualContainer:getName(), containerWeight / 100)),
            virtualContainer:remove()
    end
   
    player:setStorageValue(storage, 1)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, ("You have found a %s with %s inside."):format(virtualContainer:getName(), table.concat(rewards, ", "):gsub("(.*),", "%1 and")))

    player:addItemEx(virtualContainer)
    return true
end

for v, k in pairs(rewardChests) do
    yala_style_chest:aid(v)
end
yala_style_chest:register()