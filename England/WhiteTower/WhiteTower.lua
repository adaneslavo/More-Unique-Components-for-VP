-- White Tower
-- Author: FieryCharizard7, adan_eslavo
-- DateCreated: 6/01/2018
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

local eBuildingDummyForWhiteTower = GameInfoTypes.BUILDING_D_FOR_TOWER
local eBuildingWhiteTower = GameInfoTypes.BUILDING_ENGLAND_WHITE_TOWER
local eCivilizationEngland = GameInfoTypes.CIVILIZATION_ENGLAND

-- adds happiness on enemy spy kill
function WhiteTowerEspionageResult(iPlayer, iSpy, iResult, iCityX, iCityY) 
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationEngland) then return end
	
	if iResult == 3 then
		local pCity = Map.GetPlot(iCityX, iCityY):GetWorkingCity()

		if pPlayer:CountNumBuildings(eBuildingWhiteTower) > 0 then
			local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)	
			local iGain = math.floor(100 * iEraModifier * fGameSpeedModifier)
			pPlayer:ChangeJONSCulture(iGain)
			pPlayer:ChangeGold(iGain)
			
			pCity:SetNumRealBuilding(eBuildingDummyForWhiteTower, pCity:GetNumRealBuilding(eBuildingDummyForWhiteTower) + 1);

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local sName = pCity:GetName()
				local iCityOwner = pCity:GetOwner()
				local vCityPosition = PositionCalculator(city:GetX(), city:GetY())

				Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_GOLD]+"..iGain.." [ICON_GOLD][ENDCOLOR]", 1.5)
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iGain.." [ICON_CULTURE][ENDCOLOR]", 1)
				
				Players[iCityOwner]:AddNotification(NotificationTypes.NOTIFICATION_SPY_KILLED_A_SPY,
					'You have killed an Enemy Spy in '..sName..'. '..iGain..' [ICON_GOLD] Gold, '..iGain..' [ICON_CULTURE]  Culture, and [ICON_HAPPINESS_1] Happiness in '..sName..' increased by 1.',
					'Enemy Spy killed in '..sName,
					iCityX, iCityY, iCityOwner)
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationEngland) then
	GameEvents.EspionageResult.Add(WhiteTowerEspionageResult)
end
