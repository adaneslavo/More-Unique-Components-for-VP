--------------------------------------------------------------
-- Inca - Tambo
-- Coca Monopoly gives promotion to eligible military and civilian units
-- Author: Infixo
-- DateCreated: 2018-02-03
--------------------------------------------------------------
local eResourceCoca = GameInfoTypes.RESOURCE_COCA
local eCivilizationInca = GameInfoTypes.CIVILIZATION_INCA

-- creates Coca under city
function OnConstructionPlaceCoca(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if not(pPlayer and pPlayer:GetCivilizationType() == eCivilizationInca) then return end
	if iBuilding ~= GameInfoTypes.BUILDING_INCA_QULLQA then return end
	
	local pCity = pPlayer:GetCityByID(iCity)
	
	if pCity and pCity:IsOriginalCapital() then
		local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY())
		-- removes Coca dummy building and plant a coca resource under the capital city, regardless of what was there before
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_D_FOR_QULLQA, 0) 
		pPlayer:ChangeNumResourceTotal(eResourceCoca,-1)
		pPlot:SetResourceType(-1)
		pPlot:SetResourceType(eResourceCoca, 1)
		pPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_PLANTATION)
		pPlot:SetImprovementType(-1)
		-- removes plantation after connecting Coca to trade list
		if pPlot:IsMountain() then
			pPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_JFD_MACHU_PICCHU)
		end
	end
end

--function OnFoundPlaceCoca(iPlayer, iX, iY)
--	local pPlayer = Players[iPlayer]
--	
--	if not(pPlayer and pPlayer:GetCivilizationType() == eCivilizationInca) then return end
--
--	local pTeam = Teams[pPlayer:GetTeam()]
--	if pTeam:GetTeamTechs():HasTech(GameInfoTypes.TECH_BANKING) then
--
--		local pPlot = Map.GetPlot(iX, iY)
--		if pPlot:GetNumResource() == 0 then
--	
--			pPlot:SetResourceType(eResourceCoca, 1)
--			pPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_PLANTATION)
--			pPlot:SetImprovementType(-1)
--			-- removes plantation after connecting Coca to trade list
--			if pPlot:IsMountain() then
--				pPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_JFD_MACHU_PICCHU)
--			end
--		end
--	end
--end

-- checks from monopoly bonus for Coca
function OnTurnCheckMonopoly(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for unit in pPlayer:Units() do
		if unit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then 
			unit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_INCA_COCA, pPlayer:HasGlobalMonopoly(eResourceCoca)) 
		end
	end
end

if Game.IsCivEverActive(eCivilizationInca) then
	GameEvents.CityConstructed.Add(OnConstructionPlaceCoca)
--	GameEvents.PlayerCityFounded.Add(OnFoundPlaceCoca)
	GameEvents.PlayerDoTurn.Add(OnTurnCheckMonopoly)
end
