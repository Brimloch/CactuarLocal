-----------------------------------
-- func: spawnFellow
-- desc: Spawns a player's Adventuring Fellow if they have one.
--       Primarily used for testing to bypass pearl cooldowns.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

commandObj.error = function(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!spawnFellow - no params, works on self only')
end

commandObj.onTrigger = function(player)
    if player:getFellow() ~= nil then
        error(player, 'Player already has a fellow.')
        return
    end

    if
        player:hasStatusEffect(xi.effect.LEVEL_RESTRICTION) or
        player:hasStatusEffect(xi.effect.LEVEL_SYNC)
    then
        error(player, 'Player is under Level Sync or Level Restriction.')
        return
    end

    if
        xi.settings.main.ENABLE_ADVENTURING_FELLOWS == nil or
        not xi.settings.main.ENABLE_ADVENTURING_FELLOWS
    then
        error(player, 'Fellows are disabled via server settings.')
        return
    end

    if not player:canUseMisc(xi.zoneMisc.FELLOW) then
        error(player, 'Fellows are not allowed in this zone via zone settings misc.')
        return
    end

    if player:getFellowValue('fellowid') == 0 then
        error(player, 'Player does not have a fellow.')
        return
    end

    player:spawnFellow(player:getFellowValue('fellowid'))
    player:printToPlayer('Spawned Adventuring Fellow')
end

return commandObj
