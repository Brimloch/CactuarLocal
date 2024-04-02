-----------------------------------
-- Area: Leujaoam Sanctum (Leujaoam Cleansing)
--  Mob: Leujaoam Worm
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    xi.assault.adjustMobLevel(mob)
    mob:setMod(xi.mod.UDMGMAGIC, -50)
    mob:addMod(xi.mod.DEF, 100)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.assault.progressInstance(mob)
end

entity.onMobDespawn = function(mob)
end

return entity
