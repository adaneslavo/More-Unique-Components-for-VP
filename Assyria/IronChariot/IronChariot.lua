-- Iron Chariot
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
-- 2018-01-27 updated by Infixo
--------------------------------------------------------------

function IronChariotResourceCheck(iPlayer)
	local pPlayer = Players[iPlayer]
	local tIronChariots = {}
	
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitType() == GameInfoTypes.UNIT_ASSYRIA_IRON_CHARIOT then
			table.insert(tIronChariots, pUnit)
		end
	end
	
	local iNumHorses = pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_HORSE)
	local iNumIron = pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_IRON)
	local iResourceBonuses = 0
	
	if (iNumHorses >= #tIronChariots) then
		iResourceBonuses = iResourceBonuses + 1
	end

	if (iNumIron >= #tIronChariots) then
		iResourceBonuses = iResourceBonuses + 1
	end

	for i, pIronChariot in pairs(tIronChariots) do
		if iResourceBonuses == 0 then
			pIronChariot:SetBaseCombatStrength(13)
		elseif iResourceBonuses == 1 then
			pIronChariot:SetBaseCombatStrength(15)
		else
			pIronChariot:SetBaseCombatStrength(17)
		end
	end
end

function FuryOfNergalCheckMovement(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if not pUnit then return end
	
	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL) then
		FuryOfNergalUpdate(pPlayer, pUnit)
	end

	local iX, iY = pUnit:GetX(), pUnit:GetY()
	for eDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, eDirection)
		for k = 0, pAdjacentPlot:GetNumUnits() - 1 do
			local jUnit = pAdjacentPlot:GetUnit(k)
			local jPlayer = jUnit:GetOwner()
			if jUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL) then
				FuryOfNergalUpdate(Players[jPlayer], jUnit)
			end
		end
	end
end

function FuryOfNergalCheckCreate(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if not pUnit then return end

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL) then
		FuryOfNergalUpdate(pPlayer, pUnit)
	end

	local iX, iY = pUnit:GetX(), pUnit:GetY()
	for eDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, eDirection)
		for k = 0, pAdjacentPlot:GetNumUnits() - 1 do
			local jUnit = pAdjacentPlot:GetUnit(k)
			local jPlayer = jUnit:GetOwner()
			if jUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL) then
				FuryOfNergalUpdate(Players[jPlayer], jUnit)
			end
		end
	end
end

function FuryOfNergalCheckBuild(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if not pUnit then return end
	
	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL) then
		FuryOfNergalUpdate(pPlayer, pUnit)
	end

	local iX, iY = pUnit:GetX(), pUnit:GetY()
	for eDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, eDirection)
		for k = 0, pAdjacentPlot:GetNumUnits() - 1 do
			local jUnit = pAdjacentPlot:GetUnit(k)
			local jPlayer = jUnit:GetOwner()
			
			if jUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL) then
				FuryOfNergalUpdate(Players[jPlayer], jUnit)
			end
		end
	end
end

function FuryOfNergalUpdate(pPlayer, pUnit)
	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_1, false)
	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_2, false)
	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_3, false)
	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_4, false)
	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_5, false)
	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_6, false)
	
	local iNumEnemyUnitsNearby = 0
	local iX, iY = pUnit:GetX(), pUnit:GetY()
	for eDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(iX, iY, eDirection)
		for k = 0, pAdjacentPlot:GetNumUnits() - 1 do
			local jUnit = pAdjacentPlot:GetUnit(k)
			local jPlayer = jUnit:GetOwner()
			local jTeam = Players[jPlayer]:GetTeam()
			local iTeam = pPlayer:GetTeam()
			
			if (Teams[iTeam]:IsAtWar(jTeam) and jUnit:IsCombatUnit()) then
				iNumEnemyUnitsNearby = iNumEnemyUnitsNearby + 1
			end
		end
	end

	if iNumEnemyUnitsNearby == 1 then
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_1, true)
	elseif iNumEnemyUnitsNearby == 2 then
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_2, true)
	elseif iNumEnemyUnitsNearby == 3 then
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_3, true)
	elseif iNumEnemyUnitsNearby == 4 then
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_4, true)
	elseif iNumEnemyUnitsNearby == 5 then
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_5, true)
	elseif iNumEnemyUnitsNearby == 6 then
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_6, true)
	end
end

GameEvents.PlayerDoTurn.Add(IronChariotResourceCheck)
GameEvents.UnitSetXY.Add(FuryOfNergalCheckMovement)
GameEvents.UnitCreated.Add(FuryOfNergalCheckCreate)
GameEvents.CityTrained.Add(FuryOfNergalCheckBuild)