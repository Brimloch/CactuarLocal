-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Sorrowful Sage
-- Type: Assault Mission Giver
-- !pos 134.096 0.161 -30.401 50
-----------------------------------
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/assault")
require("scripts/globals/besieged")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

local lowGradeItems = {         --  Item           
    [1] = {BitPosition = 1},    --  Barb Drink     
    [2] = {BitPosition = 2},    --  Fighter Drink  
    [3] = {BitPosition = 3},    --  Oracle Drink   
    [4] = {BitPosition = 4},    --  Assn Drink     
    [5] = {BitPosition = 5},    --  Spy Drink      
    [6] = {BitPosition = 10},   --  Gnostic Drink  
    [7] = {BitPosition = 12},   --  Shep Drink     
    [8] = {BitPosition = 18},   --  Reraise        
    [9] = {BitPosition = 19},   --  Strange Milk   
    [10] = {BitPosition = 20},  --  Strange Juice  
    [11] = {BitPosition = 21},  --  Vicars Drink   
    [12] = {BitPosition = 26},  --  Sprinter Drink 
}

local mediumGradeItems = {      --  Item           
    [1] = {BitPosition = 6},    --  Braver Drink   
    [2] = {BitPosition = 7},    --  Soldier Drink  
    [3] = {BitPosition = 8},    --  Champ Drink    
    [4] = {BitPosition = 9},    --  Monarch Drink  
    [5] = {BitPosition = 11},   --  Cleric Drink   
    [6] = {BitPosition = 13},   --  Dusty Potion   
    [7] = {BitPosition = 14},   --  Dusty Ether    
    [8] = {BitPosition = 16},   --  Fanatic Drink  
    [9] = {BitPosition = 17},   --  Fools Drink    
    [10] = {BitPosition = 22},  --  Dusty Wing     
    [11] = {BitPosition = 23},  --  Body Boost     
    [12] = {BitPosition = 24},  --  Mana Boost     
}

local highGradeItems = {        --  Item        
    [1] = {BitPosition = 15},   --  Dusty Elixir
}


entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local rank = xi.besieged.getMercenaryRank(player)
    local haveimperialIDtag
    
    local assaultPoints = player:getAssaultPoint(xi.assault.assaultArea.NYZUL_ISLE)
    local floorProgress = player:getCharVar("NyzulFloorProgress")
    local unchartedFloorProgress = 0

    local vendingBoxPreferences = player:getCharVar("Nyzul_VendingBoxPref")

    if player:hasKeyItem(xi.ki.IMPERIAL_ARMY_ID_TAG) then
        haveimperialIDtag = 1
    else
        haveimperialIDtag = 0
    end

    if (rank > 0) then
        -- param7 on the client side, param 8 here (since the client is a good CS student and counts from 0) appears to be a lockout time - possibly related to uncharted?
        player:startEvent(278, rank, haveimperialIDtag, assaultPoints, player:getCurrentAssault(), floorProgress, unchartedFloorProgress, vendingBoxPreferences, 0)
    else
        player:startEvent(284) -- no rank
    end
end

entity.onEventUpdate = function(player, csid, option)
    local rank = xi.besieged.getMercenaryRank(player)
    local haveimperialIDtag = player:hasKeyItem(xi.ki.IMPERIAL_ARMY_ID_TAG) and 1 or 0
    local assaultPoints = player:getAssaultPoint(xi.assault.assaultArea.NYZUL_ISLE)
    local floorProgress = player:getCharVar("NyzulFloorProgress")
    local unchartedFloorProgress = 0
    local vendingBoxPreferences = player:getCharVar("Nyzul_VendingBoxPref")

   -- if player:hasKeyItem(xi.ki.IMPERIAL_ARMY_ID_TAG) then
   --     haveimperialIDtag = 1
   -- else
   --     haveimperialIDtag = 0
   -- end

    if csid == 278 then
        local categorytype = bit.band(option, 0x0F)
        if categorytype == 3 then
            -- low grade item
            local item = bit.rshift(option, 16) / 4
            vendingBoxPreferences = bit.bxor(vendingBoxPreferences, bit.lshift(1, lowGradeItems[item].BitPosition))
            player:setCharVar("Nyzul_VendingBoxPref", vendingBoxPreferences)
        elseif categorytype == 4 then
            -- medium grade item
            local item = bit.rshift(option, 16) / 4
            vendingBoxPreferences = bit.bxor(vendingBoxPreferences, bit.lshift(1, mediumGradeItems[item].BitPosition))
            player:setCharVar("Nyzul_VendingBoxPref", vendingBoxPreferences)
        elseif categorytype == 5 then
            -- high grade item
            local item = bit.rshift(option, 16) / 4
            vendingBoxPreferences = bit.bxor(vendingBoxPreferences, bit.lshift(1, highGradeItems[item].BitPosition))
            player:setCharVar("Nyzul_VendingBoxPref", vendingBoxPreferences)
        end

        player:updateEvent(rank, haveimperialIDtag, assaultPoints, player:getCurrentAssault(), floorProgress, unchartedFloorProgress, vendingBoxPreferences, 0)
    end
end


entity.onEventFinish = function(player, csid, option)
    if csid == 278 then
        local selectiontype = bit.band(option, 0xF)
        if selectiontype == 1 then
            -- taken assault mission
            player:addAssault(bit.rshift(option, 4))
            player:delKeyItem(xi.ki.IMPERIAL_ARMY_ID_TAG)
            player:addKeyItem(xi.ki.NYZUL_ISLE_ASSAULT_ORDERS)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.NYZUL_ISLE_ASSAULT_ORDERS)
        end
    end
end

return entity
