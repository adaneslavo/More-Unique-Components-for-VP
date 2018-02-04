-- Chasqui
-- Author: pineappledan (modified from Qizilbash by Adan_eslavo)
-- DateCreated: 26/01/2018
--------------------------------------------------------------
--[[include("FLuaVector.lua")

function Chasquiwasi(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local ChasquiID = GameInfoTypes.UNIT_3UC_CHASQUI;
	
	for pUnit in pPlayer:Units() do
		local pUnit = Players[player]:GetUnitByID(unit);
		if pUnit:GetUnitType() == ChasquiID then
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL, false)
			elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL_DUMMY) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL_DUMMY, false)		
			end
			
			local iX = pUnit:GetX()
			local iY = pUnit:GetY()
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot:GetOwner() = pPlayer then 
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL, true) else
					pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL_DUMMY) 
				end
			end
		end
	end
end

Events.UnitActionChanged.Add(Chasquiwasi)--]]
