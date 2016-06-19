Scriptname _WL_Compatibility extends ReferenceAlias

import debug

_WL_SkyUIConfigPanelScript property WLConfig Auto 			;SkyUI Configuration script
ReferenceAlias property LanternQuestAlias auto
_WL_OilMeterInterfaceHandler property OilMeterHandler auto
_WL_PollenMeterInterfaceHandler property PollenMeterHandler auto

Actor property PlayerRef auto
Perk property _WL_CatchTorchbug auto

bool property bIsSKYUILoaded auto hidden
bool property bIsDLC1Loaded auto hidden
bool property bIsDLC2Loaded auto hidden
bool property bIsBUGSLoaded auto hidden

Formlist property _WL_PollenFlowers auto
Formlist property _WL_GlowingBugList auto
FormList property _WL_InteriorWorldspaces auto

GlobalVariable property _WL_SettingOffWhenSneaking auto
GlobalVariable property _WL_Upgraded_4_0 auto

Ingredient property MountainFlowerYellow auto hidden
Activator property FireflyBUG auto hidden

int property SKSE_MIN_VERSION = 10703 autoReadOnly
Message property _WL_SKSE_Error auto
Message property _WL_Error_JSONReadWrite auto

;Legacy mod warnings
bool bIsGuardLanternLoaded
bool bIsKhajiitLanternLoaded
bool bIsCLNLoaded
bool bIsCLNDGLoaded
bool bIsBUGSLoaded
Message property _WL_CLNWarning auto
Message property _WL_CLNDGWarning auto
Message property _WL_GuardLanternWarning auto
Message property _WL_KhajiitLanternWarning auto
Message property _WL_SkyUIErrorMessage auto

Event OnPlayerLoadGame()
	CompatibilityCheck()
	WLConfig.LoadProfileOnStartup()
	RegisterForEventsOnLoad()
	AddPerks()
	RegisterForKeysOnLoad()
endEvent

function CompatibilityCheck()
	trace("[Wearable Lanterns]=============================================================================================")
	trace("[Wearable Lanterns]                  Wearable Lanterns is now performing compatibility checks.                  ")
	trace("[Wearable Lanterns]=============================================================================================")
	
	CheckSKSE()

	bool can_read_write = CheckJSONReadWrite()
	if !can_read_write
		_WL_Error_JSONReadWrite.Show()
	endif

	if _WL_Upgraded_4_0.GetValueInt() != 2
		Upgrade_4_0()
	endif

	bIsDLC1Loaded = IsPluginLoaded(0x02009403, "Dawnguard.esm")
	bIsDLC2Loaded = IsPluginLoaded(0x0201FB99, "Dragonborn.esm")
	bIsSKYUILoaded = IsPluginLoaded(0x01000814, "SkyUI.esp")
	Activator GetFirefly = GetBUGSLoaded()
	
	if bIsDLC1Loaded
		DLC1LoadUp()
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
	bIsCLNLoaded = IsPluginLoaded(0x01001DB7, "Chesko_WearableLantern_Candle.esp")		;Candle Lanterns of the North
	if bIsCLNLoaded
		_WL_CLNWarning.Show()
	endif
	bIsCLNDGLoaded = IsPluginLoaded(0x01001DB7, "Chesko_WearableLantern_Candle_DG.esp")	;Candle Lanterns of the North (DG)
	if bIsCLNDGLoaded
		_WL_CLNDGWarning.Show()
	endif
	bIsGuardLanternLoaded = IsPluginLoaded(0x01000D62, "Chesko_WearableLantern_Guards.esp")			;Lanterns for Guards
	if bIsGuardLanternLoaded
		_WL_GuardLanternWarning.Show()
	endif
	bIsKhajiitLanternLoaded = IsPluginLoaded(0x01000D62, "Chesko_WearableLantern_Caravaner.esp")	;Lanterns for Caravans
	if bIsKhajiitLanternLoaded
		_WL_KhajiitLanternWarning.Show()
	endif
	trace("[Wearable Lanterns]=============================================================================================")
	trace("[Wearable Lanterns]                                Compatibility check complete.                                ")
	trace("[Wearable Lanterns]=============================================================================================")
