-----------------------------------
--  Crystal Weapon
--
--  Description: Invokes the power of a crystal to deal magical damage of a random element to a single target.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown
--  Notes: Can be Fire, Earth, Wind, or Water element.  Functions even at a distance (outside of melee range).
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = 1

    if mob:getName() == 'Lost_Suttung' then
        dmgmod = 3
    end

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, xi.element.FIRE, dmgmod, xi.mobskills.magicalTpBonus.MAB_BONUS, 1)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.FIRE)

    if mob:getName() == 'Suttung' or mob:getName() == 'Lost_Suttung' then
        if dmg > 0 then
            xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.PLAGUE, 5, 0, 60)
        end
    end

    return dmg
end

return mobskillObject
