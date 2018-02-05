-- Ranch
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GrowthPercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
local eBuildingRanch = GameInfoTypes.BUILDING_AMERICA_RANCH		

function OnCityExpansion(iPlayer, iCity, iX, iY, bGold, bCulture)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	-- add yields (food and culture) for natural border expansion or buying tiles
	if pCity:IsHasBuilding(eBuildingRanch) then
		local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
		local iYield1 = math.floor(5 * iEraModifier * fGameSpeedModifier1)
		local iYield2 = math.floor(5 * iEraModifier * fGameSpeedModifier2)
		
		pCity:ChangeFood(iYield1)
		pPlayer:ChangeJONSCulture(iYield2)

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local iCityX = pCity:GetX()
			local iCityY = pCity:GetY()
			local sCityName = pCity:GetName()
			local vCityPosition = PositionCalculator(iCityX, iCityY)
			
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_FOOD]+"..iYield1.." [ICON_FOOD][ENDCOLOR]", 1)
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iYield2.." [ICON_CULTURE][ENDCOLOR]", 1.5)
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_CITY_TILE, 
				'Aquired tile:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..sCityName..': [ENDCOLOR]+'..iYield1..' [ICON_FOOD] Food[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..sCityName..': [ENDCOLOR]+'..iYield2..' [ICON_CULTURE] Culture', 
				'Bonus Yields in '..sCityName, 
				iCityX, iCityY)
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityBoughtPlot.Add(OnCityExpansion)