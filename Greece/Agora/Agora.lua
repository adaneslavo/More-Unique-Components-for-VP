-- Agora
-- Author: adan_eslavo, pineappledan
-- DateCreated: 25/08/2018
--------------------------------------------------------------
local eBuildingDummyGold = GameInfoTypes.BUILDING_DUMMYGOLD
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

		if eCiv ~= -1 then
			local pCapital = pPlayer:GetCapitalCity()

			pCapital:SetNumRealBuilding(eBuildingDummyGold, pCapital:GetNumRealBuilding(eBuildingDummyGold) + 2)
		end
	end
end

GameEvents.UnitPrekill.Add(OnUnitPrekillProxenosGold)