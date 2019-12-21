-- Goedendag
-- Author: adan_eslavo
-- DateCreated: 12/12/2017
-- 2018-01-22 Infixo, RESOURCECLASS_LUXURY used
-- 2018-03-14 Infixo, no self-boost for Goedendags
--------------------------------------------------------------
--[[local eGoedendag = GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_GOEDENDAG
local eGoedendagEffect = GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT

function GoedendagBonus(iPlayer)
	local pPlayer = Players[iPlayer]

	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitCombatType() >= 0 and pUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
			pUnit:SetHasPromotion(eGoedendagEffect, pUnit:IsAdjacentToUnitPromotion(eGoedendag, true, false))
		end
	end
end

function ThisIsMyTown(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_BURGEMEESTE) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_BURGEMEESTE_EFFECT, pUnit:IsGarrisoned())
		end
	end
end

GameEvents.PlayerEndTurnCompleted.Add(GoedendagBonus)
GameEvents.PlayerDoTurn.Add(ThisIsMyTown)
]]