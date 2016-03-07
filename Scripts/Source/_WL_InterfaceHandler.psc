Scriptname _WL_MeterInterfaceHandler extends Quest

_WL_SKI_MeterWidget property Meter auto
GlobalVariable property DisplayMode auto
{The display mode global. 0 = Off. 1 = Always On. 2 = Contextual.}
GlobalVariable property AttributeValue auto
{The global that contains the attribute for this meter.}
GlobalVariable property AttributeMax auto
{The global that contains the maximum value for this attribute.}
GlobalVariable property OpacityMax auto
{The global that contains the maximum opacity value for this meter.}

bool should_update = false
bool meter_displayed = false
int display_iterations_remaining = 0
float last_attribute_value = 0.0

Event OnUpdate()
	UpdateParentMeter()
	if should_update
		RegisterForSingleUpdate(2)
		should_update = false
	endif
EndEvent

function UpdateParentMeter(bool abForceDisplayIfEnabled = false)
	HandleMeterUpdate(abForceDisplayIfEnabled)
	if display_iterations_remaining > 0
		display_iterations_remaining -= 1
	endif

	if display_iterations_remaining != 0
		if !should_update
			should_update = true
		endif
	else
		if DisplayMode.GetValueInt() == 2 && meter_displayed
			Meter.FadeTo(0.0, 3.0)
			meter_displayed = false
		endif
	endif
endFunction

function HandleExposureMeterUpdate(bool abForceDisplayIfEnabled = false)
	bool warm = false
	float attribute_value = AttributeValue.GetValue()
	
	;if attribute_value < 20.0
	;	warm = true
	;endif

	if DisplayMode.GetValueInt() == 1 														; Always On
		Meter.Alpha = OpacityMax.GetValue()
	elseif DisplayMode.GetValueInt() == 2 || abForceDisplayIfEnabled 						; Contextual
		if warm
			ContextualDisplay(attribute_value)
		else
			Exposure_ContextualDisplay(exposure, abForceDisplayIfEnabled)
		endif
	elseif _Frost_Setting_MeterDisplayMode.GetValueInt() == 0 && exposure_display_iterations_remaining == 0
		ExposureMeter.Alpha = 0.0
		return
	endif

	if (warm && last_exposure <= 20.0 && exposure > 20.0) || (!warm && last_exposure > 20.0 && exposure <= 20.0)
		ExposureMeter.ForcePercent(0.0)
	endif

	if warm
		ExposureMeter.SetPercent(1.0 - (exposure / 20.0))
		ExposureMeter.SetColors(_Frost_ExposureMeterColorWarm_Light.GetValueInt(), _Frost_ExposureMeterColorWarm_Dark.GetValueInt())
	else
		ExposureMeter.SetPercent((exposure - 20.0) / 100.0)
		ExposureMeter.SetColors(_Frost_ExposureMeterColorCold_Light.GetValueInt(), _Frost_ExposureMeterColorCold_Dark.GetValueInt())
	endif

	last_attribute_value = attribute_value
endFunction