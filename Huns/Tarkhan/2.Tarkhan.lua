--------------------------------------------------------------------------------------------------------------------------
-- TARKHAN
-- 2018-01-27 updated by Infixo
--------------------------------------------------------------------------------------------------------------------------
--4UC Tarkhan Migration promotion
local unitClassSettlerID = GameInfoTypes.UNITCLASS_SETTLER
local unitClassWorkerID = GameInfoTypes.UNITCLASS_WORKER
local unitPromotionMigration = GameInfoTypes["PROMOTION_MIGRATION"]
function HunMigration_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	for unit in player:Units() do
		if unit:GetUnitClassType() == unitClassSettlerID or unit:GetUnitClassType() == unitClassWorkerID then
			local plot = unit:GetPlot()
			if (plot:GetUnit() and plot:GetUnit():IsHasPromotion(unitPromotionMigration)) then
				unit:ChangeMoves(60)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(HunMigration_PlayerDoTurn)
--==========================================================================================================================
--==========================================================================================================================
--Bellum Alet' promotion
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function BellumAlet(iPlayer, iUnit, iImprovement, iGold)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SACKER) then
		local unitPlot = pUnit:GetPlot()
		local iX, iY = unitPlot:GetX(), unitPlot:GetY()
		for eDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, eDirection)
			for k = 0, pAdjacentPlot:GetNumUnits() - 1 do
				local jUnit = pAdjacentPlot:GetUnit(k)
				local jPlayer = jUnit:GetOwner()
				if jPlayer == pPlayer then
				jUnit:ChangeDamage(-10, pPlayer)
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vUnitPosition = PositionCalculator(jUnit:GetX(), jUnit:GetY())
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_GREEN]Bellum Alet[ENDCOLOR]", 1)
					end
				end
			end -- units
		end -- for
	end -- promo
end -- function

function PositionCalculator(i1, i2)
    return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.UnitPillageGold.Add(BellumAlet)
