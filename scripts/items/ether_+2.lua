-----------------------------------
-- ID: 4130
-- Item: Ether +2
-- Item Effect: Restores 30 MP
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getMP() == target:getMaxMP() then
        return xi.msg.basic.ITEM_UNABLE_TO_USE
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(xi.effect.CURSE_II) then
        target:messageBasic(xi.msg.basic.NO_EFFECT)
        return 1
    end
    
    target:messageBasic(xi.msg.basic.RECOVERS_MP, 0, target:addMP(30 * xi.settings.main.ITEM_POWER))
end

return itemObject
