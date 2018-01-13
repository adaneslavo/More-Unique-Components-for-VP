-- Polder
-- Author: Enginseer, adan_eslavo
-- DateCreated: 31/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function PolderCanBeOnMarsh (iPlayer, iUnit, iX, iY, iBuild)
	if iBuild == GameInfoTypes.BUILD_POLDER_2 and Players[iPlayer]:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_NETHERLANDS then
		return false
	else 
		return true
	end
end

function EnemyUnitOnMyPolder(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer];
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local pPlot = pUnit:GetPlot()

	if pPlot ~= nil then
		if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_POLDER or pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_POLDER_2 then
			if pPlot:GetOwner() ~= nil then
				if pPlot:GetOwner() ~= iPlayer then
					if pPlayer:IsAtWar(Players[pPlot:GetOwner()]:GetTeam()) then
						pUnit:SetMoves(0)
				
						if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
							local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
				
							Events.AddPopupTextEvent(vUnitPosition, "[COLOR_NEGATIVE_TEXT]Polder[ENDCOLOR]", 1)
						end
					end
				end
			end
		end
	end	
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerCanBuild.Add(PolderCanBeOnMarsh)
GameEvents.UnitSetXY.Add(EnemyUnitOnMyPolder)