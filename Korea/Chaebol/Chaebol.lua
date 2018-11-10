-- Chaebol (altered from Waag)
-- Author: hokath
-- DateCreated: 27/1/18
--------------------------------------------------------------
local eBuildingDummyForChaebol = GameInfoTypes.BUILDING_D_FOR_CHAEBOL
local eBuildingChaebol = GameInfoTypes.BUILDING_KOREA_CHAEBOL
local eCivilizationKorea = GameInfoTypes.CIVILIZATION_KOREA
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME

-- adds GPP and yields for every TR
function TradeRoutesToGPP(iPlayer)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationKorea or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	local iNumberOfChaebols = pPlayer:CountNumBuildings(eBuildingChaebol)

	if iNumberOfChaebols > 0 then
		local iCounter = 0
		local tTradeRoutes = pPlayer:GetTradeRoutes()

		for i, tradeRoute in ipairs(tTradeRoutes) do
			local eFromCiv = tradeRoute.FromCivilizationType
			local eToCiv = tradeRoute.ToCivilizationType

			if (eFromCiv ~= eToCiv) and (eFromCiv == eCivilizationKorea) then
				iCounter = iCounter + 1
			end
		end

		local iCurrentChaebol = 0

		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingChaebol) then
				city:SetNumRealBuilding(eBuildingDummyForChaebol, iCounter)
				iCurrentChaebol = iCurrentChaebol + 1
				
				if iCurrentChaebol == iNumberOfChaebols then
					break
				end
			end
		end
	end
end

if Game.IsCivEverActive(eCivilizationKorea) then
	GameEvents.PlayerDoTurn.Add(TradeRoutesToGPP)
end
