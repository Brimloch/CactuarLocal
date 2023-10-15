-----------------------------------
-- Area: Phomiuna_Aqueducts
--  Mob: Fomor Red Mage
-----------------------------------
mixins = { require('scripts/mixins/fomor_hate') }
local ID = zones[xi.zone.PHOMIUNA_AQUEDUCTS]
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    for _, v in pairs(ID.mob.FOMOR_PARTY_THREE) do
        if mob:getID() == v then
            mob:setMobMod(xi.mobMod.SUPERLINK, 3)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
