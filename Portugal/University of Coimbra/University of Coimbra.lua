-- University of Coimbra
-- Author: pineappledan
-- 2018-02-26 Updated by Infixo (feitoria removed/pillaged)
--------------------------------------------------------------
local eBuildingCoimbra = GameInfoTypes.BUILDING_PORTUGAL_UNIVERSITY_OF_COIMBRA
local eBuildingDummyForCoimbra = GameInfoTypes.BUILDING_D_FOR_FEITORIA
local eImprovementFeitoria = GameInfoTypes.IMPROVEMENT_FEITORIA
local eCivilizationPortugal = GameInfoTypes.CIVILIZATION_PORTUGAL

-- adds yields to city with U. of Coimbra on each Feitoria built
function OnFeitoriaConstructionAddYields(iPlotX, iPlotY, iOwner, iOldImprovement, iNewImprovement, bIsPillaged)

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationPortugal) then return end

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

if Game.IsCivEverActive(eCivilizationPortugal) then
	GameEvents.TileImprovementChanged.Add(OnFeitoriaConstructionAddYields)
end