-- Horse Archer
-- Author: 
-- DateCreated: 
--------------------------------------------------------------
local ePromotionHorseArcher = GameInfoTypes.PROMOTION_UNIT_HUNS_HORSE_ARCHER;
local eMissionAttack = GameInfoTypes.MISSION_RANGE_ATTACK;

-- performs attack if ran out of moves
function OnLastMoveAttack(iPlayer, iUnit, iX, iY)
	if Map.GetPlot(iX, iY) ~= nil then
		local pUnit = Players[iPlayer]:GetUnitByID(iUnit);
		
		if pUnit and pUnit:IsHasPromotion(ePromotionHorseArcher) then
			if pUnit:GetMoves() <= 0 then
				SearchAttack(pUnit)
			end
		end
	end
end

function SearchAttack(pUnit)
	local iXMain = pUnit:GetX();
	local iYMain = pUnit:GetY();
	local tPotentialTargets = {}

	pUnit:SetMoves(1)
	
	for iX = -1, 1 do
		for iY = -1, 1 do
			local pPlot = Map.PlotXYWithRangeCheck(iXMain, iYMain, iX, iY, 1)
			
			if pPlot then
				if pUnit:CanStartMission(eMissionAttack, pPlot:GetX(), pPlot:GetY()) then
					table.insert(tPotentialTargets, pPlot)
				end
			end
		end
	end

	if #tPotentialTargets > 0 then
		local pPlot = tPotentialTargets[math.random(1, #tPotentialTargets)];
		
		pUnit:PushMission(eMissionAttack, pPlot:GetX(), pPlot:GetY())
	end

	pUnit:SetMoves(0);
end

GameEvents.UnitSetXY.Add(OnLastMoveAttack)
