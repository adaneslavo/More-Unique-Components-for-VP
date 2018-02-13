local iAltiCurEvent = GameInfoTypes.PLAYER_EVENT_CHOICE_ALTI_CUR_HAPPINESS

function AltiCurMinorTribute(iPlayer, iCS)
	local pPlayer = Players[iPlayer]
	local hasAltiCur = false
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_3UC_YURT) then
			hasAltiCur = true
		end
	end

	if not hasAltiCur then
		return
	end
	
	local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
	local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100
	local iGoldGain = 100 * iEraModifier * iGameSpeedModifier
	pPlayer:ChangeGold(iGoldGain)
	if iPlayer == Game:GetActivePlayer() then
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, Locale.ConvertTextKey("TXT_KEY_ALERT_ALTI_CUR_MINOR_TRIBUTE", iGoldGain), "Alti Cur Tribute Bonus")
	end

	if pPlayer:IsEventChoiceActive(iAltiCurEvent) then
		pPlayer:DoCancelEventChoice(iAltiCurEvent)
	end

	pPlayer:DoEventChoice(iAltiCurEvent)
end

GameEvents.PlayerBullied.Add(AltiCurMinorTribute)