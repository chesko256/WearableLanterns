scriptname _WL_LanternOil_v3 extends ReferenceAlias

; Main script. Controls all light functions for the player and assigning Reference Aliases for followers.

import debug
import utility

Actor property PlayerRef auto

form[] LanternFuelFormArray

_WL_Compatibility property Compatibility auto

FormList property _WL_InteriorWorldspaces auto

;Settings
GlobalVariable property _WL_SettingOil auto
GlobalVariable property _WL_SettingFeeding auto
GlobalVariable property _WL_SettingPosition auto
GlobalVariable property _WL_SettingAutomatic auto
GlobalVariable property _WL_SettingDropLit auto
GlobalVariable property _WL_Debug auto
GlobalVariable property GameHour auto

Formlist property _WL_AllLanterns auto
Formlist property _WL_GlowingBugList auto

MiscObject property _WL_NewLanternOil_0_5 auto
MiscObject property _WL_NewLanternOil_1 auto
MiscObject property _WL_NewLanternOil_1_5 auto
MiscObject property _WL_NewLanternOil_2 auto
MiscObject property _WL_NewLanternOil_2_5 auto
MiscObject property _WL_NewLanternOil_3 auto
MiscObject property _WL_NewLanternOil_3_5 auto
MiscObject property _WL_NewLanternOil_4 auto
MiscObject property _WL_NewLanternOil_4_5 auto
MiscObject property _WL_NewLanternOil_5 auto
MiscObject property _WL_NewLanternOil_5_5 auto
MiscObject property _WL_NewLanternOil_6 auto
MiscObject property _WL_NewLanternOil_6_5 auto
MiscObject property _WL_NewLanternOil_7 auto
MiscObject property _WL_NewLanternOil_7_5 auto
MiscObject property _WL_NewLanternOil_8 auto
MiscObject property _WL_NewLanternOil_8_5 auto
MiscObject property _WL_NewLanternOil_9 auto
MiscObject property _WL_NewLanternOil_9_5 auto
MiscObject property _WL_NewLanternOil_10 auto
MiscObject property _WL_NewLanternOil_10_5 auto
MiscObject property _WL_NewLanternOil_11 auto
MiscObject property _WL_NewLanternOil_11_5 auto
MiscObject property _WL_NewLanternOil_12 auto
MiscObject property _WL_NewLanternOil_12_5 auto
MiscObject property _WL_NewLanternOil_13 auto
MiscObject property _WL_NewLanternOil_13_5 auto
MiscObject property _WL_NewLanternOil_14 auto
MiscObject property _WL_NewLanternOil_14_5 auto
MiscObject property _WL_NewLanternOil_15 auto
MiscObject property _WL_NewLanternOil_15_5 auto
MiscObject property _WL_LanternOil4 auto
{Lantern Oil 16oz.}

MiscObject property _WL_Pollen auto

Light property Torch01 auto

FormList property _WL_InvBugLanterns auto

Armor property _WL_WearableLanternInvDisplay auto
Armor property _WL_WearableLanternApparel auto 							;Travel Lantern Worn - Back Right
Armor property _WL_WearableLanternApparelFront auto 					;Travel Lantern Worn - Front Right
Light property _WL_LanternHeld auto 									;Travel Lantern Carried - Left Hand
Light property _WL_LanternDroppedLit auto 								;Travel Lantern Lit World Object

Armor property _WL_WearableTorchbugApparel_EmptyInvDisplay auto
Armor property _WL_WearableTorchbugApparel_Empty auto 					;Empty Bug Lantern Worn - Back Right
Armor property _WL_WearableTorchbugApparelFront_Empty auto 				;Empty Bug Lantern Worn - Front Right
Light property _WL_TorchbugHeld_Empty auto 								;Empty Bug Lantern Carried - Left Hand

Armor property _WL_WearableTorchbugInvDisplay auto
Armor property _WL_WearableTorchbugApparel auto 						;Torchbug Lantern Worn - Back Right
Armor property _WL_WearableTorchbugApparelFront auto 					;Torchbug Lantern Worn - Front Right
Light property _WL_TorchbugHeld auto 									;Torchbug Lantern Carried - Left Hand
Light property _WL_TorchbugDroppedLit auto 								;Torchbug Lantern Lit World Object

Armor property _WL_WearableTorchbugInvDisplayRED auto
Armor property _WL_WearableTorchbugApparelRED auto 						;Firefly Lantern Worn - Back Right
Armor property _WL_WearableTorchbugApparelFrontRED auto 				;Firefly Lantern Worn - Front Right
Light property _WL_TorchbugHeldRED auto 								;Firefly Lantern Carried - Left Hand
Light property _WL_TorchbugREDDroppedLit auto 							;Firefly Lantern Lit World Object

Armor property _WL_WearablePaperInvDisplay auto
Armor property _WL_WearablePaperApparel auto 							;Paper Lantern Worn - Back Right
Armor property _WL_WearablePaperApparelFront auto 						;Paper Lantern Worn - Front Right
Light property _WL_PaperHeld auto 										;Paper Lantern Carried - Left Hand
Light property _WL_PaperHeldDroppedLit auto 							;Paper Lantern Lit World Object

activator property CritterFirefly auto

Ingredient property Lavender auto
Ingredient property MountainFlower01Blue auto
Ingredient property MountainFlower01Purple auto
Ingredient property MountainFlower01Red auto
Ingredient property Thistle01 auto

