-- Buffalo Pound
-- Author: adan_eslavo
-- DateCreated: 4/11/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function BuffaloPoundPlaceBison(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetName() == "Pocatello" then
		if iBuilding == GameInfoTypes.BUILDING_SHOSHONE_BUFFALO_POUND then
			local pCity = pPlayer:GetCityByID(iCity)
			local bIsBison = false
			local tPossibleSpots = {}

			for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
				local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
				
				if pSpecificPlot:GetOwner() == iPlayer then
					if (pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS) then
						if pSpecificPlot:GetFeatureType() == (-1) or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST then
							if not pSpecificPlot:IsMountain() and not pSpecificPlot:IsHills() then
								if pSpecificPlot:GetResourceType(-1) == (-1) then
									tPossibleSpots[#tPossibleSpots + 1] = pSpecificPlot
								end
							end
						end
					end
				end
			end

			if #tPossibleSpots > 0 then
				iChosenPlot = Game.Rand(#tPossibleSpots - 1, "") + 1
				tPossibleSpots[iChosenPlot]:SetResourceType(GameInfoTypes.RESOURCE_BISON, 1)
				bIsBison = true

				local vPlotPosition = PositionCalculator(tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
				
				Events.AddPopupTextEvent(vPlotPosition, "[COLOR_SELECTED_TEXT]Bison from Buffalo Pound[ENDCOLOR]", 1)
			end
			
			if not bIsBison then
				for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
					local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
				
					if pSpecificPlot:GetOwner() == -1 then
						if (pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS) then
							if pSpecificPlot:GetFeatureType() == (-1) or pSpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST then
								if not pSpecificPlot:IsMountain() and not pSpecificPlot:IsHills() then
									if pSpecificPlot:GetResourceType(-1) == (-1) then
										tPossibleSpots[#tPossibleSpots + 1] = pSpecificPlot
									end
								end
							end
						end
					end
				end

				if #tPossibleSpots > 0 then
					iChosenPlot = Game.Rand(#tPossibleSpots - 1, "") + 1
					tPossibleSpots[iChosenPlot]:SetResourceType(GameInfoTypes.RESOURCE_BISON, 1)

					local vPlotPosition = PositionCalculator(tPossibleSpots[iChosenPlot]:GetX(), tPossibleSpots[iChosenPlot]:GetY())
				
					Events.AddPopupTextEvent(vPlotPosition, "[COLOR_SELECTED_TEXT]Bison from Buffalo Pound[ENDCOLOR]", 1)
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityConstructed.Add(BuffaloPoundPlaceBison)
