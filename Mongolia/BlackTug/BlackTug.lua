-- Black Tug
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
function PillagedTileBonusStand(iPlayer)
	local pPlayer = Players[iPlayer]

	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MINGGHAN) then
			local pPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY())
				
			if pPlot:IsImprovementPillaged() then
				if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE) == false then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE, true)
				end
			else
				if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE) then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE, false)
				end
			end
		end
	end
end

function PillagedTileBonusMove(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MINGGHAN) then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot:IsImprovementPillaged() then
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE) == false then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE, true)
			end
		else
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE, false)
			end
		end
	end
end

function OnPillageBonus(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged) 
	if bPillaged then
		local pPlot = Map.GetPlot(iX, iY)
		local pUnit = pPlot:GetUnit(0)
		local pPlayer = Players[pUnit:GetOwner()]

		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MINGGHAN) then
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE) == false then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MASSACRE, true)
			end
			
			local iGameSpeedScaler
		
			if Game.GetGameSpeedType() == 0 then
				iGameSpeedScaler = 3
			elseif Game.GetGameSpeedType() == 1 then
				iGameSpeedScaler = 1.5
			elseif Game.GetGameSpeedType() == 2 then
				iGameSpeedScaler = 1
			else
				iGameSpeedScaler = 0.66
			end
			
			pUnit:SetExperience(pUnit:GetExperience() + (5 * iGameSpeedScaler))
		end
	end
end

GameEvents.PlayerDoTurn.Add(PillagedTileBonusStand)
GameEvents.UnitSetXY.Add(PillagedTileBonusMove)
GameEvents.TileImprovementChanged.Add(OnPillageBonus)