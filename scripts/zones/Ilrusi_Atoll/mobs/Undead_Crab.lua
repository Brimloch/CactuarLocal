-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  Mob: Undead Crab
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    xi.assault.adjustMobLevel(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller then
        xi.assault.progressInstance(mob, 1)
    end
end

entity.onMobDespawn = function(mob)
end

return entity
