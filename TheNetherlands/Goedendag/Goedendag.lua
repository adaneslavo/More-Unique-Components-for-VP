-- Goedendag
-- Author: adan_eslavo
-- DateCreated: 12/12/2017
-- 2018-01-22 Infixo, RESOURCECLASS_LUXURY used
--------------------------------------------------------------
function GoedendagOnMove(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer];

	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitCombatType() >= 0 and pUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
			local bInRange = false
			local bOnTheSameTile = false
			local pPlot = pUnit:GetPlot()

			if pPlot == nil then
				break
			end

			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
					bOnTheSameTile = true
					break
				end
			end

			if not bOnTheSameTile then
				for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
					
					for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
						local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
						
						if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
							bInRange = true
							break
						end
					end

					if bInRange then
						break
					end
				end
			end

			pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], (bInRange or bOnTheSameTile))
		end
	end
end

function GoedendagOnCreate(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetUnitCombatType() >= 0 and pUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND and not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
		local bInRange = false
		local bOnTheSameTile = false
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
					bOnTheSameTile = true
					break
				end
			end

			if not bOnTheSameTile then
				for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
					for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
						local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
						if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
							bInRange = true
							break
						end
					end

					if bInRange then
						break
					end
				end
			end

			pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], (bInRange or bOnTheSameTile))
		end
	elseif pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:GetUnitCombatType() >= 0 and pSameTileUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
					pSameTileUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
					local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
					if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:GetUnitCombatType() >= 0 and pAdjacentUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
						pAdjacentUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
					end
				end
			end
		end
	end
end

function GoedendagOnBuild(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetUnitCombatType() >= 0 and pUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND and not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
		local bInRange = false
		local bOnTheSameTile = false
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
					bOnTheSameTile = true
					break
				end
			end

			if not bOnTheSameTile then
				for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
					for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
						local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
						if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
							bInRange = true
							break
						end
					end

					if bInRange then
						break
					end
				end
			end

			pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], (bInRange or bOnTheSameTile))
		end
	elseif pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:GetUnitCombatType() >= 0 and pSameTileUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
					pSameTileUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
					local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
					if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:GetUnitCombatType() >= 0 and pAdjacentUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
						pAdjacentUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
					end
				end
			end
		end
	end
end

function GoedendagOnResourceBonus(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer];
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_BURGEMEESTE) then
		local pPlot = pUnit:GetPlot()
			
		if pPlot ~= nil then	
			local eResType = pPlot:GetResourceType(pPlayer:GetTeam())
			local bIsLuxury = false
			if eResType ~= -1 then bIsLuxury = (GameInfo.Resources[ eResType ].ResourceClassType == "RESOURCECLASS_LUXURY") end
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_BURGEMEESTE_EFFECT, bIsLuxury)
		end			
	end
end

GameEvents.UnitSetXY.Add(GoedendagOnMove)
GameEvents.UnitCreated.Add(GoedendagOnCreate)
GameEvents.CityTrained.Add(GoedendagOnBuild)
GameEvents.UnitSetXY.Add(GoedendagOnResourceBonus)