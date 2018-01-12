-- Ballista and Legion
-- Author: adan_eslavo
-- DateCreated: 30/12/2017
--------------------------------------------------------------
function LegatusOnMove(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer];

	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA"]) or pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_ON_LEGION"]) then
			local bInRange = false
			local bOnTheSameTile = false
			local pPlot = pUnit:GetPlot()

			if pPlot == nil then
				break
			end

			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
					bOnTheSameTile = true
					break
				end
			end

			if not bOnTheSameTile then
				for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
					for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
						local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
						if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
							bInRange = true
							break
						end
					end

					if bInRange then
						break
					end
				end

				if not bInRange then
					for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)		
						
						for iSecondDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
							local pSecondAdjacentPlot = Map.PlotDirection(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), iSecondDirection)
												
							for iVal2 = 0,(pSecondAdjacentPlot:GetNumUnits() - 1) do
								local pAdjacentOfAdjacentUnit = pSecondAdjacentPlot:GetUnit(iVal2)
							
								if pAdjacentOfAdjacentUnit:GetOwner() == iPlayer and pAdjacentOfAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
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

			if bInRange or bOnTheSameTile then
				if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA"]) and not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"], true)
				elseif pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_ON_LEGION"]) and not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"], true)
				end
			else
				if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"], false)
				elseif pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"], false)
				end
			end
		end
	end
end

function LegatusOnCreate(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ROME and pUnit:GetUnitType() == GameInfoTypes.UNIT_GREAT_GENERAL then
		pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"], true)
		pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM"], true)
	end

	if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA"]) or pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_ON_LEGION"]) then
		local bInRange = false
		local bOnTheSameTile = false
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
					bOnTheSameTile = true
					break
				end
			end

			if not bOnTheSameTile then
				for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
					for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
						local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
						if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
							bInRange = true
							break
						end
					end

					if bInRange then
						break
					end
				end

				if not bInRange then
					for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)		
						
						for iSecondDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
							local pSecondAdjacentPlot = Map.PlotDirection(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), iSecondDirection)
												
							for iVal2 = 0,(pSecondAdjacentPlot:GetNumUnits() - 1) do
								local pAdjacentOfAdjacentUnit = pSecondAdjacentPlot:GetUnit(iVal2)
							
								if pAdjacentOfAdjacentUnit:GetOwner() == iPlayer and pAdjacentOfAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
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

			if bInRange or bOnTheSameTile then
				if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA"]) and not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"], true)
				elseif pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_ON_LEGION"]) and not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"], true)
				end
			end
		end
	elseif pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer then
					if pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA"]) and not pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"]) then
						pSameTileUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"], true)
					elseif pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_ON_LEGION"]) and not pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"]) then
						pSameTileUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"], true)
					end
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
					local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
					if pAdjacentUnit:GetOwner() == iPlayer then
						if pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA"]) and not pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"]) then
							pAdjacentUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"], true)
						elseif pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_ON_LEGION"]) and not pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"]) then
							pAdjacentUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"], true)
						end
					end
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)		
						
				for iSecondDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pSecondAdjacentPlot = Map.PlotDirection(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), iSecondDirection)
												
					for iVal2 = 0,(pSecondAdjacentPlot:GetNumUnits() - 1) do
						local pAdjacentOfAdjacentUnit = pSecondAdjacentPlot:GetUnit(iVal2)
							
						if pAdjacentOfAdjacentUnit:GetOwner() == iPlayer and pAdjacentOfAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
							if pAdjacentOfAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA"]) and not pAdjacentOfAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"]) then
								pAdjacentOfAdjacentUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"], true)
							elseif pAdjacentOfAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_ON_LEGION"]) and not pAdjacentOfAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"]) then
								pAdjacentOfAdjacentUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"], true)
							end
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

	if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA"]) or pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_ON_LEGION"]) then
		local bInRange = false
		local bOnTheSameTile = false
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
					bOnTheSameTile = true
					break
				end
			end

			if not bOnTheSameTile then
				for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
					for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
						local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
						if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
							bInRange = true
							break
						end
					end

					if bInRange then
						break
					end
				end

				if not bInRange then
					for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)		
						
						for iSecondDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
							local pSecondAdjacentPlot = Map.PlotDirection(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), iSecondDirection)
												
							for iVal2 = 0,(pSecondAdjacentPlot:GetNumUnits() - 1) do
								local pAdjacentOfAdjacentUnit = pSecondAdjacentPlot:GetUnit(iVal2)
							
								if pAdjacentOfAdjacentUnit:GetOwner() == iPlayer and pAdjacentOfAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS"]) then
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

			if bInRange or bOnTheSameTile then
				if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA"]) and not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"], true)
				elseif pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_ON_LEGION"]) and not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"], true)
				end
			else
				if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT"], false)
				elseif pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_ROME_PRAEFECTUS_CASTRORUM_EFFECT"], false)
				end
			end
		end
	end
end

GameEvents.UnitSetXY.Add(LegatusOnMove)
GameEvents.UnitCreated.Add(LegatusOnCreate)
GameEvents.CityTrained.Add(LegatusOnBuild)