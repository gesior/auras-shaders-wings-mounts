local testAction = Action() -- this is our header, the first thing we have to write (except for configuration tables and such)
local c = {
    itemid = 2270,
    price = 1000000
}

function testAction.onUse(player, item, fromPosition, target, toPosition, isHotkey) -- now we can design the action itself
    local tokenCost = player:getItemCount(c.tokenId)        
    if player:removeMoney(c.price) then
        player:addItem(c.itemid, 1)
        player:sendCancelMessage("Your purshase was successful. You paid 100cc gold.")
        fromPosition:sendMagicEffect(CONST_ME_HEARTS)
    else
        player:sendCancelMessage("You do not have enough money. You need 100cc gold.")
        fromPosition:sendMagicEffect(CONST_ME_POFF)
    end
    return true
end

testAction:aid(46030) -- the action id for lever
testAction:register() -- this is our footer, it has to be the last function executed