-- Waag
-- Author: adan_eslavo
-- DateCreated: 13/12/2017
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
local eBuildingWaag = GameInfoTypes.BUILDING_NETHERLANDS_WAAG
local eBuildingDummyForWaag = GameInfoTypes.BUILDING_D_FOR_WAAG

function ImportedResourcesToGPPAndDefense(iPlayer)
	local pPlayer = Players[iPlayer]

	for city in pPlayer:Cities() do
		if city:IsHasBuilding(eBuildingWaag) then
			local iTradedResources = 0
			
			for res in GameInfo.Resources("ResourceClassType = 'RESOURCECLASS_LUXURY'") do
				iTradedResources = iTradedResources + pPlayer:GetResourceImport(res.ID) + pPlayer:GetResourceExport(res.ID)
			end
			
			city:SetNumRealBuilding(eBuildingDummyForWaag, math.min(iTradedResources, 10))
		end
	end
end

GameEvents.PlayerDoTurn.Add(ImportedResourcesToGPPAndDefense)