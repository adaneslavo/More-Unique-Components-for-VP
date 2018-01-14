-- Nilometer
-- Author: adan_eslavo
-- DateCreated: 8/01/2018
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function NilometerPlaceFlax(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetName() == "Ramesses II" then
		if iBuilding == GameInfoTypes.BUILDING_VP_NILOMETER then
			local pCity = pPlayer:GetCityByID(iCity)
			local iFlaxCount = 0

			for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
				local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
				
				if pSpecificPlot:GetOwner() == iPlayer then
					if pSpecificPlot:IsRiverSide() then
						if (pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT) then
							if pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS then
								if not pSpecificPlot:IsMountain() and not pSpecificPlot:IsHills() then
									if pSpecificPlot:GetResourceType(-1) == (-1) then
										pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_EGYPT_FLAX, 1)
										iFlaxCount = iFlaxCount + 1

										if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
											local vPlotPosition = PositionCalculator(pSpecificPlot:GetX(), pSpecificPlot:GetY())
				
											Events.AddPopupTextEvent(vPlotPosition, "[COLOR_MENU_BLUE]Flax from Nilometer[ENDCOLOR]", 1)
										end
									
										if iFlaxCount == 2 then
											break
										end
									end
								end
							end
						end
					end
				end
			end
			
			if iFlaxCount < 2 then
				for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
					local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
								
					if pSpecificPlot:GetOwner() == -1 then
						if pSpecificPlot:IsRiverSide() then
							if (pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT) then
								if pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS then
									if not pSpecificPlot:IsMountain() and not pSpecificPlot:IsHills() then
										if pSpecificPlot:GetResourceType(-1) == (-1) then
											pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_EGYPT_FLAX, 1)
											iFlaxCount = iFlaxCount + 1

											if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
												local vPlotPosition = PositionCalculator(pSpecificPlot:GetX(), pSpecificPlot:GetY())
					
												Events.AddPopupTextEvent(vPlotPosition, "[COLOR_MENU_BLUE]Flax from Nilometer[ENDCOLOR]", 1)
											end
									
											if iFlaxCount == 2 then
												break
											end
										end
									end
								end
							end
						end
					end
				end
			end
			
			if iFlaxCount < 2 then
				for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
					local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
					
					if pSpecificPlot:GetOwner() == iPlayer then
						if pSpecificPlot:IsRiverSide() then
							if (pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT) then
								if pSpecificPlot:GetFeatureType() == (-1) or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
									if not pSpecificPlot:IsMountain() and not pSpecificPlot:IsHills() then
										if pSpecificPlot:GetResourceType(-1) == (-1) then
											pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_EGYPT_FLAX, 1)
											iFlaxCount = iFlaxCount + 1

											if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
												local vPlotPosition = PositionCalculator(pSpecificPlot:GetX(), pSpecificPlot:GetY())
					
												Events.AddPopupTextEvent(vPlotPosition, "[COLOR_MENU_BLUE]Flax from Nilometer[ENDCOLOR]", 1)
											end
									
											if iFlaxCount == 2 then
												break
											end
										end
									end
								end
							end
						end
					end
				end
			end
			
			if iFlaxCount < 2 then
				for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
					local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
					
					if pSpecificPlot:GetOwner() == -1 then
						if pSpecificPlot:IsRiverSide() then
							if (pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT) then
								if pSpecificPlot:GetFeatureType() == (-1) or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
									if not pSpecificPlot:IsMountain() and not pSpecificPlot:IsHills() then
										if pSpecificPlot:GetResourceType(-1) == (-1) then
											pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_EGYPT_FLAX, 1)
											iFlaxCount = iFlaxCount + 1

											if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
												local vPlotPosition = PositionCalculator(pSpecificPlot:GetX(), pSpecificPlot:GetY())
					
												Events.AddPopupTextEvent(vPlotPosition, "[COLOR_MENU_BLUE]Flax from Nilometer[ENDCOLOR]", 1)
											end
									
											if iFlaxCount == 2 then
												break
											end
										end
									end
								end
							end
						end
					end
				end
			end

			if iFlaxCount < 2 then
				for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
					local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
					
					if pSpecificPlot:GetOwner() == iPlayer then
						if (pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT) then
							if pSpecificPlot:GetFeatureType() == (-1) or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
								if not pSpecificPlot:IsMountain() and not pSpecificPlot:IsHills() then
									if pSpecificPlot:GetResourceType(-1) == (-1) then
										pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_EGYPT_FLAX, 1)
										iFlaxCount = iFlaxCount + 1

										if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
											local vPlotPosition = PositionCalculator(pSpecificPlot:GetX(), pSpecificPlot:GetY())
				
											Events.AddPopupTextEvent(vPlotPosition, "[COLOR_MENU_BLUE]Flax from Nilometer[ENDCOLOR]", 1)
										end
									
										if iFlaxCount == 2 then
											break
										end
									end
								end
							end
						end
					end
				end	
			end

			if iFlaxCount < 2 then
				for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
					local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
					
					if pSpecificPlot:GetOwner() == -1 then
						if (pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT) then
							if pSpecificPlot:GetFeatureType() == (-1) or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
								if not pSpecificPlot:IsMountain() and not pSpecificPlot:IsHills() then
									if pSpecificPlot:GetResourceType(-1) == (-1) then
										pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_EGYPT_FLAX, 1)
										iFlaxCount = iFlaxCount + 1

										if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
											local vPlotPosition = PositionCalculator(pSpecificPlot:GetX(), pSpecificPlot:GetY())
				
											Events.AddPopupTextEvent(vPlotPosition, "[COLOR_MENU_BLUE]Flax from Nilometer[ENDCOLOR]", 1)
										end
									
										if iFlaxCount == 2 then
											break
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

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityConstructed.Add(NilometerPlaceFlax)
