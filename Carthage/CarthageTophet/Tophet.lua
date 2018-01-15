include("FLuaVector.lua")
include("PlotIterators.lua")

function TophetXPGain(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_TOPHET) and bGold) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		local oldXP = pUnit:GetExperience()
		local newXP = 2 * oldXP
		pUnit:SetExperience(newXP)
	end
end

function TophetCultureGain(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_TOPHET) and (bGold or bFaith)) then
		local cultureGain = 10 * math.max(pPlayer:GetCurrentEra(), 1)
		pPlayer:ChangeJONSCulture(cultureGain)
		if iPlayer == Game:GetActivePlayer() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ALERT_TOPHET_CULTURE", cultureGain, pCity:GetName()))
		end
	end
end

GameEvents.CityTrained.Add(TophetXPGain)
GameEvents.CityTrained.Add(TophetCultureGain)