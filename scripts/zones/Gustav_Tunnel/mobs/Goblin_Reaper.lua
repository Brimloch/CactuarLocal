-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Goblin Reaper
-- Note: Place holder Goblinsavior Heronox
-----------------------------------
local ID = zones[xi.zone.GUSTAV_TUNNEL]
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 764, 3, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 765, 3, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.GOBLINSAVIOR_HERONOX_PH, 5, 10800) -- 3 hour minimum
end

return entity
