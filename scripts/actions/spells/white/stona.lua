-----------------------------------
-- Spell: Stona
-- Removes petrification from target.
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:delStatusEffect(xi.effect.PETRIFICATION) then
        spell:setMsg(xi.msg.basic.MAGIC_REMOVE_EFFECT)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end
    caster:delStatusEffectSilent(xi.effect.MANAWELL)

    return xi.effect.PETRIFICATION
end

return spellObject
