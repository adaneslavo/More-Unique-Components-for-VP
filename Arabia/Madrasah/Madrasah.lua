-- Madrasah
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

local eCivilizationArabia = GameInfoTypes.CIVILIZATION_ARABIA
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME

function MadrasahScienceUnit(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)

	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationArabia or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
	local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)

	if pCity:IsHasBuilding(GameInfoTypes.BUILDING_ARABIA_MADRASAH) and bFaith then
		local iScience
		local pUnit = pPlayer:GetUnitByID(iUnit)

		if pUnit:IsGreatPerson() then
			iScience = math.floor(75 * iEraModifier * iGameSpeedModifier)
		else
			iScience = math.floor(15 * iEraModifier * iGameSpeedModifier)
		end

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iScience.."[ICON_RESEARCH][ENDCOLOR]", 1)
			pPlayer:AddNotification(0, '[ICON_PEACE] Faith purchase:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iScience..' [ICON_RESEARCH] Science', 'Bonus Yields in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
		end

		pPlayer:ChangeOverflowResearch(iScience)
	end
end

function MadrasahScienceBuilding(iPlayer, iCity, iBuilding, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationArabia or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	if pCity:IsHasBuilding(GameInfoTypes.BUILDING_ARABIA_MADRASAH) and bFaith then
		local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
		local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100

		local iScience = math.floor(15 * iEraModifier * iGameSpeedModifier)
		
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iScience.."[ICON_RESEARCH][ENDCOLOR]", 1)
			pPlayer:AddNotification(0, '[ICON_PEACE] Faith purchase:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iScience..' [ICON_RESEARCH] Science', 'Bonus Yields in '..pCity:GetName()..'!', pCity:GetX(), pCity:GetY())
		end

		pPlayer:ChangeOverflowResearch(iScience)
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityTrained.Add(MadrasahScienceUnit)
GameEvents.CityConstructed.Add(MadrasahScienceBuilding)
