-----------------------------------
-- Area: The Eldieme Necropolis [S] (175)
--  Mob: Ignis Djinn
-----------------------------------
mixins = { require('scripts/mixins/families/djinn') }
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

return entity
