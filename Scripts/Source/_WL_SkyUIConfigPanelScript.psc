Scriptname _WL_SkyUIConfigPanelScript extends SKI_ConfigBase conditional

_WL_LanternOil_v3 property LanternQuest auto
Actor property PlayerRef auto

string[] MeterDisplayList
string[] MeterLayoutList
string[] BrightnessList
string[] FillDirectionList
string[] HorizontalAnchorList
string[] VerticalAnchorList
int BrightnessIndex = 2
string[] LanternPositionList
int PositionIndex = 1
string[] ModeList
int ModeIndex = 0
string[] CheckFuelDisplayList
int CheckFuelDisplayIndex = 0

int General_SettingBrightnessMenu_OID
int General_SettingPositionMenu_OID
int General_SettingSlot_OID
int General_SettingModeMenu_OID
int General_SettingDropLitToggle_OID
int General_SettingOffWhenSneaking_OID
int General_SettingOilToggle_OID
int General_HotkeyHoldUse_OID
int General_HotkeyHoldUseDuration_OID
int General_HotkeyLantern_OID
int General_HotkeyCheckFuel_OID
int General_SettingPollenToggle_OID
int General_SettingCheckFuelDisplayMenu_OID
int Interface_UIMeterDisplay_OID
int Interface_UIMeterLayout_OID
int Interface_UIMeterDisplayTime_OID
int Interface_UIMeterColor_OID
int Interface_UIMeterOpacity_OID
int Interface_UIMeterFillDirection_OID
int Interface_UIMeterHeight_OID
int Interface_UIMeterWidth_OID
int Interface_UIMeterXPos_OID
int Interface_UIMeterYPos_OID
int Interface_UIMeterHAnchor_OID
int Interface_UIMeterVAnchor_OID
int Interface_UIOilMeterShowAdvanced_OID
int Interface_UIPollenMeterShowAdvanced_OID

bool property DLC2Loaded auto hidden conditional

GlobalVariable property _WL_OilLevel auto
GlobalVariable property _WL_PollenLevel auto

GlobalVariable property _WL_SettingBrightness auto
GlobalVariable property _WL_SettingPosition auto 						;0 = Back, 1 = Front, 2 = Held
GlobalVariable property _WL_SettingDropLit auto
GlobalVariable property _WL_SettingOil auto
GlobalVariable property _WL_SettingFeeding auto
GlobalVariable property _WL_SettingSlot auto
GlobalVariable property _WL_SettingOffWhenSneaking auto
GlobalVariable property _WL_SettingHoldActivateToggle auto
GlobalVariable property _WL_SettingHoldActivateToggleDuration auto
GlobalVariable Property _WL_SettingAutomatic auto
GlobalVariable property _WL_SettingCheckFuelDisplay auto
GlobalVariable property _WL_SettingFuelMeterDisplay_Contextual auto
GlobalVariable property _WL_SettingMeterDisplayTime auto

GlobalVariable property _WL_HotkeyPlayerLantern auto
GlobalVariable property _WL_HotkeyCheckFuel auto
GlobalVariable property _WL_gToggle auto

GlobalVariable property _WL_Debug auto

GlobalVariable property _WL_SettingMeterOilColor auto
GlobalVariable property _WL_SettingMeterOilOpacity auto
GlobalVariable property _WL_SettingMeterOilFillDirection auto
GlobalVariable property _WL_SettingMeterOilHeight auto
GlobalVariable property _WL_SettingMeterOilWidth auto
GlobalVariable property _WL_SettingMeterOilXPos auto
GlobalVariable property _WL_SettingMeterOilYPos auto
GlobalVariable property _WL_SettingMeterOilHAnchor auto
GlobalVariable property _WL_SettingMeterOilVAnchor auto

GlobalVariable property _WL_SettingMeterPollenColor auto
GlobalVariable property _WL_SettingMeterPollenOpacity auto
GlobalVariable property _WL_SettingMeterPollenFillDirection auto
GlobalVariable property _WL_SettingMeterPollenHeight auto
GlobalVariable property _WL_SettingMeterPollenWidth auto
GlobalVariable property _WL_SettingMeterPollenXPos auto
GlobalVariable property _WL_SettingMeterPollenYPos auto
GlobalVariable property _WL_SettingMeterPollenHAnchor auto
GlobalVariable property _WL_SettingMeterPollenVAnchor auto

Sound property _WL_OilLanternOff auto
Sound property _WL_OilLanternOn auto
Sound property PHYBottleSmallH auto

Message property _WL_LanternOilRemainingEmpty auto
Message property _WL_LanternOilRemainingMostlyEmpty auto
Message property _WL_LanternOilRemainingLessThanHalf auto
Message property _WL_LanternOilRemainingHalfFull auto
Message property _WL_LanternOilRemainingMostlyFull auto
Message property _WL_LanternOilRemainingFull auto
Message property _WL_TorchbugRemainingFlowers auto

Armor property _WL_WearableLanternApparel auto
Armor property _WL_WearableLanternApparelFront auto
Armor property _WL_WearableTorchbugApparel_Empty auto
Armor property _WL_WearableTorchbugApparelFront_Empty auto
Armor property _WL_WearableTorchbugApparel auto
Armor property _WL_WearableTorchbugApparelFront auto
Armor property _WL_WearableTorchbugApparelRED auto
Armor property _WL_WearableTorchbugApparelFrontRED auto
Armor property _WL_WearablePaperApparel auto
Armor property _WL_WearablePaperApparelFront auto

ArmorAddon property _WL_WearableLanternAA auto hidden
ArmorAddon property _WL_WearableLanternFrontAA auto hidden
ArmorAddon property _WL_WearablePaperAA auto hidden
ArmorAddon property _WL_WearablePaperFrontAA auto hidden
ArmorAddon property _WL_WearableTorchbugAA auto hidden
ArmorAddon property _WL_WearableTorchbugAA_empty auto hidden
ArmorAddon property _WL_WearableTorchbugFrontAA auto hidden
ArmorAddon property _WL_WearableTorchbugFrontAA_empty auto hidden
ArmorAddon property _WL_WearableTorchbugFrontREDAA auto hidden
ArmorAddon property _WL_WearableTorchbugREDAA auto hidden

