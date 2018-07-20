-- Riad
-- Author: Blue, Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")
local eBuildingRiad = GameInfoTypes.BUILDING_MAROCCO_RIAD			

-- gain yields each turn for each trade route if Riad is built in the city
function OnTurnGainYieldsFromTR(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for i, tradeRoute in pairs(pPlayer:GetTradeRoutes()) do
		local pCity = tradeRoute.FromCity

		if pCity:IsHasBuilding(eBuildingRiad) then

			iGain1 = 2
			iGain2 = 100

			pPlayer:ChangeGold(iGain1)
			pPlayer:ChangeJONSCulture(iGain1)
			pCity:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_MERCHANT, iGain2)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_GOLD]+"..iGain1.."[ICON_GOLD][ENDCOLOR]", 1)
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iGain1.."[ICON_CULTURE][ENDCOLOR]", 1.5)
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_GREAT_PEOPLE_STORED]+"..iGain2.."[ICON_GREAT_PEOPLE][ENDCOLOR]", 2)
				--pPlayer:AddNotification(0, '[ICON_PEACE] Faith purchase:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iScience..' [ICON_RESEARCH] Science', 'Bonus Yields in '..pCity:GetName()..'!', pCity:GetX(), pCity:GetY())
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(OnTurnGainYieldsFromTR)
