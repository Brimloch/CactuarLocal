-----------------------------------
-- Area: Caedarva Mire
--  Mob: Peallaidh
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addImmunity(xi.immunity.SLEEP)
    mob:setMod(xi.mod.STORETP, 50) -- Value an approximation. Precise values needed
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 468)
end

return entity
