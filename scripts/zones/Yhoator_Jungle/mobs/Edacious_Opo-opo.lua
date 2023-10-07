-----------------------------------
-- Area: Yhoator Jungle
--   NM: Edacious Opo-opo
-----------------------------------
local ID = zones[xi.zone.YHOATOR_JUNGLE]
-----------------------------------
local entity = {}


entity.onMobDespawn = function(mob)
    GetNPCByID(ID.npc.EDACIOUS_QM):setLocalVar("despawned", os.time() + 900)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 366)
end

return entity
