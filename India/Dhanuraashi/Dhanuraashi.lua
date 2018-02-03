-- Dhanuraashi
-- Author: adan_eslavo
-- DateCreated: 4/12/2017
--------------------------------------------------------------
--[[include("FLuaVector.lua")

-- check XP scaling
local bXPScaling = true -- default VP

for t in GameInfo.CustomModOptions{Name="BALANCE_CORE_SCALING_XP"} do 
	bXPScaling = (tValue == 1) 
end

-- acquire game speed modifier
local fGameSpeedModifier = 1.0 -- it is float, so use 'f' at begining

if bXPScaling then 
	fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent / 100 
end

function DhanurvidyaXPGain(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]
	print("dhanurgraha")
	if pAttackingPlayer ~= nil and pDefendingPlayer ~= nil then
		local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
		
		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_INDIA_EPIC) then
			if pDefendingUnit:IsDead() then
				pAttackingUnit:ChangeExperience(math.floor(5 * fGameSpeedModifier), -1, true)
			end
		elseif pDefendingUnit ~= nil and pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_INDIA_EPIC) then			
			if pAttackingUnit:IsDead() then
				pDefendingUnit:ChangeExperience(math.floor(5 * fGameSpeedModifier), -1, true)
			end
		end
	end
end

function DhanurvidyaCultureGain(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_INDIA_DHANURVIDYA) then
		local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent / 100
		local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100
		
		local iChange1 = math.floor(5 * (pUnit:GetLevel() - 1) * iGameSpeedScaler1)
		local iChange2 = math.floor(5 * (pUnit:GetLevel() - 1) * iGameSpeedScaler2)
		
		pPlayer:ChangeJONSCulture(iChange2)
		pPlayer:ChangeFaith(iChange1)

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
		
			Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+ "..iChange2.." [ICON_CULTURE] Dhanurvidya[ENDCOLOR]", 1)
			Events.AddPopupTextEvent(vUnitPosition, "[COLOR_WHITE]+ "..iChange1.." [ICON_PEACE] Dhanurvidya[ENDCOLOR]", 1.5)
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CombatEnded.Add(DhanurvidyaXPGain)
GameEvents.UnitPromoted.Add(DhanurvidyaCultureGain)
