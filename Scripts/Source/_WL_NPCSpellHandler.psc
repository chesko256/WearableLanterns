scriptname _WL_NPCSpellHandler extends ObjectReference

Actor property PlayerRef auto
Spell property LanternSpell auto
Spell property AuxSpell auto

Event OnEquipped(Actor akActor)
	if akActor != PlayerRef
		debug.trace("[Wearable Lanterns] " + self + " _WL_NPCSpellHandler OnEquipped")
		if !akActor.HasSpell(LanternSpell)
			akActor.AddSpell(LanternSpell, false)
		endif
		if AuxSpell != None
			if !akActor.HasSpell(AuxSpell)
				akActor.AddSpell(AuxSpell, false)
			endif
		endif
	endif
EndEvent

Event OnUnequipped(Actor akActor)
	if akActor != PlayerRef
		debug.trace("[Wearable Lanterns] " + self + " _WL_NPCSpellHandler OnUnequipped")
		if akActor.HasSpell(LanternSpell)
			akActor.RemoveSpell(LanternSpell)
		endif
		if AuxSpell != None
			if akActor.HasSpell(AuxSpell)
				akActor.RemoveSpell(AuxSpell)
			endif
		endif
	endif
EndEvent
