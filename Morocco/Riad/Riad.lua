-- Riad
-- Author: Blue, Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

local eCivilizationMorocco = GameInfoTypes.CIVILIZATION_MOROCCO
local eBuildingRiad = GameInfoTypes.BUILDING_MAROCCO_RIAD
local eBuildingDummyRiad = GameInfoTypes.BUILDING_DUMMYGPPGOLDANDCULTURE			

-- gain yields each turn for each trade route if Riad is built in the city
function OnTurnGainYieldsFromTR(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationMorocco) then 
		return 
	end

	for city in Player:Cities() do
		city:SetNumRealBuilding(eBuildingDummyRiad, 0)
	end

	for i, tradeRoute in pairs(pPlayer:GetTradeRoutes()) do
		local pCity = tradeRoute.FromCity

		if pCity:IsHasBuilding(eBuildingRiad) then
			city:SetNumRealBuilding(eBuildingDummyRiad, GetNumRealBuilding(eBuildingDummyRiad) + 1)
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(OnTurnGainYieldsFromTR)
