-- Monitor
-- Author: adan_eslavo
-- DateCreated: 15/01/2018
--------------------------------------------------------------
local eMonitor = GameInfoTypes.PROMOTION_UNIT_AMERICA_MONITOR

function OnTurnEndAddCityDefense(iPlayer)
	local pPlayer = Players[iPlayer]

	-- loop through cities in search of monitor
	for city in pPlayer:Cities() do
		local iInRange = 0
		local pPlot = city:Plot()
		local pFoundUnit
		
		-- check city tile
		for val = 0, (pPlot:GetNumUnits() - 1), 1 do
			pFoundUnit = pPlot:GetUnit(val)
				
			if pFoundUnit:GetOwner() == iPlayer and pFoundUnit:IsHasPromotion(eMonitor) then
				iInRange = 1
				break
			end
		end

		-- check adjacent tiles
		if iInRange == 0 then
			local pAdjacentPlot
			local iX = pPlot:GetX()
			local iY = pPlot:GetY()

			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
			
				for val = 0, (pAdjacentPlot:GetNumUnits() - 1), 1 do
					pFoundUnit = pAdjacentPlot:GetUnit(val)
					
					if pFoundUnit:GetOwner() == iPlayer and pFoundUnit:IsHasPromotion(eMonitor) then
						iInRange = 1
						break
					end
				end

				if iInRange == 1 then
					break
				end
			end
		end

		-- add defense to the city
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, iInRange)
	end
end

GameEvents.PlayerEndTurnCompleted.Add(OnTurnEndAddCityDefense)