endFunction

function Upgrade_4_0()
	; Re-run the MCM initialization.
	WLConfig.OnConfigInit()

	; Load a meter preset for the user's display aspect ratio
	WLConfig.ApplyMeterPreset(1)
	
	trace("[Wearable Lanterns] Upgraded to 4.0.")
	_WL_Upgraded_4_0.SetValueInt(2)
endFunction

bool function CheckJSONReadWrite()
	; Attempt to open the file and write a value.
	string path = "../WearableLanternsData/startup_test_file"
	string test_key = "test_key"
	JsonUtil.IntListResize(path, test_key, 7)
	JsonUtil.IntListSet(path, test_key, 0, 0)
	JsonUtil.IntListSet(path, test_key, 1, 1)
	JsonUtil.IntListSet(path, test_key, 2, 100)
	JsonUtil.IntListSet(path, test_key, 3, 1000)
	JsonUtil.IntListSet(path, test_key, 4, 5555)
	JsonUtil.IntListSet(path, test_key, 5, -1)
	JsonUtil.IntListSet(path, test_key, 6, 123456)

	; Test saving the file.
	bool save_success = JsonUtil.Save(path)
	if !save_success
		debug.trace("[Frostfall][ERROR] Could not save test JSON file. Check that you have folder read/write permissions to Skyrim/Data/SKSE/FrostfallData (or, for Mod Organizer users, Mod Organizer/overwrite/SKSE/FrostfallData).")
		return false
	endif

	; Test loading the file.
	bool load_success = JsonUtil.Load(path)
	if !load_success
		debug.trace("[Frostfall][ERROR] Could not load test JSON file. Check that you have folder read/write permissions to Skyrim/Data/SKSE/FrostfallData (or, for Mod Organizer users, Mod Organizer/overwrite/SKSE/FrostfallData).")
		return false
	endif
	; Test reading back the values.
	int val0 = JsonUtil.IntListGet(path, test_key, 0)
	int val1 = JsonUtil.IntListGet(path, test_key, 1)
	int val2 = JsonUtil.IntListGet(path, test_key, 2)
	int val3 = JsonUtil.IntListGet(path, test_key, 3)
	int val4 = JsonUtil.IntListGet(path, test_key, 4)
	int val5 = JsonUtil.IntListGet(path, test_key, 5)
	int val6 = JsonUtil.IntListGet(path, test_key, 6)

	if val0 == 0 		&& \
	   val1 == 1 		&& \
	   val2 == 100 		&& \
	   val3 == 1000 	&& \
	   val4 == 5555 	&& \
	   val5 == -1   	&& \
	   val6 == 123456

	    ; Success - Clear the values for the next test.
		JsonUtil.IntListClear(path, test_key)
		return true
	else
		debug.trace("[Frostfall][ERROR] Could not read from test JSON file. Check that you have folder read/write permissions to Skyrim/Data/SKSE/FrostfallData (or, for Mod Organizer users, Mod Organizer/overwrite/SKSE/FrostfallData).")
		return false
	endif
endFunction

function CheckSKSE()
	bool skse_loaded = SKSE.GetVersion()
	if skse_loaded
		int skse_version = (SKSE.GetVersion() * 10000) + (SKSE.GetVersionMinor() * 100) + SKSE.GetVersionBeta()
		if skse_version < SKSE_MIN_VERSION
			_WL_SKSE_Error.Show(((skse_version as float) / 10000), ((SKSE_MIN_VERSION as float) / 10000))
			debug.trace("[Wearable Lanterns][Error] Detected SKSE version " + ((skse_version as float) / 10000) + ", expected " + ((SKSE_MIN_VERSION as float) / 10000) + " or newer.")			
		else
			debug.trace("[Wearable Lanterns] Detected SKSE version " + ((skse_version as float) / 10000) + " (expected " + ((SKSE_MIN_VERSION as float) / 10000) + " or newer, success!)")
		endif
	else
		_WL_SKSE_Error.Show(((0.0) / 10000), ((SKSE_MIN_VERSION as float) / 10000))
		debug.trace("[Wearable Lanterns][Error] Detected SKSE version " + ((0.0) / 10000) + ", expected " + ((SKSE_MIN_VERSION as float) / 10000) + " or newer.")
	endif
