-----------------------------------
-- Area: Dynamis - Tavnazia
--  Mob: Tombstone Prototype
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.dynamis.timeExtensionOnDeath(mob, player, optParams)
end

return entity
