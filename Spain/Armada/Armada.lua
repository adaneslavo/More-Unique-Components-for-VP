-- Armada
-- Author: adan_eslavo
-- DateCreated: 8/11/2017
--------------------------------------------------------------
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
						local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent
						
						pUnit:SetExperience(pUnit:GetExperience() + math.floor(2 * iGameSpeedModifier))
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