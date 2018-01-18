function RiadTradeRouteBonuses(iPlayer)
	local pPlayer = Players[iPlayer]
	local tradeRoutes = pPlayer:GetTradeRoutes()
	for i, tradeRoute in pairs(tradeRoutes) do
		local pCity = tradeRoute.FromCity
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_VP_RIAD) then
			local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent
			local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent
			local iGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GreatPeoplePercent
			
			pPlayer:ChangeGold(math.floor(2 * iGameSpeedModifier1))
			pPlayer:ChangeJONSCulture(math.floor(2 * iGameSpeedModifier2))
			pCity:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_MERCHANT, math.floor(200 * iGameSpeedModifier3))
		end
	end
end


GameEvents.PlayerDoTurn.Add(RiadTradeRouteBonuses)