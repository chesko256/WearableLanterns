scriptname _WL_VendorStock extends Quest

Armor property _WL_WearableLanternInvDisplay auto
Armor property _WL_WearableTorchbugApparel_EmptyInvDisplay auto

;===Hotfix 3.0b: Auxiliary properties with new names to fix vendor inventory bug
Armor property TravelLanternItem auto
Armor property TorchbugLanternItem auto

Book property _WL_Manual auto
MiscObject property _WL_LanternOil4 auto

ReferenceAlias property RiverwoodTraderChestAlias auto
ReferenceAlias property CaravanAChestAlias auto
ReferenceAlias property CaravanBChestAlias auto
ReferenceAlias property CaravanCChestAlias auto
ReferenceAlias property AvalAtheronChestAlias auto
ReferenceAlias property BethethorsChestAlias auto
ReferenceAlias property BirnaChestAlias auto
ReferenceAlias property BrandChestAlias auto
ReferenceAlias property PawnedPrawnChestAlias auto
ReferenceAlias property WhiterunFraliaChestAlias auto
ReferenceAlias property SolitudeBitsAndPiecesChestAlias auto
ReferenceAlias property ArnleifChestAlias auto
ReferenceAlias property GrayPineGoodsChestAlias auto
ReferenceAlias property NiranyeChestAlias auto

ObjectReference property RiverwoodTraderMerchantContainer auto
ObjectReference property CaravanAChestREF auto
ObjectReference property CaravanBChestREF auto
ObjectReference property CaravanCChestREF auto
ObjectReference property AvalAtheronChest auto
ObjectReference property BethethorsMerchantChestRef auto
ObjectReference property BirnaChest auto
ObjectReference property BrandChest auto
ObjectReference property PawnedPrawnChest auto
ObjectReference property WhiterunFraliaChest auto
ObjectReference property MerchantSolitudeBitsAndPiecesChestRef auto
ObjectReference property ArnleifChest auto
ObjectReference property GrayPineGoodsChest auto
ObjectReference property NiranyeChest auto

Event OnInit()
	
	;Stock lantern items
	FillAllAliases()
	utility.wait(3.0)
	ClearAllAliases()
	RemoveAllModItems()
	FillAllAliases()
	
	RegisterForSingleUpdateGameTime(24)
	
endEvent

Event OnUpdateGameTime()

	;Clear the alias
	ClearAllAliases()
	
	;Remove any items found in any of the chests listed
	RemoveAllModItems()
	
	;Re-fill the alias
	FillAllAliases()
	
	RegisterForSingleUpdateGameTime(24)
	
endEvent

Function ClearAllAliases()

	;Clear all merchant chest aliases
	RiverwoodTraderChestAlias.Clear()
	CaravanAChestAlias.Clear()
	CaravanBChestAlias.Clear()
	CaravanCChestAlias.Clear()
	AvalAtheronChestAlias.Clear()
	BethethorsChestAlias.Clear()
	BirnaChestAlias.Clear()
	BrandChestAlias.Clear()
	PawnedPrawnChestAlias.Clear()
	WhiterunFraliaChestAlias.Clear()
	SolitudeBitsAndPiecesChestAlias.Clear()
	ArnleifChestAlias.Clear()
	GrayPineGoodsChestAlias.Clear()
	NiranyeChestAlias.Clear()
	
endFunction

Function FillAllAliases()

	;Fill aliases to apply their inventories
	RiverwoodTraderChestAlias.ForceRefIfEmpty(RiverwoodTraderMerchantContainer)
	CaravanAChestAlias.ForceRefIfEmpty(CaravanAChestREF)
	CaravanBChestAlias.ForceRefIfEmpty(CaravanBChestREF)
	CaravanCChestAlias.ForceRefIfEmpty(CaravanCChestREF)
	AvalAtheronChestAlias.ForceRefIfEmpty(AvalAtheronChest)
	BethethorsChestAlias.ForceRefIfEmpty(BethethorsMerchantChestRef)
	BirnaChestAlias.ForceRefIfEmpty(BirnaChest)
	BrandChestAlias.ForceRefIfEmpty(BrandChest)
	PawnedPrawnChestAlias.ForceRefIfEmpty(PawnedPrawnChest)
	WhiterunFraliaChestAlias.ForceRefIfEmpty(WhiterunFraliaChest)
	SolitudeBitsAndPiecesChestAlias.ForceRefIfEmpty(MerchantSolitudeBitsAndPiecesChestRef)
	ArnleifChestAlias.ForceRefIfEmpty(ArnleifChest)
	GrayPineGoodsChestAlias.ForceRefIfEmpty(GrayPineGoodsChest)
	NiranyeChestAlias.ForceRefIfEmpty(NiranyeChest)

