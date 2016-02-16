scriptname _WL_TriggerLightEffect extends ActiveMagicEffect

Spell property LanternSpell auto
Spell property AuxSpell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if !akTarget.HasSpell(LanternSpell)
		akTarget.AddSpell(LanternSpell, false)
	endif
	if AuxSpell != None
		if !akTarget.HasSpell(AuxSpell)
			akTarget.AddSpell(AuxSpell, false)
		endif
	endif
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if akTarget.HasSpell(LanternSpell)
		akTarget.RemoveSpell(LanternSpell)
	endif
	if AuxSpell != None
		if akTarget.HasSpell(AuxSpell)
			akTarget.RemoveSpell(AuxSpell)
		endif
	endif 
endEvent