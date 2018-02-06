-- Scythed Chariot
-- Author: adan_eslavo
-- DateCreated: 26/10/2017
--------------------------------------------------------------
include("FLuaVector.lua")

local ePromotionScythe = GameInfoTypes.PROMOTION_UNIT_CELTS_SCYTHE

-- damage adjacent enemies on move
function OnMoveAddScytheDamage(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if pUnit and pUnit:IsHasPromotion(ePromotionScythe) then
		local pPlot = pUnit:GetPlot()
		
		-- loop through adjacent tiles
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
			
			-- loop through all units on adjacent tile
			for k = 0, pAdjacentPlot:GetNumUnits() - 1, 1 do
				local pAdjacentUnit = pAdjacentPlot:GetUnit(k)
				local eAdjacentPlayer = pAdjacentUnit:GetOwner()
				local pAdjacentPlayer = Players[eAdjacentPlayer]
				
				if Teams[pPlayer:GetTeam()]:IsAtWar(pAdjacentPlayer:GetTeam()) then
					pAdjacentUnit:ChangeDamage(10, eAdjacentPlayer)
					
					local iX, iY = pAdjacentUnit:GetX(), pAdjacentUnit:GetY()

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vUnitPosition = PositionCalculator(iX, iY)
					
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]Scythe[ENDCOLOR]", 2)
					end

					if pAdjacentPlayer:IsHuman() then
						pAdjacentPlayer:AddNotification(NotificationTypes.NOTIFICATION_ENEMY_IN_TERRITORY, 
							pAdjacentUnit:GetName()..' was hurt by enemy Scythed Chariot for 10 damage.', 
							'Unit damaged by Scythed Chariot', 
							iX, iY, pAdjacentUnit:GetID())
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.UnitSetXY.Add(OnMoveAddScytheDamage)