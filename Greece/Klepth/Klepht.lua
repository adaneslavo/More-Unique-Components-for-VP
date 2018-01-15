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
		local iGameSpeedScaler
		
		if Game.GetGameSpeedType() == 0 then
			iGameSpeedScaler = 3
		elseif Game.GetGameSpeedType() == 1 then
			iGameSpeedScaler = 1.5
		elseif Game.GetGameSpeedType() == 2 then
			iGameSpeedScaler = 1
		else
			iGameSpeedScaler = 0.66
		end
		
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

			local iGain = math.floor((5 * ((pPlayer:GetCurrentEra() + 1) / iKlephtEraPlusOne) *  iGameSpeedScaler * (iAlliesOrFriends + 1)) + 0.5)
					
			pPlayer:ChangeGold(iGain)
			pCapital:ChangeProduction(iGain)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pAttackingUnit:GetX(), pAttackingUnit:GetY())
				
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_YIELD_PRODUCTION]+"..iGain.." [ICON_PRODUCTION][ENDCOLOR]", 1)
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_YIELD_GOLD]+"..iGain.." [ICON_GOLD][ENDCOLOR]", 1.5)
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CombatEnded.Add(Philhellenism)
