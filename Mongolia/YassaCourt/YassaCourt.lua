-- Yassa Court
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
include("FLuaVector.lua")

local eCivilizationMongolia = GameInfoTypes.CIVILIZATION_MONGOL
local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
local fGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
local fGameSpeedModifier4 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100
local eBuildingYassa = GameInfoTypes.BUILDING_MONGOLIA_YASSA_COURT
local eTechPhilosophy = GameInfoTypes.TECH_PHILOSOPHY
			
function OnCaptureCityBonuses(iPlayer, iCapital, iResourceX, iResourceY, iNewPlayer, iConquest, iConquest2)
	local pNewPlayer = Players[iNewPlayer]

	if not (pNewPlayer and pNewPlayer:GetCivilizationType() == eCivilizationMongolia) then 
		return 
	end

	local pCity = Map.GetPlot(iResourceX, iResourceY):GetWorkingCity()
	
	-- builds Yassa Court in conquered city
	if Teams[pNewPlayer:GetTeam()]:GetTeamTechs():HasTech(eTechPhilosophy) then
		pCity:SetNumRealBuilding(eBuildingYassa, 1)
	end

	-- adds yields to conquered city
	local iCulture = math.floor(5 * fGameSpeedModifier2)
	local iResearch = math.floor(5 * fGameSpeedModifier3)
	local iGold = math.floor(5 * fGameSpeedModifier4)

	pNewPlayer:ChangeJONSCulture(iCulture)
	pNewPlayer:ChangeOverflowResearch(iResearch)
	pNewPlayer:ChangeGold(iGold)

	if pNewPlayer:IsHuman() and pNewPlayer:IsTurnActive() then
		local vCityPosition = PositionCalculator(iResourceX, iResourceY)

		Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_GOLD]+"..iGold.."[ICON_GOLD][ENDCOLOR]", 1)
		Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iResearch.." [ICON_RESEARCH][ENDCOLOR]", 1.5)
		Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+ "..iCulture.." [ICON_CULTURE][ENDCOLOR]", 2)	
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityCaptureComplete.Add(OnCaptureCityBonuses)