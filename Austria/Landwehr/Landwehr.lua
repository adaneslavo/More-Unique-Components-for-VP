-- Landwehr
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

function YorkscherMarsch(iPlayer)
	local pPlayer = Players[iPlayer]

	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_YORKSCHER_MARCHE) then
			local pPlot = pUnit:GetPlot()
			
			if pPlot ~= nil then
				local iImprovementOnTile = pPlot:GetImprovementType()
				
				if iImprovementOnTile == GameInfoTypes.IMPROVEMENT_CITADEL or iImprovementOnTile == GameInfoTypes.IMPROVEMENT_FORT then
					local iOwner = pPlot:GetOwner()
					local pOwner = Players[iOwner]

					if pOwner == pPlayer then
						pPlayer:ChangeJONSCulture(2)

						if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
							local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
							Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+2 [ICON_CULTURE] Regimentsmarsche[ENDCOLOR]", 1)
						end
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(YorkscherMarsch)
