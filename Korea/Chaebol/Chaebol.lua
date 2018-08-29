-- Chaebol (altered from Waag)
-- Author: hokath
-- DateCreated: 27/1/18
--------------------------------------------------------------
local eBuildingDummyForChaebol = GameInfoTypes.BUILDING_D_FOR_CHAEBOL
local eBuildingChaebol = GameInfoTypes.BUILDING_KOREA_CHAEBOL

-- adds GPP for every TR
function TradeRoutesToGPP(iPlayer)
	local pPlayer = Players[iPlayer]

	local iCounter = 0
	local tTradeRoutes = pPlayer:GetTradeRoutes()

	for i, tradeRoute in ipairs(tTradeRoutes) do
		local eFromCiv = tradeRoute.FromCivilizationType
		local eToCiv = tradeRoute.ToCivilizationType

		if (eFromCiv ~= eToCiv) and (eFromCiv == eCivilizationKorea) then
			iCounter = iCounter + 1
		end
	end

	for city in pPlayer:Cities() do
		if city:IsHasBuilding(eBuildingChaebol) then
			city:SetNumRealBuilding(eBuildingDummyForChaebol, iCounter)
		end
	end
end

GameEvents.PlayerDoTurn.Add(TradeRoutesToGPP)
