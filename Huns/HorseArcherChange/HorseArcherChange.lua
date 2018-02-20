--UU

local HerdID = GameInfoTypes.PROMOTION_HORSE_ARCHER;
local RangAtt = GameInfoTypes.MISSION_RANGE_ATTACK;
local tPIE = {}

function WalkingSzekely(player, unit, x, y)
	if Map.GetPlot(x,y) ~= nil then
		local cUnit = Players[player]:GetUnitByID(unit);
		if cUnit:IsHasPromotion(HerdID) then
			if tPIE[cUnit] then
				if cUnit:GetMoves() <= 0 then
					SearchAttack(cUnit)
				end
			else
				tPIE[cUnit] = 1;
			end
		end
	end
end
GameEvents.UnitSetXY.Add(WalkingSzekely)

function SearchAttack(jUnit)
	local bX = jUnit:GetX();
	local bY = jUnit:GetY();
	local hTab = {}
	jUnit:SetMoves(1)
	for iX = -3, 3 do
		for iY = -3, 3 do
			local plot = Map.PlotXYWithRangeCheck(bX, bY, iX, iY, 3)
			if plot then
				if jUnit:CanStartMission(RangAtt, plot:GetX(), plot:GetY()) then
					table.insert(hTab, plot)
				end
			end
		end
	end
	if #hTab > 0 then
		local ePlot = hTab[math.random(1, #hTab)];
		jUnit:PushMission(RangAtt, ePlot:GetX(), ePlot:GetY())
	end
	jUnit:SetMoves(0);
end
