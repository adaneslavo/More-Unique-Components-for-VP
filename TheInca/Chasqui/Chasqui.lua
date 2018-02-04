-- Chasqui
-- Author: pineappledan (modified from Qizilbash by Adan_eslavo)
-- DateCreated: 26/01/2018
--------------------------------------------------------------
include("FLuaVector.lua")

local iChasqui = GameInfoTypes.UNIT_3UC_CHASQUI

function Chasquiwasi(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
		
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL) then
			local iX = pUnit:GetX()
			local iY = pUnit:GetY()
			local pPlot = Map.GetPlot(iX, iY)

			if pPlot:GetOwner() == pPlayer then
				pUnit:ChangeDamage(-10)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(Chasquiwasi)
