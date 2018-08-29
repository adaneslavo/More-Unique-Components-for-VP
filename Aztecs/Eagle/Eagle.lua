-- Eagle
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
local ePromotionCaptives = GameInfoTypes.PROMOTION_UNIT_AZTEC_CAPTIVES_OF_WAR
local eUnitWorker = GameInfoTypes.UNIT_WORKER

-- 50% chance to spawn worker unit on kill by an Eagle
function OnCombatEndSpawnWorker(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	
	if not pAttackingPlayer then return end

	local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)

	if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(ePromotionCaptives) and (iDefenderFinalDamage >= iDefenderMaxHP) and (iDefenderMaxHP <= 100) then
		if Game.Rand(2, "Eagle capture roll") == 1 then
			pAttackingPlayer:InitUnit(eUnitWorker, iPlotX, iPlotY)
		end
	end
end

GameEvents.CombatEnded.Add(OnCombatEndSpawnWorker)