-- Dromon
-- Author: adan_eslavo
-- DateCreated: 30/11/2017
--------------------------------------------------------------
include("FLuaVector.lua")

function GreekFire(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]

	if pAttackingPlayer ~= nil and pDefendingPlayer ~= nil then
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)

		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE) then
			if defenderFinalDamage < defenderMaxHP then
				local pDefendingUnit = Players[iDefendingPlayer]:GetUnitByID(iDefendingUnit)
				
				if pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_ON_UNIT) then				
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2_ON_UNIT, true)
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_ON_UNIT, false)
				elseif pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2_ON_UNIT) then
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3_ON_UNIT, true)
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2_ON_UNIT, false)
				elseif pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3_ON_UNIT) then
				else
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_ON_UNIT, true)
				end
			end
		end
	end
end

function FireFromGreekFire(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_ON_UNIT) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_ON_UNIT, false)
			pUnit:ChangeDamage(10)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]Fire[ENDCOLOR]", 1.5)
			end
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2_ON_UNIT) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2_ON_UNIT, false)
			pUnit:ChangeDamage(20)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]Huge fire[ENDCOLOR]", 1.5)
			end
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3_ON_UNIT) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3_ON_UNIT, false)
			pUnit:ChangeDamage(30)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]Raging Fire[ENDCOLOR]", 1.5)
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CombatResult.Add(GreekFire)
GameEvents.PlayerDoTurn.Add(FireFromGreekFire)
