-- Black Tug
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
function PillagedTileBonusStand(iPlayer)
	local pPlayer = Players[iPlayer]

	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MINGGHAN) then
			local pPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY())
			
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE, pPlot:IsImprovementPillaged())
		end
	end
end

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
		local pUnit = pPlot:GetUnit(0)
		local pPlayer = Players[pUnit:GetOwner()]
		
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MINGGHAN) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE, true)
			pUnit:ChangeExperience(5)
		end
	end
end

GameEvents.PlayerDoTurn.Add(PillagedTileBonusStand)
GameEvents.UnitSetXY.Add(PillagedTileBonusMove)
GameEvents.TileImprovementChanged.Add(OnPillageBonus)