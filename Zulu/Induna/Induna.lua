-- Indaba
-- Author: Blue Ghost, pineappledan
-- 2018-02-26 updated by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

local ePromotionIbutho = GameInfoTypes.PROMOTION_UNIT_ZULU_IBUTHO
local ePromotionIqawe = GameInfoTypes.PROMOTION_UNIT_ZULU_IQAWE
local eCivilizationZulu = GameInfoTypes.CIVILIZATION_ZULU

local tEligibleCombats = {
	[GameInfoTypes.UNITCOMBAT_MELEE] = true,
	[GameInfoTypes.UNITCOMBAT_GUN] = true,
	[GameInfoTypes.UNITCOMBAT_MOUNTED] = true,
	[GameInfoTypes.UNITCOMBAT_ARMOR] = true,
	[GameInfoTypes.UNITCOMBAT_RECON] = true,
	[GameInfoTypes.UNITCOMBAT_HELICOPTER] = true,
}

-- adds XP to stacked unit and deals damage to adjacent enemy units
function OnExpendingGrantXPAndDealDmg(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationZulu) then return end
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if not pUnit:IsHasPromotion(ePromotionIqawe) then return end

	local pPlot = Map.GetPlot(iX, iY)
	
	-- grants XP to adjacent units
	for k = 0, pPlot:GetNumUnits() - 1, 1 do
		local pStackedUnit = pPlot:GetUnit(k)
		local eOwner = pStackedUnit:GetOwner()
		
		if eOwner == iPlayer and pStackedUnit:IsCombatUnit() then
			pStackedUnit:ChangeExperience(30)
		end
	end

	-- deals damage to adjacent units
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

-- adds xp to stacked units on attack
--[[function OnAttackGainExtraXP(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP) 
	local pAttackingPlayer = Players[iAttackingPlayer]
	
	if not (pAttackingPlayer and pAttackingPlayer:GetCivilizationType() == eCivilizationZulu) then return end

	local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
	
	if pAttackingUnit == nil then return end
	
	local pPlot = pAttackingUnit:GetPlot()
			
	for k = 0, pPlot:GetNumUnits() - 1, 1 do
		local pStackedUnit = pPlot:GetUnit(k)
		local eOwner = pStackedUnit:GetOwner()
	
		if eOwner == iAttackingPlayer and pStackedUnit:IsHasPromotion(ePromotionIbutho) then
			if tEligibleCombats[ pAttackingUnit:GetUnitCombatType() ] then
				pAttackingUnit:ChangeExperience(5)
			else
				pAttackingUnit:ChangeExperience(2)
			end
		end
	end
end ]]

function PositionCalculator(i1, i2)
    return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationZulu) then
	GameEvents.GreatPersonExpended.Add(OnExpendingGrantXPAndDealDmg)
--	GameEvents.CombatEnded.Add(OnAttackGainExtraXP)
end
