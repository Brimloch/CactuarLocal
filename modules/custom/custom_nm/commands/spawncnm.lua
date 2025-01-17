-----------------------------------
-- func: spawncnm
-- desc: Spawn custom NM in current zone
-----------------------------------
local nm = require('modules/custom/custom_nm/custom_nm')
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

commandObj.onTrigger = function(player, name)
    local zone = player:getZone()
    local zoneID = zone:getID()
    local nmName = string.gsub(name, '_', ' ')

    for _, v in pairs(nm.zone[zoneID]) do
        if v.name == nmName then
            local pos = player:getPos()

            if v.spawnArea then
                player:setPos(v.spawnArea[1], v.spawnArea[2], v.spawnArea[3])
            end

            v.mob:setSpawn(pos.x, pos.y, pos.z, pos.rot)
            v.mob:spawn()
            player:printToPlayer(string.format('Spawning: %s', nmName), xi.msg.channel.SYSTEM_3, '')

            return
        end
    end

    player:printToPlayer(string.format('Unable to spawn: %s', nmName), xi.msg.channel.SYSTEM_3, '')
end

return commandObj