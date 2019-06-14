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

		if pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_10) then
			local eNewEagle = pAttackingPlayer:InitUnit(GameInfoTypes.UNIT_AZTEC_EAGLE, iPlotX, iPlotY, -1, DirectionTypes.NO_DIRECTION, false)
			eNewEagle:Convert(pAttackingUnit, false, false)
			eNewEagle:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_10, false)
			eNewEagle:SetHasPromotion(GameInfoTypes.PROMOTION_BARBARIAN_BONUS, false)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_9) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_10, true)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_9, false)

		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_8) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_9, true)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_8, false)

		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_7) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_8, true)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_7, false)

		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_6) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_7, true)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_6, false)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_5) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_6, true)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_5, false)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_4) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_5, true)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_4, false)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_3) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_4, true)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_3, false)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_2) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_3, true)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_2, false)
		
		elseif pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1) then
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_2, true)
			pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1, false)
		end
	end
end

GameEvents.CombatEnded.Add(OnCombatEndSpawnWorker)
