-- Chaebol (altered from Waag)
-- Author: hokath
-- DateCreated: 27/1/18
--------------------------------------------------------------
local eBuildingDummyGPP2 = GameInfoTypes.BUILDING_DUMMYGPP2
local eBuildingChaebol = GameInfoTypes.BUILDING_KOREA_CHAEBOL
local eCivilizationKorea = GameInfoTypes.CIVILIZATION_KOREA

-- adds GPP for every TR
function TradeRoutesToGPPAndGold(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationKorea) then 
		return 
	end

	numTR = pPlayer:GetNumInternationalTradeRoutesUsed()
	
	print("numTR", numTR)

	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(eBuildingChaebol) then
			pCity:SetNumRealBuilding(eBuildingDummyGPP2, numTR)
		end
	end
end

GameEvents.PlayerDoTurn.Add(TradeRoutesToGPPAndGold)
