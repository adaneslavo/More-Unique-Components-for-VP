include("FLuaVector.lua")
include("PlotIterators.lua")

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

function RazziaOnKill(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
	local pDefendingPlayer = Players[iDefendingPlayer]
	local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)

	if(pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_RAZZIA) and iDefenderFinalDamage >= iDefenderMaxHP) then
		local yields = pDefendingUnit:GetBaseCombatStrength() * 2
		local city = GetNearestCoastalCity(iPlotX, iPlotY, pAttackingPlayer)
		if city then
			local hex = ToHexFromGrid(Vector2(iPlotX, iPlotY))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[ICON_WHITE]+{1_Num}[ENDCOLOR] [ICON_FOOD]", yields), true)
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[ICON_WHITE]+{1_Num}[ENDCOLOR] [ICON_PRODUCTION]", yields), true)
			city:ChangeFood(yields)
			city:ChangeProduction(yields)
		end
	end
end

function RazziaOnPillage(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_RAZZIA) then
		local yields = 50
		local plot = pUnit:GetPlot()
		local iPlotX = plot:GetX()
		local iPlotY = plot:GetY()
		local city = GetNearestCoastalCity(iPlotX, iPlotY, pPlayer)
		if city then
			local hex = ToHexFromGrid(Vector2(iPlotX, iPlotY))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[ICON_WHITE]+{1_Num}[ENDCOLOR] [ICON_FOOD]", yields), true)
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[ICON_WHITE]+{1_Num}[ENDCOLOR] [ICON_PRODUCTION]", yields), true)
			city:ChangeFood(yields)
			city:ChangeProduction(yields)
		end
	end
end

function RazziaOnPlunder(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_RAZZIA) then
		local yields = 100
		local plot = pUnit:GetPlot()
		local iPlotX = plot:GetX()
		local iPlotY = plot:GetY()
		local city = GetNearestCoastalCity(iPlotX, iPlotY, pPlayer)
		if city then
			local hex = ToHexFromGrid(Vector2(iPlotX, iPlotY))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[ICON_WHITE]+{1_Num}[ENDCOLOR] [ICON_FOOD]", yields), true)
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[ICON_WHITE]+{1_Num}[ENDCOLOR] [ICON_PRODUCTION]", yields), true)
			city:ChangeFood(yields)
			city:ChangeProduction(yields)
		end
	end
end

GameEvents.CombatEnded.Add(RazziaOnKill)
GameEvents.UnitPillageGold.Add(RazziaOnPillage)
GameEvents.PlayerPlunderedTradeRoute.Add(RazziaOnPlunder)