-- Hippodrome
-- Author: adan_eslavo
-- DateCreated: 2/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function HippodromeBuilt(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetName() == "Theodora" then
		if iBuilding == GameInfoTypes.BUILDING_BYZANTIUM_HIPPODROME then
			for pCity in pPlayer:Cities() do
				local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent
				local iWLTKDLength = math.floor(20 * iGameSpeedModifier)
				
				pCity:ChangeWeLoveTheKingDayCounter(iWLTKDLength)
				
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
						
					Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]"..iWLTKDLength.."-turn [ICON_HAPPINESS_1] WLTKD Hippodrome[ENDCOLOR]", 1)
				end
			end
		end
	end
end

function HippodromeHooliganism(eTeam, eEra, bFirst)
	for id, pPlayer in pairs(Players) do
		if pPlayer:IsEverAlive() then
			if pPlayer:GetTeam() == eTeam then
				if pPlayer:GetName() == "Theodora" then
					if not pPlayer:IsAnarchy() then
						local pCapital = pPlayer:GetCapitalCity()
						local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent
						local iWLTKDLength = math.floor(10 * iGameSpeedModifier) + 1
						
						pPlayer:ChangeAnarchyNumTurns(2)
						pCapital:ChangeWeLoveTheKingDayCounter(iWLTKDLength)
						
						if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
							local vCityPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
							
							Events.AddPopupTextEvent(vCityPosition, "[COLOR_RED]1-turn [ICON_RESISTNCE] Anarchy[ENDCOLOR]", 2)							
							Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]"..iWLTKDLength.."-turn [ICON_HAPPINESS_1] WLTKD Hippodrome[ENDCOLOR]", 1)
						end
						
						break
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityConstructed.Add(HippodromeBuilt)
GameEvents.TeamSetEra.Add(HippodromeHooliganism)