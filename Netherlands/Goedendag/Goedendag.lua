-- Goedendag
-- Author: adan_eslavo
-- DateCreated: 12/12/2017
-- 2018-01-22 Infixo, RESOURCECLASS_LUXURY used
--------------------------------------------------------------
local iGoedendag = GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_GOEDENDAG
local iGoedendagEffect = GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_GOEDENDAG_EFFECT

function GoedendagBonus(iPlayer)
	local pPlayer = Players[iPlayer]

	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitCombatType() >= 0 and pUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
			local bInRange = pUnit:IsWithinDistanceOfUnitPromotion(iGoedendag, 1, true, false)

			pUnit:SetHasPromotion(iGoedendagEffect, bInRange)
		end
	end
end

function GoedendagResource(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_BURGEMEESTE) then
		local pPlot = pUnit:GetPlot()
			
		if pPlot ~= nil then	
			local eResType = pPlot:GetResourceType(pPlayer:GetTeam())
			local bIsLuxury = false
			
			if eResType ~= -1 then bIsLuxury = (GameInfo.Resources[ eResType ].ResourceClassType == "RESOURCECLASS_LUXURY") end
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_NETHERLANDS_BURGEMEESTE_EFFECT, bIsLuxury)
		end			
	end
end

GameEvents.PlayerEndTurnCompleted.Add(GoedendagBonus)
GameEvents.UnitSetXY.Add(GoedendagResource)