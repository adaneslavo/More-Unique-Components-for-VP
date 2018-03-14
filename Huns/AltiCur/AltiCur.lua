-- Alti Cur
-- Author: 
-- DateCreated: 
--------------------------------------------------------------
local eAltiCurEvent = GameInfoTypes.PLAYER_EVENT_CHOICE_ALTI_CUR_HAPPINESS
local eBuildingAltiCur = GameInfoTypes.BUILDING_HUNS_ALTI_CUR
local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100

-- adds gold and 6 turn of happiness after demanding tribute from CS
function OnDemandTributeAddGoldAndHappiness(iPlayer, iCS)
	local pPlayer = Players[iPlayer]
	local bHasAltiCur = false
	local pCity

	for city in pPlayer:Cities() do
		if city:IsHasBuilding(GameInfoTypes.BUILDING_HUNS_ALTI_CUR) then
			bHasAltiCur = true
			pCity = city
			break
		end
	end

	if not bHasAltiCur then
		return
	end
	
	local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
	local iGoldGain = 100 * iEraModifier * fGameSpeedModifier
	
	pPlayer:ChangeGold(iGoldGain)
	
	if pPlayer:IsEventChoiceActive(eAltiCurEvent) then
		pPlayer:DoCancelEventChoice(eAltiCurEvent)
	end

	pPlayer:DoEventChoice(eAltiCurEvent)

	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		local iX, iY = pCity:GetX(), pCity:GetY()
		local vCityPosition = PositionCalculator(iX, iY)

		Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_GOLD]+"..iGoldGain.."[ICON_GOLD][ENDCOLOR]", 1)

		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC,
			'Player demanded tribute from City-State. People admire your power. You gain Gold and Happiness.',
			'Demanding tribute from City-State',
			iX, iY, pCity:GetID())
	end
end

GameEvents.PlayerBullied.Add(OnDemandTributeAddGoldAndHappiness)