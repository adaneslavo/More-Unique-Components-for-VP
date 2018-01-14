include("PlotIterators.lua")

local horses = GameInfoTypes.RESOURCE_HORSE
local iron = GameInfoTypes.RESOURCE_IRON

function IronChariotResourceCheck(iPlayer)
	pPlayer = Players[iPlayer]
	local ironChariots = {}
	for unit in pPlayer:Units() do
		if (unit:GetUnitType() == GameInfoTypes.UNIT_ASSYRIAN_IRON_CHARIOT) then
			table.insert(ironChariots, unit)
		end
	end
	local numHorses = pPlayer:GetNumResourceAvailable(horses)
	local numIron = pPlayer:GetNumResourceAvailable(iron)
	local resourceBonuses = 0
	if (numHorses >= #ironChariots) then
		resourceBonuses = resourceBonuses + 1
	end
	if (numIron >= #ironChariots) then
		resourceBonuses = resourceBonuses + 1
	end

	for _, ironChariot in pairs(ironChariots) do
		if (resourceBonuses == 0) then
			ironChariot:SetBaseCombatStrength(13)
		elseif (resourceBonuses == 1) then
			ironChariot:SetBaseCombatStrength(15)
		elseif (resourceBonuses == 2) then
			ironChariot:SetBaseCombatStrength(17)
		end
	end
end

function FuryOfNergalUpdate(pPlayer, unit)
	unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_1, false)
	unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_2, false)
	unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_3, false)
	unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_4, false)
	unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_5, false)
	unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_6, false)
	local numEnemyUnitsNearby = 0
	local unitPlot = unit:GetPlot()
	for iPlot in PlotRingIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
		for k = 0, iPlot:GetNumUnits() - 1 do
			local jUnit = iPlot:GetUnit(k)
			local jPlayer = jUnit:GetOwner()
			local jTeam = Players[jPlayer]:GetTeam()
			local iTeam = pPlayer:GetTeam()
			if (Teams[iTeam]:IsAtWar(jTeam) and jUnit:IsCombatUnit()) then
				numEnemyUnitsNearby = numEnemyUnitsNearby + 1
			end
		end
	end

	if (numEnemyUnitsNearby == 1) then
		unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_1, true)
	elseif (numEnemyUnitsNearby == 2) then
		unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_2, true)
	elseif (numEnemyUnitsNearby == 3) then
		unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_3, true)
	elseif (numEnemyUnitsNearby == 4) then
		unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_4, true)
	elseif (numEnemyUnitsNearby == 5) then
		unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_5, true)
	elseif (numEnemyUnitsNearby == 6) then
		unit:SetHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL_6, true)
	end
end

function FuryOfNergalCheckTurnStart(iPlayer)
	pPlayer = Players[iPlayer]
	for unit in pPlayer:Units() do
		if unit:IsHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL) then
			FuryOfNergalUpdate(pPlayer, unit)
		end
	end
end

function FuryOfNergalCheckMovement(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local unit = pPlayer:GetUnitByID(iUnit)
	if unit:IsHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL) then
		FuryOfNergalUpdate(pPlayer, unit)
	end

	local unitPlot = unit:GetPlot()
	for iPlot in PlotRingIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
		for k = 0, iPlot:GetNumUnits() - 1 do
			local jUnit = iPlot:GetUnit(k)
			local jPlayer = jUnit:GetOwner()
			if jUnit:IsHasPromotion(GameInfoTypes.PROMOTION_FURY_OF_NERGAL) then
				FuryOfNergalUpdate(Players[jPlayer], jUnit)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(IronChariotResourceCheck)
GameEvents.PlayerDoTurn.Add(FuryOfNergalCheckTurnStart)
GameEvents.UnitSetXY.Add(FuryOfNergalCheckMovement)