Event OnConfigInit()
	Pages = new string[3]
	Pages[0] = "$WearableLanternsGeneralPage"
	Pages[1] = "$WearableLanternsInterfacePage"
	Pages[2] = "$WearableLanternsProfilePage"

	LanternPositionList = new string[3]
	LanternPositionList[0] = "$WearableLanternsPositionList1"
	LanternPositionList[1] = "$WearableLanternsPositionList2"
	LanternPositionList[2] = "$WearableLanternsPositionList3"

	MeterDisplayList = new string[3]
	MeterDisplayList[0] = "$WearableLanternsOff"		;"Off"
	MeterDisplayList[1] = "$WearableLanternsAlwaysOn"	;"Always On"
	MeterDisplayList[2] = "$WearableLanternsContextual"	;"Contextual"

	MeterLayoutList = new string[12]
	MeterLayoutList[0] = "$WearableLanternsMeterLayoutList1"	;"(16:9) Bottom Left"
	MeterLayoutList[1] = "$WearableLanternsMeterLayoutList2"	;"(16:9) Bottom Right"
	MeterLayoutList[2] = "$WearableLanternsMeterLayoutList3"	;"(16:9) Top Left"
	MeterLayoutList[3] = "$WearableLanternsMeterLayoutList4"	;"(16:9) Top Right"
	MeterLayoutList[4] = "$WearableLanternsMeterLayoutList5"	;"(16:10) Bottom Left"
	MeterLayoutList[5] = "$WearableLanternsMeterLayoutList6"	;"(16:10) Bottom Right"
	MeterLayoutList[6] = "$WearableLanternsMeterLayoutList7"	;"(16:10) Top Left"
	MeterLayoutList[7] = "$WearableLanternsMeterLayoutList8"	;"(16:10) Top Right"
	MeterLayoutList[8] = "$WearableLanternsMeterLayoutList9"	;"(4:3) Bottom Left"
	MeterLayoutList[9] = "$WearableLanternsMeterLayoutList10"	;"(4:3) Bottom Right"
	MeterLayoutList[10] = "$WearableLanternsMeterLayoutList11"	;"(4:3) Top Left"
	MeterLayoutList[11] = "$WearableLanternsMeterLayoutList12"	;"(4:3) Top Right"

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

	FillDirectionList = new string[3]
	FillDirectionList[0] = "$WearableLanternsLeft"
	FillDirectionList[1] = "$WearableLanternsRight"
	FillDirectionList[2] = "$WearableLanternsCenter"

	HorizontalAnchorList = new string[3]
	HorizontalAnchorList[0] = "$WearableLanternsLeft"
	HorizontalAnchorList[1] = "$WearableLanternsRight"
	HorizontalAnchorList[2] = "$WearableLanternsCenter"

	VerticalAnchorList = new string[3]
	VerticalAnchorList[0] = "$WearableLanternsTop"
	VerticalAnchorList[1] = "$WearableLanternsBottom"
	VerticalAnchorList[2] = "$WearableLanternsCenter"

	FILL_DIRECTIONS = new string[3]
	FILL_DIRECTIONS[0] = "Left"
	FILL_DIRECTIONS[1] = "Right"
	FILL_DIRECTIONS[2] = "Center"

	HORIZONTAL_ANCHORS = new string[3]
	HORIZONTAL_ANCHORS[0] = "Left"
	HORIZONTAL_ANCHORS[1] = "Right"
	HORIZONTAL_ANCHORS[2] = "Center"

	VERTICAL_ANCHORS = new string[3]
	VERTICAL_ANCHORS[0] = "Top"
	VERTICAL_ANCHORS[1] = "Bottom"
	VERTICAL_ANCHORS[2] = "Center"
endEvent

Event OnConfigClose()
	configuring_oil_meter = false
	configuring_pollen_meter = false
EndEvent

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
	General_SettingSlot_OID = AddSliderOption("$WearableLanternsGeneralSettingSlot", _WL_SettingSlot.GetValueInt(), "{0}")
	General_SettingModeMenu_OID = AddMenuOption("$WearableLanternsGeneralSettingMode", ModeList[ModeIndex])
	if _WL_SettingDropLit.GetValueInt() == 2
		General_SettingDropLitToggle_OID = AddToggleOption("$WearableLanternsGeneralSettingDropLit", true)
	else
		General_SettingDropLitToggle_OID = AddToggleOption("$WearableLanternsGeneralSettingDropLit", false)
	endif
	if _WL_SettingOffWhenSneaking.GetValueInt() == 2
		General_SettingOffWhenSneaking_OID = AddToggleOption("$WearableLanternsGeneralSettingTurnOffWhenSneaking", true)
	else
		General_SettingOffWhenSneaking_OID = AddToggleOption("$WearableLanternsGeneralSettingTurnOffWhenSneaking", false)
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
	
	SetCursorPosition(1)
	AddHeaderOption("$WearableLanternsGeneralHeaderHotkeys") ;Hotkeys
	if _WL_SettingHoldActivateToggle.GetValueInt() == 2
		General_HotkeyHoldUse_OID = AddToggleOption("$WearableLanternsGeneralSettingHotkeyLanternUseKey", true)
		General_HotkeyHoldUseDuration_OID = AddSliderOption("$WearableLanternsGeneralSettingHotkeyLanternUseKeyDuration", _WL_SettingHoldActivateToggleDuration.GetValue(), "{1} sec")
	else
		General_HotkeyHoldUse_OID = AddToggleOption("$WearableLanternsGeneralSettingHotkeyLanternUseKey", false)
		General_HotkeyHoldUseDuration_OID = AddSliderOption("$WearableLanternsGeneralSettingHotkeyLanternUseKeyDuration", _WL_SettingHoldActivateToggleDuration.GetValue(), "{1} sec", OPTION_FLAG_DISABLED)
	endif
	General_HotkeyLantern_OID = AddKeyMapOption("$WearableLanternsGeneralSettingHotkeyLantern", _WL_HotkeyPlayerLantern.GetValueInt())
	General_HotkeyCheckFuel_OID = AddKeyMapOption("$WearableLanternsGeneralSettingHotkeyCheckFuel", _WL_HotkeyCheckFuel.GetValueInt())
	General_SettingCheckFuelDisplayMenu_OID = AddMenuOption("$WearableLanternsGeneralSettingHotkeyCheckFuelDisplayMode", CheckFuelDisplayList[CheckFuelDisplayIndex])
endFunction

string[] FILL_DIRECTIONS
string[] HORIZONTAL_ANCHORS
string[] VERTICAL_ANCHORS
float NORMAL_METER_MIN_WIDTH = 50.0
float NORMAL_METER_MAX_WIDTH = 400.0
float NORMAL_METER_DEFAULT_WIDTH = 292.8
float NORMAL_METER_MIN_HEIGHT = 10.0
float NORMAL_METER_MAX_HEIGHT = 40.0
float NORMAL_METER_DEFAULT_HEIGHT = 25.2

float NORMAL_METER_BOTTOMLEFT_16_9_X = 69.2
float NORMAL_METER_BOTTOMLEFT_16_9_Y = 618.0
float NORMAL_METER_BOTTOMRIGHT_16_9_X = 1211.0
float NORMAL_METER_BOTTOMRIGHT_16_9_Y = 618.0
float NORMAL_METER_TOPLEFT_16_9_X = 69.2
float NORMAL_METER_TOPLEFT_16_9_Y = 113.0
float NORMAL_METER_TOPRIGHT_16_9_X = 1211.0
float NORMAL_METER_TOPRIGHT_16_9_Y = 113.0

float NORMAL_METER_BOTTOMLEFT_16_10_X = 61.5
float NORMAL_METER_BOTTOMLEFT_16_10_Y = 632.0
float NORMAL_METER_BOTTOMRIGHT_16_10_X = 1218.0
float NORMAL_METER_BOTTOMRIGHT_16_10_Y = 632.0
float NORMAL_METER_TOPLEFT_16_10_X = 61.5
float NORMAL_METER_TOPLEFT_16_10_Y = 99.0
float NORMAL_METER_TOPRIGHT_16_10_X = 1218.0
float NORMAL_METER_TOPRIGHT_16_10_Y = 99.0

float NORMAL_METER_BOTTOMLEFT_4_3_X = 64.0
float NORMAL_METER_BOTTOMLEFT_4_3_Y = 644.0
float NORMAL_METER_BOTTOMRIGHT_4_3_X = 1217.0
float NORMAL_METER_BOTTOMRIGHT_4_3_Y = 644.0
float NORMAL_METER_TOPLEFT_4_3_X = 64.0
float NORMAL_METER_TOPLEFT_4_3_Y = 90.0
float NORMAL_METER_TOPRIGHT_4_3_X = 1217.0
float NORMAL_METER_TOPRIGHT_4_3_Y = 90.0

