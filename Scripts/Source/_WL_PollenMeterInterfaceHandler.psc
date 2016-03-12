scriptname _WL_PollenMeterInterfaceHandler extends CommonMeterInterfaceHandler

function RegisterForEvents()
	RegisterForModEvent("WearableLanterns_ForcePollenMeterDisplay", "ForceMeterDisplay")
	RegisterForModEvent("WearableLanterns_RemovePollenMeter", "RemoveMeter")
	RegisterForModEvent("WearableLanterns_UpdatePollenMeter", "UpdateMeterDelegate")
endFunction