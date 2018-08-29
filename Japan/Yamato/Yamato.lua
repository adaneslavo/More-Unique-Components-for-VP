-- Yamato
-- Author: pineappledan
-- DateCreated: 02/02/2018
--------------------------------------------------------------
local eUnitYamato = GameInfoTypes.UNIT_JAPAN_YAMATO

--GAP on construction of Yamato
function YamatoOnBuild(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetUnitType() == eUnitYamato then
		pPlayer:ChangeGoldenAgeProgressMeter(600)
		-- inform the player
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(
				NotificationTypes.NOTIFICATION_INSTANT_YIELD,
				'The City of [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] has constructed a Yamato Battleship, gaining 600 [ICON_GOLDEN_AGE] Points towards a Golden Age.', -- use TXT_KEY_ here
				'Yamato Constructed in '..pCity:GetName()..' 600 [ICON_GOLDEN_AGE] Golden Age Points gained',
				pUnit:GetX(), pUnit:GetY(), eUnitYamato)
		end
	end
end

--GAP and Culture on killing Yamato
function YamatoOnDeath(iPlayerKiller, iPlayerKillee, eKillerUnitType, eKilledUnitType)
	local pPlayerKiller = Players[iPlayerKiller]

	if eKilledUnitType == eUnitYamato then
		pPlayerKiller:ChangeJONSCulture(400)
		pPlayerKiller:ChangeGoldenAgeProgressMeter(400)		
	end		
end
			
GameEvents.CityTrained.Add(YamatoOnBuild)
GameEvents.UnitKilledInCombat.Add(YamatoOnDeath)
