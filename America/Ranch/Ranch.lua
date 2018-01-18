function RanchCityGrowth(iPlayer, iCity, iPlotX, iPlotY, bGold, bCulture)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	local iGameSpeedModifier = 1
	if Game.GetGameSpeedType() == 0 then
		iGameSpeedModifier = 3
	elseif Game.GetGameSpeedType() == 1 then
		iGameSpeedModifier = 2
	elseif Game.GetGameSpeedType() == 2 then
		iGameSpeedModifier = 1
	elseif Game.GetGameSpeedType() == 3 then
		iGameSpeedModifier = 0.67
	end
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_AMERICA_RANCH)) then
		local iEra = pPlayer:GetCurrentEra()
		
		if (iEra <= 0) then
			iEra = 1
		end
		
		local yield = 10 * iEra * iGameSpeedModifier
		yield = math.floor(yield + 0.5)
		pCity:ChangeFood(yield)
		pPlayer:ChangeJONSCulture(yield)
	end
end

GameEvents.CityBoughtPlot.Add(RanchCityGrowth)