message property _WL_TorchbugDropRelease auto

message property _WL_TorchbugEmptyEquip auto
message property _WL_TorchbugCatch auto
message property _WL_FireflyCatch auto
message property _WL_TorchbugNoPollen auto
message property _WL_LanternOilDepleted auto
message property _WL_TorchbugRemainingFlowers auto
message property _WL_TorchbugFlowersUsed auto
message property _WL_LanternOilRemaining auto
message property _WL_LanternOilUsed auto

; enum
int property current_lantern = 0 auto hidden

int property LANTERN_NONE = 0 auto hidden
int property LANTERN_NORMAL = 1 auto hidden
int property LANTERN_TORCHBUG = 2 auto hidden
int property LANTERN_TORCHBUGEMPTY = 3 auto hidden


bool property pHasLantern = false auto hidden
bool property pHasTorchbug = false auto hidden
bool property pHasTorchbugEmpty = false auto hidden
GlobalVariable property _WL_OilLevel auto
GlobalVariable property _WL_PollenLevel auto
GlobalVariable property _WL_gToggle auto
GlobalVariable property _WL_HasFuel auto
GlobalVariable property _WL_AutoModeLightOn auto

int oil_update_counter = 0
float fLastOilLevel = 0.0
float last_oil_level = 0.0
int iPollenCounter = 0
int iLastPollenLevel = 0
int iLastPollenLevel2 = 0

int property pPollenLevel = 0 auto hidden

;Timer variables (for debug purposes)
float pfThreadLastUpdateTime = 0.0

Location myLoc
Keyword property LocTypeDwelling auto
Keyword property LocTypeInn auto
Keyword property LocTypeHouse auto
Keyword property LocTypeCastle auto
Keyword property LocTypeGuild auto
Keyword property LocTypePlayerHouse auto
Keyword property LocTypeStore auto

form fCandleLanternHeld
form fCandleLanternHeldDroppedLit

;--------------
;	States		\
;------------------------------------------------------------------------------------

State BlockEvents

	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	endEvent
	
endState

;--------------
;	Events		\
;------------------------------------------------------------------------------------
Event OnInit()
	RegisterForSingleUpdate(0.1)
endEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	myLoc = akNewLoc
endEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject == Torch01
		WLDebug(1, "OnObjectEquipped Event, Torch")
		LanternMutex(akBaseObject)
	elseif (akBaseObject as Armor).IsShield() || (akBaseObject as Weapon && PlayerRef.GetEquippedItemType(0) <= 4)	;I equipped a shield or off-hand weapon
		WLDebug(1, "OnObjectEquipped Event, Weapon or Shield")
		DropLantern()
		RegisterForSingleUpdate(0.1)
    elseif akBaseObject == _WL_WearableLanternInvDisplay
    	SetLantern(akBaseObject, 0, LANTERN_NORMAL, "Lantern")
	elseif akBaseObject == _WL_WearableTorchbugInvDisplay
		SetLantern(akBaseObject, 1, LANTERN_TORCHBUG, "Torchbug")
	elseif akBaseObject == _WL_WearableTorchbugInvDisplayRED
		SetLantern(akBaseObject, 2, LANTERN_TORCHBUG, "Torchbug")
	elseif akBaseObject == _WL_WearablePaperInvDisplay
		;Check Compatibility for Dragonborn loaded
		if Compatibility.bIsDLC2Loaded
			SetLantern(akBaseObject, 3, LANTERN_NORMAL, "Paper")
		else
			debug.notification("Dragonborn not installed.")
			while PlayerRef.GetItemCount(_WL_WearablePaperInvDisplay) > 0
				PlayerRef.Removeitem(_WL_WearablePaperInvDisplay)
			endwhile
		endif
	elseif akBaseObject == _WL_WearableTorchbugApparel_EmptyInvDisplay
		SetLantern(akBaseObject, 5, LANTERN_TORCHBUGEMPTY, "Empty Torchbug")
		_WL_TorchbugEmptyEquip.Show()
	elseif akBaseObject == fCandleLanternHeld
		WLDebug(1, "OnObjectEquipped Event, Candle Lantern")
		LanternMutex(akBaseObject)
	endif
endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject == _WL_WearableLanternInvDisplay || akBaseObject == _WL_WearablePaperInvDisplay
		;Stop the lantern and save oil (if applicable)
		WLDebug(1, "OnObjectUnequipped Event, Lantern/paper")
		DestroyNonDisplayLantern(akBaseObject)
        ; ReclaimOil()
	elseif akBaseObject == _WL_WearableTorchbugInvDisplay || akBaseObject == _WL_WearableTorchbugInvDisplayRED
		;Stop the torchbug light and save pollen (if applicable)
		WLDebug(1, "OnObjectUnequipped Event, Torchbug/red")
		DestroyNonDisplayLantern(akBaseObject)
		; ReclaimPollen(akBaseObject)
    endif
endEvent

function SetLantern(Form akBaseObject, int aiLanternIndex, int aiLanternState, string asTorchTypeDebug)
	WLDebug(1, "Setting lantern: " + asTorchTypeDebug)
	LanternMutex(akBaseObject)						;Prevent using more than one light source
	DestroyNonDisplayLantern(akBaseObject)
	EquipNonPlayableLantern(aiLanternIndex)			;Equip the "real" lantern
	;The player has a lantern
	_WL_gToggle.SetValueInt(1)
	current_lantern = aiLanternState
	RegisterForSingleUpdate(0.1)
