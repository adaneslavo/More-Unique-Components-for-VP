-- Barbican
-- Author: adan_eslavo
-- DateCreated: 20/10/2017
--------------------------------------------------------------
function GarrisonRangePower(iPlayer, iUnit, iX, iY)
	-- check for Poland
	local pPlayer = Players[iPlayer]
	if not( pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_POLAND ) then return end
	-- check for archer or siege
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if not( pUnit and (pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_ARCHER or pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SIEGE) ) then return end
	-- process promo
	local bHasBarbican = false
	local pCity = pUnit:GetPlot():GetWorkingCity()
	if pCity ~= nil then bHasBarbican = pCity:IsHasBuilding(GameInfoTypes.BUILDING_POLAND_BARBICAN) end
	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLAND_BARBICAN, bHasBarbican and pUnit:IsGarrisoned())
end

GameEvents.UnitSetXY.Add(GarrisonRangePower)