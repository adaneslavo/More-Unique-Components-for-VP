-- Waag
-- Author: adan_eslavo
-- DateCreated: 13/12/2017
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
local eBuildingWaag = GameInfoTypes.BUILDING_NETHERLANDS_WAAG
local eBuildingDummyForWaag = GameInfoTypes.BUILDING_D_FOR_WAAG
local eCivilizationNetherlands = GameInfoTypes.CIVILIZATION_NETHERLANDS
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME

-- add bonuses from Waag for each resource imported or exported
function OnTurnAddDefenseFromResources(iPlayer)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationNetherlands or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	local iTradedResources = 0
	local bIsAnyWaag = false
	local iNumberOfWaags = pPlayer:CountNumBuildings(eBuildingWaag)

	if iNumberOfWaags > 0 then
		for res in GameInfo.Resources("ResourceClassType = 'RESOURCECLASS_LUXURY'") do
			iTradedResources = iTradedResources + pPlayer:GetResourceImport(res.ID) + pPlayer:GetResourceExport(res.ID)

			if iTradedResources >= 10 then
				break
			end
		end
			
		bIsAnyWaag = true
	end
	
	if bIsAnyWaag then
		local iCurrentWaag = 0

		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingWaag) then
				city:SetNumRealBuilding(eBuildingDummyForWaag, iTradedResources)
				iCurrentWaag = iCurrentWaag + 1

				if iCurrentWaag == iNumberOfWaags then
					break
				end
			end
		end
	end		
end

if Game.IsCivEverActive(eCivilizationNetherlands) then
	GameEvents.PlayerDoTurn.Add(OnTurnAddDefenseFromResources)
end
