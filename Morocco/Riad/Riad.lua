-- Riad
-- Author: Blue, Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
local fGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GreatPeoplePercent / 100
local eBuildingRiad = GameInfoTypes.BUILDING_MAROCCO_RIAD			

-- gain yields each turn for each trade route if Riad is built in the city
function OnTurnGainYieldsFromTR(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for i, tradeRoute in pairs(pPlayer:GetTradeRoutes()) do
		local pCity = tradeRoute.FromCity
		
		if pCity:IsHasBuilding(eBuildingRiad) then
			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)

			iGain1 = math.max(math.floor(1 * fGameSpeedModifier1 * iEraModifier), 1)
			iGain2 = math.max(math.floor(1 * fGameSpeedModifier2 * iEraModifier), 1)
			iGain3 = math.floor(100 * fGameSpeedModifier3 * iEraModifier)

			pPlayer:ChangeGold(iGain1)
			pPlayer:ChangeJONSCulture(iGain2)
			pCity:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_MERCHANT, iGain3)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_GOLD]+"..iGain1.."[ICON_GOLD][ENDCOLOR]", 1)
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iGain2.."[ICON_CULTURE][ENDCOLOR]", 1.5)
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_GREAT_PEOPLE_STORED]+"..iGain3.."[ICON_GREAT_PEOPLE][ENDCOLOR]", 2)
				--pPlayer:AddNotification(0, '[ICON_PEACE] Faith purchase:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iScience..' [ICON_RESEARCH] Science', 'Bonus Yields in '..pCity:GetName()..'!', pCity:GetX(), pCity:GetY())
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(OnTurnGainYieldsFromTR)