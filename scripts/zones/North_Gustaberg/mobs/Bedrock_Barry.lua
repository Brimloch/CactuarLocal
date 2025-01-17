-----------------------------------
-- Area: North Gustaberg
--   NM: Bedrock Barry
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addStatusEffect(xi.effect.STONESKIN, math.random(30, 40), 0, 300)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 199)
    xi.regime.checkRegime(player, mob, 16, 1, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.nmTODPersist(mob, math.random(3600, 4200)) -- 60 to 70 minutes
end

return entity
