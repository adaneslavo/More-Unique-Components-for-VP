-- Hippodrome
-- Author: adan_eslavo
-- DateCreated: 2/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")

local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent / 100
local eBuildingHippodrome = GameInfoTypes.BUILDING_BYZANTIUM_HIPPODROME
local eCivilizationByzantium = GameInfoTypes.CIVILIZATION_BYZANTIUM
				
-- adds WLTKD on empire after its construction
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

-- sets Anarchy and WLTKD on new Era
function OnEraSetAnarchyAndWLTKD(eTeam, eEra, bFirst)
	for id, pPlayer in pairs(Players) do
		if pPlayer:IsEverAlive() and pPlayer:GetTeam() == eTeam and pPlayer:GetCivilizationType() == eCivilizationByzantium then
			local pCapital = pPlayer:GetCapitalCity()
					
			if pCapital:IsHasBuilding(eBuildingHippodrome) then
				if not pPlayer:IsAnarchy() then
					local iWLTKDLength = math.floor(10 * fGameSpeedModifier) + 1
						
--					pPlayer:DoEventChoice(GameInfoTypes.PLAYER_EVENT_CHOICE_BYZANTIUM_HIPPODROME_NIKA_RIOT)
--					pPlayer:DoCancelEventChoice(GameInfoTypes.PLAYER_EVENT_CHOICE_BYZANTIUM_HIPPODROME_NIKA_RIOT)
					pPlayer:DoStartEvent(GameInfoTypes.PLAYER_EVENT_BYZANTIUM_HIPPODROME_NIKA_RIOT)
					
					for city in pPlayer:Cities() do
						city:ChangeWeLoveTheKingDayCounter(iWLTKDLength)
					end
						
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						pPlayer:AddNotification(0, 'Your Empire entered new Era, causing a massive riot across your Empire. Your Empire becomes very [ICON_HAPPINESS_4] Unhappy for 1 turn, after which your [ICON_CITIZEN] Citizens will [ICON_HAPPINESS_1] love their king for '..(iWLTKDLength - 1)..' turns.', 'Hooliganism in '..pCapital:GetName()..'!', pCapital:GetX(), pCapital:GetY())
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
end

