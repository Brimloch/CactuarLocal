-----------------------------------
-- xi.effect.DIRGE
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.CHR, effect:getSubPower()) -- Apply Stat Buff from AUGMENT_SONG_STAT
    target:addMod(xi.mod.ENMITY, -effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.CHR, effect:getSubPower()) -- Remove Stat Buff from AUGMENT_SONG_STAT
    target:delMod(xi.mod.ENMITY, -effect:getPower())
end

return effectObject
