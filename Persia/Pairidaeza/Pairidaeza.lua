-- Pairidaeza
-- Author: adan_eslavo
-- DateCreated: 19/12/2017
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
local eBuildingParadiseGarden = GameInfoTypes.BUILDING_PERSIA_PAIRIDAEZA

function PairidaezaGoldenAgeStartBonus(iPlayer, bStart, iTurns)
	local pPlayer = Players[iPlayer]
	
	if bStart then
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingParadiseGarden) then
				local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
				
				local iGain = math.floor(15 * iEraModifier * fGameSpeedModifier)

				pPlayer:ChangeJONSCulture(iGain)

				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vCityPosition = PositionCalculator(city:GetX(), city:GetY())
			
					Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iGain.." [ICON_CULTURE][ENDCOLOR]", 1)
					pPlayer:AddNotification(
						NotificationTypes.NOTIFICATION_INSTANT_YIELD,
						'[ICON_GOLDEN_AGE] Golden Age has started:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..city:GetName()..'[ENDCOLOR]: +'..iGain..' [ICON_CULTURE] Culture',
						'Bonus Yields in '..city:GetName(),
						city:GetX(), city:GetY(), city:GetID())
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerGoldenAge.Add(PairidaezaGoldenAgeStartBonus)