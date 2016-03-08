Scriptname CommonMeterInterfaceHandler extends Quest

_WL_SKI_MeterWidget property Meter auto
GlobalVariable property DisplayMode auto
{The display mode global. 0 = Off. 1 = Always On. 2 = Contextual.}
GlobalVariable property DisplayTime auto
{The display time global.}
GlobalVariable property AttributeValue auto
{The global that contains the attribute for this meter.}
GlobalVariable property AttributeMax auto
{The global that contains the maximum value for this attribute.}
GlobalVariable property OpacityMax auto
{The global that contains the maximum opacity value for this meter.}
GlobalVariable property MainPrimaryColor auto
{Setting global for primary color.}
GlobalVariable property MainSecondaryColor auto
{Setting global for primary color.}
GlobalVariable property AuxPrimaryColor auto
{Setting global for aux (inversion) color.}
GlobalVariable property AuxSecondaryColor auto
{Setting global for aux (inversion) color.}

bool property lower_is_better = false auto
{By default, contextual mode displays the meter when decreasing below thresholds and always when increasing. Setting this to "true" makes the system display the meter when increasing above thresholds and always when decreasing.}
float property meter_inversion_value = -1.0 auto
{If set, this will cause the meter to fill back up / go back down when this value is reached, usually with an accompanying alternate color. Useful for portraying a "bonus range".}
float property improvement_display_delta_threshold = -1.0 auto
{If the player's attribute improves, we should force the display of the meter, but only if it exceeds this absolute value.}

bool should_update = false
bool meter_displayed = false
int display_iterations_remaining = 0
float last_attribute_value = 0.0

float[] property contextual_display_thresholds auto
bool[] property threshold_should_flash auto
bool[] property threshold_should_stay_on auto

Event OnUpdate()
	UpdateMeter()
	if should_update
		RegisterForSingleUpdate(2)
		should_update = false
	endif
EndEvent

function UpdateMeter(bool abForceDisplayIfEnabled = false)
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

function HandleMeterUpdate(bool abForceDisplayIfEnabled = false)
	bool inverted = false
	float attribute_value = AttributeValue.GetValue()
	
	if meter_inversion_value != -1.0
		if lower_is_better && attribute_value < meter_inversion_value
			inverted = true
		elseif !lower_is_better && attribute_value > meter_inversion_value
			inverted = true
		endif
	endif

	if DisplayMode.GetValueInt() == 1 														; Always On
		Meter.Alpha = OpacityMax.GetValue()
	elseif DisplayMode.GetValueInt() == 2 || abForceDisplayIfEnabled 						; Contextual
		if inverted
			ContextualDisplay(attribute_value)
		else
			ContextualDisplay(attribute_value, abForceDisplayIfEnabled)
		endif
	elseif DisplayMode.GetValueInt() == 0 && display_iterations_remaining == 0
		Meter.Alpha = 0.0
		return
	endif

	if inverted
		if lower_is_better
			Meter.SetPercent(1.0 - (attribute_value / meter_inversion_value))
			SetMeterColors(AuxPrimaryColor.GetValueInt(), AuxSecondaryColor.GetValueInt())
		else
			Meter.SetPercent(attribute_value / meter_inversion_value)
			SetMeterColors(AuxPrimaryColor.GetValueInt(), AuxSecondaryColor.GetValueInt())
		endif
	else
		Meter.SetPercent((attribute_value - meter_inversion_value) / 100.0)
		SetMeterColors(MainPrimaryColor.GetValueInt(), MainSecondaryColor.GetValueInt())
	endif

	last_attribute_value = attribute_value
endFunction

function ContextualDisplay(float attribute_value, bool abForceDisplayIfEnabled = false)
	if abForceDisplayIfEnabled
		display_iterations_remaining = DisplayTime.GetValueInt()
		return
	endif

	bool increasing = last_attribute_value < attribute_value

	int i = contextual_display_thresholds.Length - 1
	int current_zone = -1
	while i > 0
		float threshold_value = contextual_display_thresholds[i]
		float next_threshold_value = 0.0
		if i - 1 >= 0
			next_threshold_value = contextual_display_thresholds[i - 1]
		endif
		if attribute_value < threshold_value && attribute_value >= next_threshold_value
			current_zone = i - 1
			i = 0
		else
			i -= 1
		endif
	endWhile
	
	if current_zone == -1
		; Abort and return an error. This shouldn't happen.
	endif

	float threshold_value = contextual_display_thresholds[current_zone]
	bool should_flash = threshold_should_flash[current_zone]
	bool should_stay_on = threshold_should_stay_on[current_zone]
	if lower_is_better
		if increasing && last_attribute_value < threshold_value && attribute_value >= threshold_value
			if should_stay_on
				MeterFadeUp(-1, should_flash)
			else
				MeterFadeUp(DisplayTime.GetValueInt(), should_flash)
			endif
		elseif !increasing && (last_attribute_value - attribute_value >= Math.Abs(improvement_display_delta_threshold))
			MeterFadeUp(-1)
		elseif !increasing && !should_stay_on
			if display_iterations_remaining == -1
				display_iterations_remaining = DisplayTime.GetValueInt()
			endif
		endif
	else
		if !increasing && last_attribute_value > threshold_value && attribute_value <= threshold_value
			if should_stay_on
				MeterFadeUp(-1, should_flash)
			else
				MeterFadeUp(DisplayTime.GetValueInt(), should_flash)
			endif
		elseif increasing && (last_attribute_value - attribute_value >= Math.Abs(improvement_display_delta_threshold))
			MeterFadeUp(-1)
		elseif increasing && !should_stay_on
			if display_iterations_remaining == -1
				display_iterations_remaining = DisplayTime.GetValueInt()
			endif
		endif
	endif
endFunction

function MeterFadeUp(int iterations_remaining, bool flash = false)
	if DisplayMode.GetValueInt() == 0
		return
	endif
	meter_displayed = true
	Meter.FadeTo(OpacityMax.GetValue(), 2.0)
	if flash
		Meter.StartFlash()
	endIf
	display_iterations_remaining = iterations_remaining
endFunction

function SetMeterColors(int aiPrimaryColor, int aiSecondaryColor)
	if Meter.PrimaryColor != aiPrimaryColor
		Meter.SetColors(aiPrimaryColor, aiSecondaryColor)
	endIf
endFunction

Event ForceMeterDisplay(bool flash = false)
	MeterFadeUp(DisplayTime.GetValueInt(), flash)
	UpdateMeter(true)
endEvent

Event RemoveMeter()
	Meter.Alpha = 0.0
endEvent