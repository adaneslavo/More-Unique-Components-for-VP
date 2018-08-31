-- Tersane
-- Author: adan_eslavo
-- DateCreated: 1/11/2017
--------------------------------------------------------------
local eUnitSeaBeggar = GameInfoTypes.UNIT_DUTCH_SEA_BEGGAR
local ePromotionPrizeShips = GameInfoTypes.PROMOTION_PRIZE_SHIPS
local eBuildingTersane = GameInfoTypes.BUILDING_OTTOMANS_TERSANE
local eCivilizationOttoman = GameInfoTypes.CIVILIZATION_OTTOMAN

-- add Prize Ships promotion on unit training
function OnTrainAddPrizeShips(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationOttoman) then return end
	
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetUnitType() == eUnitSeaBeggar then return end
	
	if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALMELEE then
		local pCity = pPlayer:GetCityByID(iCity)

		pUnit:SetHasPromotion(ePromotionPrizeShips, pCity:IsHasBuilding(eBuildingTersane))
	end
end

GameEvents.CityTrained.Add(OnTrainAddPrizeShips)
