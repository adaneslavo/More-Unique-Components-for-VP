-- Teutonic Order
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
-- 2018-02-04 Modified by Infixo
--------------------------------------------------------------
local eBuildingTeutonicOrder = GameInfoTypes.BUILDING_GERMANY_TEUTONIC_ORDER
local eBuildingBarracks = GameInfoTypes.BUILDING_BARRACKS
local ePantheon = ReligionTypes.RELIGION_PANTHEON

-- helper checks if Teutonic Order is present
function PlayerHasTeutonicOrder(pPlayer)
	for city in pPlayer:Cities() do
		if city:IsHasBuilding(eBuildingTeutonicOrder) then return true end
	end
	return false
end

function OnCityConstructedTeutonicOrder(iPlayer, iCity, eBuilding)
	local pPlayer = Players[iPlayer]
	
	if eBuilding == eBuildingTeutonicOrder then
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingBarracks) then
				city:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSEHPPROMOTION, 1)
			end
		end
	elseif eBuilding == eBuildingBarracks then
		if PlayerHasTeutonicOrder(pPlayer) then
			pPlayer:GetCityByID(iCity):SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSEHPPROMOTION, 1)
		end
	end
end

-- CityCaptureComplete(eOldOwner, bIsCapital, iX, iY, eNewOwner, iOldPopulation, bConquest, iNumGreatWorks, iCaptureGreatWorks)
function OnCityCaptureCompleteTeutonicOrder(eOldOwner, iCapital, iX, iY, eNewOwner, iConquest1, iConquest2)
	local pPlayer = Players[eNewOwner]
	-- check if Teutonic Order is present
	if not( pPlayer and PlayerHasTeutonicOrder(pPlayer)) then return end -- no TO, no effect
	-- do we have a religion?
	local eReligion = -1
	if pPlayer:HasCreatedReligion() then eReligion = pPlayer:GetReligionCreatedByPlayer()
	elseif pPlayer:HasStateReligion() then eReligion = pPlayer:GetStateReligion() end
	if eReligion == -1 then return end -- no religion, no conversion
	-- ok, de-convert non-followers
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	for religion in GameInfo.Religions() do
		if religion.ID ~= ePantheon and religion.ID ~= eReligion and pCity:GetNumFollowers(religion.ID) > 0 then
			--ConvertPercentFollowers(eToReligion, eFromReligion, iPercent) -- works with religious pressure so calling it for all religions could create weird effects
			pCity:ConvertPercentFollowers(ePantheon, religion.ID, 100)
		end
	end
end

GameEvents.CityConstructed.Add(OnCityConstructedTeutonicOrder)
GameEvents.CityCaptureComplete.Add(OnCityCaptureCompleteTeutonicOrder)