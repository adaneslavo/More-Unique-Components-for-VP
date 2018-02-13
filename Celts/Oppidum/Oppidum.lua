-- Oppidum
-- Author: adan_eslavo
-- DateCreated: 30/10/2017
--------------------------------------------------------------
local iUnitX
local iUnitY

function OppidumAddsHP(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	local pPlayer = Players[iOwner]
	
	if (iNewImprovement == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM and iNewImprovement ~= iOldImprovement) or (iNewImprovement == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM and iNewImprovement == iOldImprovement and not bPillaged) then
		local pPlot = Map.GetPlot(iX, iY)

		if pPlot ~= nil then
			pCity = GetNearestCity(pPlayer, pPlot)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pCity:GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) + 1)
		end
	end

	if (iOldImprovement == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM and iOldImprovement ~= iNewImprovement) or (iOldImprovement == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM and iOldImprovement == iNewImprovement and bPillaged) then
		local pPlot = Map.GetPlot(iX, iY)

		if pPlot ~= nil then
			pCity = GetNearestCity(pPlayer, pPlot)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pCity:GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) - 1)
		end
	end
end

function OppidumMoveHP(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	local pFoundCity = Map.GetPlot(iX, iY):GetWorkingCity()

	for iCityPlot = 1, pFoundCity:GetNumCityPlots() - 1, 1 do
		local pSpecificPlot = pFoundCity:GetCityIndexPlot(iCityPlot)

		if pSpecificPlot and pSpecificPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM and not pSpecificPlot:IsImprovementPillaged() then
			local pCheckedCity = GetNearestCity(pPlayer, pSpecificPlot)

			if pCheckedCity == pFoundCity then
				pFirstCity = GetNearestCityExcluded(pPlayer, pSpecificPlot, pFoundCity)
				pFirstCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pFirstCity:GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) - 1)
				pFoundCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pFoundCity:GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) + 1)
			end
		end
	end
end

function OppidumOnCapture(iPlayer, iCapital, iX, iY, iNewPlayer, iConquest1, iConquest2)
	local pNewPlayer = Players[iNewPlayer]
	local pOldPlayer = Players[iPlayer]
	local pCapturedCity = Map.GetPlot(iX, iY):GetWorkingCity()

	if pOldPlayer then
		for iCityPlot = 1, pCapturedCity:GetNumCityPlots() - 1, 1 do
			local pSpecificPlot = pCapturedCity:GetCityIndexPlot(iCityPlot)

			if pSpecificPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM and not pSpecificPlot:IsImprovementPillaged() then
				local pCheckedPlayer = Players[pSpecificPlot:GetOwner()]
				local pCheckedCity = GetNearestCityFor2Players(pOldPlayer, pNewPlayer, pSpecificPlot)
				
				if pCheckedCity == pCapturedCity then
					if pCheckedPlayer ~= pNewPlayer then
						pNewCity = GetNearestCity(pOldPlayer, pSpecificPlot)
						pCapturedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pCapturedCity:GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) - 1)
						pNewCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pNewCity:GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) + 1)
					else
						pCapturedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pCapturedCity:GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) + 1)
					end
				else
					if pCheckedPlayer == pNewPlayer then
						pCheckedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP, pCheckedCity:GetNumBuilding(GameInfoTypes.BUILDING_DUMMYCITYHP) - 1)
					end
				end
			end
		end
	end					
end

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

function GetNearestCityExcluded(pPlayer, pPlot, pExcludedCity)
	local iDistance = 10000
	local pNearestCity = nil

	for pCity in pPlayer:Cities() do
		if pCity ~= pExcludedCity then
			local iDistanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())

			if(iDistanceToCity < iDistance and iDistanceToCity <= 3) then
				iDistance = iDistanceToCity
				pNearestCity = pCity
			end
		end
	end

	return pNearestCity
end

function GetNearestCityFor2Players(pPlayer1, pPlayer2, pPlot)
	local iDistance = 10000
	local pNearestCity = nil

	for pCity in pPlayer1:Cities() do
		local iDistanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())

		if(iDistanceToCity < iDistance and iDistanceToCity <= 3) then
			iDistance = iDistanceToCity
			pNearestCity = pCity
		end
	end

	for pCity in pPlayer2:Cities() do
		local iDistanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())

		if(iDistanceToCity < iDistance and iDistanceToCity <= 3) then
			iDistance = iDistanceToCity
			pNearestCity = pCity
		end
	end

	return pNearestCity
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
			if iUnitX and iUnitY then	
				local pPlot = Map.GetPlot(iUnitX, iUnitY)

				if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CELTS_OPPIDUM then
					local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
			
					pAttackingUnit:SetXY(iUnitX, iUnitY)
				end
			end
		end
	end
end

GameEvents.CombatResult.Add(OppidumGarrisonBefore)
GameEvents.CombatEnded.Add(OppidumGarrisonAfter)
GameEvents.TileImprovementChanged.Add(OppidumAddsHP)
GameEvents.PlayerCityFounded.Add(OppidumMoveHP)
GameEvents.CityCaptureComplete.Add(OppidumOnCapture)