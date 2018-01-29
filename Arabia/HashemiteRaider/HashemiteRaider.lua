-- Hashemite Raider
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
-- 2018-01-27 updated by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function GarlandMine(iPlayer, iUnit, iImprovement, iGold)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_ARABIA_GARLAND_MINE) then
		local pTeam = Teams[pPlayer:GetTeam()]
		local unitPlot = pUnit:GetPlot()
		local iX, iY = unitPlot:GetX(), unitPlot:GetY()
		for eDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, eDirection)
			for k = 0, pAdjacentPlot:GetNumUnits() - 1, 1 do
				local jUnit = pAdjacentPlot:GetUnit(k)
				local jPlayer = jUnit:GetOwner()
				local jTeam = Players[jPlayer]:GetTeam()
				if pTeam:IsAtWar(jTeam) then
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vUnitPosition = PositionCalculator(jUnit:GetX(), jUnit:GetY())
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]Garland Mine[ENDCOLOR]", 1)
					end
					jUnit:ChangeDamage(10, jPlayer)
				end
			end -- for units
		end -- for adj plots
	end -- if has promo
end

function PositionCalculator(i1, i2)
    return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.UnitPillageGold.Add(GarlandMine)