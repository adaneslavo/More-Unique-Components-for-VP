-- Monitor
-- Author: adan_eslavo
-- DateCreated: 15/01/2018
--------------------------------------------------------------
local iMonitor = GameInfoTypes.PROMOTION_UNIT_AMERICA_MONITOR

function MonitorCityDefense(iPlayer)
	local pPlayer = Players[iPlayer]

	for pCity in pPlayer:Cities() do
		local bInRange = false
		local pPlot = pCity:Plot()

		if pPlot == nil then
			break
		end

		for iVal = 0,(pPlot:GetNumUnits() - 1) do
			local pSameTileUnit = pPlot:GetUnit(iVal)
				
			if pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:IsHasPromotion(iMonitor) then
				bInRange = true
				break
			end
		end

		if not bInRange then
			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
					local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
					if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:IsHasPromotion(iMonitor) then
						bInRange = true
						break
					end
				end

				if bInRange then
					break
				end
			end
		end

		if bInRange then
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, 1)
		else
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, 0)
		end
	end
end

GameEvents.PlayerEndTurnCompleted.Add(MonitorCityDefense)