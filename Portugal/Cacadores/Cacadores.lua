-- Cacadores 2.0
-- Author: pineappledan
-- DateCreated:
-- 2018-02-26 updated by Infixo
-- 2018-03-04 rewritten by Infixo
--------------------------------------------------------------	

local tEligiblePromotions = {
	GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_I,
	GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_II,
	GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_III,
	GameInfoTypes.PROMOTION_SURVIVALISM_1,
	GameInfoTypes.PROMOTION_SURVIVALISM_2,
	GameInfoTypes.PROMOTION_SURVIVALISM_3,
}

function OnUnitPromotedCacadorPromotion(iPlayer, iUnit, iPromotionType)
	local pPlayer = Players[iPlayer]
	if not pPlayer then return end -- assert
	local pUnit = pPlayer:GetUnitByID(iUnit)
	-- No need to go further if unit has all eligible promotions
	if not (pUnit and pUnit.IsHasPromotion(GameInfoTypes.PROMOTION_CACADOR) and pUnit:GetLevel() < #tEligiblePromotions + 2) then return end
	
	-- Create a list of available promotions
	-- There's a Lua function that checks in a unit can be promoted with a specific promotion!
	local tAvailablePromotions = {}
	for _,promo in ipairs(tEligiblePromotions) do
		if pUnit:CanPromote(promo, -1) then table.insert(tAvailablePromotions, promo) end
	end
	if #tAvailablePromotions == 0 then return end -- assert
	
	-- Grant a random one
	pUnit:SetHasPromotion(tAvailablePromotions[ math.random(1, #tAvailablePromotions) ], true)
end
GameEvents.UnitPromoted.Add(OnUnitPromotedCacadorPromotion)

function CacadorPromotion(iPlayer, iUnit, iPromotionType)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
		--If unit is level 8 or higher it has all the promotions. No need to go further
	if (pUnit:getLevel() >= 8) then return end

	if (pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CACADOR)) then
		local rand = math.random(2)
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
--	if (pUnit:getLevel() >= 8) then return end
--	if (pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CACADOR)) then
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
