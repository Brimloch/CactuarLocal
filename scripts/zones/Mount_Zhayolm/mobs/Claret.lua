-----------------------------------
-- Area: Mount Zhayolm
--  ZNM: Claret
-- !pos 501 -9 53
-- Spawned with Pectin: !additem 2591
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Claret
-----------------------------------
mixins = { require("scripts/mixins/rage") }
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:setMobMod(xi.mobMod.GIL_MIN, 3000)
    mob:setMobMod(xi.mobMod.GIL_MAX, 5000)
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:addMod(xi.mod.REGEN, math.floor(mob:getMaxHP() * 0.004))
    mob:addMod(xi.mod.BIND_MEVA, 40)
    mob:addMod(xi.mod.MOVE, 25)
    mob:setMobMod(xi.mobMod.TARGET_DISTANCE_OFFSET, 50)
    mob:addMod(xi.mod.REGAIN, 100) -- can be seen TPing with little to no interaction from players
    mob:setAutoAttackEnabled(false)
    mob:setMod(xi.mod.UDMGMAGIC, 50)
end

entity.onMobFight = function(mob, target)
    if mob:checkDistance(target) < 3 then
        if not target:hasStatusEffect(xi.effect.POISON) then
            target:addStatusEffect(xi.effect.POISON, 100, 3, math.random(3, 6) * 3) -- Poison for 3-6 ticks.
        else
            if target:getStatusEffect(xi.effect.POISON):getPower() < 100 then
                target:delStatusEffect(xi.effect.POISON)
                target:addStatusEffect(xi.effect.POISON, 100, 3, math.random(3, 6) * 3) -- Poison for 3-6 ticks.
            end
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
