local iPromotion1 = GameInfoTypes.PROMOTION_IMPERIAL_VIGILANCE
local iPromotion2 = GameInfoTypes.PROMOTION_YORKSCHER_MARCHE
local iBonus = GameInfoTypes.PROMOTION_LANDWEHR_CS_BONUS

function CheckLandwehr(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in Players[iPlayer]:Units() do
		if pUnit:IsHasPromotion(iPromotion1) then
			local pPlot = pUnit:GetPlot()
			if pPlot then
				local iOwner = pPlot:GetOwner()
				if iOwner >= GameDefines.MAX_MAJOR_CIVS and iOwner < GameDefines.MAX_CIV_PLAYERS then
					local pOwner = Players[iOwner]
					if pOwner:GetMinorCivFriendshipLevelWithMajor(iPlayer) >= 2 then
						pUnit:SetHasPromotion(iBonus, true)
					else
						pUnit:SetHasPromotion(iBonus, false)
					end
				else
					pUnit:SetHasPromotion(iBonus, false)
				end
			end
		end
		if pUnit:IsHasPromotion(iPromotion2) then
			local pPlot = pUnit:GetPlot()
			if pPlot then
				local iOwner = pPlot:GetOwner()
				local pOwner = Players[iOwner]
				if pOwner == pPlayer then
					pPlayer:ChangeJONSCulture(2)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(CheckLandwehr)