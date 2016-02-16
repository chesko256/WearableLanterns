;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _WL_DialogueFrag_Held Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Travel Lanterns
	while akSpeaker.GetItemCount(_WL_AllLanterns) > 0
		akSpeaker.RemoveItem(_WL_AllLanterns, 1, abSilent = true)
	endWhile
	if akSpeaker.IsEquipped(_WL_WearableLanternInvDisplay)
		akSpeaker.AddItem(_WL_LanternHeld)
		akSpeaker.EquipItem(_WL_LanternHeld)
	;Torchbug Lanterns
	elseif akSpeaker.IsEquipped(_WL_WearableTorchbugInvDisplay)
		akSpeaker.AddItem(_WL_TorchbugHeld)
		akSpeaker.EquipItem(_WL_TorchbugHeld)
	;Firefly Lanterns
	elseif akSpeaker.IsEquipped(_WL_WearableTorchbugInvDisplayRED)
		akSpeaker.AddItem(_WL_TorchbugHeldRED)
		akSpeaker.EquipItem(_WL_TorchbugHeldRED)
	;Paper Lanterns
	elseif akSpeaker.IsEquipped(_WL_WearablePaperInvDisplay)
		akSpeaker.AddItem(_WL_PaperHeld)
		akSpeaker.EquipItem(_WL_PaperHeld)
	endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Light Property _WL_LanternHeld  Auto  

Light Property _WL_TorchbugHeld  Auto  

Light Property _WL_TorchbugHeldRED auto

Light Property _WL_PaperHeld auto

Formlist property _WL_AllLanterns auto
Armor property _WL_WearableLanternInvDisplay auto
Armor property _WL_WearableTorchbugInvDisplay auto
Armor property _WL_WearableTorchbugInvDisplayRED auto
Armor property _WL_WearablePaperInvDisplay auto
