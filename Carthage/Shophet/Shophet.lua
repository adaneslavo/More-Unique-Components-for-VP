-- Shophet
-- Author: JFD, pineappledan, Blue Ghost
-- 2018-01-27 updated by Infixo
-- 2018-01-31 updated by adan_eslavo
----------------------------------------------------------------------------------------------------------------------------	
local iUnitPromotionGreatAdmiral = GameInfoTypes["PROMOTION_GREAT_ADMIRAL"]
local iUnitPromotionGreatGeneral = GameInfoTypes["PROMOTION_GREAT_GENERAL"]
local iUnitPromotionShophetAdmiral = GameInfoTypes["PROMOTION_UNIT_CARTHAGE_ADMIRAL"]
local iUnitPromotionShophetGeneral = GameInfoTypes["PROMOTION_UNIT_CARTHAGE_GENERAL"]
local iUnitAdmiral = GameInfoTypes["UNIT_GREAT_ADMIRAL"]
local iUnitShophet = GameInfoTypes["UNIT_CARTHAGE_SHOPHET"]
local iDomain = GameInfoTypes["DOMAIN_LAND"]
local iUnitPromotionShophetZoC = GameInfoTypes["PROMOTION_UNIT_CARTHAGE_ZOC"]

-- ShophetChange
function ShophetChange(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(iX, iY)
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if (pUnit and pPlot and pUnit:IsHasPromotion(iUnitPromotionShophetGeneral)) then
		if pPlot:IsWater() then
			local pNewShophet = pPlayer:InitUnit(iUnitAdmiral, iX, iY, -1, DirectionTypes.NO_DIRECTION, false)
			
			pUnit:SetEmbarked(false)
			
			pNewShophet:Convert(pUnit, false, false)
			pNewShophet:SetHasPromotion(iUnitPromotionShophetGeneral, false)
			pNewShophet:SetHasPromotion(iUnitPromotionGreatGeneral, false)
			pNewShophet:SetHasPromotion(iUnitPromotionShophetAdmiral, true)
			pNewShophet:SetMoves(0)
		end
	elseif (pUnit and pPlot and pUnit:IsHasPromotion(iUnitPromotionShophetAdmiral)) then
		if not pPlot:IsWater() then
			local pNewShophet = pPlayer:InitUnit(iUnitShophet, iX, iY, -1, DirectionTypes.NO_DIRECTION, false)
			
			pNewShophet:Convert(pUnit, false, false)
			pNewShophet:SetHasPromotion(iUnitPromotionShophetAdmiral, false)
			pNewShophet:SetHasPromotion(iUnitPromotionGreatAdmiral, false)
			pNewShophet:SetHasPromotion(iUnitPromotionShophetGeneral, true)
			pNewShophet:SetMoves(0)
		end
	end
end

-- ShophetZoneOfControl
function ShophetZoneOfControl(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if (pPlayer:IsAlive() and (not pPlayer:IsBarbarian())) then	
		for pUnit in pPlayer:Units() do
			if (pUnit:GetDomainType() == iDomain and (not pUnit:IsEmbarked())) then
				local bIsNearbyShophet = (pUnit:IsAdjacentToUnit(iUnitShophet, true, false) or pUnit:IsWithinDistanceOfUnit(iUnitShophet, 0, true, false))
				
				pUnit:SetHasPromotion(iUnitPromotionShophetZoC, bIsNearbyShophet)
			end
		end
	end
end

if Game.IsCivEverActive(eCivilizationCarthage) then
	GameEvents.PlayerDoTurn.Add(ShophetZoneOfControl)
	GameEvents.UnitSetXY.Add(ShophetChange)
end

