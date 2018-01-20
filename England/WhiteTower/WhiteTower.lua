-- White Tower
-- Author: FieryCharizard7, adan_eslavo
-- DateCreated: 6/01/2018
--------------------------------------------------------------
function WhiteTowerEspionageResult(iPlayer, iSpy, iResult, iCityX, iCityY) 
	local pPlayer = Players[iPlayer]
	
	if iResult == 3 then
		local pCity = Map.GetPlot(iCityX, iCityY):GetWorkingCity()
		
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_ENGLAND_WHITE_TOWER) then
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYHAPPINESS, pCity:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYHAPPINESS) + 1);

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				Players[pCity:GetOwner()]:AddNotification(0, 'You have killed an Enemy Spy in '..pCity:GetName()..'. [ICON_HAPPINESS_1] Happiness in '..pCity:GetName()..' incresed by 1.', 'Enemy Spy killed in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
			end
		end
	end
end

GameEvents.EspionageResult.Add(WhiteTowerEspionageResult)