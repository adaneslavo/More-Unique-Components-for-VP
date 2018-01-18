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
				local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent / 100
				local iWLTKDLength = math.floor(10 * iGameSpeedModifier)
				
				pCity:ChangeWeLoveTheKingDayCounter(iWLTKDLength)
									
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
			
					Events.AddPopupTextEvent(vCityPosition, "[COLOR_YELLOW]"..iWLTKDLength.."-turn [ICON_HAPPINESS_1] WLTKD Yassa Court[ENDCOLOR]", 1)
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityCaptureComplete.Add(ConquereMorePlease)