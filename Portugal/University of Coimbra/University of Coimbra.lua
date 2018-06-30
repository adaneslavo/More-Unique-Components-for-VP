----------------------------------------------------------------------------
-- COIMBRA
-- 2018-02-26 Updated by Infixo (feitoria removed/pillaged)
----------------------------------------------------------------------------

local eBuildingCoimbraID = GameInfoTypes.BUILDING_PORTUGAL_UNIVERSITY_OF_COIMBRA
local eBuildingDummyProductionGoldID = GameInfoTypes.BUILDING_FEITORIADUMMY
local eImprovementFeitoria = GameInfoTypes.IMPROVEMENT_FEITORIA


function CoimbraBuiltGrantPromotion(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding == eBuildingCoimbraID then
		for unit in pPlayer:Units() do
			unit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_PORTUGAL_AGE_OF_DISCOVERY, (unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALMELEE or unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALRANGED))
		end
	end
end

--function CoimbraUnitCheckGrantPromotion(iPlayer, iCity, iUnit)
--	local player = Players[iPlayer]
--	local unit = player:GetUnitByID(iUnit)
--	if unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALMELEE or unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALRANGED then
--		for city in player:Cities() do
--			unit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_PORTUGAL_AGE_OF_DISCOVERY, city:IsHasBuilding(eBuildingCoimbraID))
--		end
--	end
--end

function OnTileImprovementChangedCoimbraFeitoria(iPlotX, iPlotY, iOwner, iOldImprovement, iNewImprovement, bIsPillaged)

	local function UpdateCoimbraEffectInCities(iChange) -- +1 or -1
		for playerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local player = Players[playerID]
			if player:IsAlive() and player:IsMajorCiv() then
				for city in player:Cities() do
					if city:IsHasBuilding(eBuildingCoimbraID) then
						local iDummies = city:GetNumRealBuilding(eBuildingDummyProductionGoldID)
						city:SetNumRealBuilding(eBuildingDummyProductionGoldID, iDummies + iChange) -- +1/-1 production, +2/-2 gold
					end
				end
			end
		end 
	end
	
	local pOwner = Players[iOwner]
	if not pOwner then return end -- assert

	-- created
	if iNewImprovement == eImprovementFeitoria and pOwner:IsMinorCiv() and not bIsPillaged then
		UpdateCoimbraEffectInCities(1)
	end
	-- destroyed
	if iOldImprovement == eImprovementFeitoria and iNewImprovement ~= iOldImprovement then
		UpdateCoimbraEffectInCities(-1)
	end
	-- pillaged
	if iNewImprovement == eImprovementFeitoria and bIsPillaged then
		UpdateCoimbraEffectInCities(-1)
	end
end

GameEvents.CityConstructed.Add(CoimbraBuiltGrantPromotion)
GameEvents.CityTrained.Add(CoimbraUnitCheckGrantPromotion)
GameEvents.TileImprovementChanged.Add(OnTileImprovementChangedCoimbraFeitoria)