endFunction

function DLC1LoadUp()
	MountainFlowerYellow = Game.GetFormFromFile(0x01002A78, "Dawnguard.esm") as Ingredient
	if !_WL_PollenFlowers.HasForm(MountainFlowerYellow)
		_WL_PollenFlowers.AddForm(MountainFlowerYellow)
	endif
	Form DLC01WS05 = Game.GetFormFromFile(0x020048C7, "Dawnguard.esm")			;DLC1AncestorsGladeWorld
	Form DLC01WS06 = Game.GetFormFromFile(0x02004BEA, "Dawnguard.esm")			;DLC1DarkfallPassageWorld
	Form DLC01WS07 = Game.GetFormFromFile(0x02002F64, "Dawnguard.esm")			;DLC1ForebearsHoldout
	
	if !(_WL_InteriorWorldspaces.HasForm(DLC01WS05))
		_WL_InteriorWorldspaces.AddForm(DLC01WS05)
		_WL_InteriorWorldspaces.AddForm(DLC01WS06)
		_WL_InteriorWorldspaces.AddForm(DLC01WS07)
	endif
endFunction

function DLC2LoadUp()
	WLConfig.DLC2Loaded = true
endFunction

Activator function GetBUGSLoaded()
	Activator myBug

	bool bugs_loaded = IsPluginLoaded(0x01001894, "83Willows_101BUGS_V4_HighRes.esp")
	if bugs_loaded
		myBug = Game.GetFormFromFile(0x01001894, "83Willows_101BUGS_V4_HighRes.esp") as Activator
	endif

	if !bugs_loaded
		bugs_loaded = IsPluginLoaded(0x01001894, "83Willows_101BUGS_V4_LowRes.esp")
		if bugs_loaded
			myBug = Game.GetFormFromFile(0x01001894, "83Willows_101BUGS_V4_LowRes.esp") as Activator
		endif
	endif

	if !bugs_loaded
		bugs_loaded = IsPluginLoaded(0x01001894, "83Willows_101BUGS_V4_HighRes_HighSpawn.esp")
		if bugs_loaded
			myBug = Game.GetFormFromFile(0x01001894, "83Willows_101BUGS_V4_HighRes_HighSpawn.esp") as Activator
		endif
	endif

	if !bugs_loaded
		bugs_loaded = IsPluginLoaded(0x01001894, "83Willows_101BUGS_V4_LowerRes_HighSpawn.esp")
		if bugs_loaded
			myBug = Game.GetFormFromFile(0x01001894, "83Willows_101BUGS_V4_LowerRes_HighSpawn.esp") as Activator
		endif
	endif

	return myBug
endFunction

function RemovePaperLanterns()
	WLConfig.DLC2Loaded = false
endFunction

function AddPerks()
	if !PlayerRef.HasPerk(_WL_CatchTorchbug)
		PlayerRef.AddPerk(_WL_CatchTorchbug)
	endif
endFunction

function RegisterForEventsOnLoad()
	(LanternQuestAlias as _WL_LanternOil_v3).RegisterForSingleUpdateGameTime(0.1)
	if _WL_SettingOffWhenSneaking.GetValueInt() == 2
		(LanternQuestAlias as _WL_LanternOil_v3).RegisterForSneakEvents()
	else
		(LanternQuestAlias as _WL_LanternOil_v3).UnregisterForSneakEvents()
	endif
	OilMeterHandler.RegisterForEvents()
	PollenMeterHandler.RegisterForEvents()
endFunction

Function RegisterForKeysOnLoad()
	WLConfig.RegisterForKeysOnLoad()
endFunction

bool function IsPluginLoaded(int iFormID, string sPluginName)
	int i = Game.GetModByName(sPluginName)
	if i != 255
		debug.trace("[Wearable Lanterns] Loaded: " + sPluginName)
		return true
	else
		return false
	endif
endFunction