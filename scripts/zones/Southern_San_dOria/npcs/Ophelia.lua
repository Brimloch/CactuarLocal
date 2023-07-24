-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ophelia
-- Type: ENM Quest Timer
-----------------------------------
require("scripts/globals/enm")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.enm.timerNpcOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