bool configuring_oil_meter = false
bool configuring_pollen_meter = false
function PageReset_Interface()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("$WearableLanternsInterfaceHeaderMetersGeneral")

	; Screen aspect ratio? Might only need it when selecting preset, so just fold it into that
	Interface_UIMeterDisplay_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterDisplay", MeterDisplayList[_WL_SettingFuelMeterDisplay_Contextual.GetValueInt()])
	Interface_UIMeterDisplayTime_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterDisplayTime", _WL_SettingMeterDisplayTime.GetValue() * 2, "{0}")
	Interface_UIMeterLayout_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterLayout", "$WearableLanternsSelect")
	AddEmptyOption()
	AddHeaderOption("$WearableLanternsInterfaceHeaderMetersOilName")
	Interface_UIOilMeterShowAdvanced_OID = AddToggleOption("$WearableLanternsInterfaceSettingUIMeterShowAdvanced", configuring_oil_meter)
	AddEmptyOption()
	AddHeaderOption("$WearableLanternsInterfaceHeaderMetersPollenName")
	Interface_UIPollenMeterShowAdvanced_OID = AddToggleOption("$WearableLanternsInterfaceSettingUIMeterShowAdvanced", configuring_pollen_meter)
	
	SetCursorPosition(1)

	; Advanced settings
	if configuring_oil_meter
		AddHeaderOption("$WearableLanternsInterfaceHeaderMetersAdvanced")
		AddTextOption("$WearableLanternsInterfaceSettingUIMeterConfiguring", "$WearableLanternsInterfaceHeaderMetersOilName", OPTION_FLAG_DISABLED)
		Interface_UIMeterColor_OID = AddColorOption("$WearableLanternsInterfaceSettingUIColor", _WL_SettingMeterOilColor.GetValueInt())
		Interface_UIMeterOpacity_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterOpacity", _WL_SettingMeterOilOpacity.GetValue(), "{0}%")
		Interface_UIMeterFillDirection_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterFillDirection", FillDirectionList[_WL_SettingMeterOilFillDirection.GetValueInt()])
		Interface_UIMeterHeight_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterHeight", _WL_SettingMeterOilHeight.GetValue(), "{1}")
		Interface_UIMeterWidth_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterLength", _WL_SettingMeterOilWidth.GetValue(), "{1}")
		Interface_UIMeterXPos_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterXPos", _WL_SettingMeterOilXPos.GetValue(), "{1}")
		Interface_UIMeterYPos_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterYPos", _WL_SettingMeterOilYPos.GetValue(), "{1}")
		Interface_UIMeterHAnchor_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterHAnchor", HorizontalAnchorList[_WL_SettingMeterOilHAnchor.GetValueInt()])
		Interface_UIMeterVAnchor_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterVAnchor", VerticalAnchorList[_WL_SettingMeterOilVAnchor.GetValueInt()])
	elseif configuring_pollen_meter
		AddHeaderOption("$WearableLanternsInterfaceHeaderMetersAdvanced")
		AddTextOption("$WearableLanternsInterfaceSettingUIMeterConfiguring", "$WearableLanternsInterfaceHeaderMetersPollenName", OPTION_FLAG_DISABLED)
		Interface_UIMeterColor_OID = AddColorOption("$WearableLanternsInterfaceSettingUIColor", _WL_SettingMeterPollenColor.GetValueInt())
		Interface_UIMeterOpacity_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterOpacity", _WL_SettingMeterPollenOpacity.GetValue(), "{0}%")
		Interface_UIMeterFillDirection_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterFillDirection", FillDirectionList[_WL_SettingMeterPollenFillDirection.GetValueInt()])
		Interface_UIMeterHeight_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterHeight", _WL_SettingMeterPollenHeight.GetValue(), "{1}")
		Interface_UIMeterWidth_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterLength", _WL_SettingMeterPollenWidth.GetValue(), "{1}")
		Interface_UIMeterXPos_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterXPos", _WL_SettingMeterPollenXPos.GetValue(), "{1}")
		Interface_UIMeterYPos_OID = AddSliderOption("$WearableLanternsInterfaceSettingUIMeterYPos", _WL_SettingMeterPollenYPos.GetValue(), "{1}")
		Interface_UIMeterHAnchor_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterHAnchor", HorizontalAnchorList[_WL_SettingMeterPollenHAnchor.GetValueInt()])
		Interface_UIMeterVAnchor_OID = AddMenuOption("$WearableLanternsInterfaceSettingUIMeterVAnchor", VerticalAnchorList[_WL_SettingMeterPollenVAnchor.GetValueInt()])
	endif
endFunction

