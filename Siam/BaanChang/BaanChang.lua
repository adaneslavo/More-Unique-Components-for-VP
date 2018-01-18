-- Baan Chang
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function BaanChangCSBonus(iPlayer)
	local pPlayer = Players[iPlayer]

	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_SIAM_BAAN_CHANG) then
			local iStrategicResourcesFromMinors = 0.5 * (pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_HORSE) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_IRON) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_COAL) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_OIL) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_ALUMINUM) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_URANIUM))
			
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGOLD, iStrategicResourcesFromMinors)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYPRODUCTION, iStrategicResourcesFromMinors)
		end
	end
end

function BaanChangGetsUnitFromCS(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetUnitCombatType() ~= nil then
		if iUnitType ~= GameInfoTypes.UNIT_FRENCH_FOREIGNLEGION then
			local iNumberOfBaanChangs = 0

			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(GameInfoTypes.BUILDING_SIAM_BAAN_CHANG) then
					iNumberOfBaanChangs = iNumberOfBaanChangs + 1
				end
			end

			if iNumberOfBaanChangs > 0 then
				local pCapital = pPlayer:GetCapitalCity()
				local iBaanChangEraPlusOne = 3
					
				if Game.GetGameSpeedType() == 0 then	
					local iGain = math.floor(10 * iNumberOfBaanChangs * ((pPlayer:GetCurrentEra() + 1) / iBaanChangEraPlusOne) * 3)

					pCapital:ChangeProduction(iGain)
					pPlayer:ChangeJONSCulture(iGain)
				
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCapitalPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
				
						Events.AddPopupTextEvent(vCapitalPosition, "[COLOR_YIELD_PRODUCTION]+ "..iGain.." [ICON_PRODUCTION] Baan Chang[ENDCOLOR]", 1)
						Events.AddPopupTextEvent(vCapitalPosition, "[COLOR_MAGENTA]+ "..iGain.." [ICON_CULTURE] Baan Chang[ENDCOLOR]", 1.5)
					end
				elseif Game.GetGameSpeedType() == 1 then
					local iGain = math.floor(10 * iNumberOfBaanChangs * ((pPlayer:GetCurrentEra() + 1) / iBaanChangEraPlusOne) * 1.5)

					pCapital:ChangeProduction(iGain)
					pPlayer:ChangeJONSCulture(iGain)
				
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCapitalPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
				
						Events.AddPopupTextEvent(vCapitalPosition, "[COLOR_YIELD_PRODUCTION]+ "..iGain.." [ICON_PRODUCTION] Baan Chang[ENDCOLOR]", 1)
						Events.AddPopupTextEvent(vCapitalPosition, "[COLOR_MAGENTA]+ "..iGain.." [ICON_CULTURE] Baan Chang[ENDCOLOR]", 1.5)
					end
				elseif Game.GetGameSpeedType() == 2 then
					local iGain = math.floor(10 * iNumberOfBaanChangs * ((pPlayer:GetCurrentEra() + 1) / iBaanChangEraPlusOne) * 1)

					pCapital:ChangeProduction(iGain)
					pPlayer:ChangeJONSCulture(iGain)
				
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCapitalPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
				
						Events.AddPopupTextEvent(vCapitalPosition, "[COLOR_YIELD_PRODUCTION]+ "..iGain.." [ICON_PRODUCTION] Baan Chang[ENDCOLOR]", 1)
						Events.AddPopupTextEvent(vCapitalPosition, "[COLOR_MAGENTA]+ "..iGain.." [ICON_CULTURE] Baan Chang[ENDCOLOR]", 1.5)
					end
				else
					local iGain = math.floor(10 * iNumberOfBaanChangs * ((pPlayer:GetCurrentEra() + 1) / iBaanChangEraPlusOne) * 0.66)

					pCapital:ChangeProduction(iGain)
					pPlayer:ChangeJONSCulture(iGain)
				
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCapitalPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
				
						Events.AddPopupTextEvent(vCapitalPosition, "[COLOR_YIELD_PRODUCTION]+ "..iGain.." [ICON_PRODUCTION] Baan Chang[ENDCOLOR]", 1)
						Events.AddPopupTextEvent(vCapitalPosition, "[COLOR_MAGENTA]+ "..iGain.." [ICON_CULTURE] Baan Chang[ENDCOLOR]", 1.5)
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(BaanChangCSBonus)
GameEvents.UnitCreated.Add(BaanChangGetsUnitFromCS)