-----------------------------------
-- Tachi Koki
-- Great Katana weapon skill
-- Skill level: 175
-- Deals light elemental damage to enemy. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Aqua Gorget & Thunder Gorget.
-- Aligned with the Aqua Belt & Thunder Belt.
-- Element: Light
-- Modifiers: STR:30%  MND:50%
-- 100%TP    200%TP    300%TP
-- .5        .75        1.00
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 0.5, 0.75, 1.0 }
    params.str_wsc = 0.5 params.mnd_wsc = 0.3
    params.hybridWS = true
    params.ele = xi.element.LIGHT
    params.skill = xi.skill.GREAT_KATANA
    params.includemab = true

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 1.0, 1.25, 1.60 }
        params.str_wsc = 0.2 params.mnd_wsc = 0.75
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    local duration = 5 * applyResistanceAddEffect(player, target, xi.element.LIGHT, 0)
    if damage > 0 then
        target:addStatusEffect(xi.effect.FLASH, 20, 0, duration)
        player:messagePublic(xi.msg.basic.SKILL_ENFEEB, target, wsID, xi.effect.FLASH)
    end

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
