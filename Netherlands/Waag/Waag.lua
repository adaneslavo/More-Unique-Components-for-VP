-- Waag
-- Author: adan_eslavo
-- DateCreated: 13/12/2017
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
local eBuildingWaag = GameInfoTypes.BUILDING_NETHERLANDS_WAAG
local eBuildingDummyForWaag = GameInfoTypes.BUILDING_D_FOR_WAAG
local eCivilizationNetherlands = GameInfoTypes.CIVILIZATION_NETHERLANDS
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME

-- adds bonuses to TRs for each monopoly Netherlands or Rome has
function OnTurnAddMonopolyBonus (iPlayer)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationNetherlands or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	local iMonopolyCounter = 0
	
	for resource in GameInfo.Resources() do
		if resource.IsMonopoly == 1 and pPlayer:HasGlobalMonopoly(resource.ID) then
			iMonopolyCounter = iMonopolyCounter + 1
		end
	end
	
	for city in pPlayer:Cities() do
		if city:IsHasBuilding(eBuildingWaag) then
			city:SetNumRealBuilding(eBuildingDummyForWaag, iMonopolyCounter)
		end
	end
end

if Game.IsCivEverActive(eCivilizationNetherlands) then
	GameEvents.PlayerDoTurn.Add(OnTurnAddMonopolyBonus)
end
