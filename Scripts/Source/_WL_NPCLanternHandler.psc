scriptname _WL_NPCLanternHandler extends ObjectReference

Quest property LanternQuest auto
Actor property PlayerRef auto
int property LanternIndex auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer != PlayerRef && akNewContainer != none && (akNewContainer as Actor) != none
		(LanternQuest as _WL_NPCLanternActions).EquipInventoryLantern(akNewContainer as Actor, LanternIndex)
	endif
endEvent
