-- Holkan
-- Author: adan_eslavo
-- DateCreated: 16/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100

function RenewalCycleOnHolkan(iPlayer)
	local pPlayer = Players[iPlayer]
	local iCounter = math.floor(20 * GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent / 100)

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

function HolkansGoodyHuts(iPlayer, iUnit, eGoody, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_SCOUT_GOODY_BONUS_2) then
		local iResearchBonus = math.floor(10 * fGameSpeedModifier)
			
		LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iResearchBonus)

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vUnitPosition = PositionCalculator(iX, iY)

			Events.AddPopupTextEvent(vUnitPosition, "[COLOR_BLUE]+"..iResearchBonus.." [ICON_RESEARCH] Lost Codices[ENDCOLOR]", 2)
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(RenewalCycleOnHolkan)
GameEvents.GoodyHutReceivedBonus.Add(HolkansGoodyHuts)
GameEvents.UnitSetXY.Add(ModBaseResetOnFirstMove)