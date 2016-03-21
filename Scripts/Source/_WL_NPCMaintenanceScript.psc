scriptname _WL_NPCMaintenanceScript extends ActiveMagicEffect

import debug
Quest property LanternQuest auto
Actor this_actor = None

State BlockEvents
	Event OnEffectStart(Actor akTarget, Actor akCaster)
	EndEvent
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
	EndEvent
EndState

Event OnEffectStart(Actor akTarget, Actor akCaster)
	trace("[Wearable Lanterns] _WL_NPCMaintenanceScript " + self + " OnEffectStart")
	this_actor = akCaster
	(LanternQuest as _WL_NPCLanternActions).HandleLanternEquip(this_actor)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	(LanternQuest as _WL_NPCLanternActions).DestroyNonPlayableLanterns(this_actor)
	trace("[Wearable Lanterns] _WL_NPCMaintenanceScript " + self + " OnEffectFinish, finishing...")
	trace("[Wearable Lanterns] this_actor: " + this_actor)
	if this_actor
		Armor this_lantern = (LanternQuest as _WL_NPCLanternActions).GetCurrentInventoryLantern(this_actor)
		ToggleNPCInventoryLantern(this_lantern)
	endif
EndEvent

function ToggleNPCInventoryLantern(Armor akLantern)
	if akLantern
		GoToState("BlockEvents")
		trace("[Wearable Lanterns] _WL_NPCMaintenanceScript unequipping lantern...")
		this_actor.RemoveItem(akLantern, 1)
		GoToState("")
		Utility.WaitMenuMode(1)
		trace("[Wearable Lanterns] _WL_NPCMaintenanceScript equipping lantern...")
		this_actor.AddItem(akLantern, 1)
	endif
	trace("[Wearable Lanterns] _WL_NPCMaintenanceScript lantern toggled, bye!")
endFunction
