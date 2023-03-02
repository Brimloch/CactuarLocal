---------------------------------------------------
-- Seismic Tail
-- Deals extreme damage to targets behind the user.
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getID() == 16998874 then
        return 0
    else
        if not target:isBehind(mob, 96) then
            return 1
        else
            return 0
        end
    end
end


mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod  = 2
    local dmgmod  = math.random(5, 7)

    local info           = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 2, 3, 4)
    local dmg            = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.NUMSHADOWS_3)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
    
    if mob:getID() == 16998874 then
        mob:setLocalVar("Phase", 1)
        mob:setLocalVar("Changed",1)
    end

    return dmg
end

return mobskillObject
