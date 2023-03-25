-- Worm family mixin
require("scripts/globals/mixins")
require("scripts/globals/status")
require("scripts/globals/world")
require("scripts/globals/toau")
-----------------------------------

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.soulflayer = function(mob)
    mob:addListener("SPAWN", "WORM_SPAWN", function(mob)
        mob:SetMagicCastingEnabled(false)
    end)

    mob:addListener("COMBAT_TICK", "WORM_CTICK", function(mob)
        local target = mob:getTarget()
        if target then
            if mob:checkDistance(target) < (mob:getMeleeRange() - 0.2) then
               mob:SetMagicCastingEnabled(false)
            else 
                mob:SetMagicCastingEnabled(true)                        
            end
         end 
    end)
end

return g_mixins.families.worm
