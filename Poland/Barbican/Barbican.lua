-- Barbican
-- Author: adan_eslavo
-- DateCreated: 20/10/2017
--------------------------------------------------------------
local eBuildingBarbican = GameInfoTypes.BUILDING_POLAND_BARBICAN
local eBuildingDummyForBarbican = GameInfoTypes.BUILDING_D_FOR_BARBICAN
local eBuildingArmory = GameInfoTypes.BUILDING_ARMORY
local eCivilizationPoland = GameInfoTypes.CIVILIZATION_POLAND
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME
local ePromotionBarbican = GameInfoTypes.PROMOTION_UNIT_POLAND_BARBICAN

-- adds temporary promotion to range units when garrisoned in city with Barbican built
function GarrisonRangePower(iPlayer, iUnit, iX, iY)
	-- check for Poland/Rome
	local pPlayer = Players[iPlayer]

	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationPoland or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	-- check for archer or siege
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if not (pUnit and (pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_ARCHER or pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SIEGE)) then 
		return 
	end
	
	-- process promo
	local bHasBarbican = false
	local pPlot = pUnit:GetPlot()

	if pPlot and pPlot:IsCity() then
		local pCity = pPlot:GetWorkingCity()

		bHasBarbican = pCity:IsHasBuilding(eBuildingBarbican)
	end

	pUnit:SetHasPromotion(ePromotionBarbican, bHasBarbican and pUnit:IsGarrisoned())
end

-- builds dummy Armory on Barbican construction
function OnConstructionBuildDummyArmory(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]

	if pPlayer and pPlayer:GetCivilizationType() == eCivilizationPoland then
		if iBuilding == eBuildingBarbican then
			local pCity = pPlayer:GetCityByID(iCity)

			pCity:SetNumRealBuilding(eBuildingDummyForBarbican, 1)
		end
	end
end

if Game.IsCivEverActive(eCivilizationPoland) then
	GameEvents.UnitSetXY.Add(GarrisonRangePower)
	GameEvents.CityConstructed.Add(OnConstructionBuildDummyArmory)
end

