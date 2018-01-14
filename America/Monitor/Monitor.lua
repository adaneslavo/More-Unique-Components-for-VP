include("PlotIterators.lua")

function MonitorCityCombatStrength(iPlayer)
	local pPlayer = Players[iPlayer]
	for pCity in pPlayer:Cities() do
		local cityPlot = pCity:Plot()
		local monitorsAdjacent = 0
		for adjacentPlot in PlotAreaSweepIterator(cityPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			isPromotionValid = (adjacentPlot:GetUnit() and adjacentPlot:GetUnit():GetOwner() == iPlayer and adjacentPlot:GetUnit():IsHasPromotion(GameInfoTypes.PROMOTION_MONITOR)) or false
			if isPromotionValid == true then 
				monitorsAdjacent = monitorsAdjacent + 1
			end
		end
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VP_MONITOR_DUMMY, monitorsAdjacent)
	end
end

GameEvents.PlayerDoTurn.Add(MonitorCityCombatStrength)