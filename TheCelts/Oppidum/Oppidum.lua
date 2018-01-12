-- Oppidum
-- Author: adan_eslavo
-- DateCreated: 30/10/2017
--------------------------------------------------------------
function OppidumAddsHP(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	if iNewImprovement == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM then
		local pPlot = Map.GetPlot(iX, iY)
		local pPlayer = Players[pPlot:GetOwner()]

		pPlot:GetWorkingCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pPlot:GetWorkingCity():GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) + 1)
	end

	if iOldImprovement == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM then
		local pPlot = Map.GetPlot(iX, iY)
		local pPlayer = Players[pPlot:GetOwner()]

		pPlot:GetWorkingCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pPlot:GetWorkingCity():GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) - 1)
	end
end

function OppidumGarrisonBefore(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)
	local pAttackingPlayer = Players[iAttackingPlayer]

	if pAttackingPlayer ~= nil then
		if defenderFinalDamage > defenderMaxHP then
			local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
			iUnitX = pAttackingUnit:GetX()
			iUnitY = pAttackingUnit:GetY()
		end
	end
end

function OppidumGarrisonAfter(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)
	local pAttackingPlayer = Players[iAttackingPlayer]

	if pAttackingPlayer ~= nil then
		if defenderFinalDamage > defenderMaxHP then
			local pPlot = Map.GetPlot(iUnitX, iUnitY)

			if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM then
				local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
			
				pAttackingUnit:SetXY(iUnitX, iUnitY)
			end
		end
	end
end

GameEvents.CombatResult.Add(OppidumGarrisonBefore)
GameEvents.CombatEnded.Add(OppidumGarrisonAfter)
GameEvents.TileImprovementChanged.Add(OppidumAddsHP)