-- Teutonic Order
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
local iOrder = GameInfoTypes.BUILDING_GERMANY_TEUTONIC_ORDER
local iBarracks = GameInfoTypes.BUILDING_BARRACKS
local iPantheon = ReligionTypes.RELIGION_PANTHEON

function TeutonicOrderBarracksBonus(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if iBuilding == iOrder then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iBarracks) then
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSEHPPROMOTION, 1)
			end
		end
	elseif iBuilding == iBarracks then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iOrder) then
				pPlayer:GetCityByID(iCity):SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSEHPPROMOTION, 1)
				
				break
			end
		end
	end
end

function TeutonicOrderOnCapture(iPlayer, iCapital, iX, iY, iNewPlayer, iConquest1, iConquest2)
	local pPlayer = Players[iNewPlayer]
	local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
	local iFoundedReligion = pPlayer:GetReligionCreatedByPlayer()
	local iStateReligion = pPlayer:GetCapitalCity():GetReligiousMajority()

	if iFoundedReligion > 0 then
		for iReligion in GameInfo.Religions() do
			if iReligion ~= iFoundedReligion then			
				pCity:ConvertPercentFollowers(iPantheon, iReligion, 100)
			end
		end
	elseif iStateReligion > 0 then
		for iReligion in GameInfo.Religions() do
			if iReligion ~= iStateReligion then		
				pCity:ConvertPercentFollowers(iPantheon, iReligion, 100)
			end
		end
	end
end


GameEvents.CityConstructed.Add(TeutonicOrderBarracksBonus)
GameEvents.CityCaptureComplete.Add(TeutonicOrderOnCapture)