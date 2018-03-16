-- Qila
-- Author: adan_eslavo
-- DateCreated: 5/12/2017
--------------------------------------------------------------
function YieldFoodToCulture(iPlayer)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_INDIA then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_INDIA_QILA) then
				local iCultureChange = 0.05 * pCity:GetBaseYieldRate(YieldTypes.YIELD_FOOD)

				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCULTURE, iCultureChange)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(YieldFoodToCulture)
