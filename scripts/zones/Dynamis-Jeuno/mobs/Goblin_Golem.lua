-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Goblin Golem
-- Note: Mega Boss
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setLocalVar('[isDynamis_Megaboss]', 1)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.dynamis.megaBossOnDeath(mob, player, optParams)
    xi.magian.onMobDeath(mob, player, optParams, set{ 2713 })
end

return entity
