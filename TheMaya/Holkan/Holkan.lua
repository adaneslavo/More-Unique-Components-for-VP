-- Holkan
-- Author: adan_eslavo
-- DateCreated: 16/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")
include("ModUserData.lua")

function RenewalCycleOnHolkan(iPlayer)
	local pPlayer = Players[iPlayer]
	local iCounter

	if Game.GetGameSpeedType() == 0 then
		iCounter = 60
	elseif Game.GetGameSpeedType() == 1 then
		iCounter = 30
	elseif Game.GetGameSpeedType() == 2 then
		iCounter = 20
	else
		iCounter = 14
	end

	if Game.GetElapsedGameTurns() % iCounter == 0 then
		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_RENEWAL_CYCLE) then
				pUnit:ChangeDamage(-30)
				
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_POSITIVE_TEXT]Renewal Cycle[ENDCOLOR]", 1)
			end
		end
	end
end

function HolkansGoodyHuts(iPlayer, iUnit, eGoody, bPick)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_SCOUT_GOODY_BONUS_2) then
		local bGoodyHutTaken = modUserData.GetValue(pUnit:GetX().."-"..pUnit:GetY().."-GoodyHut");

		if bGoodyHutTaken == nil then
			modUserData.SetValue(pUnit:GetX().."-"..pUnit:GetY().."-GoodyHut", "1");
			if modUserData.GetValue("FileToReset") == nil then
				modUserData.SetValue("FileToReset", "1");
			end

			if Game.GetGameSpeedType() == 3 then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())

				Teams[pPlayer:GetTeam()]:GetTeamTechs():ChangeResearchProgress(pPlayer:GetCurrentResearch(), 7, iPlayer)
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_BLUE]+7 [ICON_RESEARCH] Ancient Ruins[ENDCOLOR]", 2)
			elseif Game.GetGameSpeedType() == 2 then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())

				Teams[pPlayer:GetTeam()]:GetTeamTechs():ChangeResearchProgress(pPlayer:GetCurrentResearch(), 10, iPlayer)
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_BLUE]+10 [ICON_RESEARCH] Ancient Ruins[ENDCOLOR]", 2)
			elseif Game.GetGameSpeedType() == 1 then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())

				Teams[pPlayer:GetTeam()]:GetTeamTechs():ChangeResearchProgress(pPlayer:GetCurrentResearch(), 15, iPlayer)
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_BLUE]+15 [ICON_RESEARCH] Ancient Ruins[ENDCOLOR]", 2)
			else
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())

				Teams[pPlayer:GetTeam()]:GetTeamTechs():ChangeResearchProgress(pPlayer:GetCurrentResearch(), 30, iPlayer)
				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_BLUE]+30 [ICON_RESEARCH] Ancient Ruins[ENDCOLOR]", 2)
			end
		end
	end

	return false
end

function ModBaseResetOnFirstMove(iPlayer, iUnit, iX, iY)
	if Modding.HasUserData(modid, modver) and modUserData.GetValue("FileToReset") == 1 then
		Modding.DeleteUserData(modid, modver)
		modUserData.SetValue("FileToReset", "0");
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(RenewalCycleOnHolkan)
GameEvents.GoodyHutCanNotReceive.Add(HolkansGoodyHuts)
GameEvents.UnitSetXY.Add(ModBaseResetOnFirstMove)