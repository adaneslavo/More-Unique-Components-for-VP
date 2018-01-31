-- Ballista and Legion
-- Author: adan_eslavo
-- DateCreated: 30/12/2017
--------------------------------------------------------------
local iGeneral = GameInfoTypes.UNIT_GREAT_GENERAL
local iLegatus = GameInfoTypes.PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA
local iLegatusEffect = GameInfoTypes.PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT
local iPraefectus = GameInfoTypes.PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_ON_LEGION
local iPraefectusEffect = GameInfoTypes.PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT

function LegatusOnMove(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer];

	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(iLegatus) or pUnit:IsHasPromotion(iPraefectus) then
			local bInRange = false
			local pPlot = pUnit:GetPlot()

			if pPlot == nil then
				break
			end

			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:GetUnitType() == iGeneral then
					bInRange = true
					break
				end
			end

			if not bInRange then
				bInRange = pUnit:IsAdjacentToUnit(iGeneral, true, false)

				if not bInRange then
					for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)		
						
						for iSecondDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
							local pSecondAdjacentPlot = Map.PlotDirection(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), iSecondDirection)
												
							for iVal2 = 0,(pSecondAdjacentPlot:GetNumUnits() - 1) do
								local pAdjacentOfAdjacentUnit = pSecondAdjacentPlot:GetUnit(iVal2)
							
								if pAdjacentOfAdjacentUnit:GetOwner() == iPlayer and pAdjacentOfAdjacentUnit:GetUnitType() == iGeneral then
									bInRange = true
									break
								end
							end
						
							if bInRange then
								break
							end
						end

						if bInRange then
							break
						end
					end
				end
			end

			if pUnit:IsHasPromotion(iLegatus) then
				pUnit:SetHasPromotion(iLegatusEffect, bInRange)
			elseif pUnit:IsHasPromotion(iPraefectus) then
				pUnit:SetHasPromotion(iPraefectusEffect, bInRange)
			end
		end
	end
end

function LegatusOnCreate(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(iLegatus) or pUnit:IsHasPromotion(iPraefectus) then
		local bInRange = false
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:GetUnitType() == iGeneral then
					bInRange = true
					break
				end
			end

			if not bInRange then
				bInRange = pUnit:IsAdjacentToUnit(iGeneral, true, false)

				if not bInRange then
					for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)		
						
						for iSecondDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
							local pSecondAdjacentPlot = Map.PlotDirection(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), iSecondDirection)
												
							for iVal2 = 0,(pSecondAdjacentPlot:GetNumUnits() - 1) do
								local pAdjacentOfAdjacentUnit = pSecondAdjacentPlot:GetUnit(iVal2)
							
								if pAdjacentOfAdjacentUnit:GetOwner() == iPlayer and pAdjacentOfAdjacentUnit:GetUnitType() == iGeneral then
									bInRange = true
									break
								end
							end
						
							if bInRange then
								break
							end
						end

						if bInRange then
							break
						end
					end
				end
			end

			if pUnit:IsHasPromotion(iLegatus) then
				pUnit:SetHasPromotion(iLegatusEffect, bInRange)
			elseif pUnit:IsHasPromotion(iPraefectus) then
				pUnit:SetHasPromotion(iPraefectusEffect, bInRange)
			end
		end
	elseif pUnit:GetUnitType() == iGeneral then
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit:IsHasPromotion(iLegatus) then
					pSameTileUnit:SetHasPromotion(iLegatusEffect, (pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer))
				elseif pSameTileUnit:IsHasPromotion(iPraefectus) then
					pSameTileUnit:SetHasPromotion(iPraefectusEffect, (pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer))
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
					local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
					if pAdjacentUnit:IsHasPromotion(iLegatus) then
						pAdjacentUnit:SetHasPromotion(iLegatusEffect, pAdjacentUnit:GetOwner() == iPlayer)
					elseif pAdjacentUnit:IsHasPromotion(iPraefectus) then
						pAdjacentUnit:SetHasPromotion(iPraefectusEffect, pAdjacentUnit:GetOwner() == iPlayer)
					end
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)		
						
				for iSecondDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pSecondAdjacentPlot = Map.PlotDirection(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), iSecondDirection)
												
					for iVal2 = 0,(pSecondAdjacentPlot:GetNumUnits() - 1) do
						local pAdjacentOfAdjacentUnit = pSecondAdjacentPlot:GetUnit(iVal2)
							
						if pAdjacentOfAdjacentUnit:IsHasPromotion(iLegatus) then
							pAdjacentOfAdjacentUnit:SetHasPromotion(iLegatusEffect, pAdjacentOfAdjacentUnit:GetOwner() == iPlayer)
						elseif pAdjacentOfAdjacentUnit:IsHasPromotion(iPraefectus) then
							pAdjacentOfAdjacentUnit:SetHasPromotion(iPraefectusEffect, pAdjacentOfAdjacentUnit:GetOwner() == iPlayer)
						end
					end
				end
			end
		end
	end
end

function LegatusOnBuild(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(iLegatus) or pUnit:IsHasPromotion(iPraefectus) then
		local bInRange = false
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:GetUnitType() == iGeneral then
					bInRange = true
					break
				end
			end

			if not bInRange then
				bInRange = pUnit:IsAdjacentToUnit(iGeneral, true, false)

				if not bInRange then
					for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)		
						
						for iSecondDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
							local pSecondAdjacentPlot = Map.PlotDirection(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), iSecondDirection)
												
							for iVal2 = 0,(pSecondAdjacentPlot:GetNumUnits() - 1) do
								local pAdjacentOfAdjacentUnit = pSecondAdjacentPlot:GetUnit(iVal2)
							
								if pAdjacentOfAdjacentUnit:GetOwner() == iPlayer and pAdjacentOfAdjacentUnit:GetUnitType() == iGeneral then
									bInRange = true
									break
								end
							end
						
							if bInRange then
								break
							end
						end

						if bInRange then
							break
						end
					end
				end
			end

			if pUnit:IsHasPromotion(iLegatus) then
				pUnit:SetHasPromotion(iLegatusEffect, bInRange)
			elseif pUnit:IsHasPromotion(iPraefectus) then
				pUnit:SetHasPromotion(iPraefectusEffect, bInRange)
			end
		end
	end
end

GameEvents.UnitSetXY.Add(LegatusOnMove)
GameEvents.UnitCreated.Add(LegatusOnCreate)
GameEvents.CityTrained.Add(LegatusOnBuild)