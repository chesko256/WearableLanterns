scriptname _WL_LegacyToggleLantern extends ActiveMagicEffect

_WL_LanternOil_v3 property LanternQuest auto
Actor property PlayerRef auto
GlobalVariable property _WL_gToggle auto
GlobalVariable property _WL_Debug auto
Sound property _WL_OilLanternOff auto
Sound property _WL_OilLanternOn auto
Sound property PHYBottleSmallH auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akCaster == PlayerRef
		ToggleLantern()
	endif
EndEvent

function ToggleLantern()
	if LanternQuest.current_lantern == LanternQuest.LANTERN_OIL
		if _WL_gToggle.GetValueInt() == 1
			LanternQuest.ToggleLanternOff()
			_WL_OilLanternOff.Play(PlayerRef)
			WLDebug(1, "Oil lantern turned off.")
		else
			LanternQuest.ToggleLanternOn()
			LanternQuest.previous_lantern_state = true
			_WL_OilLanternOn.Play(PlayerRef)
			LanternQuest.CheckFuel_Vanilla()
			WLDebug(1, "Oil lantern turned on.")
		endIf
	elseif LanternQuest.current_lantern == LanternQuest.LANTERN_TORCHBUG
		if _WL_gToggle.GetValueInt() == 1
			LanternQuest.ToggleLanternOff()
			PHYBottleSmallH.Play(PlayerRef)
			WLDebug(1, "Torchbug lantern turned off.")
		else
			LanternQuest.ToggleLanternOn()
			PHYBottleSmallH.Play(PlayerRef)
			LanternQuest.CheckFuel_Vanilla()
			WLDebug(1, "Torchbug lantern turned on.")
		endIf
	endIf
endFunction

function WLDebug(int aiSeverity, string asLogMessage)
	int LOG_LEVEL = _WL_Debug.GetValueInt()
	if LOG_LEVEL <= aiSeverity
		if aiSeverity == 0
			debug.trace("[Wearable Lanterns][Debug] " + asLogMessage)
		elseif aiSeverity == 1
			debug.trace("[Wearable Lanterns][Info] " + asLogMessage)
		elseif aiSeverity == 2
			debug.trace("[Wearable Lanterns][Warning] " + asLogMessage)
		elseif aiSeverity == 3
			debug.trace("[Wearable Lanterns][ERROR] " + asLogMessage)
		endif
	endif
endFunction