local iTourismEvent = GameInfoTypes['PLAYER_EVENT_CHOICE_PRACINHA_TOURISM']

function PracinhaTourism(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
	local pDefendingPlayer = Players[iDefendingPlayer]
	local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingPlayer)
	if(pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_TOURISM) and iDefenderFinalDamage >= iDefenderMaxHP) then
		if pAttackingPlayer:GetEventChoiceCooldown(iTourismEvent) == 0 and not pAttackingPlayer:IsEventChoiceActive(iTourismEvent) then
			pAttackingPlayer:DoEventChoice(iTourismEvent)
			pAttackingPlayer:DoCancelEventChoice(iTourismEvent)
		end
	end
end


GameEvents.CombatEnded.Add(PracinhaTourism)