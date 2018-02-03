-- HorseDad
-- Author: pineappledan (modified from Goedendag by Adan_eslavo)
-- DateCreated: 02/02/2018
--------------------------------------------------------------
local iSofa = GameInfoTypes.UNIT_3UC_SOFA
local iHorseDadEffect = GameInfoTypes.PROMOTION_HORSE_FATHER_EFFECT

function HorseDadOnMove(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer];

	for pUnit in pPlayer:Units() do
		if pUnit:GetIsMounted() == 1 then
			local bInRange = pUnit:IsWithinDistanceOfUnit(iSofa, 0, true, false)

			if not bInRange then
				bInRange = pUnit:IsAdjacentToUnit(iSofa, true, false)
				
				if not bInRange then
					bInRange = pUnit:IsWithinDistanceOfUnit(iSofa, 2, true, false)
				end
			end

			pUnit:SetHasPromotion(iHorseDadEffect, bInRange)
		end
	end
end

function HorseDadOnCreate(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetIsMounted() == 1 then
		local bInRange = pUnit:IsWithinDistanceOfUnit(iSofa, 0, true, false)

		if not bInRange then
			bInRange = pUnit:IsAdjacentToUnit(iSofa, true, false)
				
			if not bInRange then
				bInRange = pUnit:IsWithinDistanceOfUnit(iSofa, 2, true, false)
			end
		end

		pUnit:SetHasPromotion(iHorseDadEffect, bInRange)
	end
end

function HorseDadOnBuild(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetIsMounted() == 1 then
		local bInRange = pUnit:IsWithinDistanceOfUnit(iSofa, 0, true, false)

		if not bInRange then
			bInRange = pUnit:IsAdjacentToUnit(iSofa, true, false)
				
			if not bInRange then
				bInRange = pUnit:IsWithinDistanceOfUnit(iSofa, 2, true, false)
			end
		end

		pUnit:SetHasPromotion(iHorseDadEffect, bInRange)
	end
end

GameEvents.UnitSetXY.Add(HorseDadOnMove)
GameEvents.UnitCreated.Add(HorseDadOnCreate)
GameEvents.CityTrained.Add(HorseDadOnBuild)
