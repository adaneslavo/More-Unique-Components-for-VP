-- Tersane
-- Author: adan_eslavo
-- DateCreated: 1/11/2017
--------------------------------------------------------------
function TrainPrizeShips(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALMELEE then
		local pCity = pPlayer:GetCityByID(iCity)

		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_OTTOMANS_TERSANE) == true then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_PRIZE_SHIPS, true)
		end
	end
end

GameEvents.CityTrained.Add(TrainPrizeShips)