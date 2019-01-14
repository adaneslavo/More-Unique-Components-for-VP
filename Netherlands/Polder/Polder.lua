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

GameEvents.PlayerCanBuild.Add(PolderCanBeOnMarsh)