-----------------------------------
-- ID: 5895
-- Item: Odorless Fungus
-- Item Effect: Removes Antaeus's 100% Critical Hit Rate.
-----------------------------------


-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target, player)
    local result = 0
    if target:checkDistance(player) > 10 then
        result = xi.msg.basic.TOO_FAR_AWAY
    elseif target:getName() == 'Cirrate_Christelle' or target:getName() == 'Arch_Christelle' then
        return 0
    else
        result = xi.msg.basic.ITEM_UNABLE_TO_USE
    end

    return result
end

itemObject.onItemUse = function(target, player)
    if target:getLocalVar('itemDebuff_Fungus') == 1 then
        target:setLocalVar('itemDebuff_Fungus', 0)
        target:updateClaim(player)
    end
end

return itemObject
