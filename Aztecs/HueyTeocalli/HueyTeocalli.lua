-- Huey Teocalli
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
local eBuildingHueyTeocalli = GameInfoTypes.BUILDING_AZTEC_HUEY_TEOCALLI
local eBuildingDummyForHuey = GameInfoTypes.BUILDING_D_FOR_HUEY
local eCivilizationAztec = GameInfoTypes.CIVILIZATION_AZTEC

-- adds dummy building (XP to units and yields to building class) on golden age start
function OnGoldenAgeStartAddYieldsAndXP(iPlayer, bStart, iTurns)
	if not bStart then return end

	local pPlayer = Players[iPlayer]
		
	if pPlayer:GetCivilizationType() ~= eCivilizationAztec then return end
	
	local iNumberOfHueys = pPlayer:CountNumBuildings(eBuildingHueyTeocalli)

	if iNumberOfHueys > 0 then
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingHueyTeocalli) then
				local iGoldenAges = city:GetNumRealBuilding(eBuildingDummyForHuey) + 1
				
				if iGoldenAges <= 10 then
					city:SetNumRealBuilding(eBuildingDummyForHuey, iGoldenAges)
				end

				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local iCityX, iCityY = city:GetX(), city:GetY()
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
end

if Game.IsCivEverActive(eCivilizationAztec) then
	GameEvents.PlayerGoldenAge.Add(OnGoldenAgeStartAddYieldsAndXP)
end
