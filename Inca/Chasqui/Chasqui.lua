-- Chasqui
-- Author: pineappledan, adan_eslavo
-- DateCreated: 26/01/2018
-- 2018-02-04 Modified by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

local ePromotionChasquiwasi = GameInfoTypes.PROMOTION_UNIT_INCA_CHASQUIWASI

-- heals unit when in firendly territory and not fortfied
function Chasquiwasi(iPlayer)
    local pPlayer = Players[iPlayer]

    for pUnit in pPlayer:Units() do
        if pUnit:IsHasPromotion(ePromotionChasquiwasi) then
            local pPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY())

            if pPlot:GetOwner() == iPlayer and pUnit:FortifyModifier() <= 0 then
				pUnit:ChangeDamage(-15)

				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())

					Events.AddPopupTextEvent(vUnitPosition, "[COLOR_POSITIVE_TEXT]Chasquiwasi[ENDCOLOR]", 2)
				end
            end
        end
    end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(Chasquiwasi)
