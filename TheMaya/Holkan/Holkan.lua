-- Holkan
-- Author: adan_eslavo
-- DateCreated: 16/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")
include("ModUserData.lua")

function RenewalCycleOnHolkan(iPlayer)
	local pPlayer = Players[iPlayer]
	local iCounter = math.floor(20 * GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent) / 100

	if Game.GetElapsedGameTurns() % iCounter == 0 then
		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_RENEWAL_CYCLE) then
				pUnit:ChangeDamage(-30)
				
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
					Events.AddPopupTextEvent(vUnitPosition, "[COLOR_POSITIVE_TEXT]Renewal Cycle[ENDCOLOR]", 1)
				end
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

			local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
			
			local iResearchBonus = math.floor(10 * iEraModifier * iGameSpeedModifier)
			
			Teams[pPlayer:GetTeam()]:GetTeamTechs():ChangeResearchProgress(pPlayer:GetCurrentResearch(), iResearchBonus, iPlayer)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())

				Events.AddPopupTextEvent(vUnitPosition, "[COLOR_BLUE]+"..iResearchBonus.." [ICON_RESEARCH] Ancient Ruins[ENDCOLOR]", 2)
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