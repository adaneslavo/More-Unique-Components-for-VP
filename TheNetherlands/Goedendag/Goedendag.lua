-- Goedendag
-- Author: adan_eslavo
-- DateCreated: 12/12/2017
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

			if bInRange or bOnTheSameTile then
				if not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
				end
			else
				if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], false)
				end
			end
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

			if bInRange or bOnTheSameTile then
				if not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
				end
			end
		end
	elseif pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:GetUnitCombatType() >= 0 and pSameTileUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
					if not pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"]) then
						pSameTileUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
					end
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
					local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
					if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:GetUnitCombatType() >= 0 and pAdjacentUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
						if not pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"]) then
							pAdjacentUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
						end
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

			if bInRange or bOnTheSameTile then
				if not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
				end
			end
		end
	elseif pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG"]) then
		local pPlot = pUnit:GetPlot()

		if pPlot ~= nil then
			for iVal = 0,(pPlot:GetNumUnits() - 1) do
				local pSameTileUnit = pPlot:GetUnit(iVal)
				
				if pSameTileUnit ~= pUnit and pSameTileUnit:GetOwner() == iPlayer and pSameTileUnit:GetUnitCombatType() >= 0 and pSameTileUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
					if not pSameTileUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"]) then
						pSameTileUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
					end
				end
			end

			for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)
			
				for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
					local pAdjacentUnit = pAdjacentPlot:GetUnit(iVal)
					
					if pAdjacentUnit:GetOwner() == iPlayer and pAdjacentUnit:GetUnitCombatType() >= 0 and pAdjacentUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
						if not pAdjacentUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"]) then
							pAdjacentUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT"], true)
						end
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
			local iLuxuries = {}
				iLuxuries[0] = GameInfoTypes.RESOURCE_AMBER
				iLuxuries[1] = GameInfoTypes.RESOURCE_BRAZILWOOD
				iLuxuries[2] = GameInfoTypes.RESOURCE_CITRUS
				iLuxuries[3] = GameInfoTypes.RESOURCE_CLOVES
				iLuxuries[4] = GameInfoTypes.RESOURCE_COCOA
				iLuxuries[5] = GameInfoTypes.RESOURCE_COFFEE
				iLuxuries[6] = GameInfoTypes.RESOURCE_COPPER
				iLuxuries[7] = GameInfoTypes.RESOURCE_CORAL
				iLuxuries[8] = GameInfoTypes.RESOURCE_COTTON
				iLuxuries[9] = GameInfoTypes.RESOURCE_CRAB
				iLuxuries[10] = GameInfoTypes.RESOURCE_DYE
				iLuxuries[11] = GameInfoTypes.RESOURCE_FUR
				iLuxuries[12] = GameInfoTypes.RESOURCE_GEMS
				iLuxuries[13] = GameInfoTypes.RESOURCE_GOLD
				iLuxuries[14] = GameInfoTypes.RESOURCE_INCENSE
				iLuxuries[15] = GameInfoTypes.RESOURCE_IVORY
				iLuxuries[16] = GameInfoTypes.RESOURCE_JADE
				iLuxuries[17] = GameInfoTypes.RESOURCE_LAPIS
				iLuxuries[18] = GameInfoTypes.RESOURCE_MARBLE
				iLuxuries[19] = GameInfoTypes.RESOURCE_NUTMEG
				iLuxuries[20] = GameInfoTypes.RESOURCE_OLIVE
				iLuxuries[21] = GameInfoTypes.RESOURCE_PEARLS
				iLuxuries[22] = GameInfoTypes.RESOURCE_PEPPER
				iLuxuries[23] = GameInfoTypes.RESOURCE_PERFUME
				iLuxuries[24] = GameInfoTypes.RESOURCE_PORCELAIN
				iLuxuries[25] = GameInfoTypes.RESOURCE_SALT
				iLuxuries[26] = GameInfoTypes.RESOURCE_SILK
				iLuxuries[27] = GameInfoTypes.RESOURCE_SILVER
				iLuxuries[28] = GameInfoTypes.RESOURCE_SPICES
				iLuxuries[29] = GameInfoTypes.RESOURCE_SUGAR
				iLuxuries[30] = GameInfoTypes.RESOURCE_TEA
				iLuxuries[31] = GameInfoTypes.RESOURCE_TOBACCO
				iLuxuries[32] = GameInfoTypes.RESOURCE_TRUFFLES
				iLuxuries[33] = GameInfoTypes.RESOURCE_WHALE
				iLuxuries[34] = GameInfoTypes.RESOURCE_WINE
			local bIsLuxury = false

			for i=0, 34, 1 do
				if pPlot:GetResourceType(pPlayer:GetTeam()) == iLuxuries[i] then
					bIsLuxury = true
					break
				end
			end

			if bIsLuxury then
				if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_BURGEMEESTE_EFFECT) == false then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_BURGEMEESTE_EFFECT, true)
				end
			else
				if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_BURGEMEESTE_EFFECT) == true then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_BURGEMEESTE_EFFECT, false)
				end
			end
		end			
	end
end

GameEvents.UnitSetXY.Add(GoedendagOnMove)
GameEvents.UnitCreated.Add(GoedendagOnCreate)
GameEvents.CityTrained.Add(GoedendagOnBuild)
GameEvents.UnitSetXY.Add(GoedendagOnResourceBonus)
