-----------------------------------
-- Area: Wajaom Woodlands
--  MOB: Grand Marid
-- Note: 30 minute lottery
-----------------------------------
local ID = zones[xi.zone.WAJAOM_WOODLANDS]
mixins = 
{ 
require('scripts/mixins/families/chigoe_pet'),
require('scripts/mixins/families/marid'),
}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.GRAND_MARID1_PH, 5, 1800)
    xi.mob.phOnDespawn(mob, ID.mob.GRAND_MARID2_PH, 5, 1800)
end

return entity
