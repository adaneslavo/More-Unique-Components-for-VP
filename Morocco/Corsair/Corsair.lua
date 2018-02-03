-- Corsair
-- 2018-01-27 updated by Infixo
----------------------------------------------------------------------------------------------------------------------------	
include("FLuaVector.lua")

local terrainCoastalID = GameInfoTypes["TERRAIN_COAST"]
local terrainOceanID   = GameInfoTypes["TERRAIN_OCEAN"]

local pBarbarian = nil

for iPlayer, pPlayer in pairs(Players) do
    if pPlayer:IsBarbarian() then
        pBarbarian = pPlayer
    end
end

function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

function GetNearestCoastalCity(iPlotX, iPlotY, pPlayer)
	local iShortestDistance = 99999
	local pNearestCity = nil
	
	for pCity in pPlayer:Cities() do
		local iDist = Map.PlotDistance(pCity:GetX(), pCity:GetY(), iPlotX, iPlotY)
		if (iDist < iShortestDistance and pCity:IsCoastal()) then
			iShortestDistance = iDist
			pNearestCity = pCity
		end
	end
	return pNearestCity
end

function GrantRazziaBonus(pPlayer, iX, iY, iFood, iProduction)
	local city = GetNearestCoastalCity(iX, iY, pPlayer)
	if city then
		city:ChangeFood(iFood)
		city:ChangeProduction(iProduction)
		local hex = ToHexFromGrid(Vector2(iX, iY))
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_FOOD]", iFood), true)
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_PRODUCTION]", iProduction), true)
	end
end

function RazziaOnKill(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]

	if pAttackingPlayer ~= nil and pDefendingPlayer ~= nil then
		local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)

		if(pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_RAZZIA) and iDefenderFinalDamage >= iDefenderMaxHP) then
			local yields = pDefendingUnit:GetBaseCombatStrength() * 2
			GrantRazziaBonus(pAttackingPlayer, iPlotX, iPlotY, yields, yields)
		end
	end
end

function RazziaOnPillage(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_RAZZIA) then
		GrantRazziaBonus(pPlayer, pUnit:GetX(), pUnit:GetY(), 50, 50)
	end
end

function RazziaOnPlunder(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_RAZZIA) then
		GrantRazziaBonus(pPlayer, pUnit:GetX(), pUnit:GetY(), 100, 100)
	end
end

GameEvents.CombatEnded.Add(RazziaOnKill)
GameEvents.UnitPillageGold.Add(RazziaOnPillage)
GameEvents.PlayerPlunderedTradeRoute.Add(RazziaOnPlunder)