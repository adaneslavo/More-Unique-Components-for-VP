-- Slaganz
-- Author: Blue Ghost, Infixo, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

function SlaganzConvert(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]

	if pAttackingPlayer == nil or pDefendingPlayer == nil then return end
	
	if not pDefendingPlayer:IsBarbarian() then return end
	
	local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
	local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
	
	if pAttackingUnit == nil or pDefendingUnit == nil then return end
	
	if pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_GERMANY_BARBARIAN_ALLIANCE) and iAttackerFinalDamage < iAttackerMaxHP and iDefenderFinalDamage >= iDefenderMaxHP then
		local iRand = Game.Rand(2, "Slaganz capture roll")
		
		if iRand == 1 then
			local pNewUnit = pAttackingPlayer:InitUnit(pDefendingUnit:GetUnitType(), iPlotX, iPlotY)
			local pNearestCityState = GetNearestCityState(iPlotX, iPlotY)

			pNewUnit:Convert(pDefendingUnit)
			pNewUnit:SetDamage(75)

			pNearestCityState:ChangeMinorCivFriendshipWithMajor(pAttackingPlayer, 5)

			if pAttackingPlayer:IsHuman() and pAttackingPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(iPlotX, iPlotY)
				
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_WHITE]+5 [ICON_INFLUENCE][ENDCOLOR]", 2)
				pAttackingPlayer:AddNotification(0,
					'You have converted Barbarian Unit. Your [ICON_INFLUENCE] Influence on '..pNearestCityState:GetName()..' has increased.',
					'Barbarian conversion well received in '..pNearestCityState:GetName(),
					iPlotX, iPlotY)
			end
		end
	end
end

function GetNearestCityState(iPlotX, iPlotY)
	local iDistance = 10000
	local pNearestCity = nil
	local pPlot = Map.GetPlot(iPlotX, iPlotY)

	for i, pPlayer in pairs(Players) do	
		if pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() then
			for pCity in pPlayer:Cities() do
				local iDistanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())

				if(iDistanceToCity < iDistance) then
					iDistance = iDistanceToCity
					pNearestCityState = pPlayer
				end
			end
		end
	end

	return pNearestCityState
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CombatEnded.Add(SlaganzConvert)
