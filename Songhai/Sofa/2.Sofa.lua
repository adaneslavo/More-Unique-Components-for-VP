-- HorseDad
-- Author: pineappledan (modified from Goedendag by Adan_eslavo)
-- DateCreated: 02/02/2018
-- 2018-02-04 Modified by Infixo
--------------------------------------------------------------
local iSofa = GameInfoTypes.PROMOTION_HORSE_FATHER
local iHorseDadEffect = GameInfoTypes.PROMOTION_HORSE_FATHER_EFFECT

function HorseDadOnMove(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer];

	for pUnit in pPlayer:Units() do
		if pUnit:IsMounted() then
			--[[
			local bInRange = pUnit:IsWithinDistanceOfUnitPromotion(iSofa, 0, true, false)

			if not bInRange then
				bInRange = pUnit:IsWithinDistanceOfUnitPromotion(iSofa, true, false)
				
				if not bInRange then
					bInRange = pUnit:IsWithinDistanceOfUnitPromotion(iSofa, 2, true, false)
				end
			end
			--]]
			pUnit:SetHasPromotion(iHorseDadEffect, pUnit:IsWithinDistanceOfUnitPromotion(iSofa, 2, true, false))
		end
	end
end

function HorseDadOnCreate(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsMounted() then
		--[[
		local bInRange = pUnit:IsWithinDistanceOfUnitPromotion(iSofa, 0, true, false)

		if not bInRange then
			bInRange = pUnit:IsWithinDistanceOfUnitPromotion(iSofa, true, false)
				
			if not bInRange then
				bInRange = pUnit:IsWithinDistanceOfUnitPromotion(iSofa, 2, true, false)
			end
		end
		--]]
		pUnit:SetHasPromotion(iHorseDadEffect, pUnit:IsWithinDistanceOfUnitPromotion(iSofa, 2, true, false))
	end
end

function HorseDadOnBuild(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsMounted() then
		--[[
		local bInRange = pUnit:IsWithinDistanceOfUnitPromotion(iSofa, 0, true, false)

		if not bInRange then
			bInRange = pUnit:IsWithinDistanceOfUnitPromotion(iSofa, true, false)
				
			if not bInRange then
				bInRange = pUnit:IsWithinDistanceOfUnitPromotion(iSofa, 2, true, false)
			end
		end
		--]]
		pUnit:SetHasPromotion(iHorseDadEffect, pUnit:IsWithinDistanceOfUnitPromotion(iSofa, 2, true, false))
	end
end

GameEvents.UnitSetXY.Add(HorseDadOnMove)
GameEvents.UnitCreated.Add(HorseDadOnCreate)
GameEvents.CityTrained.Add(HorseDadOnBuild)
