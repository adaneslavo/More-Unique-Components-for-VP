-- Iziko
-- Author: pineappledan
-- 2018-02-26 updated by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

local eBuildingIziko = GameInfoTypes.BUILDING_ZULU_IZIKO

-- adds culture to each city with Iziko if unit levels up
function OnLevelCityGainCulture(iPlayer, iUnit, iPromotionType)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
	local iLevelModifier = math.max(pUnit:GetLevel() - 1, 0)
	local iGain = iLevelModifier * iEraModifier
	local pCapital = pPlayer:GetCapitalCity()

	for city in pPlayer:Cities() do
		if city:IsHasBuilding(eBuildingIziko) then
			pPlayer:ChangeJONSCulture(iGain)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vCityPosition = PositionCalculator(city:GetX(), city:GetY())

				Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iGain.."[ICON_CULTURE][ENDCOLOR]", 1)

				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_INSTANT_YIELD,
					'Unit gained new level. Each City with Iziko built gains [ICON_CULTURE] Culture.',
					'Culture for Cities with Iziko',
					pCapital:GetX(), pCapital:GetY(), pCapital:GetID())
			end	
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.UnitPromoted.Add(OnLevelCityGainCulture)
