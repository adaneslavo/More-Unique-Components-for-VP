function RanchCityGrowth(iPlayer, iCity, iPlotX, iPlotY, bGold, bCulture)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_AMERICA_RANCH)) then
		local iEra = pPlayer:GetCurrentEra()
		
		if (iEra <= 0) then
			iEra = 1
		end
		
		pCity:ChangeFood(10 * iEra)
		pPlayer:ChangeJONSCulture(10 * iEra)
	end
end

GameEvents.CityBoughtPlot.Add(RanchCityGrowth)