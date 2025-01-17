
-----------------------------------
-- Area: Mamool Ja Training Grounds (Breaking Morale)
--  Npc: Quhaaja
-----------------------------------
local ID = zones[xi.zone.MAMOOL_JA_TRAINING_GROUNDS]
local entity = {}

local lootTable =
{
    xi.item.FIGHTING_FISH_TANK,
    xi.item.GOBLIN_DIE,
    xi.item.PIECE_OF_ATTOHWA_GINSENG,
    xi.item.MAMOOL_JA_COLLAR,
    xi.item.DIVINATION_SPHERE,
    xi.item.TORN_EPISTLE,
    xi.item.GILT_GLASSES,
    xi.item.WILD_RABBIT_TAIL,
}

entity.onTrigger = function(player, npc)
    local instance = player:getInstance()
    local flag = false

    -- Check if player is handing in an item
    for i = 1, #lootTable do
        local item = lootTable[i]

        if xi.assault.hasTempItem(player, item) then
            instance:setProgress((instance:getProgress() + 1))
            xi.assault.delTempItem(player, item)
            flag = true
            -- Add points to be rewarded for assault
        end
    end

    if flag then
        npc:showText(npc, ID.text.QUHAAJA_DIALOGUE_OFFSET + 1)
    elseif instance:getProgress() >= #instance:getChars() then
        player:startEvent(106, instance:getProgress())
    else
        npc:showText(npc, ID.text.QUHAAJA_DIALOGUE_OFFSET)
    end
end

entity.onEventFinish = function(player, csid, option)
    local instance = player:getInstance()

    if
        csid == 106 and
        option == 1
    then
        instance:complete()
    end
end

return entity
