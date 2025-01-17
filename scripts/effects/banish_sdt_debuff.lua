-----------------------------------
-- xi.effect.TOMAHAWK
-----------------------------------
local effectObject = {}
local physSDT = { xi.mod.SLASH_SDT, xi.mod.PIERCE_SDT, xi.mod.IMPACT_SDT, xi.mod.HTH_SDT }

effectObject.onEffectGain = function(target, effect)
    if effect:getPower() == 1 then -- Banish/Banishga (Tier 1)
        for i = 1, #physSDT do
            local gearModifier  = 1 + (effect:getSubPower() / 100)
            local sdtModPhys    = target:getMod(physSDT[i])
            local reductionPhys = (1000 - sdtModPhys) * (0.50 * gearModifier)

           effect:addMod(physSDT[i], reductionPhys)
           print(gearModifier)
        end

        for i = 1, #xi.magic.specificDmgTakenMod do
            local gearModifier   = 1 + (effect:getSubPower() / 100)
            local sdtModMagic    = target:getMod(xi.magic.specificDmgTakenMod[i])
            local reductionMagic = sdtModMagic * (0.50 * gearModifier)

            effect:addMod(xi.magic.specificDmgTakenMod[i], -reductionMagic)
        end

    elseif effect:getPower() == 2 then -- Banish II/Banishga II (Tier 2)
        for i = 1, #physSDT do
            local gearModifier  = 1 + (effect:getSubPower() / 100)
            local sdtModPhys    = target:getMod(physSDT[i])
            local reductionPhys = (1000 - sdtModPhys) * (0.70 * gearModifier)

            effect:addMod(physSDT[i], reductionPhys)
        end

        for i = 1, #xi.magic.specificDmgTakenMod do
            local gearModifier   = 1 + (effect:getSubPower() / 100)
            local sdtModMagic    = target:getMod(xi.magic.specificDmgTakenMod[i])
            local reductionMagic = sdtModMagic * (0.70 * gearModifier)

            effect:addMod(xi.magic.specificDmgTakenMod[i], -reductionMagic)
        end

    elseif effect:getPower() == 3 then -- Banish III/Banishga III (Tier 3)
        for i = 1, #physSDT do
            local gearModifier  = 1 + (effect:getSubPower() / 100)
            local sdtModPhys    = target:getMod(physSDT[i])
            local reductionPhys = (1000 - sdtModPhys) * (0.90 * gearModifier)

            effect:addMod(physSDT[i], reductionPhys)
        end

        for i = 1, #xi.magic.specificDmgTakenMod do
            local gearModifier   = 1 + (effect:getSubPower() / 100)
            local sdtModMagic    = target:getMod(xi.magic.specificDmgTakenMod[i])
            local reductionMagic = sdtModMagic * (0.90 * gearModifier)
            effect:addMod(xi.magic.specificDmgTakenMod[i], -reductionMagic)
        end

    elseif effect:getPower() == 4 then -- Banish IV/Banishga IV (Tier 4)
        for i = 1, #physSDT do
            local gearModifier  = 1 + (effect:getSubPower() / 100)
            local sdtModPhys    = target:getMod(physSDT[i])
            local reductionPhys = (1000 - sdtModPhys) * (0.95 * gearModifier)

           effect:addMod(physSDT[i], reductionPhys)
        end

        for i = 1, #xi.magic.specificDmgTakenMod do
            local gearModifier   = 1 + (effect:getSubPower() / 100)
            local sdtModMagic    = target:getMod(xi.magic.specificDmgTakenMod[i])
            local reductionMagic = sdtModMagic * (0.95 * gearModifier)

            effect:addMod(xi.magic.specificDmgTakenMod[i], -reductionMagic)
        end
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    -- Mods are stacked on the effect and will be removed automatically when the effect wears off
end

return effectObject
