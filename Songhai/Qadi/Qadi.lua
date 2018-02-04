-- Qadi
-- Author: pineappledan
-- DateCreated: 25/01/2018
--------------------------------------------------------------
function YieldProdToCulture(iPlayer)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SONGHAI then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_QADI_COURT) then
				local iCultureChange = 0.1 * pCity:GetBaseYieldRate(YieldTypes.YIELD_PRODUCTION)

				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCULTURE, iCultureChange)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(YieldProdToCulture)