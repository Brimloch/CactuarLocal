-----------------------------------
-- Area: Stellar Fulcrum
--  NPC: Qe'Lov Gate
-----------------------------------
require('scripts/globals/bcnm')
require('scripts/globals/missions')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.bcnm.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.bcnm.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    local pZone = player:getZoneID()

    if csid == 32003 and option == 4 then
        if player:getCharVar(tostring(pZone) .. '_Fight') == 100 then
            player:setCharVar('BCNM_Killed', 0)
            player:setCharVar('BCNM_Timer', 0)
        end

        player:setCharVar(tostring(pZone) .. '_Runaway', 1)
        player:delStatusEffect(xi.effect.BATTLEFIELD)
        player:setCharVar(tostring(pZone) .. '_Runaway', 0)
    end
end

return entity
