-- Oppidum
-- Author: adan_eslavo
-- DateCreated: 30/10/2017
--------------------------------------------------------------
function OppidumAddsHP(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	if (iNewImprovement == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM and iNewImprovement ~= iOldImprovement) or (iNewImprovement == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM and iNewImprovement == iOldImprovement and not bPillaged) then
		local pPlot = Map.GetPlot(iX, iY)

		if pPlot ~= nil then
			local tCitiesFound = {}
			local iTableRow = 0
			local bFoundInTable = false

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)

				if pAdjacentPlot:IsCity() then
					for i, pTablePlot in pairs(tCitiesFound) do
						print("i=", i, pTablePlot:GetWorkingCity():GetName())
						if pTablePlot == pAdjacentPlot then
							bFoundInTable = true
							break
						else
							bFoundInTable = false
						end
					end
					
					if not bFoundInTable then
						pAdjacentPlot:GetWorkingCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pAdjacentPlot:GetWorkingCity():GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) + 1)
						tCitiesFound[iTableRow] = pAdjacentPlot
						iTableRow = iTableRow + 1
						bFoundInTable = false
					end
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)		
	
				for iSecondDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pSecondAdjacentPlot = Map.PlotDirection(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), iSecondDirection)
							
					if pSecondAdjacentPlot:IsCity() then
						for i, pTablePlot in pairs(tCitiesFound) do
							if pTablePlot == pSecondAdjacentPlot then
								bFoundInTable = true
								break
							else
								bFoundInTable = false
							end
						end
					
						if not bFoundInTable then
							pSecondAdjacentPlot:GetWorkingCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pSecondAdjacentPlot:GetWorkingCity():GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) + 1)
							tCitiesFound[iTableRow] = pSecondAdjacentPlot
							iTableRow = iTableRow + 1
							bFoundInTable = false
						end
					end
				end
			end
		end
	end

	if (iOldImprovement == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM and iOldImprovement ~= iNewImprovement) or (iOldImprovement == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM and iOldImprovement == iNewImprovement and bPillaged) then
		local pPlot = Map.GetPlot(iX, iY)

		if pPlot ~= nil then
			local tCitiesFound = {}
			local iTableRow = 0
			local bFoundInTable = false

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)

				if pAdjacentPlot:IsCity() then
					for i, pTablePlot in pairs(tCitiesFound) do
						if pTablePlot == pAdjacentPlot then
							bFoundInTable = true
							break
						else
							bFoundInTable = false
						end
					end
					
					if not bFoundInTable then
						pAdjacentPlot:GetWorkingCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pAdjacentPlot:GetWorkingCity():GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) - 1)
						tCitiesFound[iTableRow] = pAdjacentPlot
						iTableRow = iTableRow + 1
						bFoundInTable = false
					end
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
					
				for iSecondDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pSecondAdjacentPlot = Map.PlotDirection(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), iSecondDirection)
												
					if pSecondAdjacentPlot:IsCity() then
						for i, pTablePlot in pairs(tCitiesFound) do
							if pTablePlot == pSecondAdjacentPlot then
								bFoundInTable = true
								break
							else
								bFoundInTable = false
							end
						end
					
						if not bFoundInTable then
							pSecondAdjacentPlot:GetWorkingCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pSecondAdjacentPlot:GetWorkingCity():GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) - 1)
							tCitiesFound[iTableRow] = pSecondAdjacentPlot
							iTableRow = iTableRow + 1
							bFoundInTable = false
						end
					end
				end
			end
		end
		print(" ")
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