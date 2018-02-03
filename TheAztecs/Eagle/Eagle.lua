function EagleSpawnWorker(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]

	if pAttackingPlayer ~= nil and pDefendingPlayer ~= nil then
		local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
		
		if(pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CAPTIVES_OF_WAR) and iDefenderFinalDamage >= iDefenderMaxHP) then
			local iRand = Game.Rand(100, "Eagle capture roll")
			if (iRand < 50) then
				pAttackingPlayer:InitUnit(GameInfoTypes["UNIT_WORKER"], iPlotX, iPlotY)
			end
		end
	end
end


GameEvents.CombatEnded.Add(EagleSpawnWorker)