endFunction

function RemoveAllModItems()

	if RiverwoodTraderMerchantContainer.GetItemCount(TravelLanternItem) > 0
		RiverwoodTraderMerchantContainer.RemoveItem(TravelLanternItem, RiverwoodTraderMerchantContainer.GetItemCount(TravelLanternItem))
	endif
	if RiverwoodTraderMerchantContainer.GetItemCount(_WL_Manual) > 0
		RiverwoodTraderMerchantContainer.RemoveItem(_WL_Manual, RiverwoodTraderMerchantContainer.GetItemCount(_WL_Manual))
	endif
	if RiverwoodTraderMerchantContainer.GetItemCount(_WL_LanternOil4) > 0
		RiverwoodTraderMerchantContainer.RemoveItem(_WL_LanternOil4, RiverwoodTraderMerchantContainer.GetItemCount(_WL_LanternOil4))
	endif
	if RiverwoodTraderMerchantContainer.GetItemCount(TorchbugLanternItem) > 0
		RiverwoodTraderMerchantContainer.RemoveItem(TorchbugLanternItem, RiverwoodTraderMerchantContainer.GetItemCount(TorchbugLanternItem))
	endif
	
	if CaravanAChestREF.GetItemCount(TravelLanternItem) > 0
		CaravanAChestREF.RemoveItem(TravelLanternItem, CaravanAChestREF.GetItemCount(TravelLanternItem))
	endif
	if CaravanAChestREF.GetItemCount(_WL_Manual) > 0
		CaravanAChestREF.RemoveItem(_WL_Manual, CaravanAChestREF.GetItemCount(_WL_Manual))
	endif
	if CaravanAChestREF.GetItemCount(_WL_LanternOil4) > 0
		CaravanAChestREF.RemoveItem(_WL_LanternOil4, CaravanAChestREF.GetItemCount(_WL_LanternOil4))
	endif
	if CaravanAChestREF.GetItemCount(TorchbugLanternItem) > 0
		CaravanAChestREF.RemoveItem(TorchbugLanternItem, CaravanAChestREF.GetItemCount(TorchbugLanternItem))
	endif
	
	if CaravanBChestREF.GetItemCount(TravelLanternItem) > 0
		CaravanBChestREF.RemoveItem(TravelLanternItem, CaravanBChestREF.GetItemCount(TravelLanternItem))
	endif
	if CaravanBChestREF.GetItemCount(_WL_Manual) > 0
		CaravanBChestREF.RemoveItem(_WL_Manual, CaravanBChestREF.GetItemCount(_WL_Manual))
	endif
	if CaravanBChestREF.GetItemCount(_WL_LanternOil4) > 0
		CaravanBChestREF.RemoveItem(_WL_LanternOil4, CaravanBChestREF.GetItemCount(_WL_LanternOil4))
	endif
	if CaravanBChestREF.GetItemCount(TorchbugLanternItem) > 0
		CaravanBChestREF.RemoveItem(TorchbugLanternItem, CaravanBChestREF.GetItemCount(TorchbugLanternItem))
	endif
	
	if CaravanCChestREF.GetItemCount(TravelLanternItem) > 0
		CaravanCChestREF.RemoveItem(TravelLanternItem, CaravanCChestREF.GetItemCount(TravelLanternItem))
	endif
	if CaravanCChestREF.GetItemCount(_WL_Manual) > 0
		CaravanCChestREF.RemoveItem(_WL_Manual, CaravanCChestREF.GetItemCount(_WL_Manual))
	endif
	if CaravanCChestREF.GetItemCount(_WL_LanternOil4) > 0
		CaravanCChestREF.RemoveItem(_WL_LanternOil4, CaravanCChestREF.GetItemCount(_WL_LanternOil4))
	endif
	if CaravanCChestREF.GetItemCount(TorchbugLanternItem) > 0
		CaravanCChestREF.RemoveItem(TorchbugLanternItem, CaravanCChestREF.GetItemCount(TorchbugLanternItem))
	endif

	if AvalAtheronChest.GetItemCount(TravelLanternItem) > 0
		AvalAtheronChest.RemoveItem(TravelLanternItem, AvalAtheronChest.GetItemCount(TravelLanternItem))
	endif
	if AvalAtheronChest.GetItemCount(_WL_Manual) > 0
		AvalAtheronChest.RemoveItem(_WL_Manual, AvalAtheronChest.GetItemCount(_WL_Manual))
	endif
	if AvalAtheronChest.GetItemCount(_WL_LanternOil4) > 0
		AvalAtheronChest.RemoveItem(_WL_LanternOil4, AvalAtheronChest.GetItemCount(_WL_LanternOil4))
	endif
	if AvalAtheronChest.GetItemCount(TorchbugLanternItem) > 0
		AvalAtheronChest.RemoveItem(TorchbugLanternItem, AvalAtheronChest.GetItemCount(TorchbugLanternItem))
	endif
	
	if BethethorsMerchantChestRef.GetItemCount(TravelLanternItem) > 0
		BethethorsMerchantChestRef.RemoveItem(TravelLanternItem, BethethorsMerchantChestRef.GetItemCount(TravelLanternItem))
	endif
	if BethethorsMerchantChestRef.GetItemCount(_WL_Manual) > 0
		BethethorsMerchantChestRef.RemoveItem(_WL_Manual, BethethorsMerchantChestRef.GetItemCount(_WL_Manual))
	endif
	if BethethorsMerchantChestRef.GetItemCount(_WL_LanternOil4) > 0
		BethethorsMerchantChestRef.RemoveItem(_WL_LanternOil4, BethethorsMerchantChestRef.GetItemCount(_WL_LanternOil4))
	endif
	if BethethorsMerchantChestRef.GetItemCount(TorchbugLanternItem) > 0
		BethethorsMerchantChestRef.RemoveItem(TorchbugLanternItem, BethethorsMerchantChestRef.GetItemCount(TorchbugLanternItem))
	endif
	
	if BirnaChest.GetItemCount(TravelLanternItem) > 0
		BirnaChest.RemoveItem(TravelLanternItem, BirnaChest.GetItemCount(TravelLanternItem))
	endif
	if BirnaChest.GetItemCount(_WL_Manual) > 0
		BirnaChest.RemoveItem(_WL_Manual, BirnaChest.GetItemCount(_WL_Manual))
	endif
	if BirnaChest.GetItemCount(_WL_LanternOil4) > 0
		BirnaChest.RemoveItem(_WL_LanternOil4, BirnaChest.GetItemCount(_WL_LanternOil4))
	endif
	if BirnaChest.GetItemCount(TorchbugLanternItem) > 0
		BirnaChest.RemoveItem(TorchbugLanternItem, BirnaChest.GetItemCount(TorchbugLanternItem))
	endif
	
	if BrandChest.GetItemCount(TravelLanternItem) > 0
		BrandChest.RemoveItem(TravelLanternItem, BrandChest.GetItemCount(TravelLanternItem))
	endif
	if BrandChest.GetItemCount(_WL_Manual) > 0
		BrandChest.RemoveItem(_WL_Manual, BrandChest.GetItemCount(_WL_Manual))
	endif
	if BrandChest.GetItemCount(_WL_LanternOil4) > 0
		BrandChest.RemoveItem(_WL_LanternOil4, BrandChest.GetItemCount(_WL_LanternOil4))
	endif
	if BrandChest.GetItemCount(TorchbugLanternItem) > 0
		BrandChest.RemoveItem(TorchbugLanternItem, BrandChest.GetItemCount(TorchbugLanternItem))
	endif
	
	if PawnedPrawnChest.GetItemCount(TravelLanternItem) > 0
		PawnedPrawnChest.RemoveItem(TravelLanternItem, PawnedPrawnChest.GetItemCount(TravelLanternItem))
	endif
	if PawnedPrawnChest.GetItemCount(_WL_Manual) > 0
		PawnedPrawnChest.RemoveItem(_WL_Manual, PawnedPrawnChest.GetItemCount(_WL_Manual))
	endif
	if PawnedPrawnChest.GetItemCount(_WL_LanternOil4) > 0
		PawnedPrawnChest.RemoveItem(_WL_LanternOil4, PawnedPrawnChest.GetItemCount(_WL_LanternOil4))
	endif
	if PawnedPrawnChest.GetItemCount(TorchbugLanternItem) > 0
		PawnedPrawnChest.RemoveItem(TorchbugLanternItem, PawnedPrawnChest.GetItemCount(TorchbugLanternItem))
	endif
	
	if WhiterunFraliaChest.GetItemCount(TravelLanternItem) > 0
		WhiterunFraliaChest.RemoveItem(TravelLanternItem, WhiterunFraliaChest.GetItemCount(TravelLanternItem))
	endif
	if WhiterunFraliaChest.GetItemCount(_WL_Manual) > 0
		WhiterunFraliaChest.RemoveItem(_WL_Manual, WhiterunFraliaChest.GetItemCount(_WL_Manual))
	endif
	if WhiterunFraliaChest.GetItemCount(_WL_LanternOil4) > 0
		WhiterunFraliaChest.RemoveItem(_WL_LanternOil4, WhiterunFraliaChest.GetItemCount(_WL_LanternOil4))
	endif
	if WhiterunFraliaChest.GetItemCount(TorchbugLanternItem) > 0
		WhiterunFraliaChest.RemoveItem(TorchbugLanternItem, WhiterunFraliaChest.GetItemCount(TorchbugLanternItem))
	endif
	
	if MerchantSolitudeBitsAndPiecesChestRef.GetItemCount(TravelLanternItem) > 0
		MerchantSolitudeBitsAndPiecesChestRef.RemoveItem(TravelLanternItem, MerchantSolitudeBitsAndPiecesChestRef.GetItemCount(TravelLanternItem))
	endif
	if MerchantSolitudeBitsAndPiecesChestRef.GetItemCount(_WL_Manual) > 0
		MerchantSolitudeBitsAndPiecesChestRef.RemoveItem(_WL_Manual, MerchantSolitudeBitsAndPiecesChestRef.GetItemCount(_WL_Manual))
	endif
	if MerchantSolitudeBitsAndPiecesChestRef.GetItemCount(_WL_LanternOil4) > 0
		MerchantSolitudeBitsAndPiecesChestRef.RemoveItem(_WL_LanternOil4, MerchantSolitudeBitsAndPiecesChestRef.GetItemCount(_WL_LanternOil4))
	endif
	if MerchantSolitudeBitsAndPiecesChestRef.GetItemCount(TorchbugLanternItem) > 0
		MerchantSolitudeBitsAndPiecesChestRef.RemoveItem(TorchbugLanternItem, MerchantSolitudeBitsAndPiecesChestRef.GetItemCount(TorchbugLanternItem))
	endif
	
	if ArnleifChest.GetItemCount(TravelLanternItem) > 0
		ArnleifChest.RemoveItem(TravelLanternItem, ArnleifChest.GetItemCount(TravelLanternItem))
	endif
	if ArnleifChest.GetItemCount(_WL_Manual) > 0
		ArnleifChest.RemoveItem(_WL_Manual, ArnleifChest.GetItemCount(_WL_Manual))
	endif
	if ArnleifChest.GetItemCount(_WL_LanternOil4) > 0
		ArnleifChest.RemoveItem(_WL_LanternOil4, ArnleifChest.GetItemCount(_WL_LanternOil4))
	endif
	if ArnleifChest.GetItemCount(TorchbugLanternItem) > 0
		ArnleifChest.RemoveItem(TorchbugLanternItem, ArnleifChest.GetItemCount(TorchbugLanternItem))
	endif
	
	if GrayPineGoodsChest.GetItemCount(TravelLanternItem) > 0
		GrayPineGoodsChest.RemoveItem(TravelLanternItem, GrayPineGoodsChest.GetItemCount(TravelLanternItem))
	endif
	if GrayPineGoodsChest.GetItemCount(_WL_Manual) > 0
		GrayPineGoodsChest.RemoveItem(_WL_Manual, GrayPineGoodsChest.GetItemCount(_WL_Manual))
	endif
	if GrayPineGoodsChest.GetItemCount(_WL_LanternOil4) > 0
		GrayPineGoodsChest.RemoveItem(_WL_LanternOil4, GrayPineGoodsChest.GetItemCount(_WL_LanternOil4))
	endif
	if GrayPineGoodsChest.GetItemCount(TorchbugLanternItem) > 0
		GrayPineGoodsChest.RemoveItem(TorchbugLanternItem, GrayPineGoodsChest.GetItemCount(TorchbugLanternItem))
	endif	
	
	if NiranyeChest.GetItemCount(TravelLanternItem) > 0
		NiranyeChest.RemoveItem(TravelLanternItem, NiranyeChest.GetItemCount(TravelLanternItem))
	endif
	if NiranyeChest.GetItemCount(_WL_Manual) > 0
		NiranyeChest.RemoveItem(_WL_Manual, NiranyeChest.GetItemCount(_WL_Manual))
	endif
	if NiranyeChest.GetItemCount(_WL_LanternOil4) > 0
		NiranyeChest.RemoveItem(_WL_LanternOil4, NiranyeChest.GetItemCount(_WL_LanternOil4))
	endif
	if NiranyeChest.GetItemCount(TorchbugLanternItem) > 0
		NiranyeChest.RemoveItem(TorchbugLanternItem, NiranyeChest.GetItemCount(TorchbugLanternItem))
	endif
		
endFunction