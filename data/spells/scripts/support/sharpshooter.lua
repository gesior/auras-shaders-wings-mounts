local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local skill = Condition(CONDITION_ATTRIBUTES)
skill:setParameter(CONDITION_PARAM_TICKS, 10000)
skill:setParameter(CONDITION_PARAM_SPECIALSKILL_LIFELEECHCHANCE, 100)
skill:setParameter(CONDITION_PARAM_SPECIALSKILL_LIFELEECHAMOUNT, 80)
skill:setParameter(CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, 100)
skill:setParameter(CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, 35)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(skill)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
