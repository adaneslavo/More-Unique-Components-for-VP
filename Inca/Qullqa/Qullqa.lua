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
	
	if pCity then
		local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY())
	
		pPlot:SetResourceType(eResourceCoca, 1)
		pPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_PLANTATION)
		pPlot:SetImprovementType(-1)
		-- removes plantation after connecting Coca to trade list
		if pPlot:IsMountain() then
			pPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_JFD_MACHU_PICCHU)
		end
	end
end

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
	GameEvents.PlayerDoTurn.Add(OnTurnCheckMonopoly)
end
