-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Cherry Sapling
-- Note: PH for Cemetery Cherry
-----------------------------------
local ID = zones[xi.zone.KING_RANPERRES_TOMB]
-----------------------------------
local entity = {}

entity.onMobDespawn = function(mob)
    local cemCherry = GetMobByID(ID.mob.CEMETERY_CHERRY)

    cemCherry:setLocalVar("[POP]Cemetery_Cherry", cemCherry:getLocalVar("[POP]Cemetery_Cherry") + 1)
    DisallowRespawn(mob:getID(), true)
    if cemCherry:getLocalVar("[POP]Cemetery_Cherry") == 8 then
        cemCherry:setLocalVar("[POP]Cemetery_Cherry", 0)
        SpawnMob(ID.mob.CEMETERY_CHERRY) -- Pop Cemetery Cherry !
    end
end

return entity
