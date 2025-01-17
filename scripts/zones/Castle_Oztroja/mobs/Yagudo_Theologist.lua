-----------------------------------
-- Area: Castle Oztroja (151)
--  Mob: Yagudo Theologist
-- Note: PH for Moo Ouzi the Swiftblade
-----------------------------------
local ID = zones[xi.zone.CASTLE_OZTROJA]
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.MOO_OUZI_THE_SWIFTBLADE_PH, 5, 1200) -- 20 minute respawn
end

return entity
