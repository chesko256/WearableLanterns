Scriptname _WL_SkyUIConfigPanelScript extends SKI_ConfigBase conditional

_WL_LanternOil_v3 property LanternQuest auto

string[] MeterDisplayList
int MeterDisplayIndex = 2
string[] MeterLayoutList
int MeterLayoutIndex = 6
string[] MeterHeightList
int MeterHeightIndex = 1
string[] MeterLengthList
int MeterLengthIndex = 0
string[] BrightnessList
int BrightnessIndex = 2
string[] LanternPositionList
int PositionIndex = 1
string[] ModeList
int ModeIndex = 0
string[] CheckFuelDisplayList
int CheckFuelDisplayIndex = 0

int General_SettingBrightnessMenu_OID
int General_SettingPositionMenu_OID
int General_SettingModeMenu_OID
int General_SettingDropLitToggle_OID
int General_SettingOilToggle_OID
int General_HotkeyLantern_OID
int General_HotkeyCheckFuel_OID
int General_SettingPollenToggle_OID
int General_SettingCandlesToggle_OID
int General_SettingCheckFuelDisplayMenu_OID
int Interface_UIMeterDisplay_OID
int Interface_UIMeterLayout_OID
int Interface_UIMeterLength_OID
int Interface_UIMeterOpacity_OID
int Interface_UIMeterDisplayTime_OID
int Interface_UIMeterHeight_OID
int Interface_UIOilMeterColor_OID
int Interface_UIPollenMeterColor_OID
int Interface_UICandleMeterColor_OID

bool property DLC2Loaded auto hidden conditional

GlobalVariable property _WL_OilLevel auto
GlobalVariable property _WL_SettingBrightness auto
GlobalVariable property _WL_SettingPosition auto 						;0 = Back, 1 = Front, 2 = Held
GlobalVariable property _WL_SettingDropLit auto
GlobalVariable property _WL_SettingOil auto
GlobalVariable property _WL_SettingFeeding auto
GlobalVariable property _WL_SettingCandleFuel auto
GlobalVariable property _WL_HotkeyPlayerLantern auto
GlobalVariable property _WL_HotkeyCheckFuel auto
GlobalVariable property _WL_CheckFuelDisplay auto
GlobalVariable property _WL_MeterOpacity auto
GlobalVariable property _WL_MeterDisplayTime auto
GlobalVariable property _WL_OilColor auto
GlobalVariable property _WL_PollenColor auto
GlobalVariable property _WL_CandleColor auto
GlobalVariable Property _WL_SettingAutomatic auto
GlobalVariable property _WL_FuelMeterDisplay_Contextual auto
GlobalVariable property _WL_gToggle auto

Sound property _WL_OilLanternOff auto
Sound property _WL_OilLanternOn auto
Sound property PHYBottleSmallH auto

Message property _WL_AutomaticModeError auto
Message property _WL_LanternOilRemainingEmpty auto
Message property _WL_LanternOilRemainingMostlyEmpty auto
Message property _WL_LanternOilRemainingLessThanHalf auto
Message property _WL_LanternOilRemainingHalfFull auto
Message property _WL_LanternOilRemainingMostlyFull auto
Message property _WL_LanternOilRemainingFull auto
Message property _WL_TorchbugRemainingFlowers auto

