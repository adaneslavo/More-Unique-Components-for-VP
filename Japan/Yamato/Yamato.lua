-- Yamato
-- Author: pineappledan
-- DateCreated: 02/02/2018
--------------------------------------------------------------
local eUnitYamato = GameInfoTypes.UNIT_JAPAN_YAMATO
local eCivilizationJapan = GameInfoTypes.CIVILIZATION_JAPAN

--GAP on construction of Yamato
function OnYamatoConstructionAddGAP(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationJapan) then return end
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetUnitType() == eUnitYamato then
		pPlayer:ChangeGoldenAgeProgressMeter(600)
		
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local iX, iY, sCityName = pUnit:GetX(), pUnit:GetY(), pPlayer:GetCityByID(iCity):GetName()

			pPlayer:AddNotification(
				NotificationTypes.NOTIFICATION_INSTANT_YIELD,
				'The City of [COLOR_CYAN]'..sCityName..'[ENDCOLOR] has constructed a Yamato Battleship, gaining 600 [ICON_GOLDEN_AGE] Points towards a Golden Age.', -- use TXT_KEY_ here
				'Yamato Constructed in '..sCityName,
				iX, iY, eUnitYamato)
		end
	end
end

--GAP and Culture on killing Yamato
function OnYamatoDeathAddGAP(iPlayerKiller, iPlayerKilled, eKillerUnitType, eKilledUnitType)
	local pPlayerKiller = Players[iPlayerKiller]

	if eKilledUnitType == eUnitYamato then
		pPlayerKiller:ChangeJONSCulture(400)
		pPlayerKiller:ChangeGoldenAgeProgressMeter(400)

		local pCapital = pPlayer:GetCapitalCity()
		local iX, iY = pCapital:GetX(), pCapital:GetY()
		
		if pPlayerKiller:IsHuman() and pPlayerKiller:IsTurnActive() then
			local vCityPosition = PositionCalculator(iX, iY)

			Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+400 [ICON_CULTURE][ENDCOLOR]", 1)
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_LIGHT_GREY]+400 [ICON_GOLDEN_AGE][ENDCOLOR]", 1.5)
			pPlayer:AddNotification(
				NotificationTypes.NOTIFICATION_INSTANT_YIELD,
				'You sunk mighty Yamato Battleship, gaining 400 [ICON_CULTURE] Culture and 400 [ICON_GOLDEN_AGE] Points towards a Golden Age.', -- use TXT_KEY_ here
				'Yamato Battleship destroyed!',
				iX, iY, eUnitYamato)
		end

		local pPlayerKilled = Players[iPlayerKilled]

		if pPlayerKilled:IsHuman() then
			pPlayer:AddNotification(
				NotificationTypes.NOTIFICATION_INSTANT_YIELD,
				'Another player destroyed your mighty Yamato Battleship.', -- use TXT_KEY_ here
				'You lost Yamato Battleship!',
				iX, iY, eUnitYamato)
		end
	end		
end

if Game.IsCivEverActive(eCivilizationJapan) then			
	GameEvents.CityTrained.Add(OnYamatoConstructionAddGAP)
end
GameEvents.UnitKilledInCombat.Add(OnYamatoDeathAddGAP)
