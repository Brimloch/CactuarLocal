-----------------------------------
-- Aero 2
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onPetAbility = function(target, pet, skill)
    local dINT = math.floor(pet:getStat(xi.mod.INT) - target:getStat(xi.mod.INT))
    local tp   = pet:getTP()

    local damage = math.floor(325 + 0.025 * tp)
    damage = damage + (dINT * 1.5)
    damage = xi.mobskills.mobMagicalMove(pet, target, skill, damage, xi.element.ICE, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage.dmg, xi.element.ICE)
    damage = xi.summon.avatarFinalAdjustments(damage, pet, skill, target, xi.attackType.MAGICAL, xi.damageType.ICE, 1)

    target:takeDamage(damage, pet, xi.attackType.MAGICAL, xi.damageType.ICE)
    target:updateEnmityFromDamage(pet, damage)

    local ele = xi.element.ICE
    local magicBurst = xi.mobskills.calculateMobMagicBurst(pet, ele, target)
    if (magicBurst > 1) and target:hasStatusEffect(xi.effect.SKILLCHAIN) then -- Gated as this is run per target.
        skill:setMsg(xi.msg.basic.JA_MAGIC_BURST)
    else
        skill:setMsg(xi.msg.basic.DAMAGE)
    end

    return damage
end

return abilityObject