Event OnConfigInit()
	Pages = new string[2]
	Pages[0] = "$WearableLanternsGeneralPage"
	Pages[1] = "$WearableLanternsInterfacePage"

	LanternPositionList = new string[3]
	LanternPositionList[0] = "$WearableLanternsPositionList1"
	LanternPositionList[1] = "$WearableLanternsPositionList2"
	LanternPositionList[2] = "$WearableLanternsPositionList3"

	MeterDisplayList = new string[3]
	MeterDisplayList[0] = "$WearableLanternsOff"		;"Off"
	MeterDisplayList[1] = "$WearableLanternsAlwaysOn"	;"Always On"
	MeterDisplayList[2] = "$WearableLanternsContextual"	;"Contextual"

	MeterHeightList = new String[2]
	MeterHeightList[0] = "$WearableLanternsNormal"		;"Normal"
	MeterHeightList[1] = "$WearableLanternsThin"		;"Thin"

	MeterLengthList = new String[2]
	MeterLengthList[0] = "$WearableLanternsNormal"		;"Normal"
	MeterLengthList[1] = "$WearableLanternsShortened"	;"Shortened"

	MeterLayoutList = new string[12]
	MeterLayoutList[0] = "$WearableLanternsMeterLayoutList1"	;"Top Right, Offset"
	MeterLayoutList[1] = "$WearableLanternsMeterLayoutList2"	;"Top Right, Edge"
	MeterLayoutList[2] = "$WearableLanternsMeterLayoutList3"	;"Top Right, Corner"
	MeterLayoutList[3] = "$WearableLanternsMeterLayoutList4"	;"Top Left, Offset"
	MeterLayoutList[4] = "$WearableLanternsMeterLayoutList5"	;"Top Left, Edge"
	MeterLayoutList[5] = "$WearableLanternsMeterLayoutList6"	;"Top Left, Corner"
	MeterLayoutList[6] = "$WearableLanternsMeterLayoutList7"	;"Bottom Right, Offset"
	MeterLayoutList[7] = "$WearableLanternsMeterLayoutList8"	;"Bottom Right, Edge"
	MeterLayoutList[8] = "$WearableLanternsMeterLayoutList9"	;"Bottom Right, Corner"
	MeterLayoutList[9] = "$WearableLanternsMeterLayoutList10"	;"Bottom Left, Offset"
	MeterLayoutList[10] = "$WearableLanternsMeterLayoutList11"	;"Bottom Left, Edge"
	MeterLayoutList[11] = "$WearableLanternsMeterLayoutList12"	;"Bottom Left, Corner"

	BrightnessList = new string[4]
	BrightnessList[0] = "$WearableLanternsBrightnessList1"
	BrightnessList[1] = "$WearableLanternsBrightnessList2"
	BrightnessList[2] = "$WearableLanternsBrightnessList3"
	BrightnessList[3] = "$WearableLanternsBrightnessList4"

	ModeList = new string[2]
	ModeList[0] = "$WearableLanternsModeList1"
	ModeList[1] = "$WearableLanternsModeList2"

	CheckFuelDisplayList = new string[3]
	CheckFuelDisplayList[0] = "$WearableLanternsCheckFuelDisplayList1"
	CheckFuelDisplayList[1] = "$WearableLanternsCheckFuelDisplayList2"
	CheckFuelDisplayList[2] = "$WearableLanternsCheckFuelDisplayList3"
endEvent

event OnPageReset(string page)

	if page == ""
		LoadCustomContent("wearablelanterns/_WL_Title.dds", 120, -33)
	else
		UnloadCustomContent()
	endif
	
	if page == "$WearableLanternsGeneralPage"
		PageReset_General()
	elseif page == "$WearableLanternsInterfacePage"
		PageReset_Interface()
	endif
endEvent

function PageReset_General()
	PositionIndex = _WL_SettingPosition.GetValueInt()
	BrightnessIndex = _WL_SettingBrightness.GetValueInt() - 1
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("$WearableLanternsGeneralHeaderGeneral") ;General
	General_SettingBrightnessMenu_OID = AddMenuOption("$WearableLanternsGeneralSettingBrightness", BrightnessList[BrightnessIndex])
	General_SettingPositionMenu_OID = AddMenuOption("$WearableLanternsGeneralSettingPosition", LanternPositionList[PositionIndex])
	General_SettingModeMenu_OID = AddMenuOption("$WearableLanternsGeneralSettingMode", ModeList[ModeIndex])
	if _WL_SettingDropLit.GetValueInt() == 2
		General_SettingDropLitToggle_OID = AddToggleOption("$WearableLanternsGeneralSettingDropLit", true)
	else
		General_SettingDropLitToggle_OID = AddToggleOption("$WearableLanternsGeneralSettingDropLit", false)
	endif
	AddEmptyOption()
	AddHeaderOption("$WearableLanternsGeneralHeaderFuel") ;Fuel
	if _WL_SettingOil.GetValueInt() == 2
		General_SettingOilToggle_OID = AddToggleOption("$WearableLanternsGeneralSettingFuelOil", true)
	else
		General_SettingOilToggle_OID = AddToggleOption("$WearableLanternsGeneralSettingFuelOil", false)
	endif
	if _WL_SettingFeeding.GetValueInt() == 2
		General_SettingPollenToggle_OID = AddToggleOption("$WearableLanternsGeneralSettingFuelPollen", true)
	else
		General_SettingPollenToggle_OID = AddToggleOption("$WearableLanternsGeneralSettingFuelPollen", false)
	endif
	;/if _WL_SettingCandleFuel.GetValueInt() == 2
		General_SettingCandlesToggle_OID = AddToggleOption("$WearableLanternsGeneralSettingFuelCandles", true)
	else
		General_SettingCandlesToggle_OID = AddToggleOption("$WearableLanternsGeneralSettingFuelCandles", false)
	endif/;

	SetCursorPosition(1)
	AddHeaderOption("$WearableLanternsGeneralHeaderHotkeys") ;Hotkeys
	General_HotkeyLantern_OID = AddKeyMapOption("$WearableLanternsGeneralSettingHotkeyLantern", _WL_HotkeyPlayerLantern.GetValueInt())
	General_HotkeyCheckFuel_OID = AddKeyMapOption("$WearableLanternsGeneralSettingHotkeyCheckFuel", _WL_HotkeyCheckFuel.GetValueInt())
	General_SettingCheckFuelDisplayMenu_OID = AddMenuOption("$WearableLanternsGeneralSettingHotkeyCheckFuelDisplayMode", CheckFuelDisplayList[CheckFuelDisplayIndex])
