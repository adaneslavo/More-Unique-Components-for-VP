--------------------------------------------------------------------------------------------------------------------------
-- TARKHAN
--------------------------------------------------------------------------------------------------------------------------
--4UC Tarkhan Migration promotion
local unitClassCivilianID		 = GameInfoTypes["UNITCLASS_SETTLER"],["UNITCLASS_WORKER"]
local unitPromotionMigration = GameInfoTypes["PROMOTION_MIGRATION"]
function HunMigration_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	for unit in player:Units() do
		if unit:GetUnitClassType() == unitClassCivilianID then
			local plot = unit:GetPlot()
			if (plot:GetUnit() and plot:GetUnit():IsHasPromotion(unitPromotionMigration)) then
				unit:ChangeMoves(120)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(HunMigration_PlayerDoTurn)
--==========================================================================================================================
--==========================================================================================================================
--Bellum Alet' promotion
--------------------------------------------------------------
include("PlotIterators.lua")
include("FLuaVector.lua")
include("InstanceManager")

function BellumAlet(iPlayer, iUnit, iImprovement, iGold)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SACKER) then
		local unitPlot = pUnit:GetPlot()
		
		for iPlot in PlotRingIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
			for k = 0, iPlot:GetNumUnits() - 1 do
				local jUnit = iPlot:GetUnit(k)
				local iTeam = pPlayer:GetTeam()
				
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vUnitPosition = PositionCalculator(jUnit:GetX(), jUnit:GetY())
						
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_GREEN]Bellum Alet[ENDCOLOR]", 1)
					end

					jUnit:ChangeDamage(-10, pPlayer)
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
    return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.UnitPillageGold.Add(BellumAlet)
