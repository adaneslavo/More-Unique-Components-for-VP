-- Buffalo Pound
-- Author: adan_eslavo
-- DateCreated: 4/11/2017
-- 2018-01-21 updated by Infixo
--------------------------------------------------------------
local eResourceBison = GameInfoTypes.RESOURCE_BISON
local eCivilizationShoshone = GameInfoTypes.CIVILIZATION_SHOSHONE
local eBuildingBuffaloPound = GameInfoTypes.BUILDING_SHOSHONE_BUFFALO_POUND
local eBuffaloDummy = GameInfoTypes.BUILDING_D_FOR_BUFFALO

-- created Bison source on construction
function OnConstructionPlaceBison(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationShoshone) then return end
	
	if iBuilding ~= eBuildingBuffaloPound then return end
	
	local pCity = pPlayer:GetCityByID(iCity)
	
	if not pCity then return end
	if pCity:IsHasBuilding(eBuffaloDummy) then return end
	
	-- find suitable places
	local tPossibleSpots = {}
	local tPossibleSpotsFree = {}
	
	for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
		local iPlotOwner = pSpecificPlot:GetOwner()
		
		if iPlotOwner == iPlayer or iPlotOwner == -1 then
			if (pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS) then
				if pSpecificPlot:GetFeatureType() == (-1) or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST then
					if not pSpecificPlot:IsMountain() and not pSpecificPlot:IsHills() then
						if pSpecificPlot:GetNumResource() == 0 then
							if iPlotOwner == iPlayer then table.insert(tPossibleSpots,     pSpecificPlot)
							else                          table.insert(tPossibleSpotsFree, pSpecificPlot) end
						end
					end
				end
			end
		end
	end
	
	-- roll for a plot and create a resource if found
	local bBisonCreated = false
	local pChosenPlot
	local pSpotsTable
	
	if #tPossibleSpots > 0 then  
		pSpotsTable = tPossibleSpots
		bBisonCreated = true
	elseif #tPossibleSpotsFree > 0 then 
		pSpotsTable = tPossibleSpotsFree
		bBisonCreated = true
	end
	
	if bBisonCreated then
		pChosenPlot = pSpotsTable[ math.random(#pSpotsTable) ]
		pChosenPlot:SetResourceType(eResourceBison, 1)
		pCity:SetNumRealBuilding(eBuffaloDummy, 1)
	end
	
	-- send a proper notification
	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		if bBisonCreated then 
			pPlayer:AddNotification(
				NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE,
				'The City of [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] constructed a Buffalo Pound and [COLOR_POSITIVE_TEXT]created[ENDCOLOR] a new source of [ICON_RES_BISON] Bison.', -- use TXT_KEY_ here
				'New source of Bison nearby '..pCity:GetName()..' [COLOR_POSITIVE_TEXT]created[ENDCOLOR]',
				pChosenPlot:GetX(), pChosenPlot:GetY(), eResourceBison)
		else
			pPlayer:AddNotification(
				NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE,
				'The City of [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] constructed a Buffalo Pound but [COLOR_NEGATIVE_TEXT]there was no place[ENDCOLOR] to create a new source of [ICON_RES_BISON] Bison.', -- use TXT_KEY_ here
				'New source of Bison nearby '..pCity:GetName()..' [COLOR_NEGATIVE_TEXT]not created[ENDCOLOR]',
				pCity:GetX(), pCity:GetY(), eResourceBison)
		end
	end
end

if Game.IsCivEverActive(eCivilizationShoshone) then
	GameEvents.CityConstructed.Add(OnConstructionPlaceBison)
end