endFunction

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	if _WL_InvBugLanterns.HasForm(akBaseItem) && akDestContainer == none && PlayerRef.IsSneaking()
		ReleaseTorchbugMenu(akBaseItem)
	endif
endEvent

Event OnUpdate()
	DisplayThreadTime()
	
	if current_lantern == LANTERN_NORMAL
		bool bLightTime
		if _WL_SettingAutomatic.GetValueInt() == 2
			bLightTime = CheckPlayerSituation()
			if bLightTime
				_WL_AutoModeLightOn.SetValueInt(1)
			else
				_WL_AutoModeLightOn.SetValueInt(2)
				RegisterForSingleUpdate(2)
				return
			endif
		else
			_WL_AutoModeLightOn.SetValueInt(0)
			;Has the player toggled the lantern off?
			if Compatibility.bIsSKYUILoaded && _WL_gToggle.GetValueInt() == 0
				RegisterForSingleUpdate(2)
				return
			else
				_WL_gToggle.SetValueInt(1)
			endif
		endif

		if _WL_SettingOil.GetValueInt() == 2
			float oil_level = _WL_OilLevel.GetValue()
			WLDebug(0, "last_oil_level = " + last_oil_level + ", oil_level = " + oil_level)

			if last_oil_level < oil_level
				_WL_LanternOilUsed.Show(oil_level) 
				_WL_HasFuel.SetValueInt(1)
				last_oil_level = oil_level
			elseif last_oil_level > oil_level
				if oil_level == 12.0 || oil_level == 8.0 || oil_level == 4.0
					_WL_LanternOilRemaining.Show(oil_level)
					_WL_HasFuel.SetValueInt(1)
				else
					_WL_HasFuel.SetValueInt(1)
				endif
				last_oil_level = oil_level
			elseif oil_level == 0					;Useful when last_oil_level and oil_level both equal 0
				_WL_HasFuel.SetValueInt(2)
			else									;Oil did not increase, decrease below a threshold, but is not zero; make sure it's running
				_WL_HasFuel.SetValueInt(1)
			endif
			
			if oil_update_counter >= 6             	  ;30 seconds have passed, reduce oil in player's lantern
				if oil_level >= 0.5
					oil_level -= 0.5
					_WL_OilLevel.SetValue(oil_level)
					oil_update_counter = 0
				endif
				WLDebug(1, "[Wearable Lantern] Oil Level: " + oil_level)
			else
				oil_update_counter += 1
			endif
			
			;Attempt to refill the player's lantern
			if oil_level == 0
				RefillLantern()
			endif
		else
			;Player is not using the oil-burning mechanic
			_WL_HasFuel.SetValueInt(0)
		endif
		
		;Ensure that torchbug lights aren't on
		iPollenCounter = 0
		pHasTorchbug = false
		pHasTorchbugEmpty = false

	elseif current_lantern == LANTERN_TORCHBUG

		bool bLightTime
		if _WL_SettingAutomatic.GetValueInt() == 2
			bLightTime = CheckPlayerSituation()
			if bLightTime
				_WL_AutoModeLightOn.SetValueInt(1)
			else
				_WL_AutoModeLightOn.SetValueInt(2)
				RegisterForSingleUpdate(2)
				return
			endif
		else
			_WL_AutoModeLightOn.SetValueInt(0)
			;Has the player toggled the lantern off?
			if Compatibility.bIsSKYUILoaded && _WL_gToggle.GetValueInt() == 0
				RegisterForSingleUpdate(2)
				return
			else
				_WL_gToggle.SetValueInt(1)
			endif
		endif
		
		;Is the player using the feeding mechanic?
		if _WL_SettingFeeding.GetValueInt() == 2
			if iLastPollenLevel2 < pPollenLevel
				_WL_TorchbugFlowersUsed.Show(pPollenLevel)
				_WL_HasFuel.SetValueInt(1)
				iLastPollenLevel2 = pPollenLevel			; Record the pollen level
			elseif (iLastPollenLevel2 > pPollenLevel && pPollenLevel == 24) || (iLastPollenLevel2 > pPollenLevel && pPollenLevel == 16) || (iLastPollenLevel2 > pPollenLevel && pPollenLevel == 8)
				_WL_TorchbugRemainingFlowers.Show(pPollenLevel)
				_WL_HasFuel.SetValueInt(1)
				iLastPollenLevel2 = pPollenLevel			; Record the pollen level
			elseif pPollenLevel == 0
				_WL_HasFuel.SetValueInt(2)					; Useful with both iLastPollenLevel2 and pPollenLevel both equal 0
			else											; Oil did not increase, decrease below a threshold, but is not zero; make sure it's running
				_WL_HasFuel.SetValueInt(1)
			endif
		
			if iPollenCounter >= 14
				if pPollenLevel >= 1
					pPollenLevel -= 1
					
					;Reset the counter
					iPollenCounter = 0
				endif
			else
				iPollenCounter += 2
			endif
			
			RefillTorchbug()
		
		else
								; The player is not using the feeding mechanic
			_WL_HasFuel.SetValueInt(0)	
		endif

		; Ensure that lantern lights aren't on
		oil_update_counter = 0
		pHasLantern = false
		pHasTorchbugEmpty = false
	
	elseif current_lantern == LANTERN_TORCHBUGEMPTY
		TryToCatchTorchbug()
	else						; Reset counters
		oil_update_counter = 0
		iPollenCounter = 0	
	endif
	
	WLDebug(0, "Current light level: " + PlayerRef.GetLightLevel())
	
	RegisterForSingleUpdate(5)
