-----------------------------------
-- Vampiric Lash
--
-- Description: Deals dark damage to a single target. Additional effect: Drain
-- Type: Magical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
-- Notes: In ToAU zones, this has an additional effect of absorbing all status effects, including food.
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = 1
    
    if mob:getLocalVar('itemDebuff_Root') == 1 then
        dmgmod = 3
    end

    if mob:getLocalVar('itemDebuff_Root') == 0 and mob:getName() == 'Arch_Christelle' then
        dmgmod = 1
    end

    local numhits        = 1
    local accmod         = 1
    local dmgmod         = 1.0
    local tpEffect1      = xi.mobskills.physicalTpBonus.DMG_VARIES
    local tpEffect2      = xi.mobskills.physicalTpBonus.NONE
    local crit           = 0.00
    local attmod         = 1.0
    local info           = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, tpEffect1, 1.5, 2, 3, tpEffect2, 1, 2, 3, crit, attmod)
    local dmg            = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.NUMSHADOWS_1)

    -- TODO: Steals all buffs if ability hits target.
    --[[if mob:getZoneID() >= xi.zone.OPEN_SEA_ROUTE_TO_AL_ZAHBI and mob:getZoneID() <= xi.zone.CAEDARVA_MIRE then
        mob:stealStatusEffect(target, xi.effectFlag.DISPELABLE + xi.effectFlag.FOOD)
    end]]

    skill:setMsg(xi.mobskills.mobPhysicalDrainMove(mob, target, skill, xi.mobskills.drainType.HP, dmg))

    return dmg
end

return mobskillObject
