function RiadTradeRouteBonuses(iPlayer)
	local pPlayer = Players[iPlayer]
	local tradeRoutes = pPlayer:GetTradeRoutes()
	
	for i, tradeRoute in pairs(tradeRoutes) do
		local pCity = tradeRoute.FromCity
		
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_VP_RIAD) then
			local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100
			local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
			local iGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GreatPeoplePercent / 100
			
			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)

			pPlayer:ChangeGold(math.floor(1 * iGameSpeedModifier1 * iEraModifier))
			pPlayer:ChangeJONSCulture(math.floor(1 * iGameSpeedModifier2 * iEraModifier))
			pCity:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_MERCHANT, math.floor(100 * iGameSpeedModifier3))
		end
	end
end


GameEvents.PlayerDoTurn.Add(RiadTradeRouteBonuses)