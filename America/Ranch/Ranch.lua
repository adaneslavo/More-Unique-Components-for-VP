function RanchCityGrowth(iPlayer, iCity, iPlotX, iPlotY, bGold, bCulture)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_AMERICA_RANCH)) then
		local iEraModifier = (pPlayer:GetCurrentEra() + 1) / 3
		local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GrowthPercent / 100
		local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
		
		local yield1 = 10 * iEraModifier * iGameSpeedModifier1
		local yield2 = 10 * iEraModifier * iGameSpeedModifier2
		yield1 = math.floor(yield1)
		yield2 = math.floor(yield2)
		
		pCity:ChangeFood(yield1)
		pPlayer:ChangeJONSCulture(yield2)
	end
end

GameEvents.CityBoughtPlot.Add(RanchCityGrowth)