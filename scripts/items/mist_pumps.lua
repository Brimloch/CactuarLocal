-----------------------------------
-- ID: 15312
-- Item: Mist Pumps
-- Item Effect: Evasion Boost
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.EVASION_BOOST)
    if effect ~= nil and effect:getItemSourceID() == xi.item.MIST_PUMPS then
        target:delStatusEffect(xi.effect.EVASION_BOOST)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(xi.item.MIST_PUMPS) then
        if not target:hasStatusEffect(xi.effect.EVASION_BOOST) then
            target:addStatusEffect(xi.effect.EVASION_BOOST, 15, 0, 180, 0, 0, 0, xi.item.MIST_PUMPS)
        else
            target:messageBasic(xi.msg.basic.NO_EFFECT)
        end
    end
end

return itemObject
