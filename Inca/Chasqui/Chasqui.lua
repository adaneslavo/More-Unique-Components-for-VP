-- Chasqui
-- Author: pineappledan (modified from Qizilbash by Adan_eslavo)
-- DateCreated: 26/01/2018
-- 2018-02-04 Modified by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

function Chasquiwasi(iPlayer)
    local pPlayer = Players[iPlayer]

    for pUnit in pPlayer:Units() do
        if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL) then
            local pPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY())

            if pPlot:GetOwner() == iPlayer then
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


--function Chasquiwasi(iPlayer, iUnit)
--	local pPlayer = Players[iPlayer]

--	if not( pPlayer and pPlayer:IsAlive()) then return end
--	for unit in pPlayer:Units() do

--		if unit:IsHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL_DUMMY) then
--			local pPlot = Map.GetPlot(unit:GetX(), unit:GetY())

--			if pPlot:GetOwner() == iPlayer then 
--				unit:SetHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL, true) else
--					unit:SetHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL, false)
--			end
--		end
--	end
--end



GameEvents.PlayerDoTurn.Add(Chasquiwasi)
