function TeutonicOrderBarracksBonus(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	if (iBuilding == GameInfoTypes.BUILDING_GERMAN_TEUTONIC_ORDER) then
		for city in pPlayer:Cities() do
			if (city:IsHasBuilding(GameInfoTypes.BUILDING_BARRACKS)) then
				city:SetNumRealBuilding(GameInfoTypes.BUILDING_TEUTONIC_ORDER_DUMMY, 1)
			end
		end
	elseif (iBuilding == GameInfoTypes.BUILDING_BARRACKS) then
		for city in pPlayer:Cities() do
			if (city:IsHasBuilding(GameInfoTypes.BUILDING_GERMAN_TEUTONIC_ORDER)) then
				pCity = pPlayer:GetCityByID(iCity)
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_TEUTONIC_ORDER_DUMMY, 1)
			end
		end
	end
end

GameEvents.CityConstructed.Add(TeutonicOrderBarracksBonus)