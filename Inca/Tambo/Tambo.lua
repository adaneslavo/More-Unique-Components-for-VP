-- Tambo
-- Author: Infixo, pineappledan, adan_eslavo
-- DateCreated: 03-02-2018
--------------------------------------------------------------
local eBuildingTambo = GameInfoTypes.BUILDING_INCA_TAMBO
local eResourceCoca = GameInfoTypes.RESOURCE_INCA_COCA
local ePromotionAggresion = GameInfoTypes.PROMOTION_UNIT_INCA_COCA_MILITARY
local ePromotionConcentration = GameInfoTypes.PROMOTION_UNIT_INCA_COCA_WORKER

local tEligibleCombats = {
	[GameInfoTypes.UNITCOMBAT_MELEE] = true,
	[GameInfoTypes.UNITCOMBAT_ARCHER] = true,
	[GameInfoTypes.UNITCOMBAT_GUN] = true,
	[GameInfoTypes.UNITCOMBAT_MOUNTED] = true,
	[GameInfoTypes.UNITCOMBAT_ARMOR] = true,
	[GameInfoTypes.UNITCOMBAT_RECON] = true,
	[GameInfoTypes.UNITCOMBAT_SIEGE] = true,
	[GameInfoTypes.UNITCOMBAT_HELICOPTER] = true,
}

local tEligibleClasses = {
	[GameInfoTypes.UNITCLASS_WORKER] = true,
}

-- place Coca resource underneath the city
function OnConstructionPlaceCoca(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_INCA then return end

	if iBuilding ~= eBuildingTambo then return end
	
	local pCity = pPlayer:GetCityByID(iCity)
	local pPlot = pCity:Plot()
	
	if not pPlot then return end
	
	if pPlot:GetNumResource() == 0 then
		pPlot:SetResourceType(eResourceCoca, 1)
		
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local sCityName = pCity:GetName()

			pPlayer:AddNotification(
				NotificationTypes.NOTIFICATION_DISCOVERED_LUXURY_RESOURCE,
				'The City of [COLOR_CYAN]'..sCityName..'[ENDCOLOR] constructed a Tambo and [COLOR_POSITIVE_TEXT]created[ENDCOLOR] a new source of [ICON_RES_COCA] Coca.',
				'New source of Coca in '..sCityName..' [COLOR_POSITIVE_TEXT]created[ENDCOLOR]',
				pPlot:GetX(), pPlot:GetY(), eResourceCoca)
		end
	end
end

-- remove Coca resource if city is destroyed
function OnCityDestroyRemoveCoca(iHexPos, iPlayer1, iCity, iPlayer2)
	local pPlayer = Players[iPlayer1]
	local pCity = pPlayer:GetCityByID(iCity)
	local pPlot = pCity:Plot()
	
	pPlot:SetResourceType(eResourceCoca, 0)	
end			

-- set promotion if player has Coca monopoly
function OnTurnSetPromotions(iPlayer)
	local pPlayer = Players[iPlayer]
	local bHasCocaMonopoly = pPlayer:HasGlobalMonopoly(eResourceCoca)
	
	for unit in pPlayer:Units() do
		if tEligibleCombats[ unit:GetUnitCombatType() ] then unit:SetHasPromotion(ePromotionAggresion, bHasCocaMonopoly) end
	end
	
	for unit in pPlayer:Units() do
		if tEligibleClasses[ unit:GetUnitClassType() ] then unit:SetHasPromotion(ePromotionConcentration, bHasCocaMonopoly) end
	end
end

GameEvents.PlayerDoTurn.Add(OnTurnSetPromotions)
GameEvents.CityConstructed.Add(OnConstructionPlaceCoca)
Events.SerialEventCityDestroyed.Add(OnCityDestroyRemoveCoca)