event OnOptionHighlight(int option)

	if option == General_SettingBrightnessMenu_OID
		SetInfoText("$WearableLanternsBrightnessHighlight")
	elseif option == General_SettingPositionMenu_OID
		SetInfoText("$WearableLanternsPositionHighlight")
	elseif option == General_SettingSlot_OID
		SetInfoText("$WearableLanternsSlotHighlight")
	elseif option == General_SettingModeMenu_OID
		SetInfoText("$WearableLanternsModeHighlight")
	elseif option == General_SettingDropLitToggle_OID
		SetInfoText("$WearableLanternsDropLitHighlight")
	elseif option == General_SettingOffWhenSneaking_OID
		SetInfoText("$WearableLanternsTurnOffWhenSneakingHighlight")
	elseif option == General_HotkeyHoldUse_OID
		SetInfoText("$WearableLanternsHotkeyLanternUseKeyHighlight")
	elseif option == General_HotkeyHoldUseDuration_OID
		SetInfoText("$WearableLanternsHotkeyLanternUseKeyDurationHighlight")
	elseif option == General_SettingOilToggle_OID
		SetInfoText("$WearableLanternsFuelHighlight")
	elseif option == General_SettingPollenToggle_OID
		SetInfoText("$WearableLanternsFuelHighlightPollen")
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
	elseif option == Interface_UIMeterWidth_OID
		SetInfoText("$WearableLanternsMeterLengthHighlight")
	elseif option == Interface_UIMeterOpacity_OID
		SetInfoText("$WearableLanternsMeterOpacityHighlight")
	elseif option == Interface_UIMeterDisplayTime_OID
		SetInfoText("$WearableLanternsMeterDisplayTimeHighlight")
	elseif option == Interface_UIMeterHeight_OID
		SetInfoText("$WearableLanternsMeterHeightHighlight")
	elseif option == Interface_UIMeterColor_OID
		SetInfoText("$WearableLanternsMeterColorHighlight")
	elseif option == Interface_UIMeterXPos_OID
		SetInfoText("$WearableLanternsMeterXPosHighlight")
	elseif option == Interface_UIMeterYPos_OID
		SetInfoText("$WearableLanternsMeterYPosHighlight")
	elseif option == Interface_UIMeterHAnchor_OID
		SetInfoText("$WearableLanternsMeterHAnchorHighlight")
	elseif option == Interface_UIMeterVAnchor_OID
		SetInfoText("$WearableLanternsMeterVAnchorHighlight")
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
	elseif option == General_SettingOffWhenSneaking_OID
		if _WL_SettingOffWhenSneaking.GetValueInt() == 2
			SetToggleOptionValue(General_SettingOffWhenSneaking_OID, false)
			_WL_SettingOffWhenSneaking.SetValue(1)
			LanternQuest.UnregisterForSneakEvents()
		else
			SetToggleOptionValue(General_SettingOffWhenSneaking_OID, true)
			_WL_SettingOffWhenSneaking.SetValue(2)
			LanternQuest.RegisterForSneakEvents()
		endif
	elseif option == General_SettingOilToggle_OID
		if _WL_SettingOil.GetValueInt() == 2
			SetToggleOptionValue(General_SettingOilToggle_OID, false)
			_WL_SettingOil.SetValue(1)
			SendEvent_WearableLanternRemoveOilMeter()
			LanternQuest.ToggleLanternOn()
		else
			SetToggleOptionValue(General_SettingOilToggle_OID, true)
			_WL_SettingOil.SetValue(2)
			LanternQuest.ToggleLanternOn()
		endif
	elseif option == General_SettingPollenToggle_OID
		if _WL_SettingFeeding.GetValueInt() == 2
			SetToggleOptionValue(General_SettingPollenToggle_OID, false)
			_WL_SettingFeeding.SetValue(1)
			SendEvent_WearableLanternRemovePollenMeter()
			LanternQuest.ToggleLanternOn()
		else
			SetToggleOptionValue(General_SettingPollenToggle_OID, true)
			_WL_SettingFeeding.SetValue(2)
			LanternQuest.ToggleLanternOn()
		endif
	elseif option == General_HotkeyHoldUse_OID
		if _WL_SettingHoldActivateToggle.GetValueInt() == 2
			SetToggleOptionValue(General_HotkeyHoldUse_OID, false)
			_WL_SettingHoldActivateToggle.SetValue(1)
			UnregisterForControl("Activate")
			ForcePageReset()
		else
			SetToggleOptionValue(General_HotkeyHoldUse_OID, true)
			_WL_SettingHoldActivateToggle.SetValue(2)
			RegisterForControl("Activate")
			ForcePageReset()
		endif
	elseif option == Interface_UIOilMeterShowAdvanced_OID
		if configuring_oil_meter
			configuring_oil_meter = false
		else
			configuring_oil_meter = true
			configuring_pollen_meter = false
		endif
		ForcePageReset()
	elseif option == Interface_UIPollenMeterShowAdvanced_OID
		if configuring_pollen_meter
			configuring_pollen_meter = false
		else
			configuring_pollen_meter = true
			configuring_oil_meter = false
		endif
		ForcePageReset()
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
	elseif option == General_SettingSlot_OID
		_WL_SettingSlot.SetValue(55.0)
		SetSliderOptionValue(General_SettingSlot_OID, 55.0, "{0}")
		SetLanternSlot()
	elseif option == General_SettingModeMenu_OID
		ModeIndex = 0
		SetMenuOptionValue(General_SettingModeMenu_OID, ModeList[ModeIndex])
		_WL_SettingAutomatic.SetValueInt(1)
	elseif option == General_SettingDropLitToggle_OID
		SetToggleOptionValue(General_SettingModeMenu_OID, true)
		_WL_SettingDropLit.SetValueInt(2)
	elseif option == General_SettingOffWhenSneaking_OID
		SetToggleOptionValue(General_SettingOffWhenSneaking_OID, false)
		_WL_SettingOffWhenSneaking.SetValueInt(1)
		LanternQuest.UnregisterForSneakEvents()
	elseif option == General_SettingOilToggle_OID
		SetToggleOptionValue(General_SettingOilToggle_OID, false)
		_WL_SettingOil.SetValueInt(1)
	elseif option == General_SettingPollenToggle_OID
		SetToggleOptionValue(General_SettingPollenToggle_OID, false)
		_WL_SettingFeeding.SetValueInt(1)
	elseif option == General_HotkeyHoldUse_OID
		SetToggleOptionValue(General_HotkeyHoldUse_OID, false)
		_WL_SettingHoldActivateToggle.SetValueInt(1)
		UnregisterForControl("Activate")
		ForcePageReset()
	elseif option == General_HotkeyHoldUseDuration_OID
		SetSliderOptionValue(General_HotkeyHoldUseDuration_OID, 1.0, "{1} sec")
		_WL_SettingHoldActivateToggleDuration.SetValue(1.0)
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
		_WL_SettingCheckFuelDisplay.SetValueInt(CheckFuelDisplayIndex)
	elseif option == Interface_UIMeterDisplay_OID
		SetMenuOptionValue(Interface_UIMeterDisplay_OID, MeterDisplayList[2])
		_WL_SettingFuelMeterDisplay_Contextual.SetValueInt(2)
	elseif option == Interface_UIMeterDisplayTime_OID
		_WL_SettingMeterDisplayTime.SetValueInt(4)
		SetSliderOptionValue(Interface_UIMeterDisplayTime_OID, _WL_SettingMeterDisplayTime.GetValueInt(), "{0}")
	elseif option == Interface_UIMeterColor_OID
		if configuring_oil_meter
			_WL_SettingMeterOilColor.SetValueInt(0xE6E600)
			SetColorOptionValue(option, _WL_SettingMeterOilColor.GetValueInt())
			; Set meter color?
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenColor.SetValueInt(0xE600E6)
			SetColorOptionValue(option, _WL_SettingMeterPollenColor.GetValueInt())
			; Set meter color?
		endif
	elseif option == Interface_UIMeterOpacity_OID
		if configuring_oil_meter
			_WL_SettingMeterOilOpacity.SetValue(100.0)
			SetSliderOptionValue(Interface_UIMeterOpacity_OID, 100.0, "{0}%")
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenOpacity.SetValue(100.0)
			SetSliderOptionValue(Interface_UIMeterOpacity_OID, 100.0, "{0}%")
			UpdateMeterConfiguration(1)
		endif
	elseif option == Interface_UIMeterHeight_OID
		if configuring_oil_meter
			_WL_SettingMeterOilHeight.SetValue(NORMAL_METER_DEFAULT_HEIGHT)
			SetSliderOptionValue(Interface_UIMeterHeight_OID, NORMAL_METER_DEFAULT_HEIGHT, "{1}")
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenHeight.SetValue(NORMAL_METER_DEFAULT_HEIGHT)
			SetSliderOptionValue(Interface_UIMeterHeight_OID, NORMAL_METER_DEFAULT_HEIGHT, "{1}")
			UpdateMeterConfiguration(1)
		endif
	elseif option == Interface_UIMeterWidth_OID
		if configuring_oil_meter
			_WL_SettingMeterOilWidth.SetValue(NORMAL_METER_DEFAULT_WIDTH)
			SetSliderOptionValue(Interface_UIMeterWidth_OID, NORMAL_METER_DEFAULT_WIDTH, "{1}")
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenWidth.SetValue(NORMAL_METER_DEFAULT_WIDTH)
			SetSliderOptionValue(Interface_UIMeterWidth_OID, NORMAL_METER_DEFAULT_WIDTH, "{1}")
			UpdateMeterConfiguration(1)
		endif
	elseif option == Interface_UIMeterXPos_OID
		if configuring_oil_meter
			_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_9_X)
			SetSliderOptionValue(Interface_UIMeterXPos_OID, NORMAL_METER_BOTTOMRIGHT_16_9_X, "{1}")
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_9_X)
			SetSliderOptionValue(Interface_UIMeterXPos_OID, NORMAL_METER_BOTTOMRIGHT_16_9_X, "{1}")
			UpdateMeterConfiguration(1)
		endif
	elseif option == Interface_UIMeterYPos_OID
		if configuring_oil_meter
			_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_9_X)
			SetSliderOptionValue(Interface_UIMeterYPos_OID, NORMAL_METER_BOTTOMRIGHT_16_9_Y, "{1}")
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_9_Y)
			SetSliderOptionValue(Interface_UIMeterYPos_OID, NORMAL_METER_BOTTOMRIGHT_16_9_Y, "{1}")
			UpdateMeterConfiguration(1)
		endif		
	endif
endEvent

