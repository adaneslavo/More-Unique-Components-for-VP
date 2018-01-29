-- Hippodrome
-- Author: adan_eslavo
-- DateCreated: 2/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")

function HippodromeBuilt(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetName() == "Theodora" then
		if iBuilding == GameInfoTypes.BUILDING_BYZANTIUM_HIPPODROME then
			for pCity in pPlayer:Cities() do
				local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent / 100
				local iWLTKDLength = math.floor(20 * iGameSpeedModifier)
				local pCapital = pPlayer:GetCapitalCity()
				
				pCity:ChangeWeLoveTheKingDayCounter(iWLTKDLength)
				
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					pPlayer:AddNotification(0, 'The City of [COLOR_POSITIVE_TEXT]'..pCapital:GetName()..'[ENDCOLOR] constructed Hippodrome. People love you. '..iWLTKDLength..'-turn WLTKD has started in '..pCity:GetName()..'.', 'Hippodrome constructed in '..pCapital:GetName(), pCity:GetX(), pCity:GetY())
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
					local pCapital = pPlayer:GetCapitalCity()
					
					if pCapital:IsHasBuilding(GameInfoTypes.BUILDING_BYZANTIUM_HIPPODROME) then
						if not pPlayer:IsAnarchy() then
							local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent / 100
							local iWLTKDLength = math.floor(10 * iGameSpeedModifier) + 1
						
							pPlayer:ChangeAnarchyNumTurns(2)
							pCapital:ChangeWeLoveTheKingDayCounter(iWLTKDLength)
						
							if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
								pPlayer:AddNotification(0, 'Your Empire entered new Era, causing hooligan eccesses across your Cities. Your Empire falls into 1 turn of [ICON_RESISTANCE] Resistance, after which your [ICON_CITIZEN] Citizens will [ICON_HAPPINESS_1] love their king for '..(iWLTKDLength - 1)..' turns.', 'Hooliganism in '..pCapital:GetName()..'!', pCapital:GetX(), pCapital:GetY())
							end
						
							break
						end
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