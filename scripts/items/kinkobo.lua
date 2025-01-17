-----------------------------------
-- ID: 17592
-- Item: Kinkobo
-- Enchantment: Subtle Blow
-- Duration: 60 Mins
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(xi.effect.ENCHANTMENT) then
        target:addStatusEffect(xi.effect.ENCHANTMENT, 0, 0, 3600, 0, 0, 0, xi.item.KINKOBO)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.SUBTLE_BLOW, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.SUBTLE_BLOW, 20)
end

return itemObject
