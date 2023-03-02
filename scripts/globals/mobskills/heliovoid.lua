---------------------------------------------
-- Skill: Heliovoid
-- Absorbs one status effect from all players in range.
-- Type: Magical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
---------------------------------------------
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- try to drain buff
    local effect = mob:stealStatusEffect(target, xi.effectFlag.DISPELABLE)
    if effect ~= 0 then
        skill:setMsg(xi.msg.basic.EFFECT_DRAINED)
        return 1
    end
end

return mobskillObject