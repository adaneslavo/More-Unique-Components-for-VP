-- Ranch
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
function RanchCityGrowth(iPlayer, iCity, iPlotX, iPlotY, bGold, bCulture)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	if pCity:IsHasBuilding(GameInfoTypes.BUILDING_AMERICA_RANCH) then
		local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
		local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GrowthPercent / 100
		local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
		
		local iYield1 = math.floor(5 * iEraModifier * iGameSpeedModifier1)
		local iYield2 = math.floor(5 * iEraModifier * iGameSpeedModifier2)
		
		pCity:ChangeFood(iYield1)
		pPlayer:ChangeJONSCulture(iYield2)

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
			
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_FOOD]+"..iYield1.." [ICON_FOOD][ENDCOLOR]", 1)
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iYield2.." [ICON_CULTURE][ENDCOLOR]", 1.5)
			pPlayer:AddNotification(0, 'Aquired tile:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iYield1..' [ICON_FOOD] Food[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iYield2..' [ICON_CULTURE] Culture.', 'Bonus Yields in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
		end
	end
end

GameEvents.CityBoughtPlot.Add(RanchCityGrowth)