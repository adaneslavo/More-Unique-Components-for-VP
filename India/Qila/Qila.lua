-- Qila
-- Author: adan_eslavo
-- DateCreated: 5/12/2017
--------------------------------------------------------------
function DefenseToCulture(iPlayer)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_INDIA then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_INDIA_QILA) then
				-- 1 Defense per National or World Wonder in City
				local iDefenseChange = (pCity:GetNumWorldWonders() + pCity:GetNumNationalWonders())
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMY_1_DEFENSE, iDefenseChange)
				-- 10% Defense converted to culture in City
				local iCultureChange = 0.0010 * pCity:GetStrengthValue()
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCASTLECULTURE, iCultureChange)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DefenseToCulture)

--function YieldFoodToCulture(iPlayer)
--	local pPlayer = Players[iPlayer]
--
--	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_INDIA then
--		for pCity in pPlayer:Cities() do
--			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_INDIA_QILA) then
--				local iCultureChange = 0.05 * pCity:GetBaseYieldRate(YieldTypes.YIELD_FOOD)

--				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCULTURE, iCultureChange)
--			end
--		end
--	end
--end

--GameEvents.PlayerDoTurn.Add(YieldFoodToCulture)
