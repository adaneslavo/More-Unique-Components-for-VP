-- Riad
-- Author: Blue, Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

local eBuildingRiad = GameInfoTypes.BUILDING_MAROCCO_RIAD
local eBuildingDummyForRiad = GameInfoTypes.BUILDING_D_FOR_RIAD			

-- gain yields each turn for each trade route if Riad is built in the city
function OnTurnGainYieldsFromTR(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for city in Player:Cities() do
		city:SetNumRealBuilding(eBuildingDummyForRiad, 0)
	end

	for i, tradeRoute in pairs(pPlayer:GetTradeRoutes()) do
		local pCity = tradeRoute.FromCity

		if pCity:IsHasBuilding(eBuildingRiad) then
			city:SetNumRealBuilding(eBuildingDummyForRiad, GetNumRealBuilding(eBuildingDummyForRiad) + 1)
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(OnTurnGainYieldsFromTR)
