-----------------------------------
-- Area: Bastok Mines
--  NPC: Auction Counter
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.tutorial.onAuctionTrigger(player)
    player:sendMenu(3)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
