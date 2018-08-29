-- Khopesh
-- Author: BlueGhost, adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
--[[include("FLuaVector.lua")

function KhopeshFatigue(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]

	if pAttackingPlayer ~= nil and pDefendingPlayer ~= nil then
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
		local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
		
		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_EGYPT_FATIGUE) then
			if iDefenderFinalDamage < iDefenderMaxHP and pDefendingUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_MELEE then
				pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_EGYPT_FATIGUE_1, true)
			end
		end
	end
end

function RemoveFatigue(iPlayer)
	local pPlayer = Players[iPlayer]
		
	for pUnit in Players[iPlayer]:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_EGYPT_FATIGUE_1) then
			if pUnit:GetFortifyTurns() > 0 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_EGYPT_FATIGUE_1, false)
			else
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
				
					Events.AddPopupTextEvent(vUnitPosition, "[COLOR_LIGHT_GREY]-30% [COMBAT_STRENGTH] Fatigue[ENDCOLOR]", 1)
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CombatEnded.Add(KhopeshFatigue)
GameEvents.PlayerDoTurn.Add(RemoveFatigue)--]]
