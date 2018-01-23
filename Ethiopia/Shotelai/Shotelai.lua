-- Shotelai
-- Author: adan_eslavo
-- DateCreated: 12/11/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function Maim(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP)
	local pAttackingPlayer = Players[iAttackingPlayer]

	if pAttackingPlayer ~= nil then
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)

		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_ETHIOPIA_MAIM) then
			if iDefenderFinalDamage < iDefenderMaxHP then
				local pDefendingUnit = Players[iDefendingPlayer]:GetUnitByID(iDefendingUnit)
				
				pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ETHIOPIA_MAIM_ON_UNIT, true)
			end
		end
	end
end

function ReducedMovementMaim(iPlayer)
	local pPlayer = Players[iPlayer]
		
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_ETHIOPIA_MAIM_2_ON_UNIT) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ETHIOPIA_MAIM_2_ON_UNIT, false)
		end

		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_ETHIOPIA_MAIM_ON_UNIT) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ETHIOPIA_MAIM_2_ON_UNIT, true)
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ETHIOPIA_MAIM_ON_UNIT, false)
			pUnit:ChangeMoves(-60)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())

				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_LIGHT_GREY]-1 [ICON_ARROW_RIGHT] Maim[ENDCOLOR]", 1)
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CombatResult.Add(Maim)
GameEvents.PlayerDoTurn.Add(ReducedMovementMaim)
