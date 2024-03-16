-----------------------------------
-- Sniper Shot
-- Marksmanship weapon skill
-- Skill Level: 80
-- Lowers enemy's INT. Chance of params.critical varies with TP.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: AGI:70%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 1.0, 1.0, 1.0 }
    params.agi_wsc = 0.3

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 2.0, 2.0, 2.0 }
        params.critVaries = { 0.25, 0.5, 0.80 }
        params.agi_wsc = 0.7
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)

    if damage > 0 and not target:hasStatusEffect(xi.effect.INT_DOWN) then
        target:addStatusEffect(xi.effect.INT_DOWN, 20, 0, 140)
        player:messagePublic(xi.msg.basic.SKILL_ENFEEB, target, wsID, xi.effect.INT_DOWN)
    end

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
