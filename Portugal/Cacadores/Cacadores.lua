-- Cacadores 2.0
-- Author: pineappledan
-- DateCreated:
--------------------------------------------------------------	
function CacadorPromotion(iPlayer, iUnit, iPromotionType)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:IsHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_III) and pUnit:IsHasPromotion(PROMOTION_SURVIVALISM_3) then return end

	if (pUnit:IsHasPromotion(GameInfoTypes.TXT_KEY_PROMOTION_CACADOR)) then
		local rand = math.random(2)
		--no need to go further if unit has all promotions
		if  pUnit:IsHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_III) and pUnit:IsHasPromotion(PROMOTION_SURVIVALISM_3) then return end

		--Check for trailblazer line
		if (rand == 1) and pUnit:IsHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_III) and pUnit:IsHasPromotion(PROMOTION_SURVIVALISM_2) then
			pUnit:SetHasPromotion(PROMOTION_SURVIVALISM_3, true);

		elseif (rand == 1) and pUnit:IsHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_III) and pUnit:IsHasPromotion(PROMOTION_SURVIVALISM_1) then
			pUnit:SetHasPromotion(PROMOTION_SURVIVALISM_2, true);

		elseif (rand == 1) and pUnit:IsHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_III) then
			pUnit:SetHasPromotion(PROMOTION_SURVIVALISM_1, true);

		elseif (rand == 1) and pUnit:IsHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_II) then
			pUnit:SetHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_III, true);

		elseif (rand == 1) and pUnit:IsHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_I) then
			pUnit:SetHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_II, true);

		elseif (rand == 1) then
			pUnit:SetHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_I);

		--then for survivalism line
		elseif pUnit:IsHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_II) and pUnit:IsHasPromotion(PROMOTION_SURVIVALISM_3) then
			pUnit:SetHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_III, true);

		elseif pUnit:IsHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_I) and pUnit:IsHasPromotion(PROMOTION_SURVIVALISM_3) then
			pUnit:SetHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_II, true);

		elseif pUnit:IsHasPromotion(PROMOTION_SURVIVALISM_3) then
			pUnit:SetHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_I, true);

		elseif pUnit:IsHasPromotion(PROMOTION_SURVIVALISM_2) then
			pUnit:SetHasPromotion(PROMOTION_SURVIVALISM_3, true);

		elseif pUnit:IsHasPromotion(PROMOTION_SURVIVALISM_1) then
			pUnit:SetHasPromotion(PROMOTION_SURVIVALISM_2, true);

		else
			pUnit:SetHasPromotion(PROMOTION_SURVIVALISM_1, true);
		end
	end
end
	
GameEvents.UnitPromoted.Add(CacadorPromotion)
