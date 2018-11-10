-- White Tower
-- Author: FieryCharizard7, adan_eslavo
-- DateCreated: 6/01/2018
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
local eBuildingDummyForWhiteTower = GameInfoTypes.BUILDING_D_FOR_TOWER
local eBuildingWhiteTower = GameInfoTypes.BUILDING_ENGLAND_WHITE_TOWER
local eCivilizationEngland = GameInfoTypes.CIVILIZATION_ENGLAND

-- adds happiness on enemy spy kill
function WhiteTowerEspionageResult(iPlayer, iSpy, iResult, iCityX, iCityY) 
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationEngland) then return end
	
	if iResult == 3 then
		local pCity = Map.GetPlot(iCityX, iCityY):GetWorkingCity()
			
		--if pCity:IsHasBuilding(eBuildingWhiteTower) then
		local iNumberOfWhiteTowers = pPlayer:CountNumBuildings(eBuildingWhiteTower)

		if iNumberOfWhiteTowers > 0 then
			pCity:SetNumRealBuilding(eBuildingDummyForWhiteTower, pCity:GetNumRealBuilding(eBuildingDummyForWhiteTower) + 1);

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local sName = pCity:GetName()
				local iCityOwner = pCity:GetOwner()
				
				Players[iCityOwner]:AddNotification(NotificationTypes.NOTIFICATION_SPY_KILLED_A_SPY,
					'You have killed an Enemy Spy in '..sName..'. [ICON_HAPPINESS_1] Happiness in '..sName..' increased by 1.',
					'Enemy Spy killed in '..sName,
					iCityX, iCityY, iCityOwner)
			end
		end
	end
end

if Game.IsCivEverActive(eCivilizationEngland) then
	GameEvents.EspionageResult.Add(WhiteTowerEspionageResult)
end