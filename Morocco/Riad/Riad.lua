function RiadTradeRouteBonuses(iPlayer)
	local pPlayer = Players[iPlayer]
	local tradeRoutes = pPlayer:GetTradeRoutes()
	for i, tradeRoute in pairs(tradeRoutes) do
		local pCity = tradeRoute.FromCity
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_VP_RIAD) then
			pPlayer:ChangeGold(2)
			pPlayer:ChangeJONSCulture(2)
			pCity:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_MERCHANT, 200)
		end
	end
end


GameEvents.PlayerDoTurn.Add(RiadTradeRouteBonuses)