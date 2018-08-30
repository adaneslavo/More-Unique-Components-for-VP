-- Tophet
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------	
include("FLuaVector.lua")

local eBuildingTophet = GameInfoTypes.BUILDING_CARTHAGE_TOPHET
local eCivilizationCarthage = GameInfoTypes.CIVILIZATION_CARTHAGE
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME
local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100

function OnTrainAddXPAndYields(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)

	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationCarthage or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end

	
	if pCity:IsHasBuilding(eBuildingTophet) then
		if bGold then
			local pUnit = pPlayer:GetUnitByID(iUnit)
			-- give double amount of xp on unit purchase (reduce XP penalty on purchase)
			pUnit:ChangeExperience(2 * pUnit:GetExperience())
		end
	
		if bGold or bFaith then
			-- gain yields on purchase (faith or gold)	
			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
			local iCultureGain = math.floor(10 * iEraModifier * fGameSpeedModifier)
		
			pPlayer:ChangeJONSCulture(iCultureGain)
		
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local iCityX = pCity:GetX()
				local iCityY = pCity:GetY()
				local vCityPosition = PositionCalculator(iCityX, iCityY)
							
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iCultureGain.." [ICON_CULTURE] Tophet[ENDCOLOR]", 1)
			
				local sCityName = pCity:GetName()
				local sCurrency

				if bGold then
					sCurrency = '[ICON_GOLD] '
				elseif bFaith then
					sCurrency = '[ICON_PEACE] '
				end	

				pPlayer:AddNotification(0, 
					sCurrency..' Unit Purchase:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..sCityName..': [ENDCOLOR]+'..iCultureGain..' [ICON_CULTURE] Culture', 
					'Bonus Yields in '..sCityName, 
					iCityX, iCityY)
			
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityTrained.Add(OnTrainAddXPAndYields)
