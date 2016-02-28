Scriptname _WL_FuelMeterUpdate extends Quest  

_WL_LanternOil_v3 property LanternQuest auto
_WL_Compatibility property Compatibility auto
GlobalVariable property _WL_OilLevel auto
GlobalVariable property _WL_PollenLevel auto
GlobalVariable property _WL_MeterOpacity auto
GlobalVariable property _WL_MeterDisplayTime auto
GlobalVariable property _WL_OilColor auto
GlobalVariable property _WL_PollenColor auto
GlobalVariable property _WL_FuelMeterDisplay_Contextual auto
GlobalVariable property _WL_SettingOil auto
GlobalVariable property _WL_SettingFeeding auto
_WL_FuelMeter property FuelMeter auto

float fLastFuelValue
int iDisplayIterationsRemaining

Event OnInit()
	StartUpdating()
endEvent

Event OnGameReload()
	StartUpdating()
endEvent

Event OnUpdate()
	if Compatibility.bIsSKYUILoaded
		UpdateMeter()
	endif
	RegisterForSingleUpdate(2)
endEvent

function StartUpdating()
	RegisterForSingleUpdate(2)
endFunction

function ForceDisplayAndUpdate(bool bSkipDisplayHandling = true)
	if Compatibility.bIsSKYUILoaded
		;Called by things that change fuel.
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
		FuelMeter.FadeTo(_WL_MeterOpacity.GetValue(), 1.0)
		UpdateMeter(bSkipDisplayHandling)
	endif
endFunction

function UpdateMeter(bool bSkipDisplayHandling = false)
	float fThisFuelValue
	if (LanternQuest.current_lantern == LanternQuest.LANTERN_OIL || LanternQuest.current_lantern == LanternQuest.LANTERN_TORCHBUG) && (_WL_SettingOil.GetValueInt() == 2 || _WL_SettingFeeding.GetValueInt() == 2)
		if LanternQuest.current_lantern == LanternQuest.LANTERN_OIL
			fThisFuelValue = _WL_OilLevel.GetValue()
			UpdateOil(fThisFuelValue, bSkipDisplayHandling)
		elseif LanternQuest.current_lantern == LanternQuest.LANTERN_TORCHBUG
			fThisFuelValue = _WL_PollenLevel.GetValue()
			UpdatePollen(fThisFuelValue, bSkipDisplayHandling)
		endif

		fLastFuelValue = fThisFuelValue

		if iDisplayIterationsRemaining > 0
			iDisplayIterationsRemaining -= 1
			if iDisplayIterationsRemaining <= 0
				iDisplayIterationsRemaining = 0
				if _WL_FuelMeterDisplay_Contextual.GetValueInt() != 1
					FuelMeter.FadeTo(0.0, 3.0)
				endif
			endif
		elseif iDisplayIterationsRemaining == 0
			if FuelMeter.Alpha == _WL_MeterOpacity.GetValue()
				if _WL_FuelMeterDisplay_Contextual.GetValueInt() != 1
					FuelMeter.FadeTo(0.0, 3.0)
				endif
			endif
		else
			;keep it on
		endif
	else
		FuelMeter.FadeTo(0.0, 3.0)
	endif
endFunction

function UpdateOil(float fThisFuelValue, bool bSkipDisplayHandling = false)
	;debug.trace("[Wearable Lantern] UpdateOil " + fThisFuelValue + ", " + bSkipDisplayHandling)
	if _WL_FuelMeterDisplay_Contextual.GetValueInt() == 1
		FuelMeter.Alpha = _WL_MeterOpacity.GetValue()
	elseif _WL_FuelMeterDisplay_Contextual.GetValueInt() == 2 || bSkipDisplayHandling
		ContextualDisplayOil(fThisFuelValue, bSkipDisplayHandling)
	elseif _WL_FuelMeterDisplay_Contextual.GetValueInt() == 0 && iDisplayIterationsRemaining == 0
		FuelMeter.Alpha = 0.0
		return
	endif
	;debug.trace(fThisFuelValue + " / 16.0")
	FuelMeter.SetPercent(fThisFuelValue / 16.0)
	FuelMeter.SetColors(_WL_OilColor.GetValueInt())
endFunction

function UpdatePollen(float fThisFuelValue, bool bSkipDisplayHandling = false)
	if _WL_FuelMeterDisplay_Contextual.GetValueInt() == 1
		FuelMeter.Alpha = _WL_MeterOpacity.GetValue()
	elseif _WL_FuelMeterDisplay_Contextual.GetValueInt() == 2 || bSkipDisplayHandling
		ContextualDisplayPollen(fThisFuelValue, bSkipDisplayHandling)
	elseif _WL_FuelMeterDisplay_Contextual.GetValueInt() == 0 && iDisplayIterationsRemaining == 0
		FuelMeter.Alpha = 0.0
		return
	endif
	FuelMeter.SetPercent(fThisFuelValue / 32.0)
	FuelMeter.SetColors(_WL_PollenColor.GetValueInt())
endFunction

function ContextualDisplayOil(float fThisFuelValue, bool bSkipDisplayHandling = false)
	;debug.trace("[Wearable Lanterns] " + fThisFuelValue + " " + fLastFuelValue + " " + iDisplayIterationsRemaining)
	if bSkipDisplayHandling
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
		return
	endif

	bool GoingDown = fLastFuelValue > fThisFuelValue
	if GoingDown && fLastFuelValue >= 8.5 && fThisFuelValue < 8.5
		;50%, show
		FuelMeter.FadeTo(_WL_MeterOpacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
	elseif GoingDown && fLastFuelValue >= 4.5 && fThisFuelValue < 4.5
		;25%, show
		FuelMeter.FadeTo(_WL_MeterOpacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
	elseif GoingDown && fLastFuelValue >= 2.5 && fThisFuelValue < 2.5
		;10%, show
		FuelMeter.FadeTo(_WL_MeterOpacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
	elseif !GoingDown && fLastFuelValue != fThisFuelValue && fLastFuelValue < 15.5
		;going up, show
		FuelMeter.FadeTo(_WL_MeterOpacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
	endif
endFunction

function ContextualDisplayPollen(float fThisFuelValue, bool bSkipDisplayHandling = false)
	;debug.trace("[Frostfall] " + fThisFuelValue + " " + fLastFuelValue + " " + iDisplayIterationsRemaining)
	if bSkipDisplayHandling
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
		return
	endif

	bool GoingDown = fLastFuelValue > fThisFuelValue
	if GoingDown && fLastFuelValue >= 16.0 && fThisFuelValue < 16.0
		;50%, show
		FuelMeter.FadeTo(_WL_MeterOpacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
	elseif GoingDown && fLastFuelValue >= 8.0 && fThisFuelValue < 8.0
		;25%, show
		FuelMeter.FadeTo(_WL_MeterOpacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
	elseif GoingDown && fLastFuelValue > 4.0 && fThisFuelValue <= 4.0
		;10%, show
		FuelMeter.FadeTo(_WL_MeterOpacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
	elseif !GoingDown && fLastFuelValue != fThisFuelValue && fThisFuelValue < 32.0
		;going up, show
		FuelMeter.FadeTo(_WL_MeterOpacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _WL_MeterDisplayTime.GetValueInt()
	endif
endFunction