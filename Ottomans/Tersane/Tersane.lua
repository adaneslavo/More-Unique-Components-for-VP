-- Tersane
-- Author: adan_eslavo
-- DateCreated: 1/11/2017
--------------------------------------------------------------
function TrainPrizeShips(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALMELEE then
		local pCity = pPlayer:GetCityByID(iCity)

		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_PRIZE_SHIPS, pCity:IsHasBuilding(GameInfoTypes.BUILDING_OTTOMANS_TERSANE))
	end
end

GameEvents.CityTrained.Add(TrainPrizeShips)