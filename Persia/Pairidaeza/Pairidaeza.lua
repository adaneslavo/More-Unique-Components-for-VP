-- Pairidaeza
-- Author: adan_eslavo
-- DateCreated: 19/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function PairidaezaGoldenAgeStartBonus(iPlayer, bStart, iTurns)
	local pPlayer = Players[iPlayer]
	
	if bStart then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_PERSIA_PAIRIDAEZA) then
				local iPairidaezaEraPlusOne = 3
				local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent
				local iGain = math.floor(30 * ((pPlayer:GetCurrentEra() + 1) / iPairidaezaEraPlusOne) * iGameSpeedModifier)

				pPlayer:ChangeJONSCulture(iGain)

				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
			
					Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+"..iGain.." [ICON_CULTURE] Paradise Garden[ENDCOLOR]", 1)
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerGoldenAge.Add(PairidaezaGoldenAgeStartBonus)