endFunction

function PageReset_Interface()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("$WearableLanternsInterfaceHeaderMetersGeneral")

	Interface_UIMeterDisplay_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterDisplay", MeterDisplayList[MeterDisplayIndex])
	Interface_UIMeterLayout_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterLayout", MeterLayoutList[MeterLayoutIndex])
	Interface_UIMeterLength_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterLength", MeterLengthList[MeterLengthIndex])
	Interface_UIMeterOpacity_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterOpacity", _WL_MeterOpacity.GetValue(), "{0}")
	Interface_UIMeterDisplayTime_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterDisplayTime", _WL_MeterDisplayTime.GetValue() * 2, "{0}")
	Interface_UIMeterHeight_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterHeight", MeterHeightList[MeterHeightIndex])

	SetCursorPosition(1)

	AddHeaderOption("$WearableLanternsInterfaceHeaderMetersOil")
	Interface_UIOilMeterColor_OID = AddColorOption("$WearableLanternsInterfaceSettingUIOilMeterColor", _WL_OilColor.GetValueInt())

	AddEmptyOption()

	AddHeaderOption("$WearableLanternsInterfaceHeaderMetersPollen")
	Interface_UIPollenMeterColor_OID = AddColorOption("$WearableLanternsInterfaceSettingUIPollenMeterColor", _WL_PollenColor.GetValueInt())

	AddEmptyOption()

	;/AddHeaderOption("$WearableLanternsInterfaceHeaderMetersCandle")
	Interface_UICandleMeterColor_OID = AddColorOption("$WearableLanternsInterfaceSettingUICandlesMeterColor", _WL_CandleColor.GetValueInt())/;
endFunction

event OnOptionHighlight(int option)

	if option == General_SettingBrightnessMenu_OID
		SetInfoText("$WearableLanternsBrightnessHighlight")
	elseif option == General_SettingPositionMenu_OID
		SetInfoText("$WearableLanternsPositionHighlight")
	elseif option == General_SettingModeMenu_OID
		SetInfoText("$WearableLanternsModeHighlight")
	elseif option == General_SettingDropLitToggle_OID
		SetInfoText("$WearableLanternsDropLitHighlight")
	elseif option == General_SettingOilToggle_OID
		SetInfoText("$WearableLanternsFuelHighlight")
	elseif option == General_SettingPollenToggle_OID
		SetInfoText("$WearableLanternsFuelHighlightPollen")
	elseif option == General_SettingCandlesToggle_OID
		SetInfoText("$WearableLanternsFuelHighlightCandles")
	elseif option == General_HotkeyLantern_OID
		SetInfoText("$WearableLanternsHotkeyLanternHighlight")
	elseif option == General_HotkeyCheckFuel_OID
		SetInfoText("$WearableLanternsHotkeyCheckFuelHighlight")
	elseif option == General_SettingCheckFuelDisplayMenu_OID
		SetInfoText("$WearableLanternsCheckFuelDisplayHighlight")
	elseif option == Interface_UIMeterDisplay_OID
		SetInfoText("$WearableLanternsMeterDisplayHighlight")
	elseif option == Interface_UIMeterLayout_OID
		SetInfoText("$WearableLanternsMeterLayoutHighlight")
	elseif option == Interface_UIMeterLength_OID
		SetInfoText("$WearableLanternsMeterLengthHighlight")
	elseif option == Interface_UIMeterOpacity_OID
		SetInfoText("$WearableLanternsMeterOpacityHighlight")
	elseif option == Interface_UIMeterDisplayTime_OID
		SetInfoText("$WearableLanternsMeterDisplayTimeHighlight")
	elseif option == Interface_UIMeterHeight_OID
		SetInfoText("$WearableLanternsMeterHeightHighlight")
	elseif option == Interface_UIOilMeterColor_OID
		SetInfoText("$WearableLanternsOilMeterColorHighlight")
	elseif option == Interface_UIPollenMeterColor_OID
		SetInfoText("$WearableLanternsPollenMeterColorHighlight")
	elseif option == Interface_UICandleMeterColor_OID
		SetInfoText("$WearableLanternsCandlesMeterColorHighlight")
	endif
