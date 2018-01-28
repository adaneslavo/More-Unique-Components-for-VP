-- Black Tug
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
function PillagedTileBonusMove(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MINGGHAN) then
		local pPlot = Map.GetPlot(iX, iY)
		
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE, pPlot:IsImprovementPillaged())
	end
end

function OnPillageBonus(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged) 
	if bPillaged then
		local pPlot = Map.GetPlot(iX, iY)
		
		for iVal = 0,(pPlot:GetNumUnits() - 1) do
			local pUnit = pPlot:GetUnit(iVal)
		
			if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MINGGHAN) then	
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE, true)
			end
		end
	end
end

GameEvents.UnitSetXY.Add(PillagedTileBonusMove)
GameEvents.TileImprovementChanged.Add(OnPillageBonus)