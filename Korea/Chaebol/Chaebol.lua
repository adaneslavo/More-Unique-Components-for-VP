-- Chaebol (altered from Waag)
-- Author: hokath
-- DateCreated: 27/1/18
--------------------------------------------------------------
function TradeRoutesToGPPAndGold(iPlayer)
	local pPlayer = Players[iPlayer]
  numTR = pPlayer:GetNumInternationalTradeRoutesUsed()
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_KOREA_CHAEBOL) then
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGPPANDGOLD, numTR)
		end
	end
end

GameEvents.PlayerDoTurn.Add(TradeRoutesToGPPAndGold)
