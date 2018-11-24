-- Seir Morb
-- Author: adan_eslavo
-- DateCreated: 9/12/2017
--------------------------------------------------------------
function CroachingTigerBonusStand(iPlayer)
	local pPlayer = Players[iPlayer]

	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER) then
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_1) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_1, false)
			elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_2) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_2, false)
			elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_3) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_3, false)
			elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_4) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_4, false)
			end
			
			local iMovesLeft = math.floor(pUnit:MovesLeft())

			if iMovesLeft >= 240 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_4, true)
			elseif iMovesLeft >= 180 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_3, true)
			elseif iMovesLeft >= 120 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_2, true)
			elseif iMovesLeft > 0 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_1, true)
			end
		end
	end
end

function CroachingTigerBonusMove(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER) then
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_1) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_1, false)
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_2) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_2, false)
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_3) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_3, false)
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_4) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_4, false)
		end
			
		local iMovesLeft = math.floor(pUnit:MovesLeft())

		if iMovesLeft >= 240 then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_4, true)
		elseif iMovesLeft >= 180 then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_3, true)
		elseif iMovesLeft >= 120 then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_2, true)
		elseif iMovesLeft > 0 then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_SIAM_CROACHING_TIGER_1, true)
		end
	end
end

GameEvents.PlayerDoTurn.Add(CroachingTigerBonusStand)
GameEvents.UnitSetXY.Add(CroachingTigerBonusMove)
