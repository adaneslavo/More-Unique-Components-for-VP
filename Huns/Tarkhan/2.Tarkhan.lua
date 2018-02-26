--------------------------------------------------------------------------------------------------------------------------
-- TARKHAN
-- 2018-01-27 updated by Infixo
-- 2018-02-26 updated by Infixo (IsPlayerFriendly)
--------------------------------------------------------------------------------------------------------------------------
--4UC Tarkhan Migration promotion
local unitClassSettlerID = GameInfoTypes.UNITCLASS_SETTLER
local unitClassWorkerID = GameInfoTypes.UNITCLASS_WORKER
local unitPromotionMigration = GameInfoTypes["PROMOTION_MIGRATION"]
function HunMigration_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	for unit in player:Units() do
		if unit:GetUnitClassType() == unitClassSettlerID or unit:GetUnitClassType() == unitClassWorkerID then
			local plot = unit:GetPlot()
			if (plot:GetUnit() and plot:GetUnit():IsHasPromotion(unitPromotionMigration)) then
				unit:ChangeMoves(60)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(HunMigration_PlayerDoTurn)
--==========================================================================================================================
--==========================================================================================================================
--Bellum Alet' promotion
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function IsPlayerFriendly(ePlayer, ePlayer2)
	if ePlayer == ePlayer2 then return true end -- obvious
	local pPlayer, pPlayer2 = Players[ePlayer], Players[ePlayer2]
	if not( pPlayer or pPlayer2 ) then return false end -- assert
	local pTeam, pTeam2 = Teams[pPlayer:GetTeam()], Teams[pPlayer2:GetTeam()]
	if not( pTeam or pTeam2 ) then return false end -- assert

	if pTeam:GetID() == pTeam2:GetID() then return true end
	if pTeam:IsAtWar(pTeam2:GetID()) then return false end
	if pPlayer2:IsMinorCiv() then
		if pPlayer:IsFriends(ePlayer2) or pPlayer:IsAllies(ePlayer2) then return true end
	end
	-- any other conditions?
	return false
end

function OnUnitPillageGoldBellumAlet(iPlayer, iUnit, iImprovement, iGold)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SACKER) then
		local pUnitPlot = pUnit:GetPlot()
		local iX, iY = pUnitPlot:GetX(), pUnitPlot:GetY()
		for eDirection = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, eDirection)
			for k = 0, pAdjacentPlot:GetNumUnits() - 1 do
				local pAdjacentUnit = pAdjacentPlot:GetUnit(k)
				if IsPlayerFriendly(iPlayer, pAdjacentUnit:GetOwner()) then
					pAdjacentUnit:ChangeDamage(-10, iPlayer)
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vUnitPosition = PositionCalculator(pAdjacentUnit:GetX(), pAdjacentUnit:GetY())
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_GREEN]Bellum Alet[ENDCOLOR]", 1)
					end
				end
			end -- units
		end -- for
	end -- promo
end -- function

function PositionCalculator(i1, i2)
    return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.UnitPillageGold.Add(OnUnitPillageGoldBellumAlet)
