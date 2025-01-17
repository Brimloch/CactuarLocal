-----------------------------------
-- Catastrophe
-- Scythe weapon skill
-- Skill Level: N/A
-- Drain target's HP. Bec de Faucon/Apocalypse: Additional effect: Haste
-- This weapon skill is available with the stage 5 relic Scythe Apocalypse or within Dynamis with the stage 4 Bec de Faucon.
-- Also available without Aftermath effects with the Crisis Scythe. After 13 weapon skills have been used successfully, gives one 'charge' of Catastrophe.
-- Aligned with the Shadow Gorget & Soil Gorget.
-- Aligned with the Shadow Belt & Soil Belt.
-- Element: None
-- Modifiers: INT:40%  AGI:40%
-- 100%TP    200%TP    300%TP
-- 2.75      2.75      2.75
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 2.75, 2.75, 2.75 }
    params.agi_wsc = 0.4 params.int_wsc = 0.4

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.6 params.agi_wsc = 0.0 params.int_wsc = 0.4
    end

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if not target:isUndead() then
        local drain = math.floor(damage * (math.random(55,75)/100))
        local drainMod = 1 + player:getMod(xi.mod.ENH_DRAIN_ASPIR) / 100
        local diff = (player:getMaxHP() - player:getHP())
        if drain > diff then
            drain = diff
        end
        drain = drain * drainMod
        player:addHP(drain)
        player:timer(3500, function(playerArg)
            playerArg:messagePublic(xi.msg.basic.RECOVERS_HP, player, 0, drain)
        end)
    end

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
