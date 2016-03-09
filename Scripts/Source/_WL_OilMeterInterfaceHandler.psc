scriptname _WL_OilMeterInterfaceHandler extends CommonMeterInterfaceHandler

function RegisterForEvents()
	RegisterForModEvent("WearableLanterns_ForceOilMeterDisplay", "ForceMeterDisplay")
	RegisterForModEvent("WearableLanterns_RemoveOilMeter", "RemoveMeter")
	RegisterForModEvent("WearableLanterns_UpdateOilMeter", "UpdateMeterDelegate")
endFunction