-- Latifundium
-- Author: adan_eslavo
-- DateCreated: 25/12/2017
--------------------------------------------------------------
local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ConstructPercent / 100
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME
local eImprovementLatifundium = GameInfoTypes.IMPROVEMENT_ROME_LATIFUNDIUM

function LatifundiumSpawnFigs(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	local pPlayer = Players[iOwner]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationRome) then return end

	if iNewImprovement == eImprovementLatifundium then			
		local pMainPlot = Map.GetPlot(iX, iY)

		if not (pMainPlot:GetOwner() ~= nil and Players[pMainPlot:GetOwner()]:GetCivilizationType() == eCivilizationRome) then return end

		local tPossibleSpots = {}
								
		for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do	
			local pPlot = Map.PlotDirection(iX, iY, iDirection)
	
			if pPlot:GetResourceType(-1) == (-1) and not pPlot:IsCity() and not pPlot:IsMountain() then		
				if (pPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_HILLS or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT) then
					if pPlot:GetFeatureType() == (-1) or pPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST or pPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE or pPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS or pPlot:GetFeatureType() == FeatureTypes.FEATURE_MARSH then
						tPossibleSpots[#tPossibleSpots + 1] = pPlot
					end
				end
			end
		end
	
		local pNearestCity

		if #tPossibleSpots <= 0 then
			pNearestCity = GetNearestCity(pPlayer, pMainPlot)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				pPlayer:AddNotification(0, 
				'There was not enough space near [COLOR_CYAN]'..pNearestCity:GetName()..'[ENDCOLOR] for Latifundium to plant a new source of [ICON_RES_FIGS] Figs.', 
				'Cannot place source of Figs in '..pNearestCity:GetName(), 
				iX, iY)
			end	
		
			return 
		end

		local iChosenPlot = Game.Rand(#tPossibleSpots - 1, "") + 1
		local pChosenPlot = tPossibleSpots[iChosenPlot]
		local pCheckedPlayer = Players[pChosenPlot:GetOwner()]
		local pCityThatLostTile = pChosenPlot:GetWorkingCity()
		pNearestCity = GetNearestCity(pPlayer, pChosenPlot)

		pChosenPlot:SetResourceType(GameInfoTypes.RESOURCE_ROME_FIGS, 1)
		pChosenPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_PLANTATION)	

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE, 
			'Latifundium planted a new source of [ICON_RES_FIGS] Figs near [COLOR_CYAN]'..pNearestCity:GetName()..'[ENDCOLOR].', 
			'New source of Figs in '..pNearestCity:GetName(), 
			pChosenPlot:GetX(), pChosenPlot:GetY(), GameInfoTypes.RESOURCE_ROME_FIGS)
		end	
			
		if pCheckedPlayer == nil then
			pChosenPlot:SetOwner(iOwner, pNearestCity:GetID(), true, true)	

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_CITY_TILE, 
				'The City of '..pNearestCity:GetName()..'[ENDCOLOR] has claimed new tile.', 
				'Borders of '..pNearestCity:GetName()..' have grown', 
				pChosenPlot:GetX(), pChosenPlot:GetY(), pNearestCity:GetID())
			end
		elseif pCheckedPlayer:GetCivilizationType() ~= eCivilizationRome then
			pChosenPlot:SetOwner(iOwner, pNearestCity:GetID(), true, true)	

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_CITY_TILE, 
				'The City of '..pNearestCity:GetName()..'[ENDCOLOR] has taken a tile from another Empire!', 
				'Borders of '..pNearestCity:GetName()..' have grown', 
				pChosenPlot:GetX(), pChosenPlot:GetY(), pNearestCity:GetID())
			end

			if pCheckedPlayer:IsHuman() then
				pCheckedPlayer:AddNotification(NotificationTypes.NOTIFICATION_CITY_TILE, 
				'Roman Empire found a plantation in one of your Cities. '..pCityThatLostTile:GetName()..' lost a tile.', 
				'The City of '..pCityThatLostTile:GetName()..' lost a tile!', 
				pChosenPlot:GetX(), pChosenPlot:GetY(), pCityThatLostTile:GetID())
			end
		end

		if pChosenPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST then
			pChosenPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
		
			local iClearing = math.floor(30 * fGameSpeedModifier)
			pNearestCity:ChangeProduction(iClearing)
									
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("Clearing a Forest has created "..iClearing.." [ICON_PRODUCTION] Production for "..pNearestCity:GetName(), iClearing, pNearestCity:GetName()))
			end
		elseif pChosenPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
			pChosenPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
		
			local iClearing = math.floor(20 * fGameSpeedModifier)
			pNearestCity:ChangeProduction(iClearing)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("Clearing a Jungle has created "..iClearing.." [ICON_PRODUCTION] Production for "..pNearestCity:GetName(), iClearing, pNearestCity:GetName()))
			end
		elseif pChosenPlot:GetFeatureType() == FeatureTypes.FEATURE_MARSH then
			pChosenPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
		end
	end
end

function GetNearestCity(pPlayer, pPlot)
	local iDistance = 10000
	local pNearestCity = nil

	for pCity in pPlayer:Cities() do
		local iDistanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())

		if(iDistanceToCity < iDistance) then
			iDistance = iDistanceToCity
			pNearestCity = pCity
		end
	end

	return pNearestCity
end

function OnCaptureRemoveNationalWonders(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pNewPlayer = Players[iNewOwner]

	if pNewPlayer:GetCivilizationType() ~= eCivilizationRome then return end

	local pCity = Map.GetPlot(iX, iY):GetPlotCity()

	for building in GameInfo.Buildings() do
		local iBuilding = building.ID
		
		if pCity:IsHasBuilding(iBuilding) and building.NumCityCostMod >= 1 then
			pCity:SetNumRealBuilding(iBuilding, 0)
		end
	end
end

if Game.IsCivEverActive(eCivilizationRome) then
	GameEvents.CityCaptureComplete.Add(OnCaptureRemoveNationalWonders)
	GameEvents.TileImprovementChanged.Add(LatifundiumSpawnFigs)
end
