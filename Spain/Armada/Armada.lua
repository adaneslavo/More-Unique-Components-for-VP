-- Armada
-- Author: adan_eslavo
-- DateCreated: 8/11/2017
--------------------------------------------------------------
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

local ePromotionInvincible = GameInfoTypes.PROMOTION_UNIT_SPAIN_INVINCIBLE

function GetStrongerAtFullHealth(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(ePromotionInvincible) then
			if pUnit:IsHurt() == false then
				local iX = pUnit:GetX()
				local iY = pUnit:GetY()
				local pPlot = Map.GetPlot(iX, iY)

				pUnit:SetBaseCombatStrength(44)
			else
				pUnit:SetBaseCombatStrength(40)
			end
		end
	end
end

function SendXPOnKill(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP)
	local pAttackingPlayer = Players[iAttackingPlayer]

	if pAttackingPlayer ~= nil then
		local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)

		if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(ePromotionInvincible) then
			if iDefenderFinalDamage > iDefenderMaxHP then
				local plotDistance

				for unit in pAttackingPlayer:Units() do
					if unit:IsHasPromotion(ePromotionInvincible) and unit ~= pAttackingUnit then
						plotDistance = Map.PlotDistance(pAttackingUnit:GetX(), pAttackingUnit:GetY(), unit:GetX(), unit:GetY());

						if plotDistance <= 5 then
							unit:ChangeExperience(math.floor(2 * fGameSpeedModifier), -1, 1) -- the #3 param must be number, 1 for true, 0 or none for false
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(GetStrongerAtFullHealth)
GameEvents.CombatResult.Add(SendXPOnKill)
