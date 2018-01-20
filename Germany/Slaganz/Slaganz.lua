local pBarbarian = nil

for iPlayer, pPlayer in pairs(Players) do
    if pPlayer:IsBarbarian() then
        pBarbarian = pPlayer
    end
end

function SlaganzConvert(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
	local pDefendingPlayer = Players[iDefendingPlayer]
	local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
	if(pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_FUROR_TEUTONICUS) and iDefenderFinalDamage >= iDefenderMaxHP and pDefendingPlayer == pBarbarian) then
		local iRand = Game.Rand(100, "Slaganz capture roll")
		if (iRand < 75) then
			local pNewUnit = pAttackingPlayer:InitUnit(pDefendingUnit:GetUnitType(), pDefendingUnit:GetX(), pDefendingUnit:GetY())
			pNewUnit:Convert(pDefendingUnit)
			pNewUnit:SetDamage(75)
		end
	end
end

GameEvents.CombatEnded.Add(SlaganzConvert)