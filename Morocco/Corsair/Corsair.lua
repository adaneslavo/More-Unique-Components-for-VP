-- Corsair
-- Author: Blue Ghost, adan_eslavo
-- DateCreated: 
-- 2018-01-27 updated by Infixo
----------------------------------------------------------------------------------------------------------------------------	
include("FLuaVector.lua")

local eTerrainCoast = GameInfoTypes.TERRAIN_COAST
local eTerrainOcean = GameInfoTypes.TERRAIN_OCEAN
local ePromotionRazzia = GameInfoTypes.PROMOTION_UNIT_MOROCCO_RAZZIA
local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GrowthPercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ConstructPercent / 100

-- nearest city gains yields for Corsair's kill
function OnKillCityGainYields(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]

	if pAttackingPlayer ~= nil and pDefendingPlayer ~= nil then
		local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)

		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(ePromotionRazzia) and iDefenderFinalDamage >= iDefenderMaxHP then
			local iYield = pDefendingUnit:GetBaseCombatStrength() * 2
					
			GrantRazziaBonus(pAttackingPlayer, iPlotX, iPlotY, iYield)
		end
	end
end

-- nearest city gains yields for Corsair's pillage
function OnPillageCityGainYields(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if pUnit and pUnit:IsHasPromotion(ePromotionRazzia) then
		GrantRazziaBonus(pPlayer, pUnit:GetX(), pUnit:GetY(), 50)
	end
end

-- nearest city gains yields for Corsair's trade route plunder
function OnTRPlunderCityGainYields(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if pUnit and pUnit:IsHasPromotion(ePromotionRazzia) then
		GrantRazziaBonus(pPlayer, pUnit:GetX(), pUnit:GetY(), 100)
	end
end

function GrantRazziaBonus(pPlayer, iX, iY, iYield)
	local pCity = GetNearestCoastalCity(iX, iY, pPlayer)
	
	if not pCity then return end
	
	local iFood = math.floor(iYield * fGameSpeedModifier1)
	local iProduction = math.floor(iYield * fGameSpeedModifier2)
	
	pCity:ChangeFood(iFood)
	pCity:ChangeProduction(iProduction)
	
	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
		Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_FOOD]+"..iFood.."[ICON_FOOD][ENDCOLOR]", 1)
		Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_PRODUCTION]+"..iProduction.."[ICON_PRODUCTION][ENDCOLOR]", 1.5)
	end
end

function GetNearestCoastalCity(iX, iY, pPlayer)
	local iDistance = 10000
	local pNearestCity = nil

	for city in pPlayer:Cities() do
		local iDistanceToCity = Map.PlotDistance(city:GetX(), city:GetY(), iX, iY)

		if iDistanceToCity < iDistance and city:IsCoastal() then
			iDistance = iDistanceToCity
			pNearestCity = city
		end
	end

	return pNearestCity
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CombatEnded.Add(OnKillCityGainYields)
GameEvents.UnitPillageGold.Add(OnPillageCityGainYields)
GameEvents.PlayerPlunderedTradeRoute.Add(OnTRPlunderCityGainYields)
