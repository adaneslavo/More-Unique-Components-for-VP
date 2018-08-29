-- Yassa Court
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
include("FLuaVector.lua")

local eCivilizationMongolia = GameInfoTypes.CIVILIZATION_MONGOL
local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
local fGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100
local eBuildingYassa = GameInfoTypes.BUILDING_MONGOLIA_YASSA_COURT
local eTechPhilosophy = GameInfoTypes.TECH_PHILOSOPHY

-- adds yields to conquered city		
function OnCaptureCityBonuses(iPlayer, iCapital, iResourceX, iResourceY, iNewPlayer, iConquest, iConquest2)
	local pNewPlayer = Players[iNewPlayer]

	if not (pNewPlayer and pNewPlayer:GetCivilizationType() == eCivilizationMongolia) then 
		return 
	end

	local pCity = Map.GetPlot(iResourceX, iResourceY):GetWorkingCity()
	local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
	
	local iCulture = math.floor(5 * fGameSpeedModifier1 * iEraModifier)
	local iResearch = math.floor(5 * fGameSpeedModifier2 * iEraModifier)
	local iGold = math.floor(5 * fGameSpeedModifier3 * iEraModifier)

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

-- builds Yassa Court in all non-occupied cities on researching philosophy
function OnTechResearchedBuildYassa(iTeam, iTech)
	local pTeam = Teams[iTeam]
	local pPlayer = Players[pTeam:GetLeaderID()]

	if iTech == eTechPhilosophy then
		for city in pPlayer:Cities() do
			if not city:IsOccupied() then
				city:SetNumRealBuilding(eBuildingYassa, 1)
			end
		end
	end

	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		pPlayer:AddNotification(0, 
			'Player researched Philosophy and received free Yassa Court in every [COLOR_CYAN]non-occupied city[ENDCOLOR].', 
			'Pogost upgrade in '..pCity:GetName(), 
			pCity:GetX(), pCity:GetY())
	end
end

-- builds Yassa Court in founded city
function OnFoundAddYassa(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	local pFoundCity = Map.GetPlot(iX, iY):GetWorkingCity()

	if Teams[pNewPlayer:GetTeam()]:GetTeamTechs():HasTech(eTechPhilosophy) then
		pFoundCity:SetNumRealBuilding(eBuildingYassa, 1)
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityCaptureComplete.Add(OnCaptureCityBonuses)
GameEvents.TeamTechResearched.Add(OnTechResearchedBuildYassa)
GameEvents.PlayerCityFounded.Add(OnFoundAddYassa)