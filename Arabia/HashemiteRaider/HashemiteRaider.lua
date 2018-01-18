-- Hashemite Raider
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("PlotIterators.lua")
include("FLuaVector.lua")
include("InstanceManager")

function GarlandMine(iPlayer, iUnit, iImprovement, iGold)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if (pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ARABIA_GARLAND_MINE"]) then
		local unitPlot = pUnit:GetPlot()
		
		for iPlot in PlotRingIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
			for k = 0, iPlot:GetNumUnits() - 1 do
				local jUnit = iPlot:GetUnit(k)
				local jPlayer = jUnit:GetOwner()
				local jTeam = Players[jPlayer]:GetTeam()
				local iTeam = pPlayer:GetTeam()
				
				if Teams[iTeam]:IsAtWar(jTeam) then
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vUnitPosition = PositionCalculator(jUnit:GetX(), jUnit:GetY())
						
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]Garland Mine[ENDCOLOR]", 1)
					end

					jUnit:ChangeDamage(10, jPlayer)
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
    return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.UnitPillageGold.Add(GarlandMine)