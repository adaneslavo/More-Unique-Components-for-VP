--------------------------------------------------------------------------------------------------------------------------
-- ALAN CAVALRY
--------------------------------------------------------------------------------------------------------------------------
--JFD_Vandals_AlanCavalry_PlayerDoTurn
local unitClassSettlerID		 = GameInfoTypes["UNITCLASS_SETTLER"],["UNITCLASS_WORKER"]
local unitPromotionAlanCavalryID = GameInfoTypes["PROMOTION_JFD_ALAN_CAVALRY"]
function JFD_Vandals_AlanCavalry_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitVandalsID)) then return end
	for unit in player:Units() do
		if unit:GetUnitClassType() == unitClassSettlerID then
			local plot = unit:GetPlot()
			if (plot:GetUnit() and plot:GetUnit():IsHasPromotion(unitPromotionAlanCavalryID)) then
				unit:ChangeMoves(120)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Vandals_AlanCavalry_PlayerDoTurn)
--==========================================================================================================================
--==========================================================================================================================