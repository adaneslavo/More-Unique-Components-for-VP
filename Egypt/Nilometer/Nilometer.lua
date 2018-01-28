-- Nilometer
-- Author: adan_eslavo
-- DateCreated: 8/01/2018
-- 2018-01-21 updated by Infixo
--------------------------------------------------------------
function NilometerPlaceFlax(iPlayer, iCity, iBuilding)
	--print("NilometerPlaceFlax",iPlayer, iCity, iBuilding)
	-- check for Egypt
	local pPlayer = Players[iPlayer]
	if not( pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_EGYPT ) then return end
	-- check for Nilometer
	if iBuilding ~= GameInfoTypes.BUILDING_EGYPT_NILOMETER then return end
	local pCity = pPlayer:GetCityByID(iCity)
	if not pCity then return end
	
	-- 1st pass - flood plains, close to river
	local function LookForFloodPlains(pPlot)
		return pPlot:IsRiver() and pPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS
	end
	-- 2nd pass - flat river land, no feature or forests/jungle
	local function LookForRiverFlats(pPlot)
		if not pPlot:IsRiver() then return false end
		if pPlot:IsMountain() or pPlot:IsHills() then return false end
		return (pPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS  or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS or
		        pPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT) and
			   (pPlot:GetFeatureType() == (-1) or 
			    pPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST or pPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE)
	end
	-- 3rd pass - 1+2 with no river condition
	local function LookForOtherPlaces(pPlot)
		if pPlot:IsMountain() or pPlot:IsHills() then return false end
		return (pPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS  or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS or
		        pPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT) and
			   (pPlot:GetFeatureType() == (-1) or pPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS or
			    pPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST or pPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE)
	end
	
	-- helper function: will scan city area and place a resource on a suitable random tile, will return num of resources placed or 0 if none was
	local function TryToPlaceFlax(iPlayer, LookForFunction, iHowMany)
		if iHowMany <= 0 then return 0 end -- nothing to place
		-- find suitable places
		local tPossibleSpots = {}
		for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
			local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
			local iPlotOwner = pSpecificPlot:GetOwner()
			if iPlotOwner == iPlayer and LookForFunction(pSpecificPlot) and pSpecificPlot:GetNumResource() == 0 then -- cannot have already a resource
				table.insert(tPossibleSpots, pSpecificPlot)
			end
		end
		-- try to find a spot
		local function TryToPlaceOneFlax()
			if #tPossibleSpots == 0 then return 0 end -- sorry, no valid spot
			local pChosenPlot = table.remove( tPossibleSpots, math.random(#tPossibleSpots)) -- don't use again
			pChosenPlot:SetResourceType(GameInfoTypes.RESOURCE_EGYPT_FLAX, 1)
			-- inform the player
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				pPlayer:AddNotification(
					NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE,
					'The City of [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] constructed Nilometer and [COLOR_POSITIVE_TEXT]created[ENDCOLOR] a new source of [ICON_RES_FLAX] Flax.', -- use TXT_KEY_ here
					'New source of [ICON_RES_FLAX] Flax nearby '..pCity:GetName()..' [COLOR_POSITIVE_TEXT]created[ENDCOLOR]',
					pChosenPlot:GetX(), pChosenPlot:GetY(), GameInfoTypes.RESOURCE_EGYPT_FLAX)
			end
			return 1
		end
		-- ok, try to place 2
		local iPlaced = TryToPlaceOneFlax()
		if iPlaced < iHowMany then iPlaced = iPlaced + TryToPlaceOneFlax() end
		return iPlaced
	end
	
	-- place 2 flaxes
	local iFlaxCount = 0
	iFlaxCount = iFlaxCount + TryToPlaceFlax(iPlayer, LookForFloodPlains, 2-iFlaxCount)
	iFlaxCount = iFlaxCount + TryToPlaceFlax(     -1, LookForFloodPlains, 2-iFlaxCount)
	iFlaxCount = iFlaxCount + TryToPlaceFlax(iPlayer, LookForRiverFlats,  2-iFlaxCount)
	iFlaxCount = iFlaxCount + TryToPlaceFlax(     -1, LookForRiverFlats,  2-iFlaxCount)
	iFlaxCount = iFlaxCount + TryToPlaceFlax(iPlayer, LookForOtherPlaces, 2-iFlaxCount)
	iFlaxCount = iFlaxCount + TryToPlaceFlax(     -1, LookForOtherPlaces, 2-iFlaxCount)
	
	-- send a negative notification
	if pPlayer:IsHuman() and pPlayer:IsTurnActive() and iFlaxCount == 0 then 
		pPlayer:AddNotification(
			NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE,
			'The City of [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] constructed Nilometer but [COLOR_NEGATIVE_TEXT]there was no place[ENDCOLOR] to create a new source of [ICON_RES_FLAX] Flax.', -- use TXT_KEY_ here
			'New source of [ICON_RES_FLAX] Flax nearby '..pCity:GetName()..' [COLOR_NEGATIVE_TEXT]not created[ENDCOLOR]',
			pCity:GetX(), pCity:GetY(), GameInfoTypes.RESOURCE_EGYPT_FLAX)
	end
end
GameEvents.CityConstructed.Add(NilometerPlaceFlax)