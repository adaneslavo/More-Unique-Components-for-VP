-- Chaebol (altered from Waag)
-- Author: hokath
-- DateCreated: 27/1/18
--------------------------------------------------------------
local eBuildingDummyGPP2 = GameInfoTypes.BUILDING_DUMMYGPP2
local eBuildingChaebol = GameInfoTypes.BUILDING_KOREA_CHAEBOL
local eCivilizationKorea = GameInfoTypes.CIVILIZATION_KOREA

-- adds GPP for every TR
function TradeRoutesToGPP(iPlayer)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationKorea) then return end

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
			city:SetNumRealBuilding(eBuildingDummyGPP2, iCounter)
		end
	end
end

GameEvents.PlayerDoTurn.Add(TradeRoutesToGPP)
