-----------------------------------
-- xi.effect.SLEEP
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    if effect:getSubType() == xi.effect.BIO then
        -- Nightmare
        target:addMod(xi.mod.REGEN_DOWN, effect:getSubPower())
end

    -- Immunobreak reset.
    target:setMod(xi.mod.SLEEP_IMMUNOBREAK, 0)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    if effect:getSubType() == xi.effect.BIO then
        -- Nightmare
        target:delMod(xi.mod.REGEN_DOWN, effect:getSubPower())
    end
end

return effectObject
