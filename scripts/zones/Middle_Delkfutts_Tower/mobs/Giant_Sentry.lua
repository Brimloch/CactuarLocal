-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Giant Sentry
-- Note: PH for Rhoitos and Eurytos
-----------------------------------
local ID = zones[xi.zone.MIDDLE_DELKFUTTS_TOWER]
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 783, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 784, 2, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.RHOITOS_PH, 5, 7200) -- 2 hour minimum (could not find info, so using Ogygos' cooldown)
    xi.mob.phOnDespawn(mob, ID.mob.EURYTOS_PH, 5, 7200) -- 2 hour minimum (could not find info, so using Ogygos' cooldown)
end

return entity
