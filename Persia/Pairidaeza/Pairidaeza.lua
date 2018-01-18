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
				local iGain

				if Game.GetGameSpeedType() == 0 then
					iGain = math.floor(30 * ((pPlayer:GetCurrentEra() + 1) / iPairidaezaEraPlusOne) * 3)
					pPlayer:ChangeJONSCulture(iGain)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+"..iGain.." [ICON_CULTURE] Paradise Garden[ENDCOLOR]", 1)
					end
				elseif Game.GetGameSpeedType() == 1 then
					iGain = math.floor(30 * ((pPlayer:GetCurrentEra() + 1) / iPairidaezaEraPlusOne) * 1.5)
					pPlayer:ChangeJONSCulture(iGain)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+"..iGain.." [ICON_CULTURE] Paradise Garden[ENDCOLOR]", 1)
					end
				elseif Game.GetGameSpeedType() == 2 then
					iGain = math.floor(30 * ((pPlayer:GetCurrentEra() + 1) / iPairidaezaEraPlusOne) * 1)
					pPlayer:ChangeJONSCulture(iGain)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+"..iGain.." [ICON_CULTURE] Paradise Garden[ENDCOLOR]", 1)
					end
				else
					iGain = math.floor(30 * ((pPlayer:GetCurrentEra() + 1) / iPairidaezaEraPlusOne) * 0.66)
					pPlayer:ChangeJONSCulture(iGain)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+"..iGain.." [ICON_CULTURE] Paradise Garden[ENDCOLOR]", 1)
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerGoldenAge.Add(PairidaezaGoldenAgeStartBonus)