endEvent

function TryToCatchTorchbug()
	; Drives torchbug catching mechanics. Support for additional glowing bugs from 101BUGS.	
	ObjectReference oFoundTorchbug = Game.FindClosestReferenceOfAnyTypeInListFromRef(_WL_GlowingBugList, PlayerRef, 200.0)
	if oFoundTorchbug != none
		if oFoundTorchbug.GetBaseObject() == CritterFirefly
			;Torchbug
			PlayerRef.UnequipItem(_WL_WearableTorchbugApparel_EmptyInvDisplay, abSilent = true)
			PlayerRef.RemoveItem(_WL_WearableTorchbugApparel_EmptyInvDisplay, abSilent = true)
			PlayerRef.AddItem(_WL_WearableTorchbugInvDisplay, abSilent = true)
			PlayerRef.EquipItem(_WL_WearableTorchbugInvDisplay, abSilent = true)
			_WL_TorchbugCatch.Show()
			oFoundTorchbug.Delete()
		elseif Compatibility.bIsBUGSLoaded && oFoundTorchbug.GetBaseObject() == Compatibility.FireflyBUG
			;Firefly (101BUGS)
			PlayerRef.UnequipItem(_WL_WearableTorchbugApparel_EmptyInvDisplay, abSilent = true)
			PlayerRef.RemoveItem(_WL_WearableTorchbugApparel_EmptyInvDisplay, abSilent = true)
			PlayerRef.AddItem(_WL_WearableTorchbugInvDisplayRED, abSilent = true)
			PlayerRef.EquipItem(_WL_WearableTorchbugInvDisplayRED, abSilent = true)
			_WL_TorchbugCatch.Show()
			oFoundTorchbug.Delete()
		else
			;Default to torchbug
			PlayerRef.UnequipItem(_WL_WearableTorchbugApparel_EmptyInvDisplay, abSilent = true)
			PlayerRef.RemoveItem(_WL_WearableTorchbugApparel_EmptyInvDisplay, abSilent = true)
			PlayerRef.AddItem(_WL_WearableTorchbugInvDisplay, abSilent = true)
			PlayerRef.EquipItem(_WL_WearableTorchbugInvDisplay, abSilent = true)
			_WL_TorchbugCatch.Show()
			oFoundTorchbug.Delete()
		endif
	endif
endFunction

;-----------------------
;	Menu Functions		\
;------------------------------------------------------------------------------------
function ReleaseTorchbugMenu(Form akBaseObject)
	int ibutton = _WL_TorchbugDropRelease.Show()
	if ibutton == 0						;Release
		if akBaseObject == _WL_WearableTorchbugInvDisplay
			ObjectReference myEmptyLantern = FindAndDropEmptyBugLantern(_WL_WearableTorchbugInvDisplay)
			objectreference myTorchbug = myEmptyLantern.PlaceAtMe(CritterFirefly)
			myTorchbug.MoveTo(myEmptyLantern, 50.0, 0.0, 75.0)
		elseif akBaseObject == _WL_WearableTorchbugInvDisplayRED
			ObjectReference myEmptyLantern = FindAndDropEmptyBugLantern(_WL_WearableTorchbugInvDisplayRED)
			if Compatibility.FireflyBUG != none
				objectreference myTorchbug = myEmptyLantern.PlaceAtMe(Compatibility.FireflyBUG)
				myTorchbug.MoveTo(myEmptyLantern, 50.0, 0.0, 75.0)
			endif
		endif
	elseif ibutton == 1
		;do nothing
	endif
endFunction

ObjectReference function FindAndDropEmptyBugLantern(Form akBaseObject)
	objectreference myDroppedLantern = Game.FindClosestReferenceOfTypeFromRef(akBaseObject, PlayerRef, 350.0)
	if myDroppedLantern != none
		myDroppedLantern.Delete()
	endif
	objectreference myEmptyLantern = PlayerRef.PlaceAtMe(_WL_WearableTorchbugApparel_EmptyInvDisplay)
	myEmptyLantern.MoveTo(PlayerRef, 100.0, 0.0, 50.0)
	wait(0.2)
	myEmptyLantern.ApplyHavokImpulse(0.0, 0.0, -1.0, 1.0)		;Force to fall to the ground, like an item drop
	return myEmptyLantern
endFunction

