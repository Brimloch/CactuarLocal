-----------------------------------
-- Frog Cheer
-- Increases magical attack and grants Elemental Seal xi.effect.
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if (mob:hasStatusEffect(xi.effect.MAGIC_ATK_BOOST) == false) then
        return 0
    end
    return 1
end


mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.MAGIC_ATK_BOOST, 25, 0, 300))
    mob:addStatusEffect(xi.effect.ELEMENTAL_SEAL, 1, 0, 60)
    return xi.effect.MAGIC_ATK_BOOST
end

return mobskillObject