event OnOptionSliderOpen(int option)
	if option == General_SettingSlot_OID
		SetSliderDialogStartValue(_WL_SettingSlot.GetValueInt())
		SetSliderDialogDefaultValue(55.0)
		SetSliderDialogRange(30.0, 61.0)
		SetSliderDialogInterval(1.0)
	elseif option == General_HotkeyHoldUseDuration_OID
		SetSliderDialogStartValue(_WL_SettingHoldActivateToggleDuration.GetValue())
		SetSliderDialogDefaultValue(2.0)
		SetSliderDialogRange(1, 5.0)
		SetSliderDialogInterval(0.5)
	elseif option == Interface_UIMeterDisplayTime_OID
		SetSliderDialogStartValue(_WL_SettingMeterDisplayTime.GetValueInt() * 2)
		SetSliderDialogDefaultValue(8.0)
		SetSliderDialogRange(4.0, 20.0)
		SetSliderDialogInterval(2.0)
	elseif option == Interface_UIMeterOpacity_OID
		if configuring_oil_meter
			SetSliderDialogStartValue(_WL_SettingMeterOilOpacity.GetValue())
			SetSliderDialogDefaultValue(100.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		elseif configuring_pollen_meter
			SetSliderDialogStartValue(_WL_SettingMeterPollenOpacity.GetValue())
			SetSliderDialogDefaultValue(100.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		endif
	elseif option == Interface_UIMeterHeight_OID
		if configuring_oil_meter
			SetSliderDialogStartValue(_WL_SettingMeterOilHeight.GetValue())
			SetSliderDialogDefaultValue(NORMAL_METER_DEFAULT_HEIGHT)
			SetSliderDialogRange(NORMAL_METER_MIN_HEIGHT, NORMAL_METER_MAX_HEIGHT)
			SetSliderDialogInterval(0.1)
		elseif configuring_pollen_meter
			SetSliderDialogStartValue(_WL_SettingMeterPollenHeight.GetValue())
			SetSliderDialogDefaultValue(NORMAL_METER_DEFAULT_HEIGHT)
			SetSliderDialogRange(NORMAL_METER_MIN_HEIGHT, NORMAL_METER_MAX_HEIGHT)
			SetSliderDialogInterval(0.1)
		endif
	elseif option == Interface_UIMeterWidth_OID
		if configuring_oil_meter
			SetSliderDialogStartValue(_WL_SettingMeterOilWidth.GetValue())
			SetSliderDialogDefaultValue(NORMAL_METER_DEFAULT_WIDTH)
			SetSliderDialogRange(NORMAL_METER_MIN_WIDTH, NORMAL_METER_MAX_WIDTH)
			SetSliderDialogInterval(0.1)
		elseif configuring_pollen_meter
			SetSliderDialogStartValue(_WL_SettingMeterPollenWidth.GetValue())
			SetSliderDialogDefaultValue(NORMAL_METER_DEFAULT_WIDTH)
			SetSliderDialogRange(NORMAL_METER_MIN_WIDTH, NORMAL_METER_MAX_WIDTH)
			SetSliderDialogInterval(0.1)
		endif
	elseif option == Interface_UIMeterXPos_OID
		if configuring_oil_meter
			SetSliderDialogStartValue(_WL_SettingMeterOilXPos.GetValue())
			SetSliderDialogDefaultValue(NORMAL_METER_BOTTOMRIGHT_16_9_X)
			SetSliderDialogRange(0.0, 1280.0)
			SetSliderDialogInterval(0.1)
		elseif configuring_pollen_meter
			SetSliderDialogStartValue(_WL_SettingMeterPollenXPos.GetValue())
			SetSliderDialogDefaultValue(NORMAL_METER_BOTTOMRIGHT_16_9_X)
			SetSliderDialogRange(0.0, 1280.0)
			SetSliderDialogInterval(0.1)
		endif
	elseif option == Interface_UIMeterYPos_OID
		if configuring_oil_meter
			SetSliderDialogStartValue(_WL_SettingMeterOilYPos.GetValue())
			SetSliderDialogDefaultValue(NORMAL_METER_BOTTOMRIGHT_16_9_Y)
			SetSliderDialogRange(0.0, 720.0)
			SetSliderDialogInterval(0.1)
		elseif configuring_pollen_meter
			SetSliderDialogStartValue(_WL_SettingMeterPollenYPos.GetValue())
			SetSliderDialogDefaultValue(NORMAL_METER_BOTTOMRIGHT_16_9_Y)
			SetSliderDialogRange(0.0, 720.0)
			SetSliderDialogInterval(0.1)
		endif
	endif
endEvent

event OnOptionSliderAccept(int option, float value)
	if option == General_SettingSlot_OID
		_WL_SettingSlot.SetValue(value)
		SetSliderOptionValue(General_SettingSlot_OID, value, "{0}")
		SetLanternSlot()
	elseif option == General_HotkeyHoldUseDuration_OID
		_WL_SettingHoldActivateToggleDuration.SetValue(value)
		SetSliderOptionValue(General_HotkeyHoldUseDuration_OID, value, "{1} sec")
	elseif option == Interface_UIMeterDisplayTime_OID
		_WL_SettingMeterDisplayTime.SetValue(value/2)
		SetSliderOptionValue(Interface_UIMeterDisplayTime_OID, value, "{0}")
	
	elseif option == Interface_UIMeterOpacity_OID
		if configuring_oil_meter
			_WL_SettingMeterOilOpacity.SetValue(value)
			SetSliderOptionValue(Interface_UIMeterOpacity_OID, value, "{0}%")
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenOpacity.SetValue(value)
			SetSliderOptionValue(Interface_UIMeterOpacity_OID, value, "{0}%")
			UpdateMeterConfiguration(1)
		endif
	elseif option == Interface_UIMeterHeight_OID
		if configuring_oil_meter
			_WL_SettingMeterOilHeight.SetValue(value)
			SetSliderOptionValue(Interface_UIMeterHeight_OID, value, "{1}")
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenHeight.SetValue(value)
			SetSliderOptionValue(Interface_UIMeterHeight_OID, value, "{1}")
			UpdateMeterConfiguration(1)
		endif
	elseif option == Interface_UIMeterWidth_OID
		if configuring_oil_meter
			_WL_SettingMeterOilWidth.SetValue(value)
			SetSliderOptionValue(Interface_UIMeterWidth_OID, value, "{1}")
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenWidth.SetValue(value)
			SetSliderOptionValue(Interface_UIMeterWidth_OID, value, "{1}")
			UpdateMeterConfiguration(1)
		endif
	elseif option == Interface_UIMeterXPos_OID
		if configuring_oil_meter
			_WL_SettingMeterOilXPos.SetValue(value)
			SetSliderOptionValue(Interface_UIMeterXPos_OID, value, "{1}")
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenXPos.SetValue(value)
			SetSliderOptionValue(Interface_UIMeterXPos_OID, value, "{1}")
			UpdateMeterConfiguration(1)
		endif
	elseif option == Interface_UIMeterYPos_OID
		if configuring_oil_meter
			_WL_SettingMeterOilYPos.SetValue(value)
			SetSliderOptionValue(Interface_UIMeterYPos_OID, value, "{1}")
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenYPos.SetValue(value)
			SetSliderOptionValue(Interface_UIMeterYPos_OID, value, "{1}")
			UpdateMeterConfiguration(1)
		endif		
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
		SetMenuDialogStartIndex(_WL_SettingFuelMeterDisplay_Contextual.GetValueInt())
		SetMenuDialogDefaultIndex(0)
	elseif option == Interface_UIMeterLayout_OID
		SetMenuDialogOptions(MeterLayoutList)
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
	elseif option == Interface_UIMeterFillDirection_OID
		if configuring_oil_meter
			SetMenuDialogOptions(FillDirectionList)
			SetMenuDialogStartIndex(_WL_SettingMeterOilFillDirection.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		elseif configuring_pollen_meter
			SetMenuDialogOptions(FillDirectionList)
			SetMenuDialogStartIndex(_WL_SettingMeterPollenFillDirection.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		endif
	elseif option == Interface_UIMeterHAnchor_OID
		if configuring_oil_meter
			SetMenuDialogOptions(HorizontalAnchorList)
			SetMenuDialogStartIndex(_WL_SettingMeterOilHAnchor.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		elseif configuring_pollen_meter
			SetMenuDialogOptions(HorizontalAnchorList)
			SetMenuDialogStartIndex(_WL_SettingMeterPollenHAnchor.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		endif
	elseif option == Interface_UIMeterVAnchor_OID
		if configuring_oil_meter
			SetMenuDialogOptions(VerticalAnchorList)
			SetMenuDialogStartIndex(_WL_SettingMeterOilVAnchor.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		elseif configuring_pollen_meter
			SetMenuDialogOptions(VerticalAnchorList)
			SetMenuDialogStartIndex(_WL_SettingMeterPollenVAnchor.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		endif
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
			LanternQuest.ToggleLanternOn()
		endIf
	elseif option == General_SettingCheckFuelDisplayMenu_OID
		CheckFuelDisplayIndex = index
		SetMenuOptionValue(General_SettingCheckFuelDisplayMenu_OID, CheckFuelDisplayList[CheckFuelDisplayIndex])
		_WL_SettingCheckFuelDisplay.SetValueInt(index)
	elseif option == Interface_UIMeterDisplay_OID
		SetMenuOptionValue(Interface_UIMeterDisplay_OID, MeterDisplayList[index])
		_WL_SettingFuelMeterDisplay_Contextual.SetValueInt(index)
		if index == 0
			SendEvent_WearableLanternRemoveOilMeter()
			SendEvent_WearableLanternRemovePollenMeter()
		else
			SendEvent_ForceOilMeterDisplay()
			SendEvent_ForcePollenMeterDisplay()
		endif
	elseif option == Interface_UIMeterLayout_OID
		bool result = ShowMessage("$WearableLanternsInterfaceSettingUIMeterLayoutConfirm")
		if result == true
			ApplyMeterPreset(index)
			ShowMessage("$WearableLanternsInterfaceSettingUIMeterLayoutConfirmDone", false)
		endif
	elseif option == Interface_UIMeterFillDirection_OID
		if configuring_oil_meter
			_WL_SettingMeterOilFillDirection.SetValueInt(index)
			SetMenuOptionValue(Interface_UIMeterFillDirection_OID, FillDirectionList[index])
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenFillDirection.SetValueInt(index)
			SetMenuOptionValue(Interface_UIMeterFillDirection_OID, FillDirectionList[index])
			UpdateMeterConfiguration(1)
		endif
	elseif option == Interface_UIMeterHAnchor_OID
		if configuring_oil_meter
			_WL_SettingMeterOilHAnchor.SetValueInt(index)
			SetMenuOptionValue(Interface_UIMeterHAnchor_OID, HorizontalAnchorList[index])
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenHAnchor.SetValueInt(index)
			SetMenuOptionValue(Interface_UIMeterHAnchor_OID, HorizontalAnchorList[index])
			UpdateMeterConfiguration(1)
		endif
	elseif option == Interface_UIMeterVAnchor_OID
		if configuring_oil_meter
			_WL_SettingMeterOilVAnchor.SetValueInt(index)
			SetMenuOptionValue(Interface_UIMeterVAnchor_OID, VerticalAnchorList[index])
			UpdateMeterConfiguration(0)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenVAnchor.SetValueInt(index)
			SetMenuOptionValue(Interface_UIMeterVAnchor_OID, VerticalAnchorList[index])
			UpdateMeterConfiguration(1)
		endif
	endif
endEvent

event OnOptionKeyMapChange(int option, int keyCode, string conflictControl, string conflictName)
	bool success
	if option == General_HotkeyLantern_OID
		success = RemapHotkey(option, keyCode, conflictControl, conflictName, _WL_HotkeyPlayerLantern)
		if success
			; SaveSettingToCurrentProfile("hotkey_togglelantern", keyCode)
		endif
	elseif option == General_HotkeyCheckFuel_OID
		success = RemapHotkey(option, keyCode, conflictControl, conflictName, _WL_HotkeyCheckFuel)
		if success
			; SaveSettingToCurrentProfile("hotkey_checkfuel", keyCode)
		endif
	endif
endEvent

bool function RemapHotkey(int option, int keyCode, string conflictControl, string conflictName, GlobalVariable akHotkeyGlobal)
	if conflictControl != ""
		if conflictName != ""
			bool b = ShowMessage("This key is already bound to " + conflictControl + " in " + conflictName + ". Undesirable behavior may occur; use with caution, or assign to a different control.")
			if b
				akHotkeyGlobal.SetValueInt(keyCode)
				RegisterForKey(akHotkeyGlobal.GetValueInt())
				ForcePageReset()
				return true
			endif
		else
			ShowMessage("This key is already bound to " + conflictControl + " in Skyrim. Please select a different key.", a_withCancel = false)
			return false
		endif
	else
		akHotkeyGlobal.SetValueInt(keyCode)
		RegisterForKey(akHotkeyGlobal.GetValueInt())
		ForcePageReset()
		return true
	endif
endFunction

event OnOptionColorAccept(int option, int color)
	if option == Interface_UIMeterColor_OID
		if configuring_oil_meter
			_WL_SettingMeterOilColor.SetValueInt(color)
			SetColorOptionValue(option, color)
			; ChooseMeterPosition(MeterLayoutIndex)
		elseif configuring_pollen_meter
			_WL_SettingMeterPollenColor.SetValueInt(color)
			SetColorOptionValue(option, color)
			; ChooseMeterPosition(MeterLayoutIndex)
		endif		
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

Event OnControlDown(string control)
	if _WL_SettingHoldActivateToggle.GetValueInt() == 2 && control == "Activate" && !Utility.IsInMenuMode()
		RegisterForSingleUpdate(_WL_SettingHoldActivateToggleDuration.GetValue())
	endif
endEvent

Event OnControlUp(string control, float HoldTime)
	if control == "Activate" && !Utility.IsInMenuMode()
		UnregisterForUpdate()
	endif
endEvent

Event OnUpdate()
	if Input.IsKeyPressed(Input.GetMappedKey("Activate"))
		ToggleLantern()
	endif
EndEvent

string function GetCustomControl(int keyCode)
	if (keyCode == _WL_HotkeyPlayerLantern.GetValueInt())
		return "Toggle Lantern"
	elseif (keyCode == _WL_HotkeyCheckFuel.GetValueInt())
		return "Check Fuel"
	else
		return ""
	endIf
endFunction

_WL_OilMeter property OilMeter auto
_WL_OilMeterInterfaceHandler property OilHandler auto
_WL_PollenMeter property PollenMeter auto
_WL_PollenMeterInterfaceHandler property PollenHandler auto

function UpdateMeterConfiguration(int aiMeterIdx)
	if aiMeterIdx == 0
		; Oil
		ConfigureMeter(0, _WL_SettingMeterOilFillDirection.GetValueInt(), 	\
						  _WL_SettingMeterOilHAnchor.GetValueInt(),			\
						  _WL_SettingMeterOilVAnchor.GetValueInt(),			\
						  _WL_SettingMeterOilXPos.GetValue(),				\
						  _WL_SettingMeterOilYPos.GetValue(),				\
						  _WL_SettingMeterOilHeight.GetValue(),				\
						  _WL_SettingMeterOilWidth.GetValue())
	elseif aiMeterIdx == 1
		; Pollen
		ConfigureMeter(1, _WL_SettingMeterPollenFillDirection.GetValueInt(), 	\
						  _WL_SettingMeterPollenHAnchor.GetValueInt(),			\
						  _WL_SettingMeterPollenVAnchor.GetValueInt(),			\
						  _WL_SettingMeterPollenXPos.GetValue(),				\
						  _WL_SettingMeterPollenYPos.GetValue(),				\
						  _WL_SettingMeterPollenHeight.GetValue(),				\
						  _WL_SettingMeterPollenWidth.GetValue())
	endif
endFunction

function ConfigureMeter(int aiMeterIdx, int aiFillDirectionIdx, int aiHAnchorIdx, int aiVAnchorIdx, float afPositionX, float afPositionY, float afHeight, float afWidth)
	; Not configured: Color, Opacity
	Common_SKI_MeterWidget MyMeter = None
	CommonMeterInterfaceHandler MyMeterHandler = None
	if aiMeterIdx == 0
		MyMeter = OilMeter
		MyMeterHandler = OilHandler
	else
		MyMeter = PollenMeter
		MyMeterHandler = PollenHandler
	endif

	if !MyMeter
		return
	endIf

	MyMeter.FillDirection = FILL_DIRECTIONS[aiFillDirectionIdx]
	MyMeter.HAnchor = HORIZONTAL_ANCHORS[aiHAnchorIdx]
	MyMeter.VAnchor = VERTICAL_ANCHORS[aiVAnchorIdx]
	MyMeter.X = afPositionX
	MyMeter.Y = afPositionY
	MyMeter.Height = afHeight
	MyMeter.Width = afWidth
	MyMeterHandler.ForceMeterDisplay()
endFunction

function ApplyMeterPreset(int aiPresetIdx)
	_WL_SettingMeterOilHeight.SetValue(NORMAL_METER_DEFAULT_HEIGHT)
	_WL_SettingMeterOilWidth.SetValue(NORMAL_METER_DEFAULT_WIDTH)
	_WL_SettingMeterPollenHeight.SetValue(NORMAL_METER_DEFAULT_HEIGHT)
	_WL_SettingMeterPollenWidth.SetValue(NORMAL_METER_DEFAULT_WIDTH)

	if aiPresetIdx == 0
		; 16:9 Bottom Left
		_WL_SettingMeterOilFillDirection.SetValueInt(1)
		_WL_SettingMeterOilHAnchor.SetValueInt(0)
		_WL_SettingMeterOilVAnchor.SetValueInt(1)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_BOTTOMLEFT_16_9_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_BOTTOMLEFT_16_9_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(1)
		_WL_SettingMeterPollenHAnchor.SetValueInt(0)
		_WL_SettingMeterPollenVAnchor.SetValueInt(1)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_BOTTOMLEFT_16_9_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_BOTTOMLEFT_16_9_Y)
	elseif aiPresetIdx == 1
		; 16:9 Bottom Right
		_WL_SettingMeterOilFillDirection.SetValueInt(0)
		_WL_SettingMeterOilHAnchor.SetValueInt(1)
		_WL_SettingMeterOilVAnchor.SetValueInt(1)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_9_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_9_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(0)
		_WL_SettingMeterPollenHAnchor.SetValueInt(1)
		_WL_SettingMeterPollenVAnchor.SetValueInt(1)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_9_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_9_Y)
	elseif aiPresetIdx == 2
		; 16:9 Top Left
		_WL_SettingMeterOilFillDirection.SetValueInt(1)
		_WL_SettingMeterOilHAnchor.SetValueInt(0)
		_WL_SettingMeterOilVAnchor.SetValueInt(0)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_TOPLEFT_16_9_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_TOPLEFT_16_9_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(1)
		_WL_SettingMeterPollenHAnchor.SetValueInt(0)
		_WL_SettingMeterPollenVAnchor.SetValueInt(0)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_TOPLEFT_16_9_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_TOPLEFT_16_9_Y)
	elseif aiPresetIdx == 3
		; 16:9 Top Right
		_WL_SettingMeterOilFillDirection.SetValueInt(0)
		_WL_SettingMeterOilHAnchor.SetValueInt(1)
		_WL_SettingMeterOilVAnchor.SetValueInt(0)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_TOPRIGHT_16_9_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_TOPRIGHT_16_9_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(0)
		_WL_SettingMeterPollenHAnchor.SetValueInt(1)
		_WL_SettingMeterPollenVAnchor.SetValueInt(0)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_TOPRIGHT_16_9_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_TOPRIGHT_16_9_Y)
	elseif aiPresetIdx == 4
		; 16:10 Bottom Left
		_WL_SettingMeterOilFillDirection.SetValueInt(1)
		_WL_SettingMeterOilHAnchor.SetValueInt(0)
		_WL_SettingMeterOilVAnchor.SetValueInt(1)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_BOTTOMLEFT_16_10_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_BOTTOMLEFT_16_10_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(1)
		_WL_SettingMeterPollenHAnchor.SetValueInt(0)
		_WL_SettingMeterPollenVAnchor.SetValueInt(1)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_BOTTOMLEFT_16_10_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_BOTTOMLEFT_16_10_Y)
	elseif aiPresetIdx == 5
		; 16:10 Bottom Right
		_WL_SettingMeterOilFillDirection.SetValueInt(0)
		_WL_SettingMeterOilHAnchor.SetValueInt(1)
		_WL_SettingMeterOilVAnchor.SetValueInt(1)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_10_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_10_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(0)
		_WL_SettingMeterPollenHAnchor.SetValueInt(1)
		_WL_SettingMeterPollenVAnchor.SetValueInt(1)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_10_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_BOTTOMRIGHT_16_10_Y)
	elseif aiPresetIdx == 6
		; 16:10 Top Left
		_WL_SettingMeterOilFillDirection.SetValueInt(1)
		_WL_SettingMeterOilHAnchor.SetValueInt(0)
		_WL_SettingMeterOilVAnchor.SetValueInt(0)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_TOPLEFT_16_10_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_TOPLEFT_16_10_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(1)
		_WL_SettingMeterPollenHAnchor.SetValueInt(0)
		_WL_SettingMeterPollenVAnchor.SetValueInt(0)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_TOPLEFT_16_10_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_TOPLEFT_16_10_Y)
	elseif aiPresetIdx == 7
		; 16:10 Top Right
		_WL_SettingMeterOilFillDirection.SetValueInt(0)
		_WL_SettingMeterOilHAnchor.SetValueInt(1)
		_WL_SettingMeterOilVAnchor.SetValueInt(0)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_TOPRIGHT_16_10_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_TOPRIGHT_16_10_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(0)
		_WL_SettingMeterPollenHAnchor.SetValueInt(1)
		_WL_SettingMeterPollenVAnchor.SetValueInt(0)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_TOPRIGHT_16_10_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_TOPRIGHT_16_10_Y)
	elseif aiPresetIdx == 8
		; 4:3 Bottom Left
		_WL_SettingMeterOilFillDirection.SetValueInt(1)
		_WL_SettingMeterOilHAnchor.SetValueInt(0)
		_WL_SettingMeterOilVAnchor.SetValueInt(1)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_BOTTOMLEFT_4_3_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_BOTTOMLEFT_4_3_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(1)
		_WL_SettingMeterPollenHAnchor.SetValueInt(0)
		_WL_SettingMeterPollenVAnchor.SetValueInt(1)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_BOTTOMLEFT_4_3_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_BOTTOMLEFT_4_3_Y)
	elseif aiPresetIdx == 9
		; 4:3 Bottom Right
		_WL_SettingMeterOilFillDirection.SetValueInt(0)
		_WL_SettingMeterOilHAnchor.SetValueInt(1)
		_WL_SettingMeterOilVAnchor.SetValueInt(1)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_BOTTOMRIGHT_4_3_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_BOTTOMRIGHT_4_3_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(0)
		_WL_SettingMeterPollenHAnchor.SetValueInt(1)
		_WL_SettingMeterPollenVAnchor.SetValueInt(1)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_BOTTOMRIGHT_4_3_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_BOTTOMRIGHT_4_3_Y)
	elseif aiPresetIdx == 10
		; 4:3 Top Left
		_WL_SettingMeterOilFillDirection.SetValueInt(1)
		_WL_SettingMeterOilHAnchor.SetValueInt(0)
		_WL_SettingMeterOilVAnchor.SetValueInt(0)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_TOPLEFT_4_3_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_TOPLEFT_4_3_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(1)
		_WL_SettingMeterPollenHAnchor.SetValueInt(0)
		_WL_SettingMeterPollenVAnchor.SetValueInt(0)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_TOPLEFT_4_3_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_TOPLEFT_4_3_Y)
	elseif aiPresetIdx == 11
		; 4:3 Top Right
		_WL_SettingMeterOilFillDirection.SetValueInt(0)
		_WL_SettingMeterOilHAnchor.SetValueInt(1)
		_WL_SettingMeterOilVAnchor.SetValueInt(0)
		_WL_SettingMeterOilXPos.SetValue(NORMAL_METER_TOPRIGHT_4_3_X)
		_WL_SettingMeterOilYPos.SetValue(NORMAL_METER_TOPRIGHT_4_3_Y)
		_WL_SettingMeterPollenFillDirection.SetValueInt(0)
		_WL_SettingMeterPollenHAnchor.SetValueInt(1)
		_WL_SettingMeterPollenVAnchor.SetValueInt(0)
		_WL_SettingMeterPollenXPos.SetValue(NORMAL_METER_TOPRIGHT_4_3_X)
		_WL_SettingMeterPollenYPos.SetValue(NORMAL_METER_TOPRIGHT_4_3_Y)
	endif
	
	UpdateMeterConfiguration(0)
	UpdateMeterConfiguration(1)
