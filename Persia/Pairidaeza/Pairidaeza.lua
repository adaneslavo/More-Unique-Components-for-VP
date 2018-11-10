-- Pairidaeza
-- Author: adan_eslavo
-- DateCreated: 19/12/2017
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
local eBuildingParadiseGarden = GameInfoTypes.BUILDING_PERSIA_PAIRIDAEZA
local eCivilizationPersia = GameInfoTypes.CIVILIZATION_PERSIA
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME

function PairidaezaGoldenAgeStartBonus(iPlayer, bStart, iTurns)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationPersia or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	if bStart then
		local iNumberOfPairidaezas = pPlayer:CountNumBuildings(eBuildingParadiseGarden)
		
		if iNumberOfPairidaezas > 0 then
			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)	
			local iGain = math.floor(15 * iEraModifier * fGameSpeedModifier)
			local iCurrentPairidaeza = 0

			for city in pPlayer:Cities() do
				if city:IsHasBuilding(eBuildingParadiseGarden) then
					pPlayer:ChangeJONSCulture(iGain)
					iCurrentPairidaeza = iCurrentPairidaeza + 1

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(city:GetX(), city:GetY())
			
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iGain.." [ICON_CULTURE][ENDCOLOR]", 1)
					end

					if iCurrentPairidaeza == iNumberOfPairidaezas then
						break
					end
				end
			end

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local pCapital = pPlayer:GetCapitalCity()
				local iX, iY = pCapital:GetX(), pCapital:GetY()
			
				pPlayer:AddNotification(
					NotificationTypes.NOTIFICATION_INSTANT_YIELD,
					'[ICON_GOLDEN_AGE] Golden Age has started. Every City with Paradise Garden gained:[NEWLINE][ICON_BULLET]+'..iGain..' [ICON_CULTURE] Culture',
					'Bonus Yields from new Golden Age across the Empire',
					iX, iY, pCapital:GetID())
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationPersia) then
	GameEvents.PlayerGoldenAge.Add(PairidaezaGoldenAgeStartBonus)
end
