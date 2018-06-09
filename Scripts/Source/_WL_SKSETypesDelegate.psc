scriptname _WL_SKSETypesDelegate extends Quest
{The intention of this script is to provide a common way to access objects that require
accessing types that will make the game blow up if SKSE / SkyUI is not available through the
use of Mod Events.}

import SKI_ConfigBase
import _WL_SkyUIConfigPanelScript

_WL_SkyUIConfigPanelScript property WLConfig auto 			;SkyUI Configuration script
_WL_OilMeterInterfaceHandler property OilMeterHandler auto
_WL_PollenMeterInterfaceHandler property PollenMeterHandler auto

Event OnInit()
	if !self.IsRunning()
		self.Start()
	endif
	RegisterForAllEvents()
EndEvent

function RegisterForAllEvents()
	RegisterForModEvent("WearableLanterns_Upgrade_4_0", "Upgrade_4_0")
	RegisterForModEvent("WearableLanterns_LoadProfileOnStartup", "LoadProfileOnStartup")
	RegisterForModEvent("WearableLanterns_RegisterForKeysOnLoad", "RegisterForKeysOnLoad")
	RegisterForModEvent("WearableLanterns_RegisterForEventsOnLoad", "RegisterForEventsOnLoad")
	RegisterForModEvent("WearableLanterns_CheckFuel", "CheckFuel")
endFunction

Event Upgrade_4_0()
	; Re-run the MCM initialization.
	WLConfig.OnConfigInit()

	; Load a meter preset for the user's display aspect ratio
	WLConfig.ApplyMeterPreset(1)
endEvent

Event LoadProfileOnStartup()
	WLConfig.LoadProfileOnStartup()
endEvent

Event RegisterForKeysOnLoad()
	WLConfig.RegisterForKeysOnLoad()
endEvent

Event RegisterForEventsOnLoad()
	OilMeterHandler.RegisterForEvents()
	PollenMeterHandler.RegisterForEvents()
EndEvent

Event CheckFuel()
	WLConfig.CheckFuel()
endEvent