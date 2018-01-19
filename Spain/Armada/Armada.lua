-- Armada
-- Author: adan_eslavo
-- DateCreated: 8/11/2017
--------------------------------------------------------------

-- check XP scaling
local bXPScaling = true -- default VP
for t in GameInfo.CustomModOptions{Name="BALANCE_CORE_SCALING_XP"} do bXPScaling = (tValue == 1) end
print("XP scaling is", bXPScaling)

-- acquire game speed modifier
local fGameSpeedModifier = 1.0 -- it is float, so use 'f' at begining
if bXPScaling then fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent / 100 end
print("Game speed modifier is", fGameSpeedModifier)

function InvincibleArmada(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_SPAIN_INVINCIBLE) then
			if pUnit:IsHurt() == false then
				local iX = pUnit:GetX()
				local iY = pUnit:GetY()
				local pPlot = Map.GetPlot(iX, iY)

				if not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_SPAIN_INVINCIBLE_AT_FULL"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_SPAIN_INVINCIBLE_AT_FULL"], true)
				end
				
				if pPlot:GetOwner() ~= -1 then
					local pEnemyPlayer = Players[pPlot:GetOwner()]
					local iTeam = pPlayer:GetTeam()
					local pEnemyTeam = Teams[pEnemyPlayer:GetTeam()]

					if pEnemyTeam:IsAtWar(iTeam) then
						pUnit:SetExperience(pUnit:GetExperience() + math.floor(2 * fGameSpeedModifier))
					end
				end
			else
				if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_UNIT_SPAIN_INVINCIBLE_AT_FULL"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_SPAIN_INVINCIBLE_AT_FULL"], false)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(InvincibleArmada)