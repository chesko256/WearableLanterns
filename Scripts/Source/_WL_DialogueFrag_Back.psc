;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _WL_DialogueFrag_Back Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Travel Lanterns
	while akSpeaker.GetItemCount(_WL_AllLanterns) > 0
		akSpeaker.RemoveItem(_WL_AllLanterns, 1, abSilent = true)
	endWhile
	if akSpeaker.IsEquipped(_WL_WearableLanternInvDisplay)
		akSpeaker.AddItem(_WL_WearableLanternApparel)
		akSpeaker.EquipItem(_WL_WearableLanternApparel, true, true)
	;Torchbug Lanterns
	elseif akSpeaker.IsEquipped(_WL_WearableTorchbugInvDisplay)
		akSpeaker.AddItem(_WL_WearableTorchbugApparel)
		akSpeaker.EquipItem(_WL_WearableTorchbugApparel, true, true)
	;Firefly Lanterns
	elseif akSpeaker.IsEquipped(_WL_WearableTorchbugInvDisplayRED)
		akSpeaker.AddItem(_WL_WearableTorchbugApparelRED)
		akSpeaker.EquipItem(_WL_WearableTorchbugApparelRED, true, true)
	;Paper Lanterns
	elseif akSpeaker.IsEquipped(_WL_WearablePaperInvDisplay)
		akSpeaker.AddItem(_WL_WearablePaperApparel)
		akSpeaker.EquipItem(_WL_WearablePaperApparel, true, true)
	endif
	if (CompatibilityAlias as _WL_Compatibility).GetSKSELoaded()
		Keyword _WL_NPCLanternPositionDatastore = Game.GetFormFromFile(0x01D9A9, "Chesko_WearableLantern.esp") as Keyword
		int form_id = akSpeaker.GetFormID()
		int mod_index = form_id/16777216
		if mod_index < 0
			mod_index = 0
		endif
		string dskey = (form_id % 16777216) + "___" + Game.GetModName(mod_index)
		StorageUtil.SetIntValue(_WL_NPCLanternPositionDatastore, dskey, 1) ; 0
	endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property _WL_WearableLanternApparel auto

Armor Property _WL_WearableTorchbugApparel auto

Armor property _WL_WearableTorchbugApparelRED auto

Armor property _WL_WearablePaperApparel auto

Formlist property _WL_AllLanterns auto
Armor property _WL_WearableLanternInvDisplay auto
Armor property _WL_WearableTorchbugInvDisplay auto
Armor property _WL_WearableTorchbugInvDisplayRED auto
Armor property _WL_WearablePaperInvDisplay auto
ReferenceAlias property CompatibilityAlias auto
