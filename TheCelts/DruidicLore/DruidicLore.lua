-- Druidic Lore
-- Author: adan_eslavo
-- DateCreated: 28/10/2017
--------------------------------------------------------------
function DruidicLorePantheon(iPlayer, iCapitalCity, iReligion, iBelief1) 
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCapitalCity()

	if pPlayer:GetName() == "Boudicca" then
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP1, 1)
	end
end

function DruidicLoreReligion(iPlayer, iHolyCity, iReligion, iBelief1, iBelief2, iBelief3, iBelief4, iBelief5)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetName() == "Boudicca" then
		local pCapital = pPlayer:GetCapitalCity()
		local pCity = pPlayer:GetCityByID(iHolyCity)

		if pCity == pCapital then
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP2, 1)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP1, 0)
		else
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP1, 1)
		end
	end
end

function DruidicLoreEnhancement(iPlayer, iReligion, iBelief1, iBelief2)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetName() == "Boudicca" then
		for pCity in pPlayer:Cities() do
			if pCity:IsHolyCityForReligion(iReligion) then
				if pCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYGMP1) then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP2, 1)
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP1, 0)
				elseif pCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYGMP2) then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP3, 1)
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP2, 0)
				elseif pCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYGMP3) then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP4, 1)
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP3, 0)				
				end
				return true
			end
		end	
	end
end

function DruidicLoreReformation(iPlayer, iReligion, iBelief1)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetName() == "Boudicca" then
		for pCity in pPlayer:Cities() do
			if pCity:IsHolyCityForReligion(iReligion) then
				if pCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYGMP1) then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP2, 1)
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP1, 0)
				elseif pCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYGMP2) then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP3, 1)
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP2, 0)
				elseif pCity:IsHasBuilding(GameInfoTypes.BUILDING_DUMMYGMP3) then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP4, 1)
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGMP3, 0)	
				end
				return true
			end
		end		
	end
end

GameEvents.PantheonFounded.Add(DruidicLorePantheon)
GameEvents.ReligionFounded.Add(DruidicLoreReligion)
GameEvents.ReligionEnhanced.Add(DruidicLoreEnhancement)
GameEvents.ReligionReformed.Add(DruidicLoreReformation)