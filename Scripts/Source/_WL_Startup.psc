Scriptname _WL_Startup extends Quest  

Quest property _WL_LanternQuest2 auto
Quest property _WL_CompatibilityQuest auto
_WL_Compatibility property Compatibility auto
ReferenceAlias property _WL_Player auto
ReferenceAlias property _WL_PlayerCompatibility auto

Event OnInit()
	if !(_WL_LanternQuest2.IsRunning())
		_WL_LanternQuest2.Start()
	endif

	_WL_Player.ForceRefIfEmpty(Game.GetPlayer())

	if !(_WL_CompatibilityQuest.IsRunning())
		_WL_CompatibilityQuest.Start()
	endif

	_WL_PlayerCompatibility.ForceRefIfEmpty(Game.GetPlayer())

	Compatibility.OnPlayerLoadGame()
endEvent