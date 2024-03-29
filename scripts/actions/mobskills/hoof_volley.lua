-----------------------------------
--  Hoof Volley
--  Family: Hippogryph
--  Description: Deals critical damage to a single target. Resets hate and causes knockback.
--  Type: Physical
--  Utsusemi/Blink absorb: One shadow
--  Range: Melee
--  Notes: Easily stunnable
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local tpEffect1 = xi.mobskills.physicalTpBonus.DMG_VARIES
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, tpEffect1, 4, 4.25, 4.50)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)

    mob:resetEnmity(target)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
    return dmg
end

return mobskillObject
