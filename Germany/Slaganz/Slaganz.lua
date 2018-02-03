-- Slaganz
-- Author: Blue Ghost, Infixo, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
--[[function SlaganzConvert(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefendingPlayer = Players[iDefendingPlayer]
	print("slaganz")
	if pAttackingPlayer == nil or pDefendingPlayer == nil then return end
	
	if not pDefendingPlayer:IsBarbarian() then return end
	
	local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
	local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
	
	if pAttackingUnit == nil or pDefendingUnit == nil then return end
	
	if pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_GERMANY_BARBARIAN_ALLIANCE) and iAttackerFinalDamage < iAttackerMaxHP and iDefenderFinalDamage >= iDefenderMaxHP then
		local iRand = Game.Rand(2, "Slaganz capture roll")
		print(iRand, Game.Rand(2, "Slaganz capture roll"), Game.Rand(2, "Slaganz capture roll"), Game.Rand(2, "Slaganz capture roll"), Game.Rand(2, "Slaganz capture roll"), Game.Rand(2, "Slaganz capture roll"), Game.Rand(2, "Slaganz capture roll"), Game.Rand(2, "Slaganz capture roll"), Game.Rand(2, "Slaganz capture roll"), Game.Rand(2, "Slaganz capture roll"))
		if iRand == 1 then
			local iX = pDefendingUnit:GetX()
			local iY = pDefendingUnit:GetY()
			local pNewUnit = pAttackingPlayer:InitUnit(pDefendingUnit:GetUnitType(), iX, iY)
			--local pNearestCityState = GetNearestCityState(iX, iY)
			print(pNearestCityState:GetName())
			pNewUnit:Convert(pDefendingUnit)
			pNewUnit:SetDamage(75)

			--pNearestCityState:ChangeMinorCivFriendshipWithMajor(pAttackingPlayer, 5)
		end
	end
end

function GetNearestCityState(iX, iY)
	local iDistance = 10000
	local pNearestCity = nil
	local pPlot = Map.GetPlot(iX, iY)
	print("szukam")
	for i, pPlayer in pairs(Players) do	
		print("gracz", pPlayer:GetName())
		if pPlayer:IsMinorCiv() then
			print("znalazlem")
			for pCity in pPlayer:Cities() do
				local iDistanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())

				if(iDistanceToCity < iDistance) then
					print("jest blizej")
					iDistance = iDistanceToCity
					pNearestCity = pCity
				end
			end
		end
	end

	return pNearestCity:GetOwner()
end

GameEvents.CombatEnded.Add(SlaganzConvert)
