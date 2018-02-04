-- HorseDad
-- Author: pineappledan, adan_eslavo
-- DateCreated: 02/02/2018
-- 2018-02-04 Modified by Infixo
--------------------------------------------------------------
local iSofa = GameInfoTypes.PROMOTION_HORSE_FATHER
local iHorseDadEffect = GameInfoTypes.PROMOTION_HORSE_FATHER_EFFECT

function HorseDaddy(iPlayer)
	local pPlayer = Players[iPlayer]

	for pUnit in pPlayer:Units() do
		if GameInfo.Units[pUnit:GetUnitType()].IsMounted or pUnit:GetUnitCombatType() == UNITCOMBAT_MOUNTED then
			pUnit:SetHasPromotion(iHorseDadEffect, pUnit:IsWithinDistanceOfUnitPromotion(iSofa, 2, true, false))
		end
	end
end

GameEvents.PlayerEndTurnCompleted.Add(HorseDaddy)
