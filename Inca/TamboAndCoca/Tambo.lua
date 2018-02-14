--------------------------------------------------------------
-- Inca - Tambo
-- Author: Infixo, pineappledan
-- DateCreated: 2018-02-03
--------------------------------------------------------------
-- Coca Placement underneath city
function TamboPlaceCoca(iPlayer, iCity, iBuilding)
	--print("TamboPlaceCoca",iPlayer, iCity, iBuilding)
	-- check for Inca
	local pPlayer = Players[iPlayer]
	if not( pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_INCA ) then return end
	-- check for Tambo
	if iBuilding ~= GameInfoTypes.BUILDING_TAMBO then return end
	local pCity = pPlayer:GetCityByID(iCity)
	if not pCity then return end
	-- Spawn Coca -- currently checks if any resource is below
	local iCityPlot = iCity:GetPlot()
	if iCityPlot:GetNumResource() == 0 then
	--or "for iCityPlot do"
		iCityPlot:SetResourceType(GameInfoTypes.RESOURCE_COCA, 1)
		bCocaCreated = true
	end

	-- send a proper notification
	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		if bCocaCreated then 
			pPlayer:AddNotification(
				NotificationTypes.NOTIFICATION_DISCOVERED_LUXURY_RESOURCE,
				'The City of [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] constructed a Tambo and [COLOR_POSITIVE_TEXT]created[ENDCOLOR] a new source of [ICON_RES_COCA] Coca.', -- use TXT_KEY_ here
				'New source of Coca in '..pCity:GetName()..' [COLOR_POSITIVE_TEXT]created[ENDCOLOR]',
				iCityPlot:GetX(), iCityPlot:GetY(), GameInfoTypes.RESOURCE_COCA)
		end
	end
end

-- Coca resource is removed when a city is razed

function CocaRemoved(iHexPos, iPlayer1, iCity, iPlayer2)
	local pPlayer = Players[iPlayer1]
	local pCity = pPlayer:GetCityByID(iCity)
	local iCityPlot = iCity:GetPlot()
	for iCityPlot do		
		iCityPlot:SetResourceType(GameInfoTypes.RESOURCE_COCA, 0)
	end			
end			
-- Coca Monopoly gives promotion to eligible military and civilian units

local ePromotionMilitary = GameInfoTypes.PROMOTION_COCA_MILITARY
local ePromotionCivilian = GameInfoTypes.PROMOTION_COCA_WORKER

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

function OnPlayerDoTurnTambo(iPlayer)
	local pPlayer = Players[iPlayer]
	local bHasCocaMonopoly = pPlayer:HasGlobalMonopoly(GameInfoTypes.RESOURCE_COCA)
	for unit in pPlayer:Units() do
		if tEligibleCombats[ unit:GetUnitCombatType() ] then unit:SetHasPromotion(ePromotionMilitary, bHasCocaMonopoly) end
	end
	for unit in pPlayer:Units() do
		if tEligibleClasses[ unit:GetUnitClassType() ] then unit:SetHasPromotion(ePromotionCivilian, bHasCocaMonopoly) end
	end
end

GameEvents.PlayerDoTurn.Add(OnPlayerDoTurnTambo)
GameEvents.CityConstructed.Add(TamboPlaceCoca)
Events.SerialEventCityDestroyed.Add(CocaRemoved)
