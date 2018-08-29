-- Qadi
-- Author: pineappledan
-- DateCreated: 25/01/2018
-- 2018-02-04 Modified by Infixo
--------------------------------------------------------------
local MonopolyResources = {
	GameInfoTypes.RESOURCE_ALUMINUM,
	GameInfoTypes.RESOURCE_COAL,
	GameInfoTypes.RESOURCE_HORSE,
	GameInfoTypes.RESOURCE_IRON,
	GameInfoTypes.RESOURCE_OIL,
	GameInfoTypes.RESOURCE_URANIUM,
	GameInfoTypes.RESOURCE_AMBER,
	GameInfoTypes.RESOURCE_CITRUS,
	GameInfoTypes.RESOURCE_CLOVES,
	GameInfoTypes.RESOURCE_COFFEE,
	GameInfoTypes.RESOURCE_COPPER,
	GameInfoTypes.RESOURCE_CORAL,
	GameInfoTypes.RESOURCE_COTTON,
	GameInfoTypes.RESOURCE_CRAB,
	GameInfoTypes.RESOURCE_DYE,
	GameInfoTypes.RESOURCE_FUR,
	GameInfoTypes.RESOURCE_GEMS,
	GameInfoTypes.RESOURCE_GLASS,
	GameInfoTypes.RESOURCE_GOLD,
	GameInfoTypes.RESOURCE_INCENSE,
	GameInfoTypes.RESOURCE_IVORY,
	GameInfoTypes.RESOURCE_JADE,
	GameInfoTypes.RESOURCE_JEWELRY,
	GameInfoTypes.RESOURCE_LAPIS,
	GameInfoTypes.RESOURCE_MARBLE,
	GameInfoTypes.RESOURCE_NUTMEG,
	GameInfoTypes.RESOURCE_OLIVE,
	GameInfoTypes.RESOURCE_PEARLS,
	GameInfoTypes.RESOURCE_PEPPER,
	GameInfoTypes.RESOURCE_PERFUME,
	GameInfoTypes.RESOURCE_PORCELAIN,
	GameInfoTypes.RESOURCE_SALT,
	GameInfoTypes.RESOURCE_SILK,
	GameInfoTypes.RESOURCE_SILVER,
	GameInfoTypes.RESOURCE_SPICES,
	GameInfoTypes.RESOURCE_SUGAR,
	GameInfoTypes.RESOURCE_TEA,
	GameInfoTypes.RESOURCE_TOBACCO,
	GameInfoTypes.RESOURCE_TRUFFLES,
	GameInfoTypes.RESOURCE_WHALE,
	GameInfoTypes.RESOURCE_WINE,
	}

<<<<<<< HEAD
function OnPlayerDoTurnQadi (iPlayer)
	local pPlayer = Players[iPlayer]
	local MonopolyCounter = 0
	local GumeyBuilding = GameInfoTypes.BUILDING_SONGHAI_GUMEY
	local MonopolyDummy = GameInfoTypes.BUILDING_DUMMYSONGHAICLASSYIELD
	
	for _, iResource in pairs(MonopolyResources) do
		if (pPlayer:GetNumResourceTotal(iResource) / Map:GetNumResources(iResource)) >= 0.51 then
			MonopolyCount = MonopolyCount +1
		end
	end
	for cCity in nPlayer:Cities() do
		if cCity:IsHasBuilding(GumeyBuilding) then
			cCity:SetNumRealBuilding(MonopolyDummy, MonopolyCount)
=======
	if pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SONGHAI then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_SONGHAI_QADI_COURT) then
				-- culture
				local iCultureChange = math.floor( 0.1 * pCity:GetBaseYieldRate(YieldTypes.YIELD_PRODUCTION) )
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCULTURE, iCultureChange)
				-- gold for non-followers
				if pPlayer:GetMajorityReligion() ~= -1 then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCOURTHOUSEGOLD, pCity:GetPopulation() - pCity:GetNumFollowers(pPlayer:GetMajorityReligion()))
				end
			end
>>>>>>> 4f05c6b7a1d5177869f3f2e86971519de6bc805d
		end
	end
end

GameEvents.PlayerDoTurn.Add(OnPlayerDoTurnQadi)
