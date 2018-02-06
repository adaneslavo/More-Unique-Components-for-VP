-- Huey Teocalli
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
local eBuildingHeuyTeocalli = GameInfoTypes.BUILDING_AZTEC_HUEY_TEOCALLI
local eBuildingDummyXPAndYields = GameInfoTypes.BUILDING_DUMMYEXPANDCLASSYIELD
local eCivilizationAztec = GameInfoTypes.CIVILIZATION_AZTEC

-- adds dummy building (XP to units and yields to building class) on golden age start
function OnGoldenAgeStartAddYieldsAndXP(iPlayer, bStart, iTurns)
	if not bStart then return end

	local pPlayer = Players[iPlayer]
		
	if pPlayer:GetCivilizationType() ~= eCivilizationAztec then return end

	for city in pPlayer:Cities() do
		if city:IsHasBuilding(eBuildingHeuyTeocalli) then
			local iGoldenAges = city:GetNumRealBuilding(eBuildingDummyXPAndYields) + 1
				
			if iGoldenAges <= 10 then
				city:SetNumRealBuilding(eBuildingDummyXPAndYields, iGoldenAges)
			end

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local iCityX = city:GetX()
				local iCityY = city:GetY()
				local sCityName = city:GetName()
			
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GOLDEN_AGE_BEGUN_ACTIVE_PLAYER, 
					'Golden Age has begun. The City of [COLOR_CYAN]'..sCityName..'[ENDCOLOR] received additional bonuses.', 
					'Golden Age in '..sCityName, 
					iCityX, iCityY)
			end

			break
		end
	end
end

GameEvents.PlayerGoldenAge.Add(OnGoldenAgeStartAddYieldsAndXP)