local buildingCoimbraID = GameInfoTypes["BUILDING_VP_UNIVERSITY_OF_COIMBRA"]

function CoimbraBuiltGrantPromotion(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding == buildingCoimbraID then
		for unit in pPlayer:Units() do
			unit:SetHasPromotion(GameInfoTypes.PROMOTION_AGE_OF_DISCOVERY, (unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALMELEE or unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALRANGED))
		end
	end
end

function CoimbraUnitCheckGrantPromotion(iPlayer, iCity, iUnit)
	local player = Players[iPlayer]
	local unit = player:GetUnitByID(iUnit)
	if unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALMELEE or unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_NAVALRANGED then
		for city in player:Cities() do
			unit:SetHasPromotion(GameInfoTypes.PROMOTION_AGE_OF_DISCOVERY, city:IsHasBuilding(buildingCoimbraID))
		end
	end
end

function CoimbraFeitoriaImprovement(iPlotX, iPlotY, iOwner, iOldImprovement, iNewImprovement)
	if iNewImprovement ~= GameInfoTypes. IMPROVEMENT_FEITORIA then return end -- no point running further if not Feitoria
	local owner= Players[iOwner]
	if owner and owner:IsMinorCiv() then
		for playerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local player = Players[playerID]
			if player:IsAlive() then
				for city in player:Cities() do
					if city:IsHasBuilding(buildingCoimbraID) then
						local iDummies = city:GetNumRealBuilding(GameInfoTypes.BUILDING_VP_UNIVERSITY_OF_COIMBRA_DUMMY)
						city:SetNumRealBuilding(GameInfoTypes.BUILDING_VP_UNIVERSITY_OF_COIMBRA_DUMMY, iDummies + 1)
					end
				end
			end
		end 
	end
end



GameEvents.CityConstructed.Add(CoimbraBuiltGrantPromotion)
GameEvents.CityTrained.Add(CoimbraUnitCheckGrantPromotion)
GameEvents.TileImprovementChanged.Add(CoimbraFeitoriaImprovement)