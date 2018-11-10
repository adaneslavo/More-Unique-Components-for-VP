-- Oppidum
-- Author: adan_eslavo
-- DateCreated: 30/10/2017
--------------------------------------------------------------
local iUnitX
local iUnitY

local eBuildingDummyForOppidum = GameInfoTypes.BUILDING_D_FOR_OPPIDUM
local eImprovementOppidum = GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM

-- makes unit stay on attack if it was on Oppidum
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

-- same as above
function OppidumGarrisonAfter(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)
	local pAttackingPlayer = Players[iAttackingPlayer]

	if pAttackingPlayer ~= nil then
		if defenderFinalDamage > defenderMaxHP then
			if iUnitX and iUnitY then	
				local pPlot = Map.GetPlot(iUnitX, iUnitY)

				if pPlot:GetImprovementType() == eImprovementOppidum then
					local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
			
					pAttackingUnit:SetXY(iUnitX, iUnitY)
				end
			end
		end
	end
end

-- adds or removes HP on construction, destroying or pillaging Oppidum
function OnImprovementChangeMoveHP(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	if not (iNewImprovement == eImprovementOppidum and iNewImprovement ~= iOldImprovement) then return end

	local pPlot = Map.GetPlot(iX, iY)

	if not pPlot then return end

	local pPlayer = Players[iOwner]
	local pCity = GetNearestCity(pPlayer, pPlot)
	
	if pCity then
		pCity:SetNumRealBuilding(eBuildingDummyForOppidum, pCity:GetNumBuilding(eBuildingDummyForOppidum) + 1)
	end
end

	-- side function looking for nearest city
	function GetNearestCity(pPlayer, pPlot)
		local iDistance = 10000
		local pNearestCity = nil

		for pCity in pPlayer:Cities() do
			local iDistanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())

			if(iDistanceToCity < iDistance and iDistanceToCity <= 3) then
				iDistance = iDistanceToCity
				pNearestCity = pCity
			end
		end

		return pNearestCity
	end

if Game.IsCivEverActive(GameInfoTypes.CIVILIZATION_CELTS) then
	GameEvents.TileImprovementChanged.Add(OnImprovementChangeMoveHP)
	GameEvents.CombatResult.Add(OppidumGarrisonBefore)
	GameEvents.CombatEnded.Add(OppidumGarrisonAfter)
end
