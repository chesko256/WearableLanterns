scriptname _WL_OilMeterInterfaceHandler extends CommonMeterInterfaceHandler

function RegisterForEvents()
	RegisterForModEvent("WearableLanterns_ForceOilMeterDisplay", "ForceMeterDisplay")
	RegisterForModEvent("WearableLanterns_RemoveOilMeter", "RemoveMeter")
	RegisterForModEvent("WearableLanterns_UpdateOilMeter", "UpdateMeterDelegate")
	RegisterForModEvent("WearableLanterns_CheckMeterRequirements", "CheckMeterRequirements")
	debug.trace("[Wearable Lanterns] Registered for oil meter mod events.")
endFunction