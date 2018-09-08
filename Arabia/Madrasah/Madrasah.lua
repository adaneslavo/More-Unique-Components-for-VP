-- Madrasah
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
local eCivilizationArabia = GameInfoTypes.CIVILIZATION_ARABIA
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME
local eBuildingMadrasah = GameInfoTypes.BUILDING_ARABIA_MADRASAH

-- adds science on unit faith purchases
function MadrasahScienceUnit(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationArabia or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	local pCity = pPlayer:GetCityByID(iCity)

	if pCity and pCity:IsHasBuilding(eBuildingMadrasah) and bFaith then
		
		local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
		local pUnit = pPlayer:GetUnitByID(iUnit)
		local iScience
		
		if pUnit:IsGreatPerson() then
			iScience = math.floor(75 * iEraModifier * iGameSpeedModifier)
		else
			iScience = math.floor(15 * iEraModifier * iGameSpeedModifier)
		end

		pPlayer:ChangeOverflowResearch(iScience)

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local iX, iY = pCity:GetX(), pCity:GetY()
			local vCityPosition = PositionCalculator(iX, iY)
			local sName = pCity:GetName()

			Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iScience.."[ICON_RESEARCH][ENDCOLOR]", 1)
			pPlayer:AddNotification(0, 
				'[ICON_PEACE] Faith purchase:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..sName..': [ENDCOLOR]+'..iScience..' [ICON_RESEARCH] Science', 
				'Bonus Yields in '..sName, 
				iX, iY)
		end
	end
end

-- adds science on building faith purchases
function MadrasahScienceBuilding(iPlayer, iCity, iBuilding, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationArabia or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	local pCity = pPlayer:GetCityByID(iCity)
	
	if pCity and pCity:IsHasBuilding(eBuildingMadrasah) and bFaith then
		local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
		local iScience = math.floor(15 * iEraModifier * iGameSpeedModifier)
		
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local iX, iY = pCity:GetX(), pCity:GetY()
			local vCityPosition = PositionCalculator(iX, iY)
			local sName = pCity:GetName()
	
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iScience.."[ICON_RESEARCH][ENDCOLOR]", 1)
			pPlayer:AddNotification(0, 
				'[ICON_PEACE] Faith purchase:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..sName..': [ENDCOLOR]+'..iScience..' [ICON_RESEARCH] Science', 
				'Bonus Yields in '..sName, 
				iX, iY)
		end

		pPlayer:ChangeOverflowResearch(iScience)
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityTrained.Add(MadrasahScienceUnit)
GameEvents.CityConstructed.Add(MadrasahScienceBuilding)
