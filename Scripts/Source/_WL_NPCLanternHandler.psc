scriptname _WL_NPCLanternHandler extends ObjectReference

Actor property PlayerRef auto
int property LanternIndex auto
formlist property _WL_AllLanterns auto

Armor property _WL_WearableLanternApparelFront auto
Armor property _WL_WearableTorchbugApparelFront auto
Armor property _WL_WearableTorchbugApparelFrontRED auto
Armor property _WL_WearablePaperApparelFront auto

Armor property _WL_WearableLanternInvDisplay auto
Armor property _WL_WearableTorchbugInvDisplay auto
Armor property _WL_WearableTorchbugInvDisplayRED auto
Armor property _WL_WearablePaperInvDisplay auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer != PlayerRef && akOldContainer == PlayerRef && akNewContainer != none && (akNewContainer as Actor) != none
		HandleLanternEquip(akNewContainer as Actor, LanternIndex)
	endif
endEvent

Event OnUnequipped(Actor akActor)
	if akActor != PlayerRef
		DestroyNonPlayableLanterns(akActor)
	endif
endEvent

function HandleLanternEquip(Actor akActor, int iIndex)
	akActor.UnequipItem(_WL_WearableLanternInvDisplay)
	akActor.UnequipItem(_WL_WearableTorchbugInvDisplay)
	akActor.UnequipItem(_WL_WearableTorchbugInvDisplayRED)
	akActor.UnequipItem(_WL_WearablePaperInvDisplay)
	if iIndex == 0 					;Travel
		akActor.EquipItem(_WL_WearableLanternInvDisplay, true, true)
		akActor.EquipItem(_WL_WearableLanternApparelFront, true, true)
	elseif iIndex == 1 				;Torchbug
		akActor.EquipItem(_WL_WearableTorchbugInvDisplay, true, true)
		akActor.EquipItem(_WL_WearableTorchbugApparelFront, true, true)
	elseif iIndex == 2 				;Torchbug (red)
		akActor.EquipItem(_WL_WearableTorchbugInvDisplayRED, true, true)
		akActor.EquipItem(_WL_WearableTorchbugApparelFrontRED, true, true)
	elseif iIndex == 3 				;Paper
		akActor.EquipItem(_WL_WearablePaperInvDisplay, true, true)
		akActor.EquipItem(_WL_WearablePaperApparelFront, true, true)
	endif
endFunction

function DestroyNonPlayableLanterns(Actor akActor)
	while akActor.GetItemCount(_WL_AllLanterns) > 0
		akActor.RemoveItem(_WL_AllLanterns, 1, abSilent = true)
	endWhile
endFunction