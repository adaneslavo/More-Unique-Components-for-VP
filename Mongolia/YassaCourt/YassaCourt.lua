-- Yassa Court
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
include("FLuaVector.lua")

local eCivilizationMongolia = GameInfoTypes.CIVILIZATION_MONGOL
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME
local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
local fGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100
local eBuildingYassa = GameInfoTypes.BUILDING_MONGOLIA_YASSA_COURT
local eTechPhilosophy = GameInfoTypes.TECH_PHILOSOPHY

-- adds yields to conquered city		
function OnCaptureCityBonuses(iPlayer, iCapital, iResourceX, iResourceY, iNewPlayer, iConquest, iConquest2)
	local pNewPlayer = Players[iNewPlayer]
	local iCurrentYassa = 0;

	if not (pNewPlayer and (pNewPlayer:GetCivilizationType() == eCivilizationMongolia or pNewPlayer:GetCivilizationType() == eCivilizationRome)) then return end

	for city in pNewPlayer:Cities() do
		if city:IsHasBuilding(eBuildingYassa) then
			iCurrentYassa = iCurrentYassa + 1
		end
	end

	if iCurrentYassa == 0 then return end

	local iEraModifier = math.max(pNewPlayer:GetCurrentEra(), 1)
	local iCulture = math.floor(iCurrentYassa * 10 * fGameSpeedModifier1 * iEraModifier)
	local iResearch = math.floor(iCurrentYassa * 10 * fGameSpeedModifier2 * iEraModifier)
	local iGold = math.floor(iCurrentYassa * 10 * fGameSpeedModifier3 * iEraModifier)

	pNewPlayer:ChangeJONSCulture(iCulture)
	pNewPlayer:ChangeOverflowResearch(iResearch)
	pNewPlayer:ChangeGold(iGold)

	if pNewPlayer:IsHuman() and pNewPlayer:IsTurnActive() then
		local vCityPosition = PositionCalculator(iResourceX, iResourceY)

		Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_GOLD]+"..iGold.."[ICON_GOLD][ENDCOLOR]", 1)
		Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iResearch.." [ICON_RESEARCH][ENDCOLOR]", 1.5)
		Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+ "..iCulture.." [ICON_CULTURE][ENDCOLOR]", 2)	

		pNewPlayer:AddNotification(0, 
			'A city has been conquered for the Great Khan![NEWLINE][ICON_BULLET]+'..iGold..' [ICON_GOLD] Gold[NEWLINE][ICON_BULLET]+'..iResearch..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET]+'..iCulture..' [ICON_CULTURE] Culture', 
			'Subjugation!', 
			iResourceX, iResourceY)
	end
end

-- builds Yassa Court in all non-occupied cities on researching philosophy
function OnTechResearchedBuildYassa(iTeam, iTech)
	local pTeam = Teams[iTeam]
	local pPlayer = Players[pTeam:GetLeaderID()]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationMongolia) then return end

	if iTech == eTechPhilosophy then
		for city in pPlayer:Cities() do
			if not city:IsOccupied() then
				city:SetNumRealBuilding(eBuildingYassa, 1)
			end
		end
	
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local pCapital = pPlayer:GetCapitalCity()
		
			pPlayer:AddNotification(0, 
				'Player researched Philosophy and received free Yassa Court in every [COLOR_CYAN]non-occupied City[ENDCOLOR].', 
				'Yassa Courts built across the Empire', 
				pCapital:GetX(), pCapital:GetY())
		end
	end
end

-- builds Yassa Court in founded city
function OnFoundAddYassa(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationMongolia) then return end

	local pFoundCity = Map.GetPlot(iX, iY):GetWorkingCity()

	if Teams[pPlayer:GetTeam()]:GetTeamTechs():HasTech(eTechPhilosophy) then
		pFoundCity:SetNumRealBuilding(eBuildingYassa, 1)
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationMongolia) then
	GameEvents.CityCaptureComplete.Add(OnCaptureCityBonuses)
	GameEvents.TeamTechResearched.Add(OnTechResearchedBuildYassa)
	GameEvents.PlayerCityFounded.Add(OnFoundAddYassa)
end


