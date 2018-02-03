-- Pracinha
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
local iTourismEvent = GameInfoTypes['PLAYER_EVENT_CHOICE_PRACINHA_TOURISM']

function PracinhaTourism(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]

	if pAttackingPlayer ~= nil and pDefendingPlayer ~= nil then
		local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
			
		if (pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_BRAZIL_TOURISM) and iDefenderFinalDamage >= iDefenderMaxHP) then
			if pAttackingPlayer:GetEventChoiceCooldown(iTourismEvent) == 0 and not pAttackingPlayer:IsEventChoiceActive(iTourismEvent) then
				pAttackingPlayer:DoEventChoice(iTourismEvent)
				pAttackingPlayer:DoCancelEventChoice(iTourismEvent)
			end
		end
	end
end


GameEvents.CombatEnded.Add(PracinhaTourism)