endFunction

;/ function ; ChooseMeterPosition(int index)
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
/;

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
			CheckFuel()
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
			CheckFuel()
			WLDebug(1, "Torchbug lantern turned on.")
		endIf
	endIf
endFunction

function CheckFuel()
	int i = _WL_SettingCheckFuelDisplay.GetValueInt()
	if i == 0  									;Meter, Message
		if _WL_SettingOil.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_OIL
			ShowOilRemainingMessage(_WL_OilLevel.GetValue())
			ForceOilMeterFlashIfEmpty()
		elseif _WL_SettingFeeding.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_TORCHBUG
			ShowPollenRemainingMessage(_WL_PollenLevel.GetValueInt())
			ForcePollenMeterFlashIfEmpty()
		endIf
	elseif i == 1 								;Meter Only
		if _WL_SettingOil.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_OIL
			ForceOilMeterFlashIfEmpty()
		elseif _WL_SettingFeeding.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_TORCHBUG
			ForcePollenMeterFlashIfEmpty()
		endIf
	elseif i == 2 								;Message Only
		if _WL_SettingOil.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_OIL
			ShowOilRemainingMessage(_WL_OilLevel.GetValue())
		elseif _WL_SettingFeeding.GetValueInt() == 2 && LanternQuest.current_lantern == LanternQuest.LANTERN_TORCHBUG
			ShowPollenRemainingMessage(_WL_PollenLevel.GetValueInt())
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

