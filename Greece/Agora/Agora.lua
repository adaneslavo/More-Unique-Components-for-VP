-- Agora
-- Author: adan_eslavo, pineappledan
-- DateCreated: 25/08/2018
--------------------------------------------------------------
local eBuildingDummyForProxenos = GameInfoTypes.BUILDING_D_FOR_PROXENOS
local ePromotionProxenos = GameInfoTypes.PROMOTION_UNIT_GREECE_PROXENOS
-- adds gold to the city after performing diplo missions
function OnUnitPrekillProxenosGold(unitOwnerId, unitId, iUnitType, unitX, unitY, bDelay, eKillingPlayer)
	--print("ProxenosGold",unitOwnerId, unitId, iUnitType, unitX, unitY, bDelay, eKillingPlayer)
	if not (bDelay and eKillingPlayer == -1) then return end -- this check is important as this event is called TWICE; eKillingPlayer is always -1 when bDelay = false, only when bDelay = true it contains a correct player ID

	local pPlayer = Players[unitOwnerId]
	if not pPlayer then return end -- assert

	local pUnit = pPlayer:GetUnitByID(unitId)
	if not pUnit then return end -- assert

	if pUnit:IsHasPromotion(ePromotionProxenos) then
		local pPlot = Map.GetPlot(unitX, unitY)
		local eCiv = pPlot:GetOwner()

		if eCiv ~= -1 and Players[eCiv]:IsMinorCiv() then
			local pCapital = pPlayer:GetCapitalCity()
			local sName = pCapital:GetName()

			pCapital:SetNumRealBuilding(eBuildingDummyForProxenos, pCapital:GetNumRealBuilding(eBuildingDummyForProxenos) + 1)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_INSTANT_YIELD,
					'[ICON_INFLUENCE] Diplomatic Mission performed by Unit with Proxenos ability. The City of '..sName..' gained additional 2 [ICON_GOLD] Gold',
					'Gold added in '..sName, 
					unitX, unitY, pCapital:GetID())
			end
		end
	end
end

GameEvents.UnitPrekill.Add(OnUnitPrekillProxenosGold)