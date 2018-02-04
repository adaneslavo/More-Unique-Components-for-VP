--------------------------------------------------------------
-- Inca - Tambo
-- Coca Monopoly gives promotion to eligible military and civilian units
-- Author: Infixo
-- DateCreated: 2018-02-03
--------------------------------------------------------------
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
