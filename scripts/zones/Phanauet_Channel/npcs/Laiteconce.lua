-----------------------------------
-- Area: Phanauet Channel
--  NPC: Laiteconce
-- Type: Barge Time NPC to South or Central Landing
-- !pos 4.066 -4.5 -10.450 1
-----------------------------------
require('scripts/globals/barge')
-----------------------------------
local entity = {}

local timekeeperLocation = xi.barge.location.BARGE
local timekeeperEventId = 2

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.barge.timekeeperOnTrigger(player, timekeeperLocation, timekeeperEventId)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
