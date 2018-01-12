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
					local iGameSpeedScaler
		
					if Game.GetGameSpeedType() == 0 then
						iGameSpeedScaler = 3
					elseif Game.GetGameSpeedType() == 1 then
						iGameSpeedScaler = 1.5
					elseif Game.GetGameSpeedType() == 2 then
						iGameSpeedScaler = 1
					else
						iGameSpeedScaler = 0.66
					end
					
					local iGain1 = math.floor((1 * iGameSpeedScaler) + 0.5)
					local iGain2 = math.floor((2 * iGameSpeedScaler) + 0.5)
					
					pPlayer:ChangeFaith(iGain1)
					pPlayer:ChangeGoldenAgeProgressMeter(iGain2)
					pPlayer:ChangeGold(iGain2)
					
					local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
				
					Events.AddPopupTextEvent(vUnitPosition, "[COLOR_WHITE]+"..iGain1.." [ICON_PEACE] Safavi Agitator[ENDCOLOR]", 1)
					Events.AddPopupTextEvent(vUnitPosition, "[COLOR_YIELD_GOLD]+"..iGain2.." [ICON_GOLD] Safavi Agitator[ENDCOLOR]", 1.5)
					Events.AddPopupTextEvent(vUnitPosition, "[COLOR_LIGHT_GREY]+"..iGain2.." [ICON_GOLDEN_AGE] Safavi Agitator[ENDCOLOR]", 2)	
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(QizilbashAgitator)