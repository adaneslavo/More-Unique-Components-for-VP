-- Klepht
-- Author: adan_eslavo
-- DateCreated: 5/11/2017
-- 2018-04-08: Infixo, fixed Proxenos ability
--------------------------------------------------------------
include("FLuaVector.lua")

function Philhellenism(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]

	if pAttackingPlayer ~= nil and pDefendingPlayer ~= nil then
		local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
				
		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_GREECE_PHILHELLENISM) then
			local iPlayer = iAttackingPlayer
			local pPlayer = Players[iPlayer]
			local pCapital = pPlayer:GetCapitalCity()
			local iAlliesOrFriends = 0

			for id, player in pairs(Players) do
				if player:IsAllies(iPlayer) or player:IsFriends(iPlayer) then
					iAlliesOrFriends = iAlliesOrFriends + 1
				end
			end
			
			local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ConstructPercent / 100
			local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100
			
			local iGain1 = math.floor(1.25 *  iGameSpeedModifier1 * (iAlliesOrFriends + 1))
			local iGain2 = math.floor(1.25 *  iGameSpeedModifier2 * (iAlliesOrFriends + 1))
					
			pPlayer:ChangeGold(iGain2)
			pCapital:ChangeProduction(iGain1)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pAttackingUnit:GetX(), pAttackingUnit:GetY())
				
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_YIELD_PRODUCTION]+"..iGain1.." [ICON_PRODUCTION][ENDCOLOR]", 1)
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_YIELD_GOLD]+"..iGain2.." [ICON_GOLD][ENDCOLOR]", 1.5)
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CombatEnded.Add(Philhellenism)

--------------------------------------------------------------
-- Proxenos ability is actually related to Agora building, not Klepht unit!

function OnUnitPrekillProxenosGold(unitOwnerId, unitId, iUnitType, unitX, unitY, bDelay, eKillingPlayer)
	--print("ProxenosGold",unitOwnerId, unitId, iUnitType, unitX, unitY, bDelay, eKillingPlayer)
	
	if not (bDelay and eKillingPlayer == -1) then return end -- this check is important as this event is called TWICE; eKillingPlayer is always -1 when bDelay = false, only when bDelay = true it contains a correct player ID
	
	local pPlayer = Players[unitOwnerId]
	if not pPlayer then return end -- assert
	local pUnit = pPlayer:GetUnitByID(unitId)
	if not pUnit then return end -- assert

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_GREECE_PROXENOS) then
		local pPlot = Map.GetPlot(unitX, unitY)
		local eCiv = pPlot:GetOwner()
		if eCiv ~= -1 and Players[eCiv]:IsMinorCiv() then
			local pCapital = pPlayer:GetCapitalCity()
			pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGOLD, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGOLD) + 2)
		end
	end
end

GameEvents.UnitPrekill.Add(OnUnitPrekillProxenosGold)
