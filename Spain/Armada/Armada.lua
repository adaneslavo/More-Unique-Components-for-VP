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

				--pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_SPAIN_INVINCIBLE_AT_FULL"], true)
				pUnit:SetBaseCombatStrength(44)
				
				if pPlot:GetOwner() ~= -1 then
					local pEnemyPlayer = Players[pPlot:GetOwner()]
					local iTeam = pPlayer:GetTeam()
					local pEnemyTeam = Teams[pEnemyPlayer:GetTeam()]

					if pEnemyTeam:IsAtWar(iTeam) then
						pUnit:ChangeExperience(2)
					end
				end
			else
				pUnit:SetBaseCombatStrength(40)
				--pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_SPAIN_INVINCIBLE_AT_FULL"], false)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(InvincibleArmada)
