-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  NPC: ??? (Spawns Kirin)
-- !pos -81 32 2 178
-----------------------------------
local ID = zones[xi.zone.THE_SHRINE_OF_RUAVITAU]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, { 1404, 1405, 1406, 1407 }) then
        player:startEvent(101)
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(100)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option)
    if
        csid == 101 and
        npcUtil.popFromQM(player, GetNPCByID(ID.npc.KIRIN_QM), ID.mob.KIRIN, { claim = true })
    then
        player:confirmTrade()
    end
end

return entity
