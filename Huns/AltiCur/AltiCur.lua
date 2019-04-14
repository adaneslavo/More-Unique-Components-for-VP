-- Alti Cur
-- Author: 
-- DateCreated: 
--------------------------------------------------------------
local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100
local eAltiCurEvent = GameInfoTypes.PLAYER_EVENT_CHOICE_ALTI_CUR_HAPPINESS
local eBuildingAltiCur = GameInfoTypes.BUILDING_HUNS_ALTI_CUR
local eCivilizationHuns = GameInfoTypes.CIVILIZATION_HUNS

-- adds gold and 6 turn of happiness after demanding tribute from CS
function OnDemandTributeAddGoldAndHappiness(iPlayer, iCS)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationHuns) then return end
	
	local iNumberOfAltiCurs = pPlayer:CountNumBuildings(eBuildingAltiCur)

	local pCityWithAltiCur

	if iNumberOfAltiCurs > 0 then 
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingAltiCur) then
				pCityWithAltiCur = city
				break
			end
		end
	else return end

	local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
	local iGoldGain = 100 * iEraModifier * fGameSpeedModifier
	
	pPlayer:ChangeGold(iGoldGain)
	
	if pPlayer:IsEventChoiceActive(eAltiCurEvent) then
		pPlayer:DoCancelEventChoice(eAltiCurEvent)
	end

	pPlayer:DoEventChoice(eAltiCurEvent)

	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		local iX, iY = pCityWithAltiCur:GetX(), pCityWithAltiCur:GetY()
		local vCityPosition = PositionCalculator(iX, iY)

		Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_GOLD]+"..iGoldGain.."[ICON_GOLD][ENDCOLOR]", 1)

		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC,
			'Player demanded tribute from City-State. People admire your power. You gain Gold and Happiness.',
			'Demanding tribute from City-State',
			iX, iY, pCityWithAltiCur:GetID())
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationHuns) then
	GameEvents.PlayerBullied.Add(OnDemandTributeAddGoldAndHappiness)
end
