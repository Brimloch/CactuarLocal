-----------------------------------
-- ID: 4255
-- Item: bottle_of_mana_powder
-- Item Effect: Restores 25% of Maximum MP to Party members within 10'
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return 0
end

itemObject.onItemUse = function(target)
    target:forMembersInRange(10, function(member)
        if target:hasStatusEffect(xi.effect.CURSE_II) then
            target:messageBasic(xi.msg.basic.NO_EFFECT)
            return 1
        end
        
        member:messageBasic(xi.msg.basic.RECOVERS_MP, 0, member:addMP((member:getMaxMP() / 100) * 25))
    end)
end

return itemObject
