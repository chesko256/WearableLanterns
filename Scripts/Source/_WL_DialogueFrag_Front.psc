;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname _WL_DialogueFrag_Front Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Travel Lanterns
	while akSpeaker.GetItemCount(_WL_AllLanterns) > 0
		akSpeaker.RemoveItem(_WL_AllLanterns, 1, abSilent = true)
	endWhile
	if akSpeaker.IsEquipped(_WL_WearableLanternInvDisplay)
		akSpeaker.AddItem(_WL_WearableLanternApparelFront)
		akSpeaker.EquipItem(_WL_WearableLanternApparelFront)
	;Torchbug Lanterns
	elseif akSpeaker.IsEquipped(_WL_WearableTorchbugInvDisplay)
		akSpeaker.AddItem(_WL_WearableTorchbugApparelFront)
		akSpeaker.EquipItem(_WL_WearableTorchbugApparelFront)
	;Firefly Lanterns
	elseif akSpeaker.IsEquipped(_WL_WearableTorchbugInvDisplayRED)
		akSpeaker.AddItem(_WL_WearableTorchbugApparelFrontRED)
		akSpeaker.EquipItem(_WL_WearableTorchbugApparelFrontRED)
	;Paper Lanterns
	elseif akSpeaker.IsEquipped(_WL_WearablePaperInvDisplay)
		akSpeaker.AddItem(_WL_WearablePaperApparelFront)
		akSpeaker.EquipItem(_WL_WearablePaperApparelFront)
	endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property _WL_WearableLanternApparelFront auto

Armor Property _WL_WearableTorchbugApparelFront auto

Armor Property _WL_WearableTorchbugApparelFrontRED auto

Armor property _WL_WearablePaperApparelFront auto

Formlist property _WL_AllLanterns auto
Armor property _WL_WearableLanternInvDisplay auto
Armor property _WL_WearableTorchbugInvDisplay auto
Armor property _WL_WearableTorchbugInvDisplayRED auto
Armor property _WL_WearablePaperInvDisplay auto
