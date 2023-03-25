-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Marid
-- Note: Place holder Mahishasura
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/mobs")
mixins = 
{ 
require("scripts/mixins/behavior_spawn_chigoe"),
require("scripts/mixins/families/marid"),
}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    if xi.mob.phOnDespawn(mob, ID.mob.MAHISHASURA_PH, 5, 10800) then -- 3 hours
    elseif xi.mob.phOnDespawn(mob, ID.mob.GRAND_MARID1_PH, 5, 1800) then
    else
        xi.mob.phOnDespawn(mob, ID.mob.GRAND_MARID2_PH, 5, 1800)
    end

end

return entity
