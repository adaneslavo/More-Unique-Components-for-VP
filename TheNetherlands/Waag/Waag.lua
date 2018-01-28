-- Waag
-- Author: adan_eslavo
-- DateCreated: 13/12/2017
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
function ImportedResourcesToGPPAndDefense(iPlayer)
	local pPlayer = Players[iPlayer]

	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_NETHERLANDS_WAAG) then
			local iTradedResources = 0
			
			for res in GameInfo.Resources("ResourceClassType = 'RESOURCECLASS_LUXURY'") do
				iTradedResources = iTradedResources + pPlayer:GetResourceImport(res.ID) + pPlayer:GetResourceExport(res.ID)
			end
			
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGPPANDDEFENSE, math.min(iTradedResources, 10))
		end
	end
end

GameEvents.PlayerDoTurn.Add(ImportedResourcesToGPPAndDefense)