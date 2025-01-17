-----------------------------------
-- ID: 14495
-- Item: Healing Harness
-- Item Effect: Restores 50-75 HP
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getHP() == target:getMaxHP() then
        return xi.msg.basic.ITEM_UNABLE_TO_USE
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(xi.effect.CURSE_II) then
        target:messageBasic(xi.msg.basic.NO_EFFECT)
        return 1
    end
    local hpHeal = math.random(50, 75)
    local dif = target:getMaxHP() - target:getHP()
    if hpHeal > dif then
        hpHeal = dif
    end

    target:addHP(hpHeal)
    target:messageBasic(xi.msg.basic.RECOVERS_HP, 0, hpHeal)
end

return itemObject
