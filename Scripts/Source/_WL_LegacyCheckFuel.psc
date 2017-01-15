scriptname _WL_LegacyCheckFuel extends ActiveMagicEffect

_WL_LanternOil_v3 property LanternQuest auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	LanternQuest.CheckFuel_Vanilla()
EndEvent