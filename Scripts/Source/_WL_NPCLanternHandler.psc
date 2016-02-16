scriptname _WL_NPCLanternHandler extends ObjectReference

Actor property PlayerRef auto
int property LanternIndex auto
formlist property _WL_AllLanterns auto

Armor property _WL_WearableLanternApparelFront auto
Armor property _WL_WearableTorchbugApparelFront auto
Armor property _WL_WearableTorchbugApparelFrontRED auto
Armor property _WL_WearablePaperApparelFront auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer != PlayerRef && akOldContainer == PlayerRef && akNewContainer != none
		HandleLanternEquip(akNewContainer as Actor, LanternIndex)
	endif
endEvent

Event OnUnequipped(Actor akActor)
	if akActor != PlayerRef
		DestroyNonPlayableLanterns(akActor)
	endif
endEvent

function HandleLanternEquip(Actor akActor, int iIndex)
	if iIndex == 0 					;Travel
		akActor.EquipItem(_WL_WearableLanternApparelFront, abSilent = true)
	elseif iIndex == 1 				;Torchbug
		akActor.EquipItem(_WL_WearableTorchbugApparelFront, abSilent = true)
	elseif iIndex == 2 				;Torchbug (red)
		akActor.EquipItem(_WL_WearableTorchbugApparelFrontRED, abSilent = true)
	elseif iIndex == 3 				;Paper
		akActor.EquipItem(_WL_WearablePaperApparelFront, abSilent = true)
	elseif iIndex == 4 				;Candle

	endif
endFunction

function DestroyNonPlayableLanterns(Actor akActor)
	while akActor.GetItemCount(_WL_AllLanterns) > 0
		akActor.RemoveItem(_WL_AllLanterns, 1, abSilent = true)
	endWhile
endFunction