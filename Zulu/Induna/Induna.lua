-- Indaba
-- Author: Blue Ghost, pineappledan
-- 2018-02-26 updated by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

local eCivilizationZulu = GameInfoTypes.CIVILIZATION_ZULU
local ePromotionIbutho = GameInfoTypes.PROMOTION_UNIT_ZULU_IBUTHO

-- adds XP to stacked unit and deals damage to adjacent enemy units
function OnExpendingGrantXPAndCows(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationZulu) then return end
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if not pUnit:IsHasPromotion(ePromotionIbutho) then return end

	local pPlot = Map.GetPlot(iX, iY)
	
	for k = 0, pPlot:GetNumUnits() - 1, 1 do
		local pStackedUnit = pPlot:GetUnit(k)
		local eOwner = pStackedUnit:GetOwner()
		
		if eOwner == iPlayer and pStackedUnit:IsCombatUnit() then
			pStackedUnit:ChangeExperience(30)
		end
	end	
	if (pPlot:GetResourceType(-1) == (-1)) then 
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(GameInfoTypes.RESOURCE_COW, 1)
		pPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_ZULU_KRAAL)	

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE, 
			'Udibi youths have brought a new source of [ICON_RES_COW] Cattle near [COLOR_CYAN]'..pNearestCity:GetName()..'[ENDCOLOR].', 
			'New source of Cattle in '..pNearestCity:GetName(), 
			iX, iY, GameInfoTypes.RESOURCE_COW)
		end	
	end
end

function GetNearestCity(pPlayer, pPlot)
	local iDistance = 10000
	local pNearestCity = nil

	for pCity in pPlayer:Cities() do
		local iDistanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())

		if(iDistanceToCity < iDistance) then
			iDistance = iDistanceToCity
			pNearestCity = pCity
		end
	end

	return pNearestCity
end	

if Game.IsCivEverActive(eCivilizationZulu) then
	GameEvents.GreatPersonExpended.Add(OnExpendingGrantXPAndCows)
end
