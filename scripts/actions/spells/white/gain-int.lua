-----------------------------------
-- Spell: Gain-INT
-- Boosts INT for the Caster
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    if caster:isMob() and target:hasStatusEffect(xi.effect.INT_BOOST) then
        return 1
    else
        return 0
    end
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.spells.enhancing.useEnhancingSpell(caster, target, spell)
end

return spellObject
