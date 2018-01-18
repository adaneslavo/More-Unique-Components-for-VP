-- Ranch
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
function RanchCityGrowth(iPlayer, iCity, iPlotX, iPlotY, bGold, bCulture)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	if pCity:IsHasBuilding(GameInfoTypes.BUILDING_AMERICA_RANCH) then
		local iEraModifier = (pPlayer:GetCurrentEra() + 1) / 3
		local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GrowthPercent / 100
		local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
		
		local iYield1 = math.floor(10 * iEraModifier * iGameSpeedModifier1)
		local iYield2 = math.floor(10 * iEraModifier * iGameSpeedModifier2)
		
		pCity:ChangeFood(iYield1)
		pPlayer:ChangeJONSCulture(iYield2)

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
			
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_FOOD]+"..iYield1.." [ICON_FOOD] Ranch[ENDCOLOR]", 1)
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iYield2.." [ICON_CULTURE] Ranch[ENDCOLOR]", 1.5)
		end
	end
end

GameEvents.CityBoughtPlot.Add(RanchCityGrowth)