endEvent

event OnOptionSelect(int option)
	if option == General_SettingDropLitToggle_OID
		if _WL_SettingDropLit.GetValueInt() == 2
			SetToggleOptionValue(General_SettingDropLitToggle_OID, false)
			_WL_SettingDropLit.SetValue(1)
		else
			SetToggleOptionValue(General_SettingDropLitToggle_OID, true)
			_WL_SettingDropLit.SetValue(2)
		endif
	elseif option == General_SettingOilToggle_OID
		if _WL_SettingOil.GetValueInt() == 2
			SetToggleOptionValue(General_SettingOilToggle_OID, false)
			_WL_SettingOil.SetValue(1)
		else
			SetToggleOptionValue(General_SettingOilToggle_OID, true)
			_WL_SettingOil.SetValue(2)
		endif
	elseif option == General_SettingPollenToggle_OID
		if _WL_SettingFeeding.GetValueInt() == 2
			SetToggleOptionValue(General_SettingPollenToggle_OID, false)
			_WL_SettingFeeding.SetValue(1)
		else
			SetToggleOptionValue(General_SettingPollenToggle_OID, true)
			_WL_SettingFeeding.SetValue(2)
		endif
	elseif option == General_SettingCandlesToggle_OID
		if _WL_SettingCandleFuel.GetValueInt() == 2
			SetToggleOptionValue(General_SettingCandlesToggle_OID, false)
			_WL_SettingCandleFuel.SetValue(1)
		else
			SetToggleOptionValue(General_SettingCandlesToggle_OID, true)
			_WL_SettingCandleFuel.SetValue(2)
		endif
	endif
endEvent

event OnOptionDefault(int option)
	if option == General_SettingBrightnessMenu_OID
		BrightnessIndex = 2
		SetMenuOptionValue(General_SettingBrightnessMenu_OID, BrightnessList[BrightnessIndex])
		_WL_SettingBrightness.SetValueInt(BrightnessIndex)
	elseif option == General_SettingPositionMenu_OID
		PositionIndex == 1
		SetMenuOptionValue(General_SettingPositionMenu_OID, LanternPositionList[PositionIndex])
		_WL_SettingPosition.SetValueInt(0)
		ShowMessage("$WearableLanternsChangedLanternSetting")
	elseif option == General_SettingModeMenu_OID
		ModeIndex = 0
		SetMenuOptionValue(General_SettingModeMenu_OID, ModeList[ModeIndex])
		_WL_SettingAutomatic.SetValueInt(1)
	elseif option == General_SettingDropLitToggle_OID
		SetToggleOptionValue(General_SettingModeMenu_OID, true)
		_WL_SettingDropLit.SetValueInt(2)
	elseif option == General_SettingOilToggle_OID
		SetToggleOptionValue(General_SettingOilToggle_OID, false)
		_WL_SettingOil.SetValueInt(1)
	elseif option == General_SettingPollenToggle_OID
		SetToggleOptionValue(General_SettingPollenToggle_OID, false)
		_WL_SettingFeeding.SetValueInt(1)
	elseif option == General_SettingCandlesToggle_OID
		SetToggleOptionValue(General_SettingCandlesToggle_OID, false)
		_WL_SettingCandleFuel.SetValueInt(1)
	elseif option == General_HotkeyLantern_OID
		UnregisterForKey(_WL_HotkeyPlayerLantern.GetValueInt())
		_WL_HotkeyPlayerLantern.SetValueInt(0)
		ForcePageReset()
	elseif option == General_HotkeyCheckFuel_OID
		UnregisterForKey(_WL_HotkeyCheckFuel.GetValueInt())
		_WL_HotkeyCheckFuel.SetValueInt(0)
		ForcePageReset()
	elseif option == General_SettingCheckFuelDisplayMenu_OID
		CheckFuelDisplayIndex = 0
		SetMenuOptionValue(General_SettingCheckFuelDisplayMenu_OID, CheckFuelDisplayList[CheckFuelDisplayIndex])
		_WL_CheckFuelDisplay.SetValueInt(CheckFuelDisplayIndex)
	elseif option == Interface_UIMeterDisplay_OID
		MeterDisplayIndex = 2
		SetMenuOptionValue(Interface_UIMeterDisplay_OID, MeterDisplayList[MeterDisplayIndex])
		_WL_FuelMeterDisplay_Contextual.SetValueInt(MeterDisplayIndex)
	elseif option == Interface_UIMeterLayout_OID
		MeterLayoutIndex = 6
		SetMenuOptionValue(Interface_UIMeterLayout_OID, MeterLayoutList[MeterLayoutIndex])
		ChooseMeterPosition(MeterLayoutIndex)
	elseif option == Interface_UIMeterLength_OID
		MeterLengthIndex = 0
		SetMenuOptionValue(Interface_UIMeterLength_OID, MeterLengthList[MeterLengthIndex])
		_WL_MeterLength.SetValueInt(1)
		ChooseMeterPosition(MeterLayoutIndex)
	elseif option == Interface_UIMeterOpacity_OID
		_WL_MeterOpacity.SetValue(100.0)
		SetSliderOptionValue(Interface_UIMeterOpacity_OID, _WL_MeterOpacity.GetValueInt(), "{0}")
	elseif option == Interface_UIMeterDisplayTime_OID
		_WL_MeterDisplayTime.SetValueInt(4)
		SetSliderOptionValue(Interface_UIMeterDisplayTime_OID, _WL_MeterDisplayTime.GetValueInt(), "{0}")
	elseif option == Interface_UIMeterHeight_OID
		MeterHeightIndex = 1
		SetMenuOptionValue(Interface_UIMeterHeight_OID, MeterHeightList[MeterHeightIndex])
		_WL_FuelMeterHeight.SetValue(2)
		ChooseMeterPosition(MeterLayoutIndex)
	elseif option == Interface_UIOilMeterColor_OID
		_WL_OilColor.SetValueInt(0xE6E600)
		SetColorOptionValue(option, _WL_OilColor.GetValueInt())
		ChooseMeterPosition(MeterLayoutIndex)
	elseif option == Interface_UIPollenMeterColor_OID
		_WL_PollenColor.SetValueInt(0xE600E6)
		SetColorOptionValue(option, _WL_PollenColor.GetValueInt())
		ChooseMeterPosition(MeterLayoutIndex)
	elseif option == Interface_UICandleMeterColor_OID
		_WL_CandleColor.SetValueInt(0xFFFF99)
		SetColorOptionValue(option, _WL_CandleColor.GetValueInt())
	endif
