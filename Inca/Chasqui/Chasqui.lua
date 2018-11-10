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
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_INCA_CHASQUIWASI) then
			if Map.GetPlot(pUnit:GetX(), pUnit:GetY()):GetOwner() == iPlayer then
				pUnit:ChangeMoves(60)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(Chasquiwasi)