;-------------------------------
;	Generic Light Functions		\
;------------------------------------------------------------------------------------
function EquipNonPlayableLantern(int iLanternIndex)
	int iPosition = _WL_SettingPosition.GetValueInt()
	if iLanternIndex == 0 					;Travel
		if iPosition == 0
			PlayerRef.EquipItem(_WL_WearableLanternApparel, abSilent = true)
		elseif iPosition == 1
			PlayerRef.EquipItem(_WL_WearableLanternApparelFront, abSilent = true)
		elseif iPosition == 2
			PlayerRef.EquipItem(_WL_LanternHeld, abSilent = true)
		endif
	elseif iLanternIndex == 1 				;Torchbug
		if iPosition == 0
			PlayerRef.EquipItem(_WL_WearableTorchbugApparel, abSilent = true)
		elseif iPosition == 1
			PlayerRef.EquipItem(_WL_WearableTorchbugApparelFront, abSilent = true)
		elseif iPosition == 2
			PlayerRef.EquipItem(_WL_TorchbugHeld, abSilent = true)
		endif
	elseif iLanternIndex == 2 				;Torchbug (red, abSilent = true)
		if iPosition == 0
			PlayerRef.EquipItem(_WL_WearableTorchbugApparelRED, abSilent = true)
		elseif iPosition == 1
			PlayerRef.EquipItem(_WL_WearableTorchbugApparelFrontRED, abSilent = true)
		elseif iPosition == 2
			PlayerRef.EquipItem(_WL_TorchbugHeldRED, abSilent = true)
		endif
	elseif iLanternIndex == 3 				;Paper
		if iPosition == 0
			PlayerRef.EquipItem(_WL_WearablePaperApparel, abSilent = true)
		elseif iPosition == 1
			PlayerRef.EquipItem(_WL_WearablePaperApparelFront, abSilent = true)
		elseif iPosition == 2
			PlayerRef.EquipItem(_WL_PaperHeld, abSilent = true)
		endif
	elseif iLanternIndex == 4 				;Candle
		; pass
	elseif iLanternIndex == 5 				;Empty Torchbug
		if iPosition == 0
			PlayerRef.EquipItem(_WL_WearableTorchbugApparel_Empty, abSilent = true)
		elseif iPosition == 1
			PlayerRef.EquipItem(_WL_WearableTorchbugApparelFront_Empty, abSilent = true)
		elseif iPosition == 2
			PlayerRef.EquipItem(_WL_TorchbugHeld_Empty, abSilent = true)
		endif
	endif
endFunction

;-----------------------
;	Misc Functions		\
;------------------------------------------------------------------------------------
function DisplayThreadTime()
	float fThreadTimeDelta = GetCurrentGameTime() - pfThreadLastUpdateTime			;(difference in game-time days)
	float fThreadTimeDeltaSec = (fThreadTimeDelta * 86400)/20						;(difference in real seconds, using 20:1 timescale)
	WLDebug(0, "Update interval " + fThreadTimeDeltaSec + "sec")
	pfThreadLastUpdateTime = GetCurrentGameTime()
endFunction

function ReclaimPollen(Form akBaseObject)
	if _WL_SettingFeeding.GetValueInt() == 2
		;Recover any pollen
		PlayerRef.AddItem(_WL_Pollen, pPollenLevel)
		
		pPollenLevel = 0
		
		;Reset counters
		iLastPollenLevel = 0
		iLastPollenLevel2 = 0
	endif	
	
	;Clear the current lantern
	pHasTorchbug = false
endFunction

function ReclaimOil()
	;/if _WL_SettingOil.GetValueInt() == 2
		;Save oil as necessary.
		int i = ((oil_level * 2) - 1) as int
		if i >= 0 && i < 32
			PlayerRef.AddItem(LanternFuelFormArray[i])
		endif
		
		;Remove oil from lantern
		oil_level = 0
		
		;Reset counters
		fLastOilLevel = 0
		last_oil_level = 0
	endif
	
	;Clear the current lantern
	pHasLantern = false
	/;
endFunction

