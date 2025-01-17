-----------------------------------
-- ID: 14490
-- mana_tunic
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
    
    local mpHeal = math.random(30, 40)
    local dif = target:getMaxMP() - target:getMP()
    if mpHeal > dif then
        mpHeal = dif
    end

    target:addMP(mpHeal)
    target:messageBasic(xi.msg.basic.RECOVERS_MP, 0, mpHeal)
end

return itemObject
