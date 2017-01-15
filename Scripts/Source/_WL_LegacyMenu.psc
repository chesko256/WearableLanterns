scriptname _WL_LegacyMenu extends ActiveMagicEffect

Actor property PlayerRef auto
_WL_LanternOil_v3 property LanternQuest auto

;Messages
Message property _WL_legacyconfig_root auto
Message property _WL_legacyconfig_root2 auto
Message property _WL_legacyconfig_brightness_1 auto
Message property _WL_legacyconfig_brightness_2 auto
Message property _WL_legacyconfig_brightness_3 auto
Message property _WL_legacyconfig_brightness_4 auto
Message property _WL_legacyconfig_positionback auto
Message property _WL_legacyconfig_positionfront auto
Message property _WL_legacyconfig_positionheld auto
Message property _WL_legacyconfig_modeauto auto
Message property _WL_legacyconfig_modemanual auto
Message property _WL_legacyconfig_droplit_on auto
Message property _WL_legacyconfig_droplit_off auto
Message property _WL_legacyconfig_sneak_on auto
Message property _WL_legacyconfig_sneak_off auto
Message property _WL_legacyconfig_oil_on auto
Message property _WL_legacyconfig_oil_off auto
Message property _WL_legacyconfig_pollen_on auto
Message property _WL_legacyconfig_pollen_off auto
Message property _WL_legacyconfig_checkfueltoggle_on auto
Message property _WL_legacyconfig_checkfueltoggle_off auto
Message property _WL_EquipConfirm auto

GlobalVariable property _WL_SettingBrightness auto
GlobalVariable property _WL_SettingPosition auto 						;0 = Back, 1 = Front, 2 = Held
GlobalVariable property _WL_SettingDropLit auto
GlobalVariable property _WL_SettingOil auto
GlobalVariable property _WL_SettingFeeding auto
GlobalVariable property _WL_SettingOffWhenSneaking auto
GlobalVariable Property _WL_SettingAutomatic auto
GlobalVariable Property _WL_SettingCheckFuelOnToggle auto

Spell property _WL_LegacyCheckFuelSpell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if akCaster == Game.GetPlayer()
        menu_root()
    endif
EndEvent

;Root menu
function menu_root()
    int i = _WL_legacyconfig_root.Show()
    if i == 0
        menu_brightness()
        menu_root()
    elseif i == 1
        menu_position()
        menu_root()
    elseif i == 2
        menu_mode()
        menu_root()
    elseif i == 3
        menu_sneaking()
        menu_root()
    elseif i == 4
        menu_root2()
    elseif i == 5
        ; Exit
    endif
endFunction

function menu_root2()
	int i = _WL_legacyconfig_root2.Show()
	if i == 0
		menu_oil()
		menu_root2()
	elseif i == 1
		menu_pollen()
		menu_root2()
	elseif i == 2
		menu_checkfueltoggle()
		menu_root2()
	elseif i == 3
		menu_droplit()
		menu_root2()
	elseif i == 4
		menu_root()
	elseif i == 5
		; Exit
	endif
endFunction

function menu_brightness()
	Message theMenu
	int settingValue = _WL_SettingBrightness.GetValueInt()
	if settingValue == 1
		theMenu = _WL_legacyconfig_brightness_1
	elseif settingValue == 2
		theMenu = _WL_legacyconfig_brightness_2
	elseif settingValue == 3
		theMenu = _WL_legacyconfig_brightness_3
	elseif settingvalue == 4
		theMenu = _WL_legacyconfig_brightness_4
	endif

	int i = theMenu.Show()
	if i < 4
		_WL_SettingBrightness.SetValueInt(i + 1)
		menu_brightness()
	elseif i == 4
		; Back
	endif
endFunction

function menu_position(bool positionChanged = false)
	Message theMenu
	int settingValue = _WL_SettingPosition.GetValueInt()
	if settingValue == 0
		theMenu = _WL_legacyconfig_positionback
	elseif settingValue == 1
		theMenu = _WL_legacyconfig_positionfront
	elseif settingValue == 2
		theMenu = _WL_legacyconfig_positionheld
	endif

	int i = theMenu.Show()
	if i < 3
		_WL_SettingPosition.SetValueInt(i)
		menu_position(true)
	elseif i == 3
		if positionChanged
			_WL_EquipConfirm.Show()
		endif
	endif
endFunction

function menu_mode()
	MenuHandler_MultiSelect2(_WL_legacyconfig_modemanual, _WL_legacyconfig_modeauto, _WL_SettingAutomatic, 1)
endFunction

function menu_sneaking()
	MenuHandler_Toggle(_WL_legacyconfig_sneak_on, _WL_legacyconfig_sneak_off, _WL_SettingOffWhenSneaking)
	if _WL_SettingOffWhenSneaking.GetValueInt() == 2
		LanternQuest.RegisterForSneakEvents()
	else
		LanternQuest.UnregisterForSneakEvents()
	endif
endFunction

function menu_droplit()
	MenuHandler_Toggle(_WL_legacyconfig_droplit_on, _WL_legacyconfig_droplit_off, _WL_SettingDropLit)
endFunction

function menu_oil()
	MenuHandler_Toggle(_WL_legacyconfig_oil_on, _WL_legacyconfig_oil_off, _WL_SettingOil)
	LanternQuest.ToggleLanternOn()
	if _WL_SettingOil.GetValueInt() == 2 || _WL_SettingFeeding.GetValueInt() == 2
		PlayerRef.AddSpell(_WL_LegacyCheckFuelSpell, true)
	else
		PlayerRef.RemoveSpell(_WL_LegacyCheckFuelSpell)
	endif
endFunction

function menu_pollen()
	MenuHandler_Toggle(_WL_legacyconfig_pollen_on, _WL_legacyconfig_pollen_off, _WL_SettingFeeding)
	LanternQuest.ToggleLanternOn()
	if _WL_SettingOil.GetValueInt() == 2 || _WL_SettingFeeding.GetValueInt() == 2
		PlayerRef.AddSpell(_WL_LegacyCheckFuelSpell, true)
	else
		PlayerRef.RemoveSpell(_WL_LegacyCheckFuelSpell)
	endif
endFunction

function menu_checkfueltoggle()
	MenuHandler_Toggle(_WL_legacyconfig_checkfueltoggle_on, _WL_legacyconfig_checkfueltoggle_off, _WL_SettingCheckFuelOnToggle)
endFunction


;Format: On/Off, Back
;akSetting: 2 = ON, 1 = OFF
function MenuHandler_Toggle(Message akMessageOn, Message akMessageOff, GlobalVariable akSetting)
    if akSetting.GetValueInt() == 2
        int i = akMessageOn.Show()
        if i == 0
            akSetting.SetValueInt(1)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            ;return
        endif
    elseif akSetting.GetValueInt() == 1
        int i = akMessageOff.Show()
        if i == 0
            akSetting.SetValueInt(2)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            ;return
        endif
    endif
endFunction

function MenuHandler_MultiSelect2(Message akOption1Active, Message akOption2Active, GlobalVariable akSetting, int aiSettingOffset = 0)
    int setting = akSetting.GetValueInt()

    int i
    if (setting - aiSettingOffset) == 0
        i = akOption1Active.Show()
    elseif (setting - aiSettingOffset) == 1
        i = akOption2Active.Show()
    endif

    if i < 2
        akSetting.SetValueInt(i + aiSettingOffset)
        MenuHandler_MultiSelect2(akOption1Active, akOption2Active, akSetting, aiSettingOffset)
    endif
endFunction
