-- Nilometer
-- Author: adan_eslavo
-- DateCreated: 8/01/2018
-- 2018-01-21 updated by Infixo
--------------------------------------------------------------
local eBuildingNilometer = GameInfoTypes.BUILDING_EGYPT_NILOMETER
local eResourceFlax = GameInfoTypes.RESOURCE_EGYPT_FLAX
local eCivilizationEgypt = GameInfoTypes.CIVILIZATION_EGYPT
local eFlaxDummy = GameInfoTypes.BUILDING_D_FOR_FLAX

-- creates 2 sources of flax if possible. Checks 6 different conditions in total prioritizing player tiles over unowned ones
function NilometerPlaceFlax(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if not(pPlayer and pPlayer:GetCivilizationType() == eCivilizationEgypt) then return end
	if iBuilding ~= eBuildingNilometer then return end
	
	local pCity = pPlayer:GetCityByID(iCity)
	
	if not pCity then return end
	if pCity:IsHasBuilding(eFlaxDummy) then return end
	
	-- local functions for plaing flax under certain conditions
		-- 1st pass - flood plains, close to river
		local function LookForFloodPlains(pPlot)
			return pPlot:IsRiver() and pPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS
		end

		-- 2nd pass - flat river land, no feature or forests/jungle
		local function LookForRiverFlats(pPlot)
			if not pPlot:IsRiver() then return false end
			if pPlot:IsMountain() or pPlot:IsHills() then return false end
			
			local iTerrain = pPlot:GetTerrainType()
			local iFeature = pPlot:GetFeatureType()
			
			return (iTerrain == TerrainTypes.TERRAIN_GRASS  or iTerrain == TerrainTypes.TERRAIN_PLAINS or
					iTerrain == TerrainTypes.TERRAIN_TUNDRA or iTerrain == TerrainTypes.TERRAIN_DESERT) and
				   (iFeature == (-1) or 
					iFeature == FeatureTypes.FEATURE_FOREST or iFeature == FeatureTypes.FEATURE_JUNGLE)
		end
		
		-- 3rd pass - previous conditions without river restriction
		local function LookForOtherPlaces(pPlot)
			if pPlot:IsMountain() or pPlot:IsHills() then return false end

			local iTerrain = pPlot:GetTerrainType()
			local iFeature = pPlot:GetFeatureType()

			return (iTerrain == TerrainTypes.TERRAIN_GRASS  or iTerrain == TerrainTypes.TERRAIN_PLAINS or
					iTerrain == TerrainTypes.TERRAIN_TUNDRA or iTerrain == TerrainTypes.TERRAIN_DESERT) and
				   (iFeature == (-1) or iFeature == FeatureTypes.FEATURE_FLOOD_PLAINS or
					iFeature == FeatureTypes.FEATURE_FOREST or iFeature == FeatureTypes.FEATURE_JUNGLE)
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
			
			-- local function
				-- try to find a spot from places saved in table
				local function TryToPlaceOneFlax()
					if #tPossibleSpots == 0 then return 0 end -- sorry, no valid spot
					
					local pChosenPlot = table.remove(tPossibleSpots, math.random(#tPossibleSpots)) -- don't use again
					
					pChosenPlot:SetResourceType(eResourceFlax, 1)
					
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local sName = pCity:GetName()
						
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE,
							'The City of [COLOR_CYAN]'..sName..'[ENDCOLOR] constructed a Nilometer and [COLOR_POSITIVE_TEXT]created[ENDCOLOR] a new source of [ICON_RES_FLAX] Flax.', -- use TXT_KEY_ here
							'New source of [ICON_RES_FLAX] Flax near '..sName..' [COLOR_POSITIVE_TEXT]created[ENDCOLOR]',
							pChosenPlot:GetX(), pChosenPlot:GetY(), eResourceFlax)
					end

					return 1
				end
			
			-- ok, try to place first one
			local iPlaced = TryToPlaceOneFlax()
			
			-- maybe second?
			if iPlaced < iHowMany then iPlaced = iPlaced + TryToPlaceOneFlax() end
			
			return iPlaced
		end
	
	-- try to place 2 flaxes under 6 different conditions in special order
	local iFlaxCount = 0
	iFlaxCount = iFlaxCount + TryToPlaceFlax(iPlayer, LookForFloodPlains, 2-iFlaxCount)
	iFlaxCount = iFlaxCount + TryToPlaceFlax(     -1, LookForFloodPlains, 2-iFlaxCount)
	iFlaxCount = iFlaxCount + TryToPlaceFlax(iPlayer, LookForRiverFlats,  2-iFlaxCount)
	iFlaxCount = iFlaxCount + TryToPlaceFlax(     -1, LookForRiverFlats,  2-iFlaxCount)
	iFlaxCount = iFlaxCount + TryToPlaceFlax(iPlayer, LookForOtherPlaces, 2-iFlaxCount)
	iFlaxCount = iFlaxCount + TryToPlaceFlax(     -1, LookForOtherPlaces, 2-iFlaxCount)
	pCity:SetNumRealBuilding(eFlaxDummy, 1)

	-- send a negative notification if no flax was placed
	if pPlayer:IsHuman() and pPlayer:IsTurnActive() and iFlaxCount == 0 then 
		local sName = pCity:GetName()
						
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE,
			'The City of [COLOR_CYAN]'..sName..'[ENDCOLOR] constructed a Nilometer, but [COLOR_NEGATIVE_TEXT]there was no place[ENDCOLOR] to create a new source of [ICON_RES_FLAX] Flax.', -- use TXT_KEY_ here
			'New source of [ICON_RES_FLAX] Flax near '..sName..' [COLOR_NEGATIVE_TEXT]not created[ENDCOLOR]',
			pCity:GetX(), pCity:GetY(), eResourceFlax)
	end
end

if Game.IsCivEverActive(eCivilizationEgypt) then
	GameEvents.CityConstructed.Add(NilometerPlaceFlax)
end

