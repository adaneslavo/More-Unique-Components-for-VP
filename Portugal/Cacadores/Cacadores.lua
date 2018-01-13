local trailblazerPromos = {
	GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_I,
	GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_II,
	GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_III
}
local survivalismPromos = {
	GameInfoTypes.PROMOTION_SURVIVALISM_1,
	GameInfoTypes.PROMOTION_SURVIVALISM_2,
	GameInfoTypes.PROMOTION_SURVIVALISM_3
}

function TableConcat(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

function GivePromotionFromList(pUnit, promoList)
	for i, promo in ipairs(promoList) do
		if not pUnit:IsHasPromotion(promo) then
			pUnit:SetHasPromotion(promo, true)
			break
		end
	end
end

function CacadorPromotion(iPlayer, iUnit, iPromotionType)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if (pUnit:IsHasPromotion(GameInfoTypes.TXT_KEY_PROMOTION_CACADOR)) then
		local rand = math.random(2)
		local promoList = TableConcat(trailblazerPromos, survivalismPromos)
		if (rand == 1) then
			promoList = TableConcat(survivalismPromos, trailblazerPromos)
		end
		GivePromotionFromList(pUnit, promoList)
	end
end

GameEvents.UnitPromoted.Add(CacadorPromotion)