-- Cacadores 2.0
-- Author: pineappledan
-- DateCreated:
-- 2018-02-26 updated by Infixo
--------------------------------------------------------------	
function CacadorPromotion(iPlayer, iUnit, iPromotionType)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_III) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_3) then return end

	if (pUnit:IsHasPromotion(GameInfoTypes.TXT_KEY_GameInfoTypes.PROMOTION_CACADOR)) then
		local rand = math.random(2)
		--no need to go further if unit has all promotions
		if  pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_III) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_3) then return end

		--Check for trailblazer line
		if (rand == 1) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_III) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_2) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_3, true);

		elseif (rand == 1) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_III) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_1) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_2, true);

		elseif (rand == 1) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_III) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_1, true);

		elseif (rand == 1) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_II) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_III, true);

		elseif (rand == 1) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_I) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_II, true);

		elseif (rand == 1) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_I);

		--then for survivalism line
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_II) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_3) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_III, true);

		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_I) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_3) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_II, true);

		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_3) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_I, true);

		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_2) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_3, true);

		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_1) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_2, true);

		else
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SURVIVALISM_1, true);
		end
	end
end
	
GameEvents.UnitPromoted.Add(CacadorPromotion)

--local trailblazerPromos = {
--	GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_I,
--	GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_II,
--	GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_III
--}
--local survivalismPromos = {
--	GameInfoTypes.PROMOTION_SURVIVALISM_1,
--	GameInfoTypes.PROMOTION_SURVIVALISM_2,
--	GameInfoTypes.PROMOTION_SURVIVALISM_3
--}
--
--function TableConcat(t1,t2)
--    for i=1,#t2 do
--        t1[#t1+1] = t2[i]
--    end
--    return t1
--end
--
--function GivePromotionFromList(pUnit, promoList)
--	for i, promo in ipairs(promoList) do
--		if not pUnit:IsHasPromotion(promo) then
--			pUnit:SetHasPromotion(promo, true)
--			break
--		end
--	end
--end
--
--function CacadorPromotion(iPlayer, iUnit, iPromotionType)
--	local pPlayer = Players[iPlayer]
-- 	local pUnit = pPlayer:GetUnitByID(iUnit)
--	if  pUnit:IsHasPromotion(PROMOTION_WOODLAND_TRAILBLAZER_III) and pUnit:IsHasPromotion(PROMOTION_SURVIVALISM_3) then return end
--
--	if (pUnit:IsHasPromotion(GameInfoTypes.TXT_KEY_PROMOTION_CACADOR)) then
-- 		local rand = math.random(2)
--		local promoList = TableConcat(trailblazerPromos, survivalismPromos)
--		if (rand == 1) then
--			promoList = TableConcat(survivalismPromos, trailblazerPromos)
--		end
--		GivePromotionFromList(pUnit, promoList)
-- 	end
--end
--
--GameEvents.UnitPromoted.Add(CacadorPromotion) 
