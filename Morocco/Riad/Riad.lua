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

-- sets Anarchy and WLTKD on new Era
function OnEraRiadYields(eTeam, eEra, bFirst)
	for id, pPlayer in pairs(Players) do
		if pPlayer:IsEverAlive() and pPlayer:GetTeam() == eTeam and pPlayer:GetCivilizationType() == eCivilizationMorocco then
			local pCapital = pPlayer:GetCapitalCity()

			pCapital:SetNumRealBuilding(eBuildingDummyForRiad, math.max(pPlayer:GetCurrentEra(), 0))
		end
	end
end

function RiadGoldToGPPs(iPlayer)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationMorocco or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end

	local iNumberOfRiads = pPlayer:CountNumBuildings(eBuildingRiad)

	if iNumberOfRiads > 0 then
		local iCurrentRiad = 0

		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingRiad) then
				-- 15% of gold in city converted to G Merchant Points

				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_MERCHANT"], math.floor(15 * city:GetYieldRate( YieldTypes.YIELD_GOLD )))

				if iCurrentRiad == iNumberOfRiads then
					break
				end
			end
		end
	end
end

if Game.IsCivEverActive(eCivilizationMorocco) then
	GameEvents.TeamSetEra.Add(OnEraRiadYields)
	GameEvents.PlayerDoTurn.Add(RiadGoldToGPPs)
end
