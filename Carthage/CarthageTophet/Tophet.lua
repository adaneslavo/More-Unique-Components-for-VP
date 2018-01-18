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
	local iGameSpeedModifier
	if Game.GetGameSpeedType() == 0 then
		iGameSpeedModifier = 3
	elseif Game.GetGameSpeedType() == 1 then
		iGameSpeedModifier = 2
	elseif Game.GetGameSpeedType() == 2 then
		iGameSpeedModifier = 1
	elseif Game.GetGameSpeedType() == 3 then
		iGameSpeedModifier = 0.67
	end
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_TOPHET) and (bGold or bFaith)) then
		local cultureGain = 10 * math.max(pPlayer:GetCurrentEra(), 1) * iGameSpeedModifier
		cultureGain = math.floor(cultureGain)
		pPlayer:ChangeJONSCulture(cultureGain)
		if iPlayer == Game:GetActivePlayer() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ALERT_TOPHET_CULTURE", cultureGain, pCity:GetName()))
		end
	end
end

GameEvents.CityTrained.Add(TophetXPGain)
GameEvents.CityTrained.Add(TophetCultureGain)