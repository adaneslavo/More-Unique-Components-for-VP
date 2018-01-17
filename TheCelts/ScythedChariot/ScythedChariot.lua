-- Scythed Chariot
-- Author: adan_eslavo
-- DateCreated: 26/10/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function Scythe(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	local pUnit = pPlayer:GetUnitByID(iUnit)
		
	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_CELTS_SCYTHE) then
		local pPlot = Map.GetPlot(iX, iY)
			
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do	
			local pPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
			
			if pPlot:IsUnit() == true then
				pTargetUnit = pPlot:GetUnit(0)
				pTargetPlayer = Players[pTargetUnit:GetOwner()]

				if pTeam:IsAtWar(pTargetPlayer:GetTeam()) then
					pTargetUnit:ChangeDamage(10)
					
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vUnitPosition = PositionCalculator(pTargetUnit:GetX(), pTargetUnit:GetY())
					
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]Scythe[ENDCOLOR]", 2)
					end

					if pTargetPlayer:IsHuman() then
						pTargetPlayer:AddNotification(0, 'One of your units was hurt by enemy Scythed Chariot.', 'Unit damaged', pCity:GetX(), pCity:GetY())
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.UnitSetXY.Add(Scythe)