-----------------------------------
-- ID: 14491
-- Item: Dominus Shield
-- Item Effect: Restores 20-35 MP
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(xi.effect.CURSE_II) then
        target:messageBasic(xi.msg.basic.NO_EFFECT)
        return 1
    end
    
    local mpHeal = math.random(60, 85)
    local dif = target:getMaxMP() - target:getMP()
    if mpHeal > dif then
        mpHeal = dif
    end

    target:addMP(mpHeal)
    target:messageBasic(xi.msg.basic.RECOVERS_MP, 0, mpHeal)
end

return itemObject
