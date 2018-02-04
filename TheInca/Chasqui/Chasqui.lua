-- Chasqui
-- Author: pineappledan (modified from Qizilbash by Adan_eslavo)
-- DateCreated: 26/01/2018
-- 2018-02-04 Modified by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

local ePromotionChasqui = GameInfoTypes.PROMOTION_CHASQUI_HEAL
local eUnitTypeChasqui = GameInfoTypes.UNIT_3UC_CHASQUI;

function Chasquiwasi(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	--local ChasquiID = GameInfoTypes.UNIT_3UC_CHASQUI;
	if not( pPlayer and pPlayer:IsAlive()) then return end
	for unit in pPlayer:Units() do
		--local pUnit = Players[player]:GetUnitByID(unit);
		if unit:GetUnitType() == eUnitTypeChasqui then
			--if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL) then
				--pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL, false)
			--elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL_DUMMY) then
				--pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL_DUMMY, false)		
			--end
			
			--local iX = pUnit:GetX()
			--local iY = pUnit:GetY()
			local pPlot = Map.GetPlot(unit:GetX(), unit:GetY())
			if pPlot then 
				unit:SetHasPromotion(ePromotionChasqui, (pPlot:GetOwner() == iPlayer))
			end
			--if pPlot:GetOwner() == iPlayer then 
				--if pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL, true) else
					--pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CHASQUI_HEAL_DUMMY) 
				--end
			--end
		end
	end
end

Events.UnitActionChanged.Add(Chasquiwasi)
