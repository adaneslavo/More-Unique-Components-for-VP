-- Pogost
-- Author: adan_eslavo
-- DateCreated: 28/10/2017
--------------------------------------------------------------
local iBuilding1 = GameInfoTypes.BUILDING_RUSSIA_POGOST_1
local iBuilding2 = GameInfoTypes.BUILDING_RUSSIA_POGOST_2
local iBuilding3 = GameInfoTypes.BUILDING_RUSSIA_POGOST_3
local iTech1 = GameInfoTypes.TECH_BANKING
local iTech2 = GameInfoTypes.TECH_ARCHITECTURE

function Pogost(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
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

function OnTechResearched(iTeam, iTech)
	local pTeam = Teams[iTeam]
	local pPlayer = Players[pTeam:GetLeaderID()]

	if iTech == iTech1 then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iBuilding1) and not pCity:IsHasBuilding(iBuilding2) then
				pCity:SetNumRealBuilding(iBuilding2, 1)
				
				NotificationLoad(2, pPlayer, pCity)
			end
		end
	end

	if iTech == iTech2 then
		local pTeam = Teams[iTeam]
		local pPlayer = Players[pTeam:GetLeaderID()]

		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iBuilding1) and not pCity:IsHasBuilding(iBuilding3) then
				pCity:SetNumRealBuilding(iBuilding3, 1)
				
				NotificationLoad(3, pPlayer, pCity)
			end
		end
	end
end

function PogostOnCapture(iPlayer, iCapital, iX, iY, iNewPlayer, iConquest1, iConquest2)
	local pNewPlayer = Players[iNewPlayer]

	if not pNewPlayer:IsAlive() then return end
	
	local pTeam = Teams[pNewPlayer:GetTeam()]
	local pCity = Map.GetPlot(iX, iY):GetWorkingCity()

	if not pNewPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ROME then
		pCity:SetNumRealBuilding(iBuilding2, 0)
		pCity:SetNumRealBuilding(iBuilding3, 0)
	else
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

GameEvents.CityConstructed.Add(Pogost)
GameEvents.TeamTechResearched.Add(OnTechResearched)
GameEvents.CityCaptureComplete.Add(PogostOnCapture)