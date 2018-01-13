-- Yassa Court
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function ConquereMorePlease(iPlayer, iCapital, iResourceX, iResourceY, iNewPlayer, iConquest, iConquest2)
	local pNewPlayer = Players[iNewPlayer]
	if pNewPlayer:GetName() == "Genghis Khan" then
		for pCity in pNewPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MONGOLIA_YASSA_COURT) then
				if Game.GetGameSpeedType() == 3 then
					pCity:ChangeWeLoveTheKingDayCounter(7)
					
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]7-turn [ICON_HAPPINESS_1] WLTKD Yassa Court[ICON_FOOD][ENDCOLOR]", 1)
					end
				elseif Game.GetGameSpeedType() == 2 then
					pCity:ChangeWeLoveTheKingDayCounter(10)
					
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]10-turn [ICON_HAPPINESS_1] WLTKD Yassa Court[ICON_FOOD][ENDCOLOR]", 1)
					end
				elseif Game.GetGameSpeedType() == 1 then
					pCity:ChangeWeLoveTheKingDayCounter(15)
					
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]15-turn [ICON_HAPPINESS_1] WLTKD Yassa Court[ICON_FOOD][ENDCOLOR]", 1)
					end
				else
					pCity:ChangeWeLoveTheKingDayCounter(30)
					
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]30-turn [ICON_HAPPINESS_1] WLTKD Yassa Court[ICON_FOOD][ENDCOLOR]", 1)
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityCaptureComplete.Add(ConquereMorePlease)