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

			local sText = "The public execution of an enemy spy at the White Tower in " .. pCity:GetName() ..  " has excited its Citizens, providing the city with +1 [ICON_HAPPINESS1] Happiness.";
			local sTitle = "Spy killed in " .. pCity:GetName()
			
			Players[pCity:GetOwner()]:AddNotification(NotificationTypes.KILLED_A_SPY, sText, sTitle, pCity:GetX(), pCity:GetY())
		end
	end
end

GameEvents.EspionageResult.Add(WhiteTowerEspionageResult)