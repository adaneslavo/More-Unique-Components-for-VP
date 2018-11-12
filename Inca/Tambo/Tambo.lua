--------------------------------------------------------------
-- Inca - Tambo
-- Coca Monopoly gives promotion to eligible military and civilian units
-- Author: Infixo
-- DateCreated: 2018-02-03
--------------------------------------------------------------

local eResourceCoca = GameInfoTypes.RESOURCE_COCA
local eCivilizationInca = GameInfoTypes.CIVILIZATION_INCA

-- creates 2 sources of flax if possible. Checks 6 different conditions in total prioritizing player tiles over unowned ones
function TamboPlaceCoca(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if not(pPlayer and pPlayer:GetCivilizationType() == eCivilizationInca) then return end
	if iBuilding == GameInfoTypes.BUILDING_INCA_TAMBO then
	
		local pCity = pPlayer:GetCityByID(iCity)
		local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY())
		pPlot:SetResourceType(eResourceCoca, 1)
		pPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_PLANTATION)
		pPlot:SetImprovementType(-1)
	end
end

function CocaRemoveOnRaze(hexPos, iOldOwner, cityID, iNewOwner)
	local pPlayer = Players[iOldOwner]
	local pCity = pPlayer:GetCityByID(cityID)
	local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY())
	
	if pPlot:GetResourceType() == eResourceCoca then
		pPlot:SetResourceType(-1)
	end
end


function CocaMonopoly(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for unit in pPlayer:Units() do
		if unit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then unit:SetHasPromotion(GameInfoTypes.PROMOTION_COCA, pPlayer:HasGlobalMonopoly(eResourceCoca)) end
	end
end

if Game.IsCivEverActive(eCivilizationInca) then
	GameEvents.CityConstructed.Add(TamboPlaceCoca)
	Events.SerialEventCityDestroyed.Add(CocaRemoveOnRaze)
	GameEvents.PlayerDoTurn.Add(CocaMonopoly)
end
