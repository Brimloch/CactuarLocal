-----------------------------------
-- Area: Garlaige Citadel
--   NM: Chandelier
-- Note: Spawned for quest "Hitting the Marquisate"
-----------------------------------
local ID = zones[xi.zone.GARLAIGE_CITADEL]
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    GetMobByID(ID.mob.CHANDELIER):setRespawnTime(0)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 10)
    mob:addMod(xi.mod.ATT, 175)
end

entity.onMobEngaged = function(mob, target)
    local ce = mob:getCE(target)
    local ve = mob:getVE(target)
    if ce == 0 and ve == 0 then
        mob:setMobMod(xi.mobMod.NO_DROPS, 1)
        mob:useMobAbility(511) -- self-destruct
    end
end

entity.onMobDeath = function(mob, player, optParams)
    GetNPCByID(ID.npc.CHANDELIER_QM):setLocalVar('chandelierCooldown', os.time() + 600) -- 10 minute timeout
end

return entity
