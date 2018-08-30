-- Qadi
-- Author: pineappledan
-- DateCreated: 25/01/2018
-- 2018-02-04 Modified by Infixo
--------------------------------------------------------------
local tMonopolyResources = {
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

local eBuildingGumey = GameInfoTypes.BUILDING_SONGHAI_GUMEY
local eBuildingDummyForGumey = GameInfoTypes.BUILDING_D_FOR_GUMEY

function OnTurnAddMonopolyBonus (iPlayer)
	local pPlayer = Players[iPlayer]
	local iMonopolyCounter = 0
	
	for i, iResource in pairs(tMonopolyResources) do
		if (pPlayer:GetNumResourceTotal(iResource) / Map:GetNumResources(iResource)) > 0.5 then
			iMonopolyCounter = iMonopolyCounter +1
		end
	end
	
	for city in pPlayer:Cities() do
		if city:IsHasBuilding(eBuildingGumey) then
			city:SetNumRealBuilding(eBuildingDummyForGumey, iMonopolyCounter)
		end
	end
end

GameEvents.PlayerDoTurn.Add(OnTurnAddMonopolyBonus)
