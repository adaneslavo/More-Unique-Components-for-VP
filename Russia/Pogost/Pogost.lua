-- Pogost
-- Author: adan_eslavo
-- DateCreated: 28/10/2017
--------------------------------------------------------------
-- Pogost
-- Author: adan_eslavo
-- DateCreated: 28/10/2017
--------------------------------------------------------------
local iBuilding1 = GameInfoTypes.BUILDING_RUSSIA_POGOST_1
local iBuilding2 = GameInfoTypes.BUILDING_RUSSIA_POGOST_2
local iBuilding3 = GameInfoTypes.BUILDING_RUSSIA_POGOST_3
local iTech1 = GameInfoTypes.TECH_BANKING
local iTech2 = GameInfoTypes.TECH_ARCHITECTURE
local eCivilizationRussia = GameInfoTypes.CIVILIZATION_RUSSIA
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME

-- if Russia constructs Pogosts add additional Stages if tech requirement are fullfiled
function OnConstructionAddStages(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationRussia) then return end
	
	local pCity = pPlayer:GetCityByID(iCity)

	if iBuilding == iBuilding1 then
		local pTeam = Teams[pPlayer:GetTeam()]

		if pTeam:GetTeamTechs():HasTech(iTech1) then
			pCity:SetNumRealBuilding(iBuilding2, 1)
			
			NotificationLoad(0, pPlayer, pCity)
		end
			
		if pTeam:GetTeamTechs():HasTech(iTech2) then
			pCity:SetNumRealBuilding(iBuilding3, 1)
			
			NotificationLoad(1, pPlayer, pCity)
		end
	end
end

-- add Pogost stages on tech research
function OnTechResearchedAddStages(iTeam, iTech)
	local pTeam = Teams[iTeam]
	local pPlayer = Players[pTeam:GetLeaderID()]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationRussia or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	if iTech == iTech1 then
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(iBuilding1) and not city:IsHasBuilding(iBuilding2) then
				city:SetNumRealBuilding(iBuilding2, 1)
				
				NotificationLoad(2, pPlayer, city)
			end
		end
	end

	if iTech == iTech2 then
		local pTeam = Teams[iTeam]
		local pPlayer = Players[pTeam:GetLeaderID()]

		for city in pPlayer:Cities() do
			if city:IsHasBuilding(iBuilding1) and not city:IsHasBuilding(iBuilding3) then
				city:SetNumRealBuilding(iBuilding3, 1)
				
				NotificationLoad(3, pPlayer, city)
			end
		end
	end
end

-- set Pogost Stages on city capture according to techs
function OnCaptureAddStages(iPlayer, iCapital, iX, iY, iNewPlayer, iConquest1, iConquest2)
	local pNewPlayer = Players[iNewPlayer]
	local pTeam = Teams[pNewPlayer:GetTeam()]
	local pCity = Map.GetPlot(iX, iY):GetWorkingCity()

	if not (pNewPlayer and (pNewPlayer:GetCivilizationType() == eCivilizationRussia or pNewPlayer:GetCivilizationType() == eCivilizationRome)) then return end

	if pCity:IsHasBuilding(iBuilding1) then
		if pTeam:GetTeamTechs():HasTech(iTech1) and not pCity:IsHasBuilding(iBuilding2) then
			pCity:SetNumRealBuilding(iBuilding2, 1)
				
			NotificationLoad(2, pNewPlayer, pCity)
		end

		if pTeam:GetTeamTechs():HasTech(iTech2) and not pCity:IsHasBuilding(iBuilding3) then
			pCity:SetNumRealBuilding(iBuilding3, 1)
				
			NotificationLoad(3, pNewPlayer, pCity)
		end
	end
end

function NotificationLoad(iSet, pPlayer, pCity)
	if iSet == 0 then
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(0, 
			'Player constructed Pogost - Stage 1 in [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] and received automatic free upgrade to Stage 2.', 
			'Pogost upgrade in '..pCity:GetName(), 
			pCity:GetX(), pCity:GetY())
		end
	elseif iSet == 1 then
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(0, 
			'Player constructed Pogost - Stage 1 and 2 in [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] and received automatic free upgrade to Stage 3.', 
			'Pogost upgrade in '..pCity:GetName(), 
			pCity:GetX(), pCity:GetY())
		end
	elseif iSet == 2 then
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(0, 
			'Player researched Banking and received free Pogost upgrade to Stage 2 in [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR].', 
			'Pogost upgrade in '..pCity:GetName(), 
			pCity:GetX(), pCity:GetY())
		end
	else
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(0, 
			'Player researched Banking and received free Pogost upgrade to Stage 3 in [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR].', 
			'Pogost upgrade in '..pCity:GetName(), 
			pCity:GetX(), pCity:GetY())
		end
	end
end

if Game.IsCivEverActive(eCivilizationRussia) then
	GameEvents.CityConstructed.Add(OnConstructionAddStages)
	GameEvents.TeamTechResearched.Add(OnTechResearchedAddStages)
	GameEvents.CityCaptureComplete.Add(OnCaptureAddStages)
end
