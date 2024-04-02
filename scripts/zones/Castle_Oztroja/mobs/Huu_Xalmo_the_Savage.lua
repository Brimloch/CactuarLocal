-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Huu Xalmo the Savage
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.COUNTER, 30)
    mob:addMod(xi.mod.PARALYZERES, 75)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
