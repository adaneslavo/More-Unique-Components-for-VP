-- Landwehr
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

function ImperialVigilance(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_IMPERIAL_VIGILANCE) then
			local pPlot = pUnit:GetPlot()
	
			if pPlot ~= nil then
				local iOwner = pPlot:GetOwner()
				local pOwner = Players[iOwner]
			
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS, (iOwner >= GameDefines.MAX_MAJOR_CIVS and iOwner <= GameDefines.MAX_CIV_PLAYERS and pOwner:GetMinorCivFriendshipLevelWithMajor(iPlayer) >= 1))
			end
		end
	end
end

function YorkscherMarsch(iPlayer)
	local pPlayer = Players[iPlayer]

	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_YORKSCHER_MARCHE) then
			local pPlot = pUnit:GetPlot()
			
			if pPlot ~= nil then
				local iImprovementOnTile = pPlot:GetImprovementType()
				
				if pUnit:IsGarrisoned() or iImprovementOnTile == GameInfoTypes.IMPROVEMENT_CITADEL or iImprovementOnTile == GameInfoTypes.IMPROVEMENT_FORT then
					local iOwner = pPlot:GetOwner()
					local pOwner = Players[iOwner]

					if pOwner == pPlayer then
						pPlayer:ChangeJONSCulture(1)

						if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
							local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
							Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+1 [ICON_CULTURE] Regimentsmarsche[ENDCOLOR]", 1)
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

GameEvents.PlayerEndTurnCompleted.Add(ImperialVigilance)
GameEvents.PlayerDoTurn.Add(YorkscherMarsch)
