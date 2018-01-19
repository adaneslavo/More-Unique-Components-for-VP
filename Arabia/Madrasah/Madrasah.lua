-- Madrasah
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("Sukritact_ChangeResearchProgress.lua")
include("FLuaVector.lua")
include("InstanceManager")

function MadrasahScienceUnit(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
	local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)

	if pCity:IsHasBuilding(GameInfoTypes.BUILDING_ARABIA_MADRASAH) and bFaith then
		local iScience
		local pUnit = pPlayer:GetUnitByID(iUnit)

		if pUnit:IsGreatPerson() then
			iScience = math.floor(50 * iEraModifier * iGameSpeedModifier)
		else
			iScience = math.floor(10 * iEraModifier * iGameSpeedModifier)
		end

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iScience.."[ICON_RESEARCH] Madrasah[ENDCOLOR]", 1)
		end

		LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iScience)
	end
end

function MadrasahScienceBuilding(iPlayer, iCity, iBuilding, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	if pCity:IsHasBuilding(GameInfoTypes.BUILDING_ARABIA_MADRASAH) and bFaith then
		local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
		local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100

		local iScience = math.floor(10 * iEraModifier * iGameSpeedModifier)
		
		if iPlayer == Game:GetActivePlayer() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ALERT_MADRASAH_SCIENCE", iScience, pCity:GetName()))
		end

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iScience.."[ICON_RESEARCH] Madrasah[ENDCOLOR]", 1)
		end

		LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iScience)
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityTrained.Add(MadrasahScienceUnit)
GameEvents.CityConstructed.Add(MadrasahScienceBuilding)