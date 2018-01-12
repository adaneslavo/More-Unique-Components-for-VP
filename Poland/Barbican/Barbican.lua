-- Barbican
-- Author: adan_eslavo
-- DateCreated: 20/10/2017
--------------------------------------------------------------
function GarrisonRangePower(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetName() == "Casimir III" then
		local pUnit = pPlayer:GetUnitByID(iUnit)

		if pUnit:GetUnitCombatType() == 1 or pUnit:GetUnitCombatType() == 4 then
			local pPlot = pUnit:GetPlot()
			
			if pPlot:IsCity() then
				local pCity = pPlot:GetWorkingCity()				
					
				if pCity:IsHasBuilding(GameInfoTypes.BUILDING_POLAND_BARBICAN) then	
					if pUnit:IsGarrisoned() then
						if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLAND_BARBICAN) == false then
							pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLAND_BARBICAN, true)
						end
					else
						if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLAND_BARBICAN) then
							pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_POLAND_BARBICAN, false)
						end
					end
				end
			end
		end
	end
end

GameEvents.UnitSetXY.Add(GarrisonRangePower)