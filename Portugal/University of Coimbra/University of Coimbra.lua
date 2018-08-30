-- University of Coimbra
-- Author: pineappledan
-- 2018-02-26 Updated by Infixo (feitoria removed/pillaged)
--------------------------------------------------------------
local eBuildingCoimbra = GameInfoTypes.BUILDING_PORTUGAL_UNIVERSITY_OF_COIMBRA
local eBuildingDummyForCoimbra = GameInfoTypes.BUILDING_D_FOR_FEITORIA
local eImprovementFeitoria = GameInfoTypes.IMPROVEMENT_FEITORIA
local ePromotionAgeOfDiscovery = GameInfoTypes.PROMOTION_UNIT_PORTUGAL_AGE_OF_DISCOVERY
local eCivilizationPortugal = GameInfoTypes.CIVILIZATION_PORTUGAL

-- adds promotion to all naval units on construction
function OnConstructionAddPromotion(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationPortugal) then return end
		
	local pCity = pPlayer:GetCityByID(iCity)
	
	if iBuilding == eBuildingCoimbra then
		for unit in pPlayer:Units() do
			unit:SetHasPromotion(ePromotionAgeOfDiscovery, (unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALMELEE or unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALRANGED))
		end
	end
end

-- adds yields to city with U. of Coimbra on each Feitoria built
function OnFeitoriaConstructionAddYields(iPlotX, iPlotY, iOwner, iOldImprovement, iNewImprovement, bIsPillaged)
	local function UpdateCoimbraEffectInCities(iChange) -- +1 or -1
		for player = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local pPlayer = Players[player]
			
			if pPlayer:IsAlive() and pPlayer:IsMajorCiv() then
				for city in pPlayer:Cities() do
					if city:IsHasBuilding(eBuildingCoimbra) then
						local iDummies = city:GetNumRealBuilding(eBuildingDummyForCoimbra)
						
						city:SetNumRealBuilding(eBuildingDummyForCoimbra, iDummies + iChange) -- +1/-1 production, +2/-2 gold
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

GameEvents.CityConstructed.Add(OnConstructionAddPromotion)
GameEvents.TileImprovementChanged.Add(OnFeitoriaConstructionAddYields)
