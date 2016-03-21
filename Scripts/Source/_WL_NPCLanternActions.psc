scriptname _WL_NPCLanternActions extends Quest

Keyword property _WL_NPCLanternPositionDatastore auto
formlist property _WL_AllLanterns auto

Armor property _WL_WearableLanternApparel auto
Armor property _WL_WearableTorchbugApparel auto
Armor property _WL_WearableTorchbugApparelRED auto
Armor property _WL_WearablePaperApparel auto

Armor property _WL_WearableLanternApparelFront auto
Armor property _WL_WearableTorchbugApparelFront auto
Armor property _WL_WearableTorchbugApparelFrontRED auto
Armor property _WL_WearablePaperApparelFront auto
	
Armor property _WL_WearableLanternInvDisplay auto
Armor property _WL_WearableTorchbugInvDisplay auto
Armor property _WL_WearableTorchbugInvDisplayRED auto
Armor property _WL_WearablePaperInvDisplay auto

Light property _WL_LanternHeld auto
Light property _WL_TorchbugHeld auto
Light property _WL_TorchbugHeldRED auto
Light property _WL_PaperHeld auto

function HandleLanternEquip(Actor akActor)
	int index = GetLanternIndex(akActor)
	EquipInventoryLantern(akActor, index)
	int position = GetLanternPositionForActor(akActor)
	debug.trace("Last position: " + position)
	if position == 0
		EquipBackLantern(akActor, index)
	elseif position == 1
		EquipFrontLantern(akActor, index)
	elseif position == 2
		EquipHeldLantern(akActor, index)
	endif
endFunction

function DestroyNonPlayableLanterns(Actor akActor)
	if akActor
		while akActor.GetItemCount(_WL_AllLanterns) > 0
			akActor.RemoveItem(_WL_AllLanterns, 1, abSilent = true)
		endWhile
	endif
endFunction

int function GetLanternIndex(Actor akActor)
	if akActor.IsEquipped(_WL_WearableLanternInvDisplay)
		debug.trace("returning index 0")
		return 0
	elseif akActor.IsEquipped(_WL_WearableTorchbugInvDisplay)
		debug.trace("returning index 1")
		return 1
	elseif akActor.IsEquipped(_WL_WearableTorchbugInvDisplayRED)
		debug.trace("returning index 2")
		return 2
	elseif akActor.IsEquipped(_WL_WearablePaperInvDisplay)
		debug.trace("returning index 3")
		return 3
	endif
endFunction

function EquipInventoryLantern(Actor akActor, int iIndex)
	if iIndex == 0 					;Travel
		akActor.EquipItem(_WL_WearableLanternInvDisplay, true, true)
	else
		akActor.UnequipItem(_WL_WearableLanternInvDisplay)
	endif
	if iIndex == 1 				;Torchbug
		akActor.EquipItem(_WL_WearableTorchbugInvDisplay, true, true)
	else
		akActor.UnequipItem(_WL_WearableTorchbugInvDisplay)
	endif
	if iIndex == 2 				;Torchbug (red)
		akActor.EquipItem(_WL_WearableTorchbugInvDisplayRED, true, true)
	else
		akActor.UnequipItem(_WL_WearableTorchbugInvDisplayRED)
	endif
	if iIndex == 3 				;Paper
		akActor.EquipItem(_WL_WearablePaperInvDisplay, true, true)
	else
		akActor.UnequipItem(_WL_WearablePaperInvDisplay)
	endif
endFunction

function EquipBackLantern(Actor akActor, int iIndex)
	if iIndex == 0 					;Travel
		akActor.EquipItem(_WL_WearableLanternApparel, true, true)
	elseif iIndex == 1 				;Torchbug
		akActor.EquipItem(_WL_WearableTorchbugApparel, true, true)
	elseif iIndex == 2 				;Torchbug (red)
		akActor.EquipItem(_WL_WearableTorchbugApparelRED, true, true)
	elseif iIndex == 3 				;Paper
		akActor.EquipItem(_WL_WearablePaperApparel, true, true)
	endif
endFunction

function EquipFrontLantern(Actor akActor, int iIndex)
	if iIndex == 0 					;Travel
		akActor.EquipItem(_WL_WearableLanternApparelFront, true, true)
	elseif iIndex == 1 				;Torchbug
		akActor.EquipItem(_WL_WearableTorchbugApparelFront, true, true)
	elseif iIndex == 2 				;Torchbug (red)
		akActor.EquipItem(_WL_WearableTorchbugApparelFrontRED, true, true)
	elseif iIndex == 3 				;Paper
		akActor.EquipItem(_WL_WearablePaperApparelFront, true, true)
	endif
endFunction

function EquipHeldLantern(Actor akActor, int iIndex)
	if iIndex == 0 					;Travel
		akActor.EquipItem(_WL_LanternHeld, true, true)
	elseif iIndex == 1 				;Torchbug
		akActor.EquipItem(_WL_TorchbugHeld, true, true)
	elseif iIndex == 2 				;Torchbug (red)
		akActor.EquipItem(_WL_TorchbugHeldRED, true, true)
	elseif iIndex == 3 				;Paper
		akActor.EquipItem(_WL_PaperHeld, true, true)
	endif
endFunction

Armor function GetCurrentInventoryLantern(Actor akActor)
	Armor this_lantern = None
	if akActor.IsEquipped(_WL_WearableLanternInvDisplay)
		this_lantern = _WL_WearableLanternInvDisplay
	elseif akActor.IsEquipped(_WL_WearableTorchbugInvDisplay)
		this_lantern = _WL_WearableTorchbugInvDisplay
	elseif akActor.IsEquipped(_WL_WearableTorchbugInvDisplayRED)
		this_lantern = _WL_WearableTorchbugInvDisplayRED
	elseif akActor.IsEquipped(_WL_WearablePaperInvDisplay)
		this_lantern = _WL_WearablePaperInvDisplay
	endif
	debug.trace("this_lantern: " + this_lantern)
	return this_lantern
endFunction

int function GetLanternPositionForActor(Actor akActor)
	debug.trace("Getting lantern position for actor " + akActor + "...")
	string dskey = GetDatastoreKeyFromForm(akActor)
	int pos = StorageUtil.GetIntValue(_WL_NPCLanternPositionDatastore, dskey, -1)
	if pos != -1
		return pos - 1
	else
		StorageUtil.SetIntValue(_WL_NPCLanternPositionDatastore, dskey, 2)
		return 1
	endif
endFunction

string function GetDatastoreKeyFromForm(Actor akActor)
	int form_id = akActor.GetFormID()
	int mod_index = form_id/16777216
	if mod_index < 0
		mod_index = 0
	endif

	return (form_id % 16777216) + "___" + Game.GetModName(mod_index)
endFunction