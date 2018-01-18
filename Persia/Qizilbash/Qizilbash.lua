-- Qizilbash
-- Author: adan_eslavo
-- DateCreated: 20/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function QizilbashAgitator(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_PERSIA_SAFAVI_AGITATOR) then
			local iX = pUnit:GetX()
			local iY = pUnit:GetY()
			local pPlot = Map.GetPlot(iX, iY)

			if pPlot:GetOwner() ~= -1 then
				local pEnemyPlayer = Players[pPlot:GetOwner()]
				local iTeam = pPlayer:GetTeam()
				local pEnemyTeam = Teams[pEnemyPlayer:GetTeam()]

				if pEnemyTeam:IsAtWar(iTeam) then
					local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent
					local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent
					local iGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent
					
					local iGain1 = math.floor(2 * iGameSpeedModifier1)
					local iGain2 = math.floor(2 * iGameSpeedModifier2)
					local iGain3 = math.floor(1 * iGameSpeedModifier3)
					
					pPlayer:ChangeFaith(iGain1)
					pPlayer:ChangeGoldenAgeProgressMeter(iGain2)
					pPlayer:ChangeGold(iGain3)
					
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
					
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_WHITE]+"..iGain1.." [ICON_PEACE] Safavi Agitator[ENDCOLOR]", 1)
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_YIELD_GOLD]+"..iGain3.." [ICON_GOLD] Safavi Agitator[ENDCOLOR]", 1.5)
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_LIGHT_GREY]+"..iGain2.." [ICON_GOLDEN_AGE] Safavi Agitator[ENDCOLOR]", 2)
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(QizilbashAgitator)