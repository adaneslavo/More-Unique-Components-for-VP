-- Pairidaeza
-- Author: adan_eslavo
-- DateCreated: 19/12/2017
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

local eBuildingBullring = GameInfoTypes.BUILDING_SPAIN_BULLRING
local eCivilizationSpain = GameInfoTypes.CIVILIZATION_SPAIN
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME

function BullringWLTKDStarts(iPlayer, iX, iY, iTurns)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationSpain or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	if iTurns > 2 then
	
		local pCity = Map.GetPlot(iX, iY):GetPlotCity()
		if pCity:IsHasBuilding(eBuildingBullring) then
			print"Bullring WLTKD"

			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)	
			local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent / 100
			local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
			local iGain1 = math.floor(50 * iEraModifier * iGameSpeedModifier1)
			local iGain2 = math.floor(50 * iEraModifier * iGameSpeedModifier2)
			pCity:ChangeWeLoveTheKingDayCounter(math.floor(iTurns*0.5))
			pPlayer:ChangeFaith(iGain1)
			pPlayer:ChangeJONSCulture(iGain2)
			pCity:ChangeJONSCultureStored(iGain2)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vCityPosition = PositionCalculator(iX, iY)
				local sName = pCity:GetName()
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_WHITE]+"..iGain1.." [ICON_PEACE][ENDCOLOR]", 1)
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iGain2.." [ICON_CULTURE][ENDCOLOR]", 1.5)

				pPlayer:AddNotification(
					NotificationTypes.NOTIFICATION_INSTANT_YIELD,
					'[ICON_GOLDEN_AGE] We Love The King Day has started in [COLOR_POSITIVE_TEXT]'..sName..'[ENDCOLOR].[NEWLINE][ICON_BULLET]+'..iGain2..' [ICON_CULTURE] Culture[NEWLINE][ICON_BULLET]+'..iGain1..' [ICON_PEACE] Faith',
					'Bonus Yields from We Love the King Day',
					iX, iY, pCity:GetID())
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationSpain) then
	GameEvents.CityBeginsWLTKD.Add(BullringWLTKDStarts)
end