function DropLantern()
	if _WL_SettingDropLit.GetValueInt() == 2 && !IsInMenuMode()
		int iPosition = _WL_SettingPosition.GetValueInt()
		if PlayerRef.IsEquipped(_WL_WearableLanternInvDisplay) && iPosition == 2
			if _WL_SettingOil.GetValueInt() == 2
				if _WL_Oillevel.GetValue() > 0.0 	;Player must have oil to drop lit lantern. Not strictly enforced but helps verisimilitude.
					PlayerRef.UnequipItem(_WL_WearableLanternInvDisplay, abSilent = true)
					PlayerRef.RemoveItem(_WL_WearableLanternInvDisplay, abSilent = true)
					PlayerRef.PlaceAtMe(_WL_LanternDroppedLit)
				else
					return
				endif
			else
				PlayerRef.UnequipItem(_WL_WearableLanternInvDisplay, abSilent = true)
				PlayerRef.RemoveItem(_WL_WearableLanternInvDisplay, abSilent = true)
				PlayerRef.PlaceAtMe(_WL_LanternDroppedLit)
			endif
		elseif PlayerRef.IsEquipped(_WL_WearableTorchbugInvDisplay) && iPosition == 2
			if _WL_SettingFeeding.GetValueInt() == 2
				if pPollenLevel > 0.0 	;Player must have oil to drop lit lantern. Not strictly enforced but helps verisimilitude.
					PlayerRef.UnequipItem(_WL_WearableTorchbugInvDisplay, abSilent = true)
					if PlayerRef.IsSneaking()
						GoToState("BlockEvents")
					endif
					PlayerRef.RemoveItem(_WL_WearableTorchbugInvDisplay, abSilent = true)
					PlayerRef.PlaceAtMe(_WL_TorchbugDroppedLit)
					GoToState("")
				else
					return
				endif
			else
				PlayerRef.UnequipItem(_WL_WearableTorchbugInvDisplay, abSilent = true)
				if PlayerRef.IsSneaking()
					GoToState("BlockEvents")
				endif
				PlayerRef.RemoveItem(_WL_WearableTorchbugInvDisplay, abSilent = true)
				PlayerRef.PlaceAtMe(_WL_TorchbugDroppedLit)
				GoToState("")
			endif
		elseif PlayerRef.IsEquipped(_WL_WearableTorchbugInvDisplayRED) && iPosition == 2
			if _WL_SettingFeeding.GetValueInt() == 2
				if pPollenLevel > 0.0 	;Player must have oil to drop lit lantern. Not strictly enforced but helps verisimilitude.
					PlayerRef.UnequipItem(_WL_WearableTorchbugInvDisplayRED, abSilent = true)
					if PlayerRef.IsSneaking()
						GoToState("BlockEvents")
					endif
					PlayerRef.RemoveItem(_WL_WearableTorchbugInvDisplayRED, abSilent = true)
					PlayerRef.PlaceAtMe(_WL_TorchbugREDDroppedLit)
					GoToState("")
				else
					return
				endif
			else
				PlayerRef.UnequipItem(_WL_WearableTorchbugInvDisplayRED, abSilent = true)
				If PlayerRef.IsSneaking()
					GoToState("BlockEvents")
				endif
				PlayerRef.RemoveItem(_WL_WearableTorchbugInvDisplayRED, abSilent = true)
				PlayerRef.PlaceAtMe(_WL_TorchbugREDDroppedLit)
				GoToState("")

			endif
		elseif PlayerRef.IsEquipped(_WL_WearablePaperInvDisplay) && iPosition == 2
			if _WL_SettingOil.GetValueInt() == 2
				if _WL_Oillevel.GetValue() > 0.0 	;Player must have oil to drop lit lantern. Not strictly enforced but helps verisimilitude.
					PlayerRef.UnequipItem(_WL_WearablePaperInvDisplay, abSilent = true)
					PlayerRef.RemoveItem(_WL_WearablePaperInvDisplay, abSilent = true)
					PlayerRef.PlaceAtMe(_WL_PaperHeldDroppedLit)
				else
					return
				endif
			else
				PlayerRef.UnequipItem(_WL_WearablePaperInvDisplay, abSilent = true)
				PlayerRef.RemoveItem(_WL_WearablePaperInvDisplay, abSilent = true)
				PlayerRef.PlaceAtMe(_WL_PaperHeldDroppedLit)
			endif
		endif
	endif
endFunction

function RefillTorchbug()
	int iPollenUsed = 0
	
	;How much pollen is needed?
	int iPollenNeeded = 32 - pPollenLevel
	
	if iPollenNeeded == 0
		return
	endif
	
	;How much pollen do I have?
	int iPollenTotal = PlayerRef.GetItemCount(_WL_Pollen)
	
	if iPollenTotal == 0
		;No more inventory pollen - check for flowers and convert
		bool bHasFlowers = true
		while iPollenNeeded > PlayerRef.GetItemCount(_WL_Pollen) && bHasFlowers
			;Convert flowers to pollen and loop - How many flowers do I have?
			if PlayerRef.GetItemCount(Thistle01) > 0
				PlayerRef.RemoveItem(Thistle01, 1, true)
				PlayerRef.AddItem(_WL_Pollen, 8, true)
			elseif PlayerRef.GetItemCount(Lavender) > 0
				PlayerRef.RemoveItem(Lavender, 1, true)
				PlayerRef.AddItem(_WL_Pollen, 8, true)
			elseif PlayerRef.GetItemCount(MountainFlower01Blue) > 0
				PlayerRef.RemoveItem(MountainFlower01Blue, 1, true)
				PlayerRef.AddItem(_WL_Pollen, 8, true)
			elseif PlayerRef.GetItemCount(MountainFlower01Purple) > 0
				PlayerRef.RemoveItem(MountainFlower01Purple, 1, true)
				PlayerRef.AddItem(_WL_Pollen, 8, true)
			elseif PlayerRef.GetItemCount(MountainFlower01Red) > 0
				PlayerRef.RemoveItem(MountainFlower01Red, 1, true)
				PlayerRef.AddItem(_WL_Pollen, 8, true)
			elseif Compatibility.bIsDLC1Loaded
				if PlayerRef.GetItemCount(Compatibility.MountainFlowerYellow) > 0
					PlayerRef.RemoveItem(Compatibility.MountainFlowerYellow, 1, true)
					PlayerRef.AddItem(_WL_Pollen, 8, true)
				else
					bHasFlowers = false
				endif
			else
				bHasFlowers = false
			endif
	
		endWhile
	
	endif
	
	iPollenTotal = PlayerRef.GetItemCount(_WL_Pollen)
	
	if iPollenTotal == 0
		if pPollenLevel != iLastPollenLevel
			if pPollenLevel > 0
				;show message
			else
				_WL_TorchbugNoPollen.Show()
			endif
		endif
		;Record the pollen level to control messages
		iLastPollenLevel = pPollenLevel
		return
	elseif iPollenTotal >= iPollenNeeded
		pPollenLevel = 32
		iPollenUsed = iPollenNeeded
	elseif iPollenTotal < iPollenNeeded
		pPollenLevel += iPollenTotal
		iPollenUsed = iPollenTotal
	endif
	
	PlayerRef.RemoveItem(_WL_Pollen, iPollenUsed, true)
