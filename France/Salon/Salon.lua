--------------------------------------
--  Ku'Eex            --
--------------------------------------
local eCivilizationFrance = GameInfoTypes.CIVILIZATION_FRANCE

function SalonChateauBonus(iPlayer)
	local eSalon = GameInfoTypes.BUILDING_FRANCE_SALON
	local pPlayer = Players[iPlayer]

	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationFrance or pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ROME)) then return end

	local iSalonCount = pPlayer:CountNumBuildings(eSalon)
	
	if iSalonCount > 0 then
		local iCurrentSalon = 0
		
		--Search for city with highest culture from tiles
		for city in pPlayer:Cities() do
			local iSalonDummy = GameInfoTypes.BUILDING_D_FOR_SALON
			city:SetNumRealBuilding(iSalonDummy, 0)
			
			if city:IsHasBuilding(eSalon) then
				
				city:SetNumRealBuilding(iSalonDummy, city:CountNumWorkedImprovement(GameInfoTypes.IMPROVEMENT_CHATEAU, true))
				iCurrentSalon = iCurrentSalon + 1

				if iCurrentSalon == iSalonCount then
					break
				end
			end
		end
	end
end

if Game.IsCivEverActive(eCivilizationFrance) then
	GameEvents.PlayerDoTurn.Add(SalonChateauBonus)
end
			
			