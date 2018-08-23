-- Monitor
-- Author: adan_eslavo
-- DateCreated: 15/01/2018
--------------------------------------------------------------
--[[local eUnitMonitor = GameInfoTypes.PROMOTION_UNIT_AMERICA_MONITOR
local eBuildingDummyDefense = GameInfoTypes.BUILDING_DUMMYDEFENSE

function OnTurnEndAddCityDefense(iPlayer)
	local pPlayer = Players[iPlayer]

	-- loop through cities in search of monitor
	for city in pPlayer:Cities() do
		local bInRange = city:IsWithinDistanceOfUnitPromotion(eUnitMonitor, 1, true, false)

		if bInRange then
			city:SetNumRealBuilding(eBuildingDummyDefense, 1)
		else
			city:SetNumRealBuilding(eBuildingDummyDefense, 0)
		end
	end
end

GameEvents.PlayerEndTurnCompleted.Add(OnTurnEndAddCityDefense)
