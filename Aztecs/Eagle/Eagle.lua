-- Eagle
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
local ePromotionCaptives = GameInfoTypes.PROMOTION_UNIT_AZTEC_CAPTIVES_OF_WAR
local eUnitWorker = GameInfoTypes.UNIT_WORKER

-- 50% chance to spawn worker unit on kill by an Eagle
function OnCombatEndSpawnWorker(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	
	if not (pAttackingPlayer and (iDefenderFinalDamage >= iDefenderMaxHP)) then return end
	
	
	local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)

	if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(ePromotionCaptives) then
		if Game.Rand(4, "Eagle capture roll") == 1 then
			pAttackingPlayer:InitUnit(eUnitWorker, iPlotX, iPlotY)
		end
	end
	if pAttackingUnit ~= nil and (pAttackingUnit:GetUnitType() == GameInfoTypes.UNIT_AZTEC_JAGUAR) then

		if pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_10) then
			local eNewEagle:pAttackingPlayer:InitUnit(GameInfoTypes.UNIT_AZTEC_EAGLE, iPlotX, iPlotY, -1, DirectionTypes.NO_DIRECTION, false)
			eNewEagle:Convert(pAttackingUnit, false, false)
			eNewEagle:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_10, 0)	
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_9) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_10, 1)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_9, 0)

		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_8) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_9, 1)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_8, 0)

		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_7) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_8, 1)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_7, 0)

		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_6) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_7, 1)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_6, 0)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_5) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_6, 1)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_5, 0)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_4) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_5, 1)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_4, 0)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_3) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_4, 1)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_3, 0)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_2) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_3, 1)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_2, 0)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_1) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_2, 1)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CUAUHOCELOTL_1, 0)
		end
	end
end

GameEvents.CombatEnded.Add(OnCombatEndSpawnWorker)
