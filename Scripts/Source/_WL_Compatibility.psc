Scriptname _WL_Compatibility extends ReferenceAlias

import debug

_WL_SkyUIConfigPanelScript property WLConfig Auto 			;SkyUI Configuration script

bool property bIsSKYUILoaded auto hidden
bool property bIsDLC1Loaded auto hidden
bool property bIsDLC2Loaded auto hidden
bool property bIsBUGSLoaded auto hidden

Formlist property _WL_GlowingBugList auto

Ingredient property MountainFlowerYellow auto hidden
Activator property FireflyBUG auto hidden

;Legacy mod warnings
bool bIsGuardLanternLoaded
bool bIsKhajiitLanternLoaded
bool bIsCLNLoaded
bool bIsCLNDGLoaded
bool bIsBUGSLoaded
message property _WL_CLNWarning auto
message property _WL_CLNDGWarning auto
message property _WL_GuardLanternWarning auto
message property _WL_KhajiitLanternWarning auto
message property _WL_SkyUIErrorMessage auto

Event OnPlayerLoadGame()
	CompatibilityCheck()
	RegisterForKeysOnLoad()
endEvent

function CompatibilityCheck()
	trace("========================================[Wearable Lanterns: Warning Start]========================================")
	trace("            Wearable Lanterns is now performing compatibility checks. Papyrus warnings about missing or           ")
	trace("                        unloaded files may follow. This is normal and they can be ignored.                        ")
	trace("========================================[ Wearable Lanterns: Warning End ]========================================")
	
	bIsDLC1Loaded = Game.GetFormFromFile(0x02009403, "Dawnguard.esm")									;Dawnguard
	bIsDLC2Loaded = Game.GetFormFromFile(0x0201FB99, "Dragonborn.esm")
	bIsSKYUILoaded = Game.GetFormFromFile(0x01000814, "SkyUI.esp")
	Activator GetFirefly = GetBUGSLoaded()
	
	if bIsDLC1Loaded
		MountainFlowerYellow = Game.GetFormFromFile(0x01002A78, "Dawnguard.esm") as Ingredient
	else
		MountainFlowerYellow = none
	endif

	if bIsDLC2Loaded
		;DLC2 was just added.
		DLC2LoadUp()
	else
		;DLC2 is not active or was removed.
		RemovePaperLanterns()
	endif

	if !bIsSKYUILoaded
		_WL_SkyUIErrorMessage.Show()
	endif

	if GetFirefly
		FireflyBUG = GetFirefly
		bIsBUGSLoaded = true
		if !_WL_GlowingBugList.HasForm(FireflyBUG)
			_WL_GlowingBugList.AddForm(FireflyBUG)
		endif
	else
		FireflyBUG = none
		bIsBUGSLoaded = false
	endif


	;Legacy mod warnings
	bIsCLNLoaded = Game.GetFormFromFile(0x01001DB7, "Chesko_WearableLantern_Candle.esp")		;Candle Lanterns of the North
	if bIsCLNLoaded
		_WL_CLNWarning.Show()
	endif
	bIsCLNDGLoaded = Game.GetFormFromFile(0x01001DB7, "Chesko_WearableLantern_Candle_DG.esp")	;Candle Lanterns of the North (DG)
	if bIsCLNDGLoaded
		_WL_CLNDGWarning.Show()
	endif
	bIsGuardLanternLoaded = Game.GetFormFromFile(0x01000D62, "Chesko_WearableLantern_Guards.esp")			;Lanterns for Guards
	if bIsGuardLanternLoaded
		_WL_GuardLanternWarning.Show()
	endif
	bIsKhajiitLanternLoaded = Game.GetFormFromFile(0x01000D62, "Chesko_WearableLantern_Caravaner.esp")	;Lanterns for Caravans
	if bIsKhajiitLanternLoaded
		_WL_KhajiitLanternWarning.Show()
	endif
	
	trace("========================================[Wearable Lanterns: Warning Start]========================================")
	trace("                                          Compatibility check complete.                                           ")
	trace("========================================[ Wearable Lanterns: Warning End ]========================================")
endFunction

function DLC2LoadUp()
	WLConfig.DLC2Loaded = true
endFunction

Activator function GetBUGSLoaded()
	Activator myBug = Game.GetFormFromFile(0x01001894, "83Willows_101BUGS_V4_HighRes.esp") as Activator
	if !myBug
		myBug = Game.GetFormFromFile(0x01001894, "83Willows_101BUGS_V4_LowRes.esp") as Activator
		if !myBug
			myBug = Game.GetFormFromFile(0x01001894, "83Willows_101BUGS_V4_HighRes_HighSpawn.esp") as Activator
			if !myBug
				myBug = Game.GetFormFromFile(0x01001894, "83Willows_101BUGS_V4_LowerRes_HighSpawn.esp") as Activator
				if !myBug
					return myBug
				else
					return myBug
				endif
			else
				return myBug
			endif
		else
			return myBug
		endif
	else
		return myBug
	endif
endFunction

function RemovePaperLanterns()
	WLConfig.DLC2Loaded = false
endFunction

Function RegisterForKeysOnLoad()
	WLConfig.RegisterForKeysOnLoad()
endFunction