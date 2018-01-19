-- Black Tug
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------

-- check XP scaling
local bXPScaling = true -- default VP
for t in GameInfo.CustomModOptions{Name="BALANCE_CORE_SCALING_XP"} do bXPScaling = (tValue == 1) end
print("XP scaling is", bXPScaling)

-- acquire game speed modifier
local fGameSpeedModifier = 1.0 -- it is float, so use 'f' at begining
if bXPScaling then fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent / 100 end
print("Game speed modifier is", fGameSpeedModifier)

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

	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MONGOLIA_MINGGHAN) then
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
			
			pUnit:SetExperience(pUnit:GetExperience() + math.floor(5 * fGameSpeedModifier))
		end
	end
end

GameEvents.PlayerDoTurn.Add(PillagedTileBonusStand)
GameEvents.UnitSetXY.Add(PillagedTileBonusMove)
GameEvents.TileImprovementChanged.Add(OnPillageBonus)