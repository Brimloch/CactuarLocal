-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Typhoon Wyvern
-- Note: Place holder Ungur
-----------------------------------
local ID = zones[xi.zone.GUSTAV_TUNNEL]
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 769, 2, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    -- Ungur's PH spawns in multiple rooms
    UpdateNMSpawnPoint(mob:getID())
    xi.mob.phOnDespawn(mob, ID.mob.UNGUR_PH, 15, 7200) -- 2 hours
end

return entity
