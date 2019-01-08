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
	
	local bIsAnyWaag = false
	local iNumberOfWaags = pPlayer:CountNumBuildings(eBuildingWaag)

	if iNumberOfWaags > 0 then
		local iCurrentWaag = 0
		
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingWaag) then
				city:SetNumRealBuilding(eBuildingDummyForWaag, pPlayer:GetHappinessFromResources())
				iCurrentWaag = iCurrentWaag + 1

				if iCurrentWaag == iNumberOfWaags then
					break
				end
			end
		end
	end		
end

function OnConstructionWaagDummy(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if not(pPlayer and pPlayer:GetCivilizationType() == eCivilizationNetherlands) then return end
	if iBuilding ~= eBuildingWaag then return end
	
	local pCity = pPlayer:GetCityByID(iCity)
	
	if pCity then
		local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY())
	
		pPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_WAAG_DUMMY)
	end
end

if Game.IsCivEverActive(eCivilizationNetherlands) then
	GameEvents.CityConstructed.Add(OnConstructionWaagDummy)
	GameEvents.PlayerDoTurn.Add(OnTurnAddDefenseFromResources)
end
