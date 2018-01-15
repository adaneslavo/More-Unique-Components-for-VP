-- Monitor
-- Author: adan_eslavo
-- DateCreated: 15/01/2018
--------------------------------------------------------------
function MonitorOnMove(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]

	for pCity in pPlayer:Cities() do
		local bInRange = false
		local bOnTheSameTile = false
		local pPlot = pCity:Plot()

		if pPlot == nil then
			break
		end

		for iVal = 0,(pPlot:GetNumUnits() - 1) do
			local pSameTileUnit = pPlot:GetUnit(iVal)
				
			if pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_MONITOR"]) then
				bOnTheSameTile = true
				break
			end
		end

		if not bOnTheSameTile then
			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
					local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
					if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_MONITOR"]) then
						bInRange = true
						break
					end
				end

				if bInRange then
					break
				end
			end
		end

		if bInRange or bOnTheSameTile then
			if not pCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE) then
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, 1)
			end
		else
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE) then
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, 0)
			end
		end
	end
end

function MonitorOnCreate(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_MONITOR"]) then
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			if pPlot:IsCity() then
				local pSameTileCity = pPlot:GetWorkingCity()
				
				if pSameTileCity:GetOwner() == iPlayer then
					if not pSameTileCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE) then
						pSameTileCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, 1)
					end
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				if pAdjacentPlot:IsCity() then
					local pAdjacentCity = pAdjacentPlot:GetWorkingCity()
					
					if pAdjacentCity:GetOwner() == iPlayer then
						if not pAdjacentCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE) then
							pAdjacentCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, 1)
						end
					end
				end
			end
		end
	end
end

function MonitorOnBuild(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_MONITOR"]) then
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			if pPlot:IsCity() then
				local pSameTileCity = pPlot:GetWorkingCity()
				
				if pSameTileCity:GetOwner() == iPlayer then
					if not pSameTileCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE) then
						pSameTileCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, 1)
					end
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				if pAdjacentPlot:IsCity() then
					local pAdjacentCity = pAdjacentPlot:GetWorkingCity()
					
					if pAdjacentCity:GetOwner() == iPlayer then
						if not pAdjacentCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE) then
							pAdjacentCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, 1)
						end
					end
				end
			end
		end
	end
end

function MonitorOnCityFound(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(iX, iY)

	if pPlot ~= nil then
		local bInRange = false
		local bOnTheSameTile = false
		
		for iVal = 0,(pPlot:GetNumUnits() - 1) do
			local pSameTileUnit = pPlot:GetUnit(iVal)
				
			if pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_MONITOR"]) then
				bOnTheSameTile = true
				break
			end
		end

		if not bOnTheSameTile then
			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
					local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
					if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_MONITOR"]) then
						bInRange = true
						break
					end
				end

				if bInRange then
					break
				end
			end
		end

		if bInRange or bOnTheSameTile then
			if not pCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE) then
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, 1)
			end
		else
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE) then
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYDEFENSE, 0)
			end
		end
	end
end

GameEvents.UnitSetXY.Add(MonitorOnMove)
GameEvents.UnitCreated.Add(MonitorOnCreate)
GameEvents.CityTrained.Add(MonitorOnBuild)
GameEvents.PlayerCityFounded.Add(MonitorOnCityFound)