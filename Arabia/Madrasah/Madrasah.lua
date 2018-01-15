include("Sukritact_ChangeResearchProgress.lua")

local greatPeople = { GameInfoTypes.UNIT_GREAT_GENERAL, GameInfoTypes.UNIT_GREAT_ADMIRAL, GameInfoTypes.UNIT_PROPHET, GameInfoTypes.UNIT_ARTIST, GameInfoTypes.UNIT_WRITER, GameInfoTypes.UNIT_MUSICIAN, GameInfoTypes.UNIT_SCIENTIST, GameInfoTypes.UNIT_MERCHANT, GameInfoTypes.UNIT_ENGINEER, GameInfoTypes.UNIT_GREAT_DIPLOMAT }

function IsGreatPerson(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	for _, unitType in pairs(greatPeople) do
		if (unitType == pUnit:GetUnitType()) then
			return true
		end
	end
	return false
end

function MadrasahScienceUnit(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_ARABIA_MADRASA) and bFaith) then
		local iScience = 20 * math.max(pPlayer:GetCurrentEra(), 1)
		if IsGreatPerson(iPlayer, iUnit) then
			iScience = 100 * math.max(pPlayer:GetCurrentEra(), 1)
		end
		if iPlayer == Game:GetActivePlayer() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ALERT_MADRASAH_SCIENCE", iScience, pCity:GetName()))
		end
		LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iScience)
	end
end

function MadrasahScienceBuilding(iPlayer, iCity, iBuilding, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_ARABIA_MADRASA) and bFaith) then
		local iScience = 20 * math.max(pPlayer:GetCurrentEra(), 1)
		if iPlayer == Game:GetActivePlayer() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ALERT_MADRASAH_SCIENCE", iScience, pCity:GetName()))
		end
		LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iScience)
	end
end



GameEvents.CityTrained.Add(MadrasahScienceUnit)
GameEvents.CityConstructed.Add(MadrasahScienceBuilding)