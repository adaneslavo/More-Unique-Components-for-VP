-- Teutonic Order
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
-- 2018-02-04 Modified by Infixo
--------------------------------------------------------------
local eBuildingTeutonicOrder = GameInfoTypes.BUILDING_GERMANY_TEUTONIC_ORDER
local eBuildingDummyForTeutonicOrder = GameInfoTypes.BUILDING_D_FOR_TEUTONIC
local eBuildingBarracks = GameInfoTypes.BUILDING_BARRACKS
local ePantheon = ReligionTypes.RELIGION_PANTHEON
local eCivilizationGermany = GameInfoTypes.CIVILIZATION_GERMANY

-- adds bonus to barracks if TO is built
function OnCityConstructionAddDummyForTO(iPlayer, iCity, eBuilding)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationGermany) then return end

	if eBuilding == eBuildingTeutonicOrder then
		local iNumberOfBarracks = pPlayer:CountNumBuildings(eBuildingBarracks)

		if iNumberOfBarracks > 0 then
			for city in pPlayer:Cities() do
				local iCurrentBarracks = 0

				if city:IsHasBuilding(eBuildingBarracks) then
					city:SetNumRealBuilding(eBuildingDummyForTeutonicOrder, 1)
					iCurrentBarracks = iCurrentBarracks + 1

					if iCurrentBarracks == iNumberOfBarracks then
						break
					end
				end
			end
		end
	elseif eBuilding == eBuildingBarracks then
		local iNumberOfTeutonicOrders = pPlayer:CountNumBuildings(eBuildingTeutonicOrder)

		if iNumberOfTeutonicOrders > 0 then
			pPlayer:GetCityByID(iCity):SetNumRealBuilding(eBuildingDummyForTeutonicOrder, 1)
		end
	end
end

-- convert followers of different faith on city capture
function OnCaptureConvertCitizens(eOldOwner, bIsCapital, iX, iY, eNewOwner, iOldPopulation, bConquest, iNumGreatWorks, iCaptureGreatWorks)
	local pPlayer = Players[eNewOwner]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationGermany) then return end
	if pPlayer:CountNumBuildings(eBuildingTeutonicOrder) == 0 then return end
	
	local eReligion = -1

	if pPlayer:HasCreatedReligion() then
		eReligion = pPlayer:GetReligionCreatedByPlayer()
	elseif pPlayer:HasStateReligion() then 
		eReligion = pPlayer:GetStateReligion() 
	else
		return
	end

	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	
	for religion in GameInfo.Religions() do
		if religion.ID ~= ePantheon and religion.ID ~= eReligion and pCity:GetNumFollowers(religion.ID) > 0 then
			--ConvertPercentFollowers(eToReligion, eFromReligion, iPercent) -- works with religious pressure so calling it for all religions could create weird effects
			pCity:ConvertPercentFollowers(ePantheon, religion.ID, 100)
		end
	end
end

GameEvents.CityConstructed.Add(OnCityConstructionAddDummyForTO)
GameEvents.CityCaptureComplete.Add(OnCaptureConvertCitizens)