-- Latifundium
-- Author: adan_eslavo
-- DateCreated: 25/12/2017
--------------------------------------------------------------
--[[include("ModUserData.lua")

function CanRomeBuildPlantation (iPlayer, iUnit, iX, iY, iBuild)
	if iBuild == GameInfoTypes.BUILD_PLANTATION and Players[iPlayer]:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ROME then
		return false
	else 
		return true
	end
end

function LatifundiumSpawnFigs(iPlayer)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetName() == "Augustus Caesar" then
		for pCity in pPlayer:Cities() do
			for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
				local pMainPlot = pCity:GetCityIndexPlot(iCityPlot)
				
				if pMainPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_ROME_LATIFUNDIUM_UPGRADED then
					if not pMainPlot:IsImprovementPillaged() then
						if pMainPlot:GetOwner() ~= nil then
							if Players[pMainPlot:GetOwner()]:GetName() == "Augustus Caesar" then
								local tPossibleSpots = {}
								local bLatifundiumSpawnFigs = modUserData.GetValue(pMainPlot:GetX().."-"..pMainPlot:GetY());

								if bLatifundiumSpawnFigs == nil then
									modUserData.SetValue(pMainPlot:GetX().."-"..pMainPlot:GetY(), "1");
									if modUserData.GetValue("FileToReset") == nil then
										modUserData.SetValue("FileToReset", "1");
									end

									for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do	
										local pPlot = Map.PlotDirection(pMainPlot:GetX(), pMainPlot:GetY(), iDirection)
				
										if (pPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_HILLS or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT) then
											if pPlot:GetResourceType(-1) == (-1) then
												if pPlot:IsCity() == false then
													if not pPlot:IsMountain() then
														if pPlot:GetFeatureType() == (-1) or pPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST or pPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE or pPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS or pPlot:GetFeatureType() == FeatureTypes.FEATURE_MARSH then
															tPossibleSpots[#tPossibleSpots + 1] = pPlot
														end
													end
												end
											end
										end
									end

									if #tPossibleSpots > 0 then
										iChosenPlot = Game.Rand(#tPossibleSpots - 1, "") + 1
		
										if tPossibleSpots[iChosenPlot]:GetFeatureType() == (-1) or tPossibleSpots[iChosenPlot]:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS then
											tPossibleSpots[iChosenPlot]:SetResourceType(GameInfoTypes.RESOURCE_ROME_FIGS, 1)
											tPossibleSpots[iChosenPlot]:SetImprovementType(GameInfoTypes.IMPROVEMENT_PLANTATION)

											if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
												pPlayer:AddNotification(0, 'In '..pCity:GetName()..'[ENDCOLOR] Latifundium worked out new source of [ICON_RES_FIGS] Figs.', 'New source of Figs in '..pCity:GetName(), tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
											end
										
											local pCheckedPlayer = Players[tPossibleSpots[iChosenPlot]:GetOwner()]
											
											if pCheckedPlayer == nil then
												tPossibleSpots[iChosenPlot]:SetOwner(iPlayer, GetNearestCity(pPlayer, tPossibleSpots[iChosenPlot]):GetID(), true, true)
												
												if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
													pPlayer:AddNotification(14, 'The City of '..pCity:GetName()..'[ENDCOLOR] claimed new tile.', 'Borders of '..pCity:GetName()..' have grown', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end
											elseif pCheckedPlayer:GetName() ~= "Augustus Caesar" then
												local pCityThatLostTile = tPossibleSpots[iChosenPlot]:GetWorkingCity()
												
												tPossibleSpots[iChosenPlot]:SetOwner(iPlayer, GetNearestCity(pPlayer, tPossibleSpots[iChosenPlot]):GetID(), true, true)
												
												if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
													pPlayer:AddNotification(14, 'The City of '..pCity:GetName()..'[ENDCOLOR] took a tile from another Empire!', 'Borders of '..pCity:GetName()..' have grown', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end

												if pCheckedPlayer:IsHuman() then
													pCheckedPlayer:AddNotification(14, 'Roman Empire found a plantation in one of your Cities. '..pCityThatLostTile:GetName()..' lost a tile.', 'The City of '..pCityThatLostTile:GetName()..' lost a tile!', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end
											end
										elseif tPossibleSpots[iChosenPlot]:GetFeatureType() == FeatureTypes.FEATURE_FOREST then
											tPossibleSpots[iChosenPlot]:SetResourceType(GameInfoTypes.RESOURCE_ROME_FIGS, 1)
											tPossibleSpots[iChosenPlot]:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
											tPossibleSpots[iChosenPlot]:SetImprovementType(GameInfoTypes.IMPROVEMENT_PLANTATION)
											GetNearestCity(pPlayer, tPossibleSpots[iChosenPlot]):ChangeProduction(30)
											
											local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ConstructPercent / 100
											local iClearing = math.floor(30 * iGameSpeedModifier)

											if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
												Events.GameplayAlertMessage(Locale.ConvertTextKey("Clearing Forest has created "..iClearing.." [ICON_PRODUCTION] Production for"..pCity:GetName(), iClearing, pCity:GetName()))
												pPlayer:AddNotification(0, 'In '..pCity:GetName()..'[ENDCOLOR] Latifundium worked out new source of [ICON_RES_FIGS] Figs.', 'New source of Figs in '..pCity:GetName(), tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
											end
											
											local pCheckedPlayer = Players[tPossibleSpots[iChosenPlot]:GetOwner()]

											if pCheckedPlayer == nil then
												tPossibleSpots[iChosenPlot]:SetOwner(iPlayer, GetNearestCity(pPlayer, tPossibleSpots[iChosenPlot]):GetID(), true, true)
												
												if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
													pPlayer:AddNotification(14, 'The City of '..pCity:GetName()..'[ENDCOLOR] claimed new tile.', 'Borders of '..pCity:GetName()..' have grown', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end
											elseif pCheckedPlayer:GetName() ~= "Augustus Caesar" then
												local pCityThatLostTile = tPossibleSpots[iChosenPlot]:GetWorkingCity()
												
												tPossibleSpots[iChosenPlot]:SetOwner(iPlayer, GetNearestCity(pPlayer, tPossibleSpots[iChosenPlot]):GetID(), true, true)
												
												if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
													pPlayer:AddNotification(14, 'The City of '..pCity:GetName()..'[ENDCOLOR] took a tile from another Empire!', 'Borders of '..pCity:GetName()..' have grown', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end

												if pCheckedPlayer:IsHuman() then
													pCheckedPlayer:AddNotification(14, 'Roman Empire found a plantation in one of your Cities. '..pCityThatLostTile:GetName()..' lost a tile.', 'The City of '..pCityThatLostTile:GetName()..' lost a tile!', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end
											end
										elseif tPossibleSpots[iChosenPlot]:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
											tPossibleSpots[iChosenPlot]:SetResourceType(GameInfoTypes.RESOURCE_ROME_FIGS, 1)
											tPossibleSpots[iChosenPlot]:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
											tPossibleSpots[iChosenPlot]:SetImprovementType(GameInfoTypes.IMPROVEMENT_PLANTATION)
											GetNearestCity(pPlayer, tPossibleSpots[iChosenPlot]):ChangeProduction(20)

											local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ConstructPercent / 100
											local iClearing = math.floor(20 * iGameSpeedModifier)

											if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
												Events.GameplayAlertMessage(Locale.ConvertTextKey("Clearing Jungle has created "..iClearing.." [ICON_PRODUCTION] Production for"..pCity:GetName(), iClearing, pCity:GetName()))
												pPlayer:AddNotification(0, 'In '..pCity:GetName()..'[ENDCOLOR] Latifundium worked out new source of [ICON_RES_FIGS] Figs.', 'New source of Figs in '..pCity:GetName(), tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
											end
										
											local pCheckedPlayer = Players[tPossibleSpots[iChosenPlot]:GetOwner()]

											if pCheckedPlayer == nil then
												tPossibleSpots[iChosenPlot]:SetOwner(iPlayer, GetNearestCity(pPlayer, tPossibleSpots[iChosenPlot]):GetID(), true, true)
												
												if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
													pPlayer:AddNotification(14, 'The City of '..pCity:GetName()..'[ENDCOLOR] claimed new tile.', 'Borders of '..pCity:GetName()..' have grown', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end
											elseif pCheckedPlayer:GetName() ~= "Augustus Caesar" then
												local pCityThatLostTile = tPossibleSpots[iChosenPlot]:GetWorkingCity()
												
												tPossibleSpots[iChosenPlot]:SetOwner(iPlayer, GetNearestCity(pPlayer, tPossibleSpots[iChosenPlot]):GetID(), true, true)
												
												if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
													pPlayer:AddNotification(14, 'The City of '..pCity:GetName()..'[ENDCOLOR] took a tile from another Empire!', 'Borders of '..pCity:GetName()..' have grown', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end

												if pCheckedPlayer:IsHuman() then
													pCheckedPlayer:AddNotification(14, 'Roman Empire found a plantation in one of your Cities. '..pCityThatLostTile:GetName()..' lost a tile.', 'The City of '..pCityThatLostTile:GetName()..' lost a tile!', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end
											end
										elseif tPossibleSpots[iChosenPlot]:GetFeatureType() == FeatureTypes.FEATURE_MARSH then
											tPossibleSpots[iChosenPlot]:SetResourceType(GameInfoTypes.RESOURCE_ROME_FIGS, 1)
											tPossibleSpots[iChosenPlot]:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
											tPossibleSpots[iChosenPlot]:SetImprovementType(GameInfoTypes.IMPROVEMENT_PLANTATION)

											if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
												pPlayer:AddNotification(0, 'In '..pCity:GetName()..'[ENDCOLOR] Latifundium worked out new source of [ICON_RES_FIGS] Figs.', 'New source of Figs in '..pCity:GetName(), tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
											end
										
											local pCheckedPlayer = Players[tPossibleSpots[iChosenPlot]:GetOwner()]

											if pCheckedPlayer == nil then
												tPossibleSpots[iChosenPlot]:SetOwner(iPlayer, GetNearestCity(pPlayer, tPossibleSpots[iChosenPlot]):GetID(), true, true)
												
												if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
													pPlayer:AddNotification(14, 'The City of '..pCity:GetName()..'[ENDCOLOR] claimed new tile.', 'Borders of '..pCity:GetName()..' have grown', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end
											elseif pCheckedPlayer:GetName() ~= "Augustus Caesar" then
												local pCityThatLostTile = tPossibleSpots[iChosenPlot]:GetWorkingCity()
												
												tPossibleSpots[iChosenPlot]:SetOwner(iPlayer, GetNearestCity(pPlayer, tPossibleSpots[iChosenPlot]):GetID(), true, true)
												
												if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
													pPlayer:AddNotification(14, 'The City of '..pCity:GetName()..'[ENDCOLOR] took a tile from another Empire!', 'Borders of '..pCity:GetName()..' have grown', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end

												if pCheckedPlayer:IsHuman() then
													pCheckedPlayer:AddNotification(14, 'Roman Empire found a plantation in one of your Cities. '..pCityThatLostTile:GetName()..' lost a tile.', 'The City of '..pCityThatLostTile:GetName()..' lost a tile!', tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
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

GameEvents.PlayerDoTurn.Add(LatifundiumSpawnFigs)
GameEvents.PlayerCanBuild.Add(CanRomeBuildPlantation)--]]
local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ConstructPercent / 100

function LatifundiumSpawnFigs(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	local pPlayer = Players[iOwner]

	if not (pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ROME) then return end
	if not (iOldImprovement == GameInfoTypes.IMPROVEMENT_ROME_LATIFUNDIUM and iNewImprovement == GameInfoTypes.IMPROVEMENT_ROME_LATIFUNDIUM_UPGRADED) then return end
				
	local pMainPlot = Map.GetPlot(iX, iY)

	if not (pMainPlot:GetOwner() ~= nil and Players[pMainPlot:GetOwner()]:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ROME) then return end

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
			'In [COLOR_CYAN]'..pNearestCity:GetName()..'[ENDCOLOR] there was not enough space for Latifundium to work out new source of [ICON_RES_FIGS] Figs.', 
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
		'In [COLOR_CYAN]'..pNearestCity:GetName()..'[ENDCOLOR] Latifundium worked out new source of [ICON_RES_FIGS] Figs.', 
		'New source of Figs in '..pNearestCity:GetName(), 
		pChosenPlot:GetX(), pChosenPlot:GetY(), GameInfoTypes.RESOURCE_ROME_FIGS)
	end	
			
	if pCheckedPlayer == nil then
		pChosenPlot:SetOwner(iPlayer, pNearestCity:GetID(), true, true)	

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_CITY_TILE, 
			'The City of '..pNearestCity:GetName()..'[ENDCOLOR] claimed new tile.', 
			'Borders of '..pNearestCity:GetName()..' have grown', 
			pChosenPlot:GetX(), pChosenPlot:GetY(), GameInfoTypes.RESOURCE_ROME_FIGS)
		end
	elseif pCheckedPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ROME then
		pChosenPlot:SetOwner(iPlayer, pNearestCity:GetID(), true, true)	

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_CITY_TILE, 
			'The City of '..pNearestCity:GetName()..'[ENDCOLOR] took a tile from another Empire!', 
			'Borders of '..pNearestCity:GetName()..' have grown', 
			pChosenPlot:GetX(), pChosenPlot:GetY(), GameInfoTypes.RESOURCE_ROME_FIGS)
		end

		if pCheckedPlayer:IsHuman() then
			pCheckedPlayer:AddNotification(NotificationTypes.NOTIFICATION_CITY_TILE, 
			'Roman Empire found a plantation in one of your Cities. '..pCityThatLostTile:GetName()..' lost a tile.', 
			'The City of '..pCityThatLostTile:GetName()..' lost a tile!', 
			pChosenPlot:GetX(), pChosenPlot:GetY())
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

GameEvents.TileImprovementChanged.Add(LatifundiumSpawnFigs)