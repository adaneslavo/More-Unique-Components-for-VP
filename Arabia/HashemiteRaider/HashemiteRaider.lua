
include("PlotIterators.lua")
include("FLuaVector.lua")
include("InstanceManager")

function PositionCalculator(i1, i2)
    return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

function GarlandMine(iPlayer, iUnit, iImprovement, iGold)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local promotion = GameInfoTypes["PROMOTION_UNIT_ARABIA_GARLAND_MINE"]
	if (pUnit:IsHasPromotion(promotion)) then
		local unitPlot = pUnit:GetPlot()
		for iPlot in PlotRingIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
			for k = 0, iPlot:GetNumUnits() - 1 do
				local jUnit = iPlot:GetUnit(k)
				local jPlayer = jUnit:GetOwner()
				local jTeam = Players[jPlayer]:GetTeam()
				local iTeam = pPlayer:GetTeam()
				if Teams[iTeam]:IsAtWar(jTeam) then
					local vUnitPosition = PositionCalculator(jUnit:GetX(), jUnit:GetY())
					Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]Garland Mine[ENDCOLOR]", 1.2)
					jUnit:ChangeDamage(10, jPlayer)
				end
			end
		end
	end
end

GameEvents.UnitPillageGold.Add(GarlandMine)