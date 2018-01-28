--[[
local pBarbarian = nil
for iPlayer, pPlayer in pairs(Players) do
    if pPlayer:IsBarbarian() then
        pBarbarian = pPlayer
    end
end
--]]
function SlaganzConvert(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]
	if pAttackingPlayer == nil or pDefendingPlayer == nil then return end -- stupidity check
	if not pDefendingPlayer:IsBarbarian() then return end -- Infixo works only on Barbs, right?
	local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
	local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
	if pAttackingUnit == nil or pDefendingUnit == nil then return end -- stupidity check
	if pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_BARBARIAN_ALLIANCE) and iDefenderFinalDamage >= iDefenderMaxHP then
		local iRand = Game.Rand(100, "Slaganz capture roll")
		if (iRand < 51) then
			local pNewUnit = pAttackingPlayer:InitUnit(pDefendingUnit:GetUnitType(), pDefendingUnit:GetX(), pDefendingUnit:GetY())
			pNewUnit:Convert(pDefendingUnit)
			pNewUnit:SetDamage(75)
		end
	end
end

GameEvents.CombatEnded.Add(SlaganzConvert)
