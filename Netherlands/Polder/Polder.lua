-- Polder
-- Author: Enginseer, adan_eslavo
-- DateCreated: 31/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")

local eCivilizationNetherlands = GameInfoTypes.CIVILIZATION_NETHERLANDS
local eImprovementPolder = GameInfoTypes.IMPROVEMENT_POLDER

function PolderCanBeOnMarsh (iPlayer, iUnit, iX, iY, iBuild)
	if iBuild == GameInfoTypes.BUILD_POLDER_2 and Players[iPlayer]:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_NETHERLANDS then
		return false
	else 
		return true
	end
end

function OnImprovementMakeMarsh(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	local pPlayer = Players[iOwner]
    
    if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationNetherlands) then return end

	if (iNewImprovement == eImprovementPolder and iNewImprovement ~= iOldImprovement) then
		local pPlot = Map.GetPlot(iX, iY)

		if pPlot then
			pPlot:SetFeatureType(FeatureTypes.FEATURE_D_FOR_POLDER, -1)
		end
	end
end

GameEvents.PlayerCanBuild.Add(PolderCanBeOnMarsh)

if Game.IsCivEverActive(eCivilizationNetherlands) then
	GameEvents.TileImprovementChanged.Add(OnImprovementMakeMarsh)
end