endEvent

event OnOptionSliderOpen(int option)
	if option == Interface_UIMeterDisplayTime_OID
		SetSliderDialogStartValue(_WL_MeterDisplayTime.GetValueInt() * 2)
		SetSliderDialogDefaultValue(8.0)
		SetSliderDialogRange(4.0, 20.0)
		SetSliderDialogInterval(2.0)
	elseif option == Interface_UIMeterOpacity_OID
		SetSliderDialogStartValue(_WL_MeterOpacity.GetValue())
		SetSliderDialogDefaultValue(100.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	endif
endEvent

event OnOptionSliderAccept(int option, float value)
	if option == Interface_UIMeterDisplayTime_OID
		_WL_MeterDisplayTime.SetValue(value/2)
		SetSliderOptionValue(Interface_UIMeterDisplayTime_OID, value, "{0}")
	elseif option == Interface_UIMeterOpacity_OID
		_WL_MeterOpacity.SetValue(value)
		SetSliderOptionValue(Interface_UIMeterOpacity_OID, value, "{0}")
	endif
endEvent

event OnOptionMenuOpen(int option)
	if option == General_SettingBrightnessMenu_OID
		SetMenuDialogOptions(BrightnessList)
		SetMenuDialogStartIndex(BrightnessIndex)
		SetMenuDialogDefaultIndex(0)
	elseif option == General_SettingPositionMenu_OID
		SetMenuDialogOptions(LanternPositionList)
		SetMenuDialogStartIndex(PositionIndex)
		SetMenuDialogDefaultIndex(0)
	elseif option == General_SettingModeMenu_OID
		SetMenuDialogOptions(ModeList)
		SetMenuDialogStartIndex(ModeIndex)
		SetMenuDialogDefaultIndex(0)
	elseif option == General_SettingCheckFuelDisplayMenu_OID
		SetMenuDialogOptions(CheckFuelDisplayList)
		SetMenuDialogStartIndex(CheckFuelDisplayIndex)
		SetMenuDialogDefaultIndex(0)
	elseif option == Interface_UIMeterDisplay_OID
		SetMenuDialogOptions(MeterDisplayList)
		SetMenuDialogStartIndex(MeterDisplayIndex)
		SetMenuDialogDefaultIndex(0)
	elseif option == Interface_UIMeterLayout_OID
		SetMenuDialogOptions(MeterLayoutList)
		SetMenuDialogStartIndex(MeterLayoutIndex)
		SetMenuDialogDefaultIndex(0)
	elseif option == Interface_UIMeterLength_OID
		SetMenuDialogOptions(MeterLengthList)
		SetMenuDialogStartIndex(MeterLengthIndex)
		SetMenuDialogDefaultIndex(0)
	elseif option == Interface_UIMeterHeight_OID
		SetMenuDialogOptions(MeterHeightList)
		SetMenuDialogStartIndex(MeterHeightIndex)
		SetMenuDialogDefaultIndex(0)
	endif
endEvent

event OnOptionMenuAccept(int option, int index)
	if option == General_SettingBrightnessMenu_OID
		BrightnessIndex = index
		SetMenuOptionValue(General_SettingBrightnessMenu_OID, BrightnessList[BrightnessIndex])
		_WL_SettingBrightness.SetValueInt(index + 1)
	elseif option == General_SettingPositionMenu_OID
		PositionIndex = index
		SetMenuOptionValue(General_SettingPositionMenu_OID, LanternPositionList[PositionIndex])
		_WL_SettingPosition.SetValueInt(index)
		ShowMessage("$WearableLanternsChangedLanternSetting")
	elseif option == General_SettingModeMenu_OID
		ModeIndex = index
		SetMenuOptionValue(General_SettingModeMenu_OID, ModeList[ModeIndex])
		_WL_SettingAutomatic.SetValueInt(index + 1)
		if _WL_SettingAutomatic.GetValueInt() == 2
			_WL_gToggle.SetValueInt(1)
		endIf
	elseif option == General_SettingCheckFuelDisplayMenu_OID
		CheckFuelDisplayIndex = index
		SetMenuOptionValue(General_SettingCheckFuelDisplayMenu_OID, CheckFuelDisplayList[CheckFuelDisplayIndex])
		_WL_CheckFuelDisplay.SetValueInt(index)
	elseif option == Interface_UIMeterDisplay_OID
		MeterDisplayIndex = index
		SetMenuOptionValue(Interface_UIMeterDisplay_OID, MeterDisplayList[MeterDisplayIndex])
		_WL_FuelMeterDisplay_Contextual.SetValueInt(MeterDisplayIndex)
	elseif option == Interface_UIMeterLayout_OID
		MeterLayoutIndex = index
		SetMenuOptionValue(Interface_UIMeterLayout_OID, MeterLayoutList[MeterLayoutIndex])
		ChooseMeterPosition(index)
	elseif option == Interface_UIMeterLength_OID
		MeterLengthIndex = index
		SetMenuOptionValue(Interface_UIMeterLength_OID, MeterLengthList[MeterLengthIndex])
		if MeterLengthIndex == 0	;Normal
			_WL_MeterLength.SetValueInt(1)
		else
			_WL_MeterLength.SetValueInt(0)
		endIf
		ChooseMeterPosition(MeterLayoutIndex)
	elseif option == Interface_UIMeterHeight_OID
		SetMenuOptionValue(Interface_UIMeterHeight_OID, MeterHeightList[index])
		MeterHeightIndex = index
		if MeterHeightIndex == 1
			_WL_FuelMeterHeight.SetValue(2)
		else
			_WL_FuelMeterHeight.SetValue(1)
		endif
		ChooseMeterPosition(MeterLayoutIndex)
	endif
endEvent

event OnOptionKeyMapChange(int option, int keyCode, string conflictControl, string conflictName)
	if option == General_HotkeyLantern_OID
		if conflictControl != ""
			if conflictName != ""
				ShowMessage("This key is already bound to " + conflictControl + " in " + conflictName + ". Please select a different key.")
			else
				ShowMessage("This key is already bound to " + conflictControl + " in Skyrim. Please select a different key.")
			endif
		else
			_WL_HotkeyPlayerLantern.SetValueInt(keyCode)
			RegisterForKey(_WL_HotkeyPlayerLantern.GetValueInt())
			ForcePageReset()
		endif
	elseif option == General_HotkeyCheckFuel_OID
		if conflictControl != ""
			if conflictName != ""
				ShowMessage("This key is already bound to " + conflictControl + " in " + conflictName + ". Please select a different key.")
			else
				ShowMessage("This key is already bound to " + conflictControl + " in Skyrim. Please select a different key.")
			endif
		else
			_WL_HotkeyCheckFuel.SetValueInt(keyCode)
			RegisterForKey(_WL_HotkeyCheckFuel.GetValueInt())
			ForcePageReset()
		endif
	endif
endEvent

event OnOptionColorAccept(int option, int color)
	if option == Interface_UIOilMeterColor_OID
		_WL_OilColor.SetValueInt(color)
		SetColorOptionValue(option, color)
		ChooseMeterPosition(MeterLayoutIndex)
	elseif option == Interface_UIPollenMeterColor_OID
		_WL_PollenColor.SetValueInt(color)
		SetColorOptionValue(option, color)
		ChooseMeterPosition(MeterLayoutIndex)
	elseif option == Interface_UICandleMeterColor_OID
		_WL_CandleColor.SetValueInt(color)
		SetColorOptionValue(option, color)
		ChooseMeterPosition(MeterLayoutIndex)
	endif
endEvent

Event OnKeyDown(int KeyCode)
	if UI.IsMenuOpen("Console") || UI.IsMenuOpen("Book Menu") || UI.IsMenuOpen("BarterMenu") || UI.IsMenuOpen("ContainerMenu") || UI.IsMenuOpen("Crafting Menu") || UI.IsMenuOpen("Dialogue Menu") || UI.IsMenuOpen("FavoritesMenu") || UI.IsMenuOpen("InventoryMenu") || UI.IsMenuOpen("Journal Menu") || UI.IsMenuOpen("Lockpicking Menu") || UI.IsMenuOpen("MagicMenu") || UI.IsMenuOpen("MapMenu") || UI.IsMenuOpen("MessageBoxMenu") || UI.IsMenuOpen("Sleep/Wait Menu") || UI.IsMenuOpen("StatsMenu")
		return
	endif
	if KeyCode == _WL_HotkeyPlayerLantern.GetValueInt()
		ToggleLantern()
	elseif KeyCode == _WL_HotkeyCheckFuel.GetValueInt()
		CheckFuel()
	endif
endEvent

string function GetCustomControl(int keyCode)
	if (keyCode == _WL_HotkeyPlayerLantern.GetValueInt())
		return "Toggle Lantern"
	elseif (keyCode == _WL_HotkeyCheckFuel.GetValueInt())
		return "Check Fuel"
	else
		return ""
	endIf
endFunction

_WL_FuelMeter property FuelMeter auto
_WL_FuelMeterUpdate property FuelMeterDisplay auto
GlobalVariable property _WL_MeterLength auto
GlobalVariable property _WL_FuelMeterHeight auto

function ChooseMeterPosition(int index)
	if index == 0 			;Top Right, Offset
		SetMeterPosition("right", "top", 1219.0, 52.0)
	elseif index ==	1		;Top Right, Edge
		SetMeterPosition("right", "top", 1219.0, 0.0)
	elseif index == 2 		;Top Right, Corner
		SetMeterPosition("right", "top", 1280.0, 0.0)
	elseif index == 3 		;Top Left, Offset
		SetMeterPosition("left", "top", 61.0, 52.0)
	elseif index ==	4		;Top Left, Edge
		SetMeterPosition("left", "top", 61.0, 0.0)
	elseif index == 5		;Top Left, Corner
		SetMeterPosition("left", "top", 0.0, 0.0)
	elseif index == 6 		;Bottom Right, Offset
		SetMeterPosition("right", "bottom", 1219.0, 613.8)
	elseif index ==	7		;Bottom Right, Edge
		SetMeterPosition("right", "bottom", 1219.0, 720.0)
	elseif index == 8 		;Bottom Right, Corner
		SetMeterPosition("right", "bottom", 1280.0, 720.0)
	elseif index == 9 	 	;Bottom Left, Offset
		SetMeterPosition("left", "bottom", 70.0, 613.8)
	elseif index ==	10		;Bottom Left, Edge
		SetMeterPosition("left", "bottom", 70.0, 720.0)
	elseif index == 11 		;Bottom Left, Corner
		SetMeterPosition("left", "bottom", 0.0, 720.0)
	endif
endFunction

function SetMeterPosition(string HAnchor, string VAnchor, float Fuel_X, float Fuel_Y)
	FuelMeter.HAnchor = HAnchor
	FuelMeter.VAnchor = VAnchor

	if _WL_MeterLength.GetValue() == 1
		FuelMeter.Width = 292.8
	else
		FuelMeter.Width = 225.8
	endIf

	FuelMeter.X = Fuel_X
	FuelMeter.Y = Fuel_Y

	if FuelMeter.HAnchor == "right"
		FuelMeter.FillDirection = "left"
	else
		FuelMeter.FillDirection = "right"
	endIf
	if _WL_FuelMeterHeight.GetValueInt() == 2
		FuelMeter.Height = 12.0
	else
		FuelMeter.Height = 25.2
	endIf

	;Adjust sides for smaller meters
	if _WL_FuelMeterHeight.GetValueInt() == 2
		if FuelMeter.HAnchor == "right"
			FuelMeter.Width -= 24.0
			FuelMeter.X -= 12.0
		else
			FuelMeter.Width -= 24.0
			FuelMeter.X += 12.0
		endIf
	endIf

	FuelMeterDisplay.ForceDisplayAndUpdate()

	;debug.trace("[Frostfall] EMX:" + FuelMeter.X + ", EMY:" + ExposureMeter.Y + ", WMX:" + WetMeter.X + ", WMY:" + WetMeter.Y)
endFunction

function ToggleLantern()
	if _WL_SettingAutomatic.GetValueInt() == 2
		_WL_AutomaticModeError.show()
	else
		if LanternQuest.current_lantern == LanternQuest.LANTERN_NORMAL
			if _WL_gToggle.GetValueInt() == 1
				_WL_gToggle.SetValueInt(0)
				_WL_OilLanternOff.Play(Game.GetPlayer())
				;LanternQuest.TryToStopLantern()
			else
				_WL_gToggle.SetValueInt(1)
				_WL_OilLanternOn.Play(Game.GetPlayer())
				;LanternQuest.TryToStartLantern(LanternQuest.myLantern)
			endIf
		elseif LanternQuest.current_lantern == LanternQuest.LANTERN_TORCHBUG
			if _WL_gToggle.GetValueInt() == 1
				_WL_gToggle.SetValueInt(0)
				PHYBottleSmallH.Play(Game.GetPlayer())
				;LanternQuest.TryToStopTorchbug()
			else
				_WL_gToggle.SetValueInt(1)
				PHYBottleSmallH.Play(Game.GetPlayer())
				;LanternQuest.TryToStartTorchbug(LanternQuest.myLantern)
			endIf
		endIf
	endIf
endFunction

function CheckFuel()
	int i = _WL_CheckFuelDisplay.GetValueInt()
	if i == 0  									;Meter, Message
		if _WL_SettingOil.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_NORMAL
			ShowOilRemainingMessage(_WL_OilLevel.GetValue())
			ChooseMeterPosition(MeterLayoutIndex)
		elseif _WL_SettingFeeding.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_TORCHBUG
			_WL_TorchbugRemainingFlowers.Show(LanternQuest.pPollenLevel)
			ChooseMeterPosition(MeterLayoutIndex)
		endIf
	elseif i == 1 								;Meter Only
		if _WL_SettingOil.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_NORMAL
			ChooseMeterPosition(MeterLayoutIndex)
		elseif _WL_SettingFeeding.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_TORCHBUG
			ChooseMeterPosition(MeterLayoutIndex)
		endIf
	elseif i == 2 								;Message Only
		if _WL_SettingOil.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_NORMAL
			ShowOilRemainingMessage(_WL_OilLevel.GetValue())
		elseif _WL_SettingFeeding.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_TORCHBUG
			_WL_TorchbugRemainingFlowers.Show(LanternQuest.pPollenLevel)
		endIf
	endIf
endFunction

function ShowOilRemainingMessage(float oil_level)
	if oil_level == 0
		_WL_LanternOilRemainingEmpty.Show()
	elseif oil_level > 0 && oil_level <= 6
		_WL_LanternOilRemainingMostlyEmpty.Show()
	elseif oil_level > 6 && oil_level < 8
		_WL_LanternOilRemainingLessThanHalf.Show()
	elseif oil_level >= 8 && oil_level < 10
		_WL_LanternOilRemainingHalfFull.Show()
	elseif oil_level >= 10 && oil_level < 16
		_WL_LanternOilRemainingMostlyFull.Show()
	elseif oil_level == 16
		_WL_LanternOilRemainingFull.Show()
	endif
endFunction

function RegisterForKeysOnLoad()
	if _WL_HotkeyPlayerLantern.GetValueInt() != 0
		RegisterForKey(_WL_HotkeyPlayerLantern.GetValueInt())
	endIf
	if _WL_HotkeyCheckFuel.GetValueInt() != 0
		RegisterForKey(_WL_HotkeyCheckFuel.GetValueInt())
	endIf
endFunction