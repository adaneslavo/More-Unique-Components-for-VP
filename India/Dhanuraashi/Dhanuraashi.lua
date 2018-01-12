-- Dhanuraashi
-- Author: adan_eslavo
-- DateCreated: 4/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function DhanurvidyaXPGain(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)
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
		
		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_INDIA_EPIC) then
			if pDefendingUnit:IsDead() then
				pAttackingUnit:SetExperience(pAttackingUnit:GetExperience() + (5 * iGameSpeedScaler))
			end
		elseif pDefendingUnit ~= nil and pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_INDIA_EPIC) then			
			if pAttackingUnit:IsDead() then
				pDefendingUnit:SetExperience(pDefendingUnit:GetExperience() + (5 * iGameSpeedScaler))
			end
		end
	end
end

function DhanurvidyaCultureGain(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_INDIA_DHANURVIDYA) then
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
		
		local iChange = math.floor((5 * (pUnit:GetLevel() - 1) * (pPlayer:GetCurrentEra() + 1) * iGameSpeedScaler) + 0.5)
		
		pPlayer:ChangeJONSCulture(iChange)
		pPlayer:ChangeFaith(iChange)

		if pPlayer:IsTurnActive() then
			local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
		
			Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+ "..iChange.." [ICON_CULTURE] Dhanurvidya[ENDCOLOR]", 1)
			Events.AddPopupTextEvent(vUnitPosition, "[COLOR_WHITE]+ "..iChange.." [ICON_PEACE] Dhanurvidya[ENDCOLOR]", 1.5)
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CombatEnded.Add(DhanurvidyaXPGain)
GameEvents.UnitPromoted.Add(DhanurvidyaCultureGain)
