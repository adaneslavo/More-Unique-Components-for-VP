-- Waag
-- Author: adan_eslavo
-- DateCreated: 13/12/2017
--------------------------------------------------------------
function ImportedResourcesToGPPAndDefense(iPlayer)
	local pPlayer = Players[iPlayer]

	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_NETHERLANDS_WAAG) then
			local iTradedResources = 0
			local iTemp = 0
			local iLuxuries = {}
				iLuxuries[0] = GameInfoTypes.RESOURCE_AMBER
				iLuxuries[1] = GameInfoTypes.RESOURCE_BRAZILWOOD
				iLuxuries[2] = GameInfoTypes.RESOURCE_CITRUS
				iLuxuries[3] = GameInfoTypes.RESOURCE_CLOVES
				iLuxuries[4] = GameInfoTypes.RESOURCE_COCOA
				iLuxuries[5] = GameInfoTypes.RESOURCE_COFFEE
				iLuxuries[6] = GameInfoTypes.RESOURCE_COPPER
				iLuxuries[7] = GameInfoTypes.RESOURCE_CORAL
				iLuxuries[8] = GameInfoTypes.RESOURCE_COTTON
				iLuxuries[9] = GameInfoTypes.RESOURCE_CRAB
				iLuxuries[10] = GameInfoTypes.RESOURCE_DYE
				iLuxuries[11] = GameInfoTypes.RESOURCE_FUR
				iLuxuries[12] = GameInfoTypes.RESOURCE_GEMS
				iLuxuries[13] = GameInfoTypes.RESOURCE_GOLD
				iLuxuries[14] = GameInfoTypes.RESOURCE_INCENSE
				iLuxuries[15] = GameInfoTypes.RESOURCE_IVORY
				iLuxuries[16] = GameInfoTypes.RESOURCE_JADE
				iLuxuries[17] = GameInfoTypes.RESOURCE_LAPIS
				iLuxuries[18] = GameInfoTypes.RESOURCE_MARBLE
				iLuxuries[19] = GameInfoTypes.RESOURCE_NUTMEG
				iLuxuries[20] = GameInfoTypes.RESOURCE_OLIVE
				iLuxuries[21] = GameInfoTypes.RESOURCE_PEARLS
				iLuxuries[22] = GameInfoTypes.RESOURCE_PEPPER
				iLuxuries[23] = GameInfoTypes.RESOURCE_PERFUME
				iLuxuries[24] = GameInfoTypes.RESOURCE_PORCELAIN
				iLuxuries[25] = GameInfoTypes.RESOURCE_SALT
				iLuxuries[26] = GameInfoTypes.RESOURCE_SILK
				iLuxuries[27] = GameInfoTypes.RESOURCE_SILVER
				iLuxuries[28] = GameInfoTypes.RESOURCE_SPICES
				iLuxuries[29] = GameInfoTypes.RESOURCE_SUGAR
				iLuxuries[30] = GameInfoTypes.RESOURCE_TEA
				iLuxuries[31] = GameInfoTypes.RESOURCE_TOBACCO
				iLuxuries[32] = GameInfoTypes.RESOURCE_TRUFFLES
				iLuxuries[33] = GameInfoTypes.RESOURCE_WHALE
				iLuxuries[34] = GameInfoTypes.RESOURCE_WINE

			for i=0, 34, 1 do
				iTemp = pPlayer:GetResourceImport(iLuxuries[i]) + pPlayer:GetResourceExport(iLuxuries[i])
				iTradedResources = iTradedResources + iTemp
			end

			if iTradedResources >= 10 then
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGPPANDDEFENSE, 10)
			else
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGPPANDDEFENSE, iTradedResources)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(ImportedResourcesToGPPAndDefense)