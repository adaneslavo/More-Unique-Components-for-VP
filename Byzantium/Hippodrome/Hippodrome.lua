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
				if Game.GetGameSpeedType() == 3 then
					pCity:ChangeWeLoveTheKingDayCounter(13)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
							
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]13-turn [ICON_HAPPINESS_1] WLTKD Hippodrome[ICON_FOOD][ENDCOLOR]", 1)
					end
				elseif Game.GetGameSpeedType() == 2 then
					pCity:ChangeWeLoveTheKingDayCounter(20)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
							
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]20-turn [ICON_HAPPINESS_1] WLTKD Hippodrome[ICON_FOOD][ENDCOLOR]", 1)
					end
				elseif Game.GetGameSpeedType() == 1 then
					pCity:ChangeWeLoveTheKingDayCounter(30)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
							
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]30-turn [ICON_HAPPINESS_1] WLTKD Hippodrome[ICON_FOOD][ENDCOLOR]", 1)
					end
				else
					pCity:ChangeWeLoveTheKingDayCounter(60)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
							
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]60-turn [ICON_HAPPINESS_1] WLTKD Hippodrome[ICON_FOOD][ENDCOLOR]", 1)
					end
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
						
						pPlayer:ChangeAnarchyNumTurns(2)

						if Game.GetGameSpeedType() == 3 then			
							pCapital:ChangeWeLoveTheKingDayCounter(8)

							if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
								local vCityPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
							
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_RED]1-turn [ICON_RESISTNCE] Anarchy[ENDCOLOR]", 2)
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]7-turn [ICON_HAPPINESS_1] WLTKD Hippodrome[ICON_FOOD][ENDCOLOR]", 2.5)
							end
						elseif Game.GetGameSpeedType() == 2 then
							pCapital:ChangeWeLoveTheKingDayCounter(11)
							
							if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
								local vCityPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
								
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_RED]1-turn [ICON_RESISTNCE] Anarchy[ENDCOLOR]", 2)
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]10-turn [ICON_HAPPINESS_1] WLTKD Hippodrome[ICON_FOOD][ENDCOLOR]", 2.5)
							end
						elseif Game.GetGameSpeedType() == 1 then
							pCapital:ChangeWeLoveTheKingDayCounter(16)
							
							if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
								local vCityPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
								
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_RED]1-turn [ICON_RESISTNCE] Anarchy[ENDCOLOR]", 2)
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]15-turn [ICON_HAPPINESS_1] WLTKD Hippodrome[ICON_FOOD][ENDCOLOR]", 2.5)
							end
						else
							pCapital:ChangeWeLoveTheKingDayCounter(31)
							
							if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
								local vCityPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
								
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_RED]1-turn [ICON_RESISTNCE] Anarchy[ENDCOLOR]", 2)
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]30-turn [ICON_HAPPINESS_1] WLTKD Hippodrome[ICON_FOOD][ENDCOLOR]", 2.5)
							end
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