function ShowPollenRemainingMessage(int pollen_level)
	if pollen_level == 0
		_WL_LanternOilRemainingEmpty.Show()
	elseif pollen_level > 0 && pollen_level <= 12
		_WL_LanternOilRemainingMostlyEmpty.Show()
	elseif pollen_level > 12 && pollen_level < 16
		_WL_LanternOilRemainingLessThanHalf.Show()
	elseif pollen_level >= 16 && pollen_level < 20
		_WL_LanternOilRemainingHalfFull.Show()
	elseif pollen_level >= 20 && pollen_level < 32
		_WL_LanternOilRemainingMostlyFull.Show()
	elseif pollen_level == 32
		_WL_LanternOilRemainingFull.Show()
	endif
endFunction

function RegisterForKeysOnLoad()
	if _WL_SettingHoldActivateToggle.GetValueInt() == 2
		RegisterForControl("Activate")
	endif
	if _WL_HotkeyPlayerLantern.GetValueInt() != 0
		RegisterForKey(_WL_HotkeyPlayerLantern.GetValueInt())
	endIf
	if _WL_HotkeyCheckFuel.GetValueInt() != 0
		RegisterForKey(_WL_HotkeyCheckFuel.GetValueInt())
	endIf
endFunction

function SetLanternSlot()
	int slotmask = Armor.GetMaskForSlot(_WL_SettingSlot.GetValueInt())

	_WL_WearableLanternApparel.SetSlotMask(slotmask)
	_WL_WearableLanternApparelFront.SetSlotMask(slotmask)
	_WL_WearableTorchbugApparel_Empty.SetSlotMask(slotmask)
	_WL_WearableTorchbugApparelFront_Empty.SetSlotMask(slotmask)
	_WL_WearableTorchbugApparel.SetSlotMask(slotmask)
	_WL_WearableTorchbugApparelFront.SetSlotMask(slotmask)
	_WL_WearableTorchbugApparelRED.SetSlotMask(slotmask)
	_WL_WearableTorchbugApparelFrontRED.SetSlotMask(slotmask)
	_WL_WearablePaperApparel.SetSlotMask(slotmask)
	_WL_WearablePaperApparelFront.SetSlotMask(slotmask)

	if !_WL_WearableLanternAA
		_WL_WearableLanternAA = Game.GetFormFromFile(0x0012C8, "Chesko_WearableLantern.esp") as ArmorAddon
	endif
	if !_WL_WearableLanternFrontAA
		_WL_WearableLanternFrontAA = Game.GetFormFromFile(0x001D9C, "Chesko_WearableLantern.esp") as ArmorAddon
	endif
	if !_WL_WearablePaperAA
		_WL_WearablePaperAA = Game.GetFormFromFile(0x011728, "Chesko_WearableLantern.esp") as ArmorAddon
	endif
	if !_WL_WearablePaperFrontAA
		_WL_WearablePaperFrontAA = Game.GetFormFromFile(0x011729, "Chesko_WearableLantern.esp") as ArmorAddon
	endif
	if !_WL_WearableTorchbugAA
		_WL_WearableTorchbugAA = Game.GetFormFromFile(0x0038D6, "Chesko_WearableLantern.esp") as ArmorAddon
	endif
	if !_WL_WearableTorchbugAA_empty
		_WL_WearableTorchbugAA_empty = Game.GetFormFromFile(0x004E97, "Chesko_WearableLantern.esp") as ArmorAddon
	endif
	if !_WL_WearableTorchbugFrontAA
		_WL_WearableTorchbugFrontAA = Game.GetFormFromFile(0x005F47, "Chesko_WearableLantern.esp") as ArmorAddon
	endif
	if !_WL_WearableTorchbugFrontAA_empty
		_WL_WearableTorchbugFrontAA_empty = Game.GetFormFromFile(0x005F48, "Chesko_WearableLantern.esp") as ArmorAddon
	endif
	if !_WL_WearableTorchbugFrontREDAA
		_WL_WearableTorchbugFrontREDAA = Game.GetFormFromFile(0x005F4A, "Chesko_WearableLantern.esp") as ArmorAddon
	endif
	if !_WL_WearableTorchbugREDAA
		_WL_WearableTorchbugREDAA = Game.GetFormFromFile(0x005F49, "Chesko_WearableLantern.esp") as ArmorAddon
	endif

	_WL_WearableLanternAA.SetSlotMask(slotmask)
	_WL_WearableLanternFrontAA.SetSlotMask(slotmask)
	_WL_WearablePaperAA.SetSlotMask(slotmask)
	_WL_WearablePaperFrontAA.SetSlotMask(slotmask)
	_WL_WearableTorchbugAA.SetSlotMask(slotmask)
	_WL_WearableTorchbugAA_empty.SetSlotMask(slotmask)
	_WL_WearableTorchbugFrontAA.SetSlotMask(slotmask)
	_WL_WearableTorchbugFrontAA_empty.SetSlotMask(slotmask)
	_WL_WearableTorchbugFrontREDAA.SetSlotMask(slotmask)
	_WL_WearableTorchbugREDAA.SetSlotMask(slotmask)
