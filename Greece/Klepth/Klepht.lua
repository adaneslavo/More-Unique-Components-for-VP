-- Klepht
-- Author: adan_eslavo
-- DateCreated: 5/11/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function Philhellenism(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)
	pAttackingPlayer = Players[iAttackingPlayer]
	pDefendingPlayer = Players[iDefendingPlayer]
	
	if pAttackingPlayer ~= nil and pDefendingPlayer ~= nil then
		local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
				
		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_GREECE_PHILHELLENISM) then
			local iPlayer = iAttackingPlayer
			local pPlayer = Players[iPlayer]
			local pCapital = pPlayer:GetCapitalCity()
			local iAlliesOrFriends = 0
			local iKlephtEraPlusOne = 5

			for id, player in pairs(Players) do
				if player:IsAllies(iPlayer) or player:IsFriends(iPlayer) then
					iAlliesOrFriends = iAlliesOrFriends + 1
				end
			end
			
			local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ConstructPercent
			local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent
			
			local iGain1 = math.floor(5 * ((pPlayer:GetCurrentEra() + 1) / iKlephtEraPlusOne) *  iGameSpeedModifier1 * (iAlliesOrFriends + 1))
			local iGain2 = math.floor(5 * ((pPlayer:GetCurrentEra() + 1) / iKlephtEraPlusOne) *  iGameSpeedModifier2 * (iAlliesOrFriends + 1))
					
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
