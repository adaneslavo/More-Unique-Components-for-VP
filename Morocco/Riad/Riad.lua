-- Riad
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

local eBuildingRiad = GameInfoTypes.BUILDING_MAROCCO_RIAD
local eBuildingDummyForRiad = GameInfoTypes.BUILDING_D_FOR_RIAD			
local eCivilizationMorocco = GameInfoTypes.CIVILIZATION_MOROCCO
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME

-- gain yields each turn for each trade route if Riad is built in the city
function OnTurnGainYieldsFromTR(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationMorocco or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	local iNumberOfRiads = pPlayer:CountNumBuildings(eBuildingRiad)

	if iNumberOfRiads > 0 then
		local iCurrentRiad = 0
		
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingRiad) then
				city:SetNumRealBuilding(eBuildingDummyForRiad, 0)
				iCurrentRiad = iCurrentRiad + 1
				
				if iCurrentRiad == iNumberOfRiads then
					break
				end
			end
		end

		for i, tradeRoute in pairs(pPlayer:GetTradeRoutes()) do
			local pFromCity = tradeRoute.FromCity

			if pFromCity:IsHasBuilding(eBuildingRiad) then
				pFromCity:SetNumRealBuilding(eBuildingDummyForRiad, pFromCity:GetNumRealBuilding(eBuildingDummyForRiad) + 1)
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationMorocco) then
	GameEvents.PlayerDoTurn.Add(OnTurnGainYieldsFromTR)
end