endFunction

function ForceOilMeterFlashIfEmpty()
	if _WL_OilLevel.GetValue() <= 0.0
		SendEvent_ForceOilMeterDisplay(true)
	else
		SendEvent_ForceOilMeterDisplay()
	endif
endFunction

function ForcePollenMeterFlashIfEmpty()
	if _WL_PollenLevel.GetValueInt() <= 0
		SendEvent_ForcePollenMeterDisplay(true)
	else
		SendEvent_ForcePollenMeterDisplay()
	endif
endFunction

function SendEvent_ForceOilMeterDisplay(bool abFlash = false)
	int handle = ModEvent.Create("WearableLanterns_ForceOilMeterDisplay")
	if handle
		ModEvent.PushBool(handle, abFlash)
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_ForcePollenMeterDisplay(bool abFlash = false)
	int handle = ModEvent.Create("WearableLanterns_ForcePollenMeterDisplay")
	if handle
		ModEvent.PushBool(handle, abFlash)
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_WearableLanternRemoveOilMeter()
	int handle = ModEvent.Create("WearableLanterns_RemoveOilMeter")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_WearableLanternRemovePollenMeter()
	int handle = ModEvent.Create("WearableLanterns_RemovePollenMeter")
    if handle
        ModEvent.Send(handle)
    endif
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