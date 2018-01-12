-- Yellow Brow
-- Author: adan_eslavo
-- DateCreated: 3/11/2017
--------------------------------------------------------------
function YellowBrowDance(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if pUnit ~= nil then
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SHOSHONE_BIG_HORSE_DANCE) then
			if pUnit:FortifyModifier() > 0 then
				if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SHOSHONE_BIG_HORSE_DANCE_PERFORMED) == false then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SHOSHONE_BIG_HORSE_DANCE_PERFORMED, true)
				end
			else
				if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SHOSHONE_BIG_HORSE_DANCE_PERFORMED) then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SHOSHONE_BIG_HORSE_DANCE_PERFORMED, false)
				end
			end
		end
	end
end

Events.UnitActionChanged.Add(YellowBrowDance)