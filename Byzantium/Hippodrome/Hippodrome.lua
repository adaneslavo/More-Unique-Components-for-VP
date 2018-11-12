-- Hippodrome
-- Author: adan_eslavo
-- DateCreated: 2/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")

local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent / 100
local eBuildingHippodrome = GameInfoTypes.BUILDING_BYZANTIUM_HIPPODROME
local eBuildingDummyForHippodrome = GameInfoTypes.BUILDING_D_FOR_HIPPODROME
local eCivilizationByzantium = GameInfoTypes.CIVILIZATION_BYZANTIUM
				
-- adds WLTKD and Yields to all Horses in empire after its construction
function OnConstructionAddBonuses(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationByzantium) then return end

	if iBuilding == eBuildingHippodrome then
		for city in pPlayer:Cities() do
			local iWLTKDLength = math.floor(20 * fGameSpeedModifier)
				
			city:ChangeWeLoveTheKingDayCounter(iWLTKDLength)				
		end

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local pCity = pPlayer:GetCityByID(iCity)
			local sName = pCity:GetName()
					
			pPlayer:AddNotification(0, 
				'The City of [COLOR_POSITIVE_TEXT]'..sName..'[ENDCOLOR] constructed Hippodrome. People love you. '..iWLTKDLength..'-turn WLTKD has started across the Empire.', 
				'Hippodrome constructed in '..sName, 
				pCity:GetX(), pCity:GetY())
		end
	end
end

-- removes bonus gold and culture to horses on empire if Hippodrome is destroyed
function OnCaptureRemoveHorseYields(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pOldPlayer = Players[iOldOwner]
	
	if pOldPlayer:GetCivilizationType() ~= eCivilizationByzantium or not bIsCapital then return end
 	for city in pOldPlayer:Cities() do
		city:SetNumRealBuilding(eBuildingDummyHorseYields, 0)
	end
end

-- sets Anarchy and WLTKD on new Era
function OnEraSetAnarchyAndWLTKD(eTeam, eEra, bFirst)
	for id, pPlayer in pairs(Players) do
		if pPlayer:IsEverAlive() and pPlayer:GetTeam() == eTeam and pPlayer:GetCivilizationType() == eCivilizationByzantium then
			local pCapital = pPlayer:GetCapitalCity()
					
			if pCapital:IsHasBuilding(eBuildingHippodrome) then
				if not pPlayer:IsAnarchy() then
					local iWLTKDLength = math.floor(10 * fGameSpeedModifier) + 1
						
					pPlayer:ChangeAnarchyNumTurns(2)
					
					for city in pPlayer:Cities() do
						city:ChangeWeLoveTheKingDayCounter(iWLTKDLength)
					end
						
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						pPlayer:AddNotification(0, 'Your Empire entered new Era, causing a massive riot across your Empire. Your Empire falls into 1 turn of [ICON_RESISTANCE] Resistance, after which your [ICON_CITIZEN] Citizens will [ICON_HAPPINESS_1] love their king for '..(iWLTKDLength - 1)..' turns.', 'Hooliganism in '..pCapital:GetName()..'!', pCapital:GetX(), pCapital:GetY())
					end
						
					break
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationByzantium) then
	GameEvents.CityConstructed.Add(OnConstructionAddBonuses)
	GameEvents.TeamSetEra.Add(OnEraSetAnarchyAndWLTKD)
	GameEvents.CityCaptureComplete.Add(OnCaptureRemoveHorseYields)
end

