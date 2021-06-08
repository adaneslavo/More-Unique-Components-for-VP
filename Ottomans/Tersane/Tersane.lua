-- Latifundium
-- Author: adan_eslavo
-- DateCreated: 25/12/2017
--------------------------------------------------------------
local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ConstructPercent / 100
local eCivilizationOttoman = GameInfoTypes.CIVILIZATION_OTTOMAN
local eImprovementTersane = GameInfoTypes.IMPROVEMENT_OTTOMAN_TERSANE

function TersanePlaceDummy(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	local pPlayer = Players[iOwner]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationOttoman) then return end

	if iNewImprovement == eImprovementTersane then			
		local pMainPlot = Map.GetPlot(iX, iY)

		if not (pMainPlot:GetOwner() ~= nil and Players[pMainPlot:GetOwner()]:GetCivilizationType() == eCivilizationOttoman) then return end

		local tPossibleSpots = {}
								
		for iDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do	
			local pPlot = Map.PlotDirection(iX, iY, iDirection)
			
			if pPlot:IsCity() then	
				local pCity = pPlot:GetPlotCity()
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_D_FOR_TERSANE, 1)
			end
		end
	end
end

if Game.IsCivEverActive(eCivilizationOttoman) then
	GameEvents.TileImprovementChanged.Add(TersanePlaceDummy)
end
