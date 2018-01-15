----------------------------------------------------------------------------------------------------------------------------
-- SHOPHET
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_CarthageHannibal_Shophet
local unitPromotionGreatAdmiralID = GameInfoTypes["PROMOTION_GREAT_ADMIRAL"]
local unitPromotionGreatGeneralID = GameInfoTypes["PROMOTION_GREAT_GENERAL"]
local unitPromotionShophetID = GameInfoTypes["PROMOTION_JFD_SHOPHET"]
local unitPromotionShophetAdmiralID = GameInfoTypes["PROMOTION_JFD_SHOPHET_ADMIRAL"]
local unitPromotionShophetGeneralID = GameInfoTypes["PROMOTION_JFD_SHOPHET_GENERAL"]
local unitAdmiralID = GameInfoTypes["UNIT_GREAT_ADMIRAL"]
local unitShophetID = GameInfoTypes["UNIT_JFD_SHOPHET"]
function JFD_CarthageHannibal_Shophet(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local plot = Map.GetPlot(unitX, unitY)
	local unit = player:GetUnitByID(unitID)
	if (unit and plot and unit:IsHasPromotion(unitPromotionShophetGeneralID)) then
		if plot:IsWater() then
			local newShophet = player:InitUnit(unitAdmiralID, unitX, unitY, -1, DirectionTypes.NO_DIRECTION, false)
			unit:SetEmbarked(false)
			newShophet:Convert(unit, false)
			newShophet:SetHasPromotion(unitPromotionShophetGeneralID, false)
			newShophet:SetHasPromotion(unitPromotionGreatGeneralID, false)
			newShophet:SetHasPromotion(unitPromotionShophetID, false)
			newShophet:SetHasPromotion(unitPromotionShophetAdmiralID, true)
		end
	elseif (unit and plot and unit:IsHasPromotion(unitPromotionShophetAdmiralID)) then
		if (not plot:IsWater()) then
			local newShophet = player:InitUnit(unitShophetID, unitX, unitY, -1, DirectionTypes.NO_DIRECTION, false)
			newShophet:Convert(unit, false)
			newShophet:SetHasPromotion(unitPromotionShophetAdmiralID, false)
			newShophet:SetHasPromotion(unitPromotionGreatAdmiralID, false)
			newShophet:SetHasPromotion(unitPromotionShophetGeneralID, true)
			newShophet:SetHasPromotion(unitPromotionShophetID, true)
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_CarthageHannibal_Shophet) 

-- JFD_CarthageHannibal_AtTheGates
--local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
--function JFD_CarthageHannibal_AtTheGates(playerID)
--	local player = Players[playerID]
--	local playerTeam = Teams[player:GetTeam()]
--	if player:GetUnitClassCount(unitClassGreatGeneralID) == 0 then return end
--	if isUsingCPDLL then
--		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
--			local otherPlayer = Players[otherPlayerID]
--			if (player:IsAlive() and otherPlayerID ~= playerID) then
--				if playerTeam:IsAtWar(otherPlayer:GetTeam()) then
--					for city in otherPlayer:Cities() do
--						local shophetDamage = 0
--						if city:IsWithinDistanceOfUnit(unitShophetID, 1, false, true) then
--							shophetDamage = 30	
--						elseif city:IsWithinDistanceOfUnit(unitShophetID, 2, false, true) then
--							shophetDamage = 20
--						end
--						if (shophetDamage > 0 and (player:IsHuman() or otherPlayer:IsHuman())) then
--							city:ChangeDamage(shophetDamage)
--							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]-{1_Num} Hannibal ante Portas[ENDCOLOR]", shophetDamage))
--						end
--					end
--				end
--			end
--		end
--	else
--		for unit in player:Units() do
--			if unit:IsHasPromotion(unitPromotionShophetID) then
--				local unitX = unit:GetX()
--				local unitY = unit:GetY()
--				for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
--					local otherPlayer = Players[otherPlayerID]
--					if (player:IsAlive() and otherPlayerID ~= playerID) then
--						if playerTeam:IsAtWar(otherPlayer:GetTeam()) then
--							for city in otherPlayer:Cities() do
--								local shophetDamage = 0
--								local cityX = city:GetX()
--								local cityY = city:GetY()
--								local distance = Map.PlotDistance(unitX, unitY, cityX, cityY)
--								if distance < 2 then
--									shophetDamage = 30
--								elseif distance < 3 then
--									shophetDamage = 20
--								end
--								if (shophetDamage > 0 and (player:IsHuman() or otherPlayer:IsHuman())) then
--									city:ChangeDamage(shophetDamage)
--									Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(cityX, cityY))), Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]-{1_Num} Hannibal ante Portas[ENDCOLOR]", shophetDamage))
--								end
--							end
--						end
--					end
--				end
--			end
--		end
--	end		
--end	
--GameEvents.PlayerDoTurn.Add(JFD_CarthageHannibal_AtTheGates)

-- JFD_CarthageHannibal_ShophetZoC
local unitDomainLandID = GameInfoTypes["DOMAIN_LAND"]
local unitPromotionShophetZoCID = GameInfoTypes["PROMOTION_JFD_SHOPHET_ZOC"]
function JFD_CarthageHannibal_ShophetZoC(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	
		for unit in player:Units() do
			if (unit:GetDomainType() == unitDomainLandID and (not unit:IsEmbarked())) then
				local isNearbyShophet = false
				local unitPlot = unit:GetPlot()
				if isUsingCPDLL then
					isNearbyShophet = (unit:IsWithinDistanceOfUnit(unitShophetID, 1, true) or unit:IsWithinDistanceOfUnit(unitShophetID, 0))
				else
					for adjacentPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						isNearbyShophet = (adjacentPlot:GetUnit() and adjacentPlot:GetUnit():IsHasPromotion(unitPromotionShophetID))
						if isNearbyShophet == true then 
							break
						end
					end
				end
				if isNearbyShophet then
					if (not unit:IsHasPromotion(unitPromotionShophetZoCID)) then
						unit:SetHasPromotion(unitPromotionShophetZoCID, true)
					end
				else
					if unit:IsHasPromotion(unitPromotionShophetZoCID) then
						unit:SetHasPromotion(unitPromotionShophetZoCID, false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_CarthageHannibal_ShophetZoC) 
--==========================================================================================================================
--==========================================================================================================================