-----------------------------------
-- ID: 5357
-- Item: Ether Drop
-- Item Effect: Restores 15 MP
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:hasStatusEffect(xi.effect.MEDICINE) then
        return xi.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(xi.effect.CURSE_II) then
        target:messageBasic(xi.msg.basic.NO_EFFECT)
        return 1
    end
    
    target:addMP(15 * xi.settings.main.ITEM_POWER)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 300)
end

return itemObject
