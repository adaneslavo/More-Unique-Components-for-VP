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

		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_0) then
			if defenderFinalDamage < defenderMaxHP then
				local pDefendingUnit = Players[iDefendingPlayer]:GetUnitByID(iDefendingUnit)
				
				if pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_1) then				
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2, true)
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_1, false)
				elseif pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2) then
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3, true)
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2, false)
				elseif pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3) then
				else
					pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_1, true)
				end
			end
		end
	end
end

function FireFromGreekFire(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_1) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_1, false)
			pUnit:ChangeDamage(10)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]Fire[ENDCOLOR]", 1.5)
			end
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2, false)
			pUnit:ChangeDamage(20)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]Huge fire[ENDCOLOR]", 1.5)
			end
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3, false)
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
