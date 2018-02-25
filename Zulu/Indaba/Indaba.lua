-- Indaba
-- Author: Blue Ghost, pineappledan
--------------------------------------------------------------
include("FLuaVector.lua")

function IndabaExpended(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_IQAWE) then
		local pPlot = Map.GetPlot(iX, iY)
		for k = 0, pPlot:GetNumUnits() - 1, 1 do
			local pStackedUnit = pPlot:GetUnit(k)
			local eOwner = pStackedUnit:GetOwner()
			if Players[eOwner] == pPlayer and pStackedUnit:IsCombatUnit() then
				pStackedUnit:ChangeExperience(30)
			end
		end
		-- loop through adjacent tiles
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
			
			-- loop through all units on adjacent tile
			for k = 0, pAdjacentPlot:GetNumUnits() - 1, 1 do
				local pAdjacentUnit = pAdjacentPlot:GetUnit(k)
				local eAdjacentPlayer = pAdjacentUnit:GetOwner()
				local pAdjacentPlayer = Players[eAdjacentPlayer]
				
				if Teams[pPlayer:GetTeam()]:IsAtWar(pAdjacentPlayer:GetTeam()) then
					pAdjacentUnit:ChangeDamage(30, eAdjacentPlayer)
					
					local iAdjacentX, iAdjacentY = pAdjacentUnit:GetX(), pAdjacentUnit:GetY()

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vUnitPosition = PositionCalculator(iAdjacentX, iAdjacentY)
						
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_RED]InDuna[ENDCOLOR]", 2)
					end

					if pAdjacentPlayer:IsHuman() then
						pAdjacentPlayer:AddNotification(NotificationTypes.NOTIFICATION_ENEMY_IN_TERRITORY, 
							pTargetUnit:GetName()..' was hurt by enemy InDuna for 30 damage.', 
							'Unit damaged by InDuna', 
							iAdjacentX, iAdjacentY, iUnit)
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
    return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

function IbuthoGainXP(iPlayer, iUnitOrCity, iRole, bIsCity) 
	if iRole == 0 and not bIsCity then -- Attacker
		local pPlayer = Players[iPlayer]
		local pUnit = pPlayer:GetUnitByID(iUnitOrCity)
		local pPlot = pUnit:GetPlot()
		local meleeCombat = {
	GameInfoTypes.UNITCOMBAT_RECON,
	GameInfoTypes.UNITCOMBAT_MOUNTED,
	GameInfoTypes.UNITCOMBAT_MELEE,
	GameInfoTypes.UNITCOMBAT_GUN,
	GameInfoTypes.UNITCOMBAT_ARMOR,
	GameInfoTypes.UNITCOMBAT_HELICOPTER
}
	local rangeCombat = {
	GameInfoTypes.UNITCOMBAT_ARCHER,
	GameInfoTypes.UNITCOMBAT_SIEGE,
}
		
		for k = 0, pPlot:GetNumUnits() - 1, 1 do
			local pStackedUnit = pPlot:GetUnit(k)
			local eOwner = pStackedUnit:GetOwner()
			if Players[eOwner] == pPlayer and pStackedUnit:IsHasPromotion(GameInfoTypes.PROMOTION_IBUTHO) then
				if pUnit:GetUnitCombatType() == meleeCombat then
					pUnit:ChangeExperience(5)
				else
					pUnit:ChangeExperience(2)
				end
			end
		end
	end
end

GameEvents.GreatPersonExpended.Add(IndabaExpended)
GameEvents.BattleJoined.Add(IbuthoGainXP)
