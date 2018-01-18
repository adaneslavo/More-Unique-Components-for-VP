function RanchCityGrowth(iPlayer, iCity, iPlotX, iPlotY, bGold, bCulture)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	local iGameSpeedModifier
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
		
		local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GrowthPercent
		local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent
		
		local yield1 = 10 * iEra * iGameSpeedModifier1
		local yield2 = 10 * iEra * iGameSpeedModifier2
		yield1 = math.floor(yield1)
		yield2 = math.floor(yield2)
		
		pCity:ChangeFood(yield1)
		pPlayer:ChangeJONSCulture(yield2)
	end
end

GameEvents.CityBoughtPlot.Add(RanchCityGrowth)