endFunction

function RefillLantern()
	int bottle_count = PlayerRef.GetItemCount(_WL_LanternOil4)
	if bottle_count >= 0
		_WL_OilLevel.SetValue(16.0)
		PlayerRef.RemoveItem(_WL_LanternOil4, 1, true)
	endif

	;/float fOilUsed = 0

	;How much fuel is needed?
	float fOilNeeded = 16 - oil_level
	
	if fOilNeeded == 0
		WLDebug(3, "I am returning fOilNeeded == 0")
		return
	endif
	
	;Check fuel array
	WLDebug(3, "Check the fuel arrays")
	CheckFuelArrays()
	
	;How much fuel do I have?	
	int i = 0
	float fOilTotal
	while i < 32
		fOilTotal += (PlayerRef.GetItemCount(LanternFuelFormArray[i]) * ((i + 1.0) / 2.0))
		i += 1
		WLDebug(3, "fOilTotal is now " + fOilTotal)
	endwhile
	
	if fOilTotal == 0
		if fLastOilLevel != oil_level
			if oil_level > 0
				;notification("Your lantern has " + oil_level + " ounces of lantern oil remaining.")
			else
				;notification("Your lantern has run out of oil.")
				_WL_LanternOilDepleted.Show()
			endif
		endif
		;Record the oil level to control messages
		fLastOilLevel = oil_level
		return
	elseif fOilTotal >= fOilNeeded
		WLDebug(3, "fOilTotal >= fOilNeeded")
		WLDebug(3, fOilTotal + " " + fOilNeeded)
		oil_level = 16
		fOilUsed = fOilNeeded
	else
		WLDebug(3, "fOilTotal < fOilNeeded")
		oil_level += fOilTotal
		fOilUsed = fOilTotal
	endif 
	
	;notification("You use " + fOilUsed + " ounces of lantern oil.")
	if fOilUsed > 0.5
		_WL_LanternOilUsed.Show(fOilUsed)
	endif
	
	;Reset the oil timer
	oil_update_counter = 0
	
	;Subtract the right bottles from the player's inventory, starting with the smallest
	
	float fOilToSubtract = fOilUsed
	
	int j = 0
	While j < 32
		While fOilToSubtract > 0 && PlayerRef.GetItemCount(LanternFuelFormArray[j]) > 0
			PlayerRef.RemoveItem(LanternFuelFormArray[j], 1, true)		
			if fOilToSubtract >= ((j + 1.0) / 2.0)
				fOilToSubtract -= ((j + 1.0) / 2.0)
				WLDebug(3, "fOilToSubtract = " + fOilToSubtract)
			else
				WLDebug(3, "j = " + j)
				float fRemainder = ((j + 1.0) / 2.0) - fOilToSubtract
				WLDebug(3, "fRemainder = " + fRemainder)
				WLDebug(3, "fOilToSubtract = " + fOilToSubtract)
				int k = ((fRemainder * 2) - 1) as int
				WLDebug(3, "k index = " + k)
				if k >= 0 && k < 32
					PlayerRef.AddItem(LanternFuelFormArray[k], 1, true)
					fOilToSubtract = 0
				else
					;Something went wrong, bail out
					fOilToSubtract = 0
				endif
			endif
		endWhile
		j += 1
	endWhile
	/;
endFunction    

function CheckFuelArrays()
	if !(LanternFuelFormArray)
		InitializeLanternFuelFormArray()
		;notification("array none")
		LanternFuelFormArray[0] = _WL_NewLanternOil_0_5
		LanternFuelFormArray[1] = _WL_NewLanternOil_1
		LanternFuelFormArray[2] = _WL_NewLanternOil_1_5
		LanternFuelFormArray[3] = _WL_NewLanternOil_2
		LanternFuelFormArray[4] = _WL_NewLanternOil_2_5
		LanternFuelFormArray[5] = _WL_NewLanternOil_3
		LanternFuelFormArray[6] = _WL_NewLanternOil_3_5
		LanternFuelFormArray[7] = _WL_NewLanternOil_4
		LanternFuelFormArray[8] = _WL_NewLanternOil_4_5
		LanternFuelFormArray[9] = _WL_NewLanternOil_5
		LanternFuelFormArray[10] = _WL_NewLanternOil_5_5
		LanternFuelFormArray[11] = _WL_NewLanternOil_6
		LanternFuelFormArray[12] = _WL_NewLanternOil_6_5
		LanternFuelFormArray[13] = _WL_NewLanternOil_7
		LanternFuelFormArray[14] = _WL_NewLanternOil_7_5
		LanternFuelFormArray[15] = _WL_NewLanternOil_8
		LanternFuelFormArray[16] = _WL_NewLanternOil_8_5
		LanternFuelFormArray[17] = _WL_NewLanternOil_9
		LanternFuelFormArray[18] = _WL_NewLanternOil_9_5
		LanternFuelFormArray[19] = _WL_NewLanternOil_10
		LanternFuelFormArray[20] = _WL_NewLanternOil_10_5
		LanternFuelFormArray[21] = _WL_NewLanternOil_11
		LanternFuelFormArray[22] = _WL_NewLanternOil_11_5
		LanternFuelFormArray[23] = _WL_NewLanternOil_12
		LanternFuelFormArray[24] = _WL_NewLanternOil_12_5
		LanternFuelFormArray[25] = _WL_NewLanternOil_13
		LanternFuelFormArray[26] = _WL_NewLanternOil_13_5
		LanternFuelFormArray[27] = _WL_NewLanternOil_14
		LanternFuelFormArray[28] = _WL_NewLanternOil_14_5
		LanternFuelFormArray[29] = _WL_NewLanternOil_15
		LanternFuelFormArray[30] = _WL_NewLanternOil_15_5
		LanternFuelFormArray[31] = _WL_LanternOil4
	endif
endFunction		

function InitializeLanternFuelFormArray()
	LanternFuelFormArray = new form[32]
endFunction	

function LanternMutex(Form akBaseObject)
	;Ensure that the player can only equip one lantern at a time.
	if akBaseObject != Torch01
		PlayerRef.UnequipItem(Torch01, false, true)
	endif
	
	;Travel Lanterns
	PlayerRef.UnequipItem(_WL_WearableLanternApparel, false, true)
	PlayerRef.UnequipItem(_WL_WearableLanternApparelFront, false, true)
	PlayerRef.UnequipItem(_WL_LanternHeld, false, true)
	PlayerRef.UnequipItem(_WL_WearableTorchbugApparel_Empty, false, true)
	PlayerRef.UnequipItem(_WL_WearableTorchbugApparelFront_Empty, false, true)
	PlayerRef.UnequipItem(_WL_TorchbugHeld_Empty, false, true)
	PlayerRef.UnequipItem(_WL_WearableTorchbugApparel, false, true)
	PlayerRef.UnequipItem(_WL_WearableTorchbugApparelFront, false, true)
	PlayerRef.UnequipItem(_WL_TorchbugHeld, false, true)
	PlayerRef.UnequipItem(_WL_WearableTorchbugApparelRED, false, true)
	PlayerRef.UnequipItem(_WL_WearableTorchbugApparelFrontRED, false, true)
	PlayerRef.UnequipItem(_WL_TorchbugHeldRED, false, true)
	PlayerRef.UnequipItem(_WL_WearablePaperApparel, false, true)
	PlayerRef.UnequipItem(_WL_WearablePaperApparelFront, false, true)
	PlayerRef.UnequipItem(_WL_PaperHeld, false, true)

	if akBaseObject != _WL_WearableLanternInvDisplay
		PlayerRef.UnequipItem(_WL_WearableLanternInvDisplay, false, true)
	endif
	if akBaseObject != _WL_WearablePaperInvDisplay
		PlayerRef.UnequipItem(_WL_WearablePaperInvDisplay, false, true)
	endif
	if akBaseObject != _WL_WearableTorchbugInvDisplay
		PlayerRef.UnequipItem(_WL_WearableTorchbugInvDisplay, false, true)
	endif
	if akBaseObject != _WL_WearableTorchbugInvDisplayRED
		PlayerRef.UnequipItem(_WL_WearableTorchbugInvDisplayRED, false, true)
	endif
	if akBaseObject != _WL_WearableTorchbugApparel_EmptyInvDisplay
		PlayerRef.UnequipItem(_WL_WearableTorchbugApparel_EmptyInvDisplay, false, true)
	endif

	;Candle Lanterns of the North compatibility
	;/if bIsCLNLoaded
		if !(akBaseObject == fCandleLanternHeld)
			if PlayerRef.IsEquipped(fCandleLanternHeld)
				PlayerRef.UnequipItem(fCandleLanternHeld)
			endif
		endif
	endif/;
endFunction

function DestroyNonDisplayLantern(Form akBaseObject)
	while PlayerRef.GetItemCount(_WL_AllLanterns) > 0
		PlayerRef.RemoveItem(_WL_AllLanterns, 1, abSilent = true)
	endWhile
endFunction

bool function CheckPlayerSituation()
	if PlayerRef.IsSneaking()															;Player is sneaking; Turn off
		return false
	else
		;bool bInExteriorActingLikeInterior = CheckWorldspace()
		if PlayerRef.IsInInterior(); || bInExteriorActingLikeInterior == true											;Inside?
			if myLoc.HasKeyword(LocTypeCastle) || myLoc.HasKeyword(LocTypeGuild) || myLoc.HasKeyword(LocTypeInn) || myLoc.HasKeyword(LocTypeHouse) || myLoc.HasKeyword(LocTypePlayerHouse) || myLoc.HasKeyword(LocTypeStore)		;Is it a restricted location?
				WLDebug(0, "Inside, in house, try to stop...")								;Yes, stop
				return false
			else																						;No, start
				WLDebug(0, "Inside, not in house, try to start")
				return true
			endif
		else																							;Outside
			WLDebug(0, "Outside...")
			if GameHour.GetValue() >= 19.0 || GameHour.GetValue() <= 7.0								;Is it between 7PM and 7AM?
				WLDebug(0, "Nighttime, try to start")
				return true
			else
				WLDebug(0, "Daytime, try to stop")
				return false
			endif
		endif
	endif
endFunction

bool function CheckWorldspace()
	;Check whether or not the player is in a worldspace that has cells that are technically exteriors, but behave like interiors
	Worldspace myWorldSpace = PlayerRef.GetWorldSpace()
	if _WL_InteriorWorldspaces.HasForm(myWorldspace)
		return true
	else
		return false
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
