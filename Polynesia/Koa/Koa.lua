-- Koa
-- Author: adan_eslavo
-- DateCreated: 3/11/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function Leiomano(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]

	if pAttackingPlayer ~= nil and pDefendingPlayer ~= nil then
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)

		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA) then
			if iDefenderFinalDamage < iDefenderMaxHP then
				local pDefendingUnit = Players[iDefendingPlayer]:GetUnitByID(iDefendingUnit)
				
				if pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_ON_UNIT) then				
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_2_ON_UNIT, true)
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_ON_UNIT, false)
				elseif pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_2_ON_UNIT) then
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_3_ON_UNIT, true)
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_2_ON_UNIT, false)
				elseif pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_3_ON_UNIT) then
				else
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_ON_UNIT, true)
				end
			end
		end
	end
end

function BleedFromLeiomano(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_ON_UNIT) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_ON_UNIT, false)
			pUnit:ChangeDamage(10)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]-10 Bleeding[ENDCOLOR]", 1)
			end
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_2_ON_UNIT) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_2_ON_UNIT, false)
			pUnit:ChangeDamage(20)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]-20 Heavy bleeding[ENDCOLOR]", 1)
			end
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_3_ON_UNIT) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_3_ON_UNIT, false)
			pUnit:ChangeDamage(30)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]-30 Massive bleeding[ENDCOLOR]", 1)
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CombatResult.Add(Leiomano)
GameEvents.PlayerDoTurn.Add(BleedFromLeiomano)
