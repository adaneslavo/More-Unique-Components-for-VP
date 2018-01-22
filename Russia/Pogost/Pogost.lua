-- Pogost
-- Author: adan_eslavo
-- DateCreated: 28/10/2017
--------------------------------------------------------------
function Pogost(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)

	if iBuilding == GameInfoTypes.BUILDING_RUSSIA_POGOST_1 then
		local iBuilding2 = GameInfoTypes.BUILDING_RUSSIA_POGOST_2
		local iBuilding3 = GameInfoTypes.BUILDING_RUSSIA_POGOST_3
		local pTeam = Teams[pPlayer:GetTeam()]

		if pTeam:GetTeamTechs():HasTech(GameInfoTypes.TECH_BANKING) then
			pCity:SetNumRealBuilding(iBuilding2, 1)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				pPlayer:AddNotification(147, 'Player received free Pogost upgrade to Stage 2 in '..pCity:GetName()..'.', 'Pogost upgrade in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
			end
		end
			
		if pTeam:GetTeamTechs():HasTech(GameInfoTypes.TECH_ARCHITECTURE) then
			pCity:SetNumRealBuilding(iBuilding3, 1)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				pPlayer:AddNotification(147, 'Player received free Pogost upgrade to Stage 3 in '..pCity:GetName()..'.', 'Pogost upgrade in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
			end
		end
	end
end

function OnTechResearched(iTeam, iTech)
	local pTeam = Teams[iTeam]
	local pPlayer = Players[pTeam:GetLeaderID()]

	if iTech == GameInfoTypes.TECH_BANKING then
		local iBuilding = GameInfoTypes.BUILDING_RUSSIA_POGOST_1
		local iBuilding2 = GameInfoTypes.BUILDING_RUSSIA_POGOST_2
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iBuilding) then
				pCity:SetNumRealBuilding(iBuilding2, 1)
				
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					pPlayer:AddNotification(147, 'Player received free Pogost upgrade to Stage 2 in '..pCity:GetName()..'.', 'Pogost upgrade in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
				end
			end
		end
	end

	if iTech == GameInfoTypes.TECH_ARCHITECTURE then
		local pTeam = Teams[iTeam]
		local pPlayer = Players[pTeam:GetLeaderID()]
		local iBuilding = GameInfoTypes.BUILDING_RUSSIA_POGOST_1
		local iBuilding3 = GameInfoTypes.BUILDING_RUSSIA_POGOST_3
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iBuilding) then
				pCity:SetNumRealBuilding(iBuilding3, 1)
				
				if pPlayer:IsHuman() then
					pPlayer:AddNotification(147, 'Player received free Pogost upgrade to Stage 3 in '..pCity:GetName()..'.', 'Pogost upgrade in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
				end
			end
		end
	end
end

GameEvents.CityConstructed.Add(Pogost)
GameEvents.TeamTechResearched.Add(OnTechResearched)