-----------------------------------
-- Hard Slash
-- Great Sword weapon skill
-- Skill level: 5
-- Delivers a single-hit attack. Damage varies with TP.
-- Modifiers: STR:30%
-- 100%TP     200%TP     300%TP
-- 1.5         1.75        2.0
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 1.5, 1.75, 2.0 }
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.3

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 1.75, 2.5, 3.75 }
        params.str_wsc = 1.0
        params.atkVaries = { 1.2, 1.2, 1.2 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
