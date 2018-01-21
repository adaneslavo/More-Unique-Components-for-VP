-- Pitz
-- Author: adan_eslavo
-- DateCreated: 16/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

function KatunAhaw(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetName() == "Pacal" then
		local pCity = pPlayer:GetCityByID(iCity)
	
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MAYA_PITZ) then	
			local pUnit = pPlayer:GetUnitByID(iUnit)
			
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW, pUnit:GetUnitCombatType() <= 6)
		end
	end
end

function KatunAhawUpgrade(iPlayer)
	local pPlayer = Players[iPlayer]
	
	local iCounter = math.floor(20 * GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent) / 100

	if pPlayer:GetName() == "Pacal" then
		if Game.GetElapsedGameTurns() % iCounter == 0 then
			for pUnit in pPlayer:Units() do
				if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW) then
					if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_1) then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_2, true)
						pUnit:ChangeExperience(10)
					elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_2) then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_3, true)
						pUnit:ChangeExperience(10)
					elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_3) then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_4, true)
						pUnit:ChangeExperience(15)
					elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_4) then
					else
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_1, true)
						pUnit:ChangeExperience(5)
					end
				end
			end
		end

		if Game.GetGameSpeedType() == 3 then
			local iBaktunTurn = {}
				iBaktunTurn[0] = 22
				iBaktunTurn[1] = 28
				iBaktunTurn[2] = 35
				iBaktunTurn[3] = 42
				iBaktunTurn[4] = 48
				iBaktunTurn[5] = 57
				iBaktunTurn[6] = 67
				iBaktunTurn[7] = 77
				iBaktunTurn[8] = 88
				iBaktunTurn[9] = 102
				iBaktunTurn[10] = 122
				iBaktunTurn[11] = 152
				iBaktunTurn[12] = 293

			for i, t in ipairs(iBaktunTurn) do
				if Game.GetElapsedGameTurns() == t then
					for pCity in pPlayer:Cities() do
						if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MAYA_PITZ) then
							local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
							local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent / 100
							local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
											
							local iChange1 = math.floor(10 * iEraModifier * iGameSpeedModifier1)
							local iChange2 = math.floor(10 * iEraModifier * iGameSpeedModifier2)
							
							pPlayer:ChangeFaith(iChange2)
							LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iChange1)
	
							if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
								local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_WHITE]+"..iChange2.."[ICON_PEACE][ENDCOLOR]", 1)
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iChange1.."[ICON_RESEARCH][ENDCOLOR]", 1.5)
								pPlayer:AddNotification(0, 'New Baktun:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange1..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange2..' [ICON_PEACE] Faith', 'Bonus Yields in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
							end
						end
					end
				end
			end
		elseif Game.GetGameSpeedType() == 2 then
			local iBaktunTurn = {}
				iBaktunTurn[0] = 33
				iBaktunTurn[1] = 42
				iBaktunTurn[2] = 52
				iBaktunTurn[3] = 62
				iBaktunTurn[4] = 72
				iBaktunTurn[5] = 86
				iBaktunTurn[6] = 101
				iBaktunTurn[7] = 117
				iBaktunTurn[8] = 133
				iBaktunTurn[9] = 152
				iBaktunTurn[10] = 183
				iBaktunTurn[11] = 234
				iBaktunTurn[12] = 433

			for i, t in ipairs(iBaktunTurn) do
				if Game.GetElapsedGameTurns() == t then
					for pCity in pPlayer:Cities() do
						if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MAYA_PITZ) then
							local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
							local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent / 100
							local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
											
							local iChange1 = math.floor(10 * iEraModifier * iGameSpeedModifier1)
							local iChange2 = math.floor(10 * iEraModifier * iGameSpeedModifier2)
							
							pPlayer:ChangeFaith(iChange2)
							LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iChange1)
	
							if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
								local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_WHITE]+"..iChange2.."[ICON_PEACE][ENDCOLOR]", 1)
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iChange1.."[ICON_RESEARCH][ENDCOLOR]", 1.5)
								pPlayer:AddNotification(0, 'New Baktun:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange1..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange2..' [ICON_PEACE] Faith', 'Bonus Yields in '..pCity:GetName()..'!', pCity:GetX(), pCity:GetY())
							end
						end
					end
				end
			end
		elseif Game.GetGameSpeedType() == 1 then
			local iBaktunTurn = {}
				iBaktunTurn[0] = 52
				iBaktunTurn[1] = 68
				iBaktunTurn[2] = 83
				iBaktunTurn[3] = 99
				iBaktunTurn[4] = 115
				iBaktunTurn[5] = 131
				iBaktunTurn[6] = 150
				iBaktunTurn[7] = 177
				iBaktunTurn[8] = 203
				iBaktunTurn[9] = 229
				iBaktunTurn[10] = 268
				iBaktunTurn[11] = 344
			
			for i, t in ipairs(iBaktunTurn) do
				if Game.GetElapsedGameTurns() == t then
					for pCity in pPlayer:Cities() do
						if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MAYA_PITZ) then
							local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
							local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent / 100
							local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
											
							local iChange1 = math.floor(10 * iEraModifier * iGameSpeedModifier1)
							local iChange2 = math.floor(10 * iEraModifier * iGameSpeedModifier2)
							
							pPlayer:ChangeFaith(iChange2)
							LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iChange1)
	
							if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
								local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_WHITE]+"..iChange2.."[ICON_PEACE][ENDCOLOR]", 1)
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iChange1.."[ICON_RESEARCH][ENDCOLOR]", 1.5)
								pPlayer:AddNotification(0, 'New Baktun:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange1..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange2..' [ICON_PEACE] Faith', 'Bonus Yields in '..pCity:GetName()..'!', pCity:GetX(), pCity:GetY())
							end
						end
					end
				end
			end
		else
			local iBaktunTurn = {}
				iBaktunTurn[0] = 86
				iBaktunTurn[1] = 118
				iBaktunTurn[2] = 158
				iBaktunTurn[3] = 197
				iBaktunTurn[4] = 236
				iBaktunTurn[5] = 276
				iBaktunTurn[6] = 315
				iBaktunTurn[7] = 355
				iBaktunTurn[8] = 394
				iBaktunTurn[9] = 467
				iBaktunTurn[10] = 545
				iBaktunTurn[11] = 705

			for i, t in ipairs(iBaktunTurn) do
				if Game.GetElapsedGameTurns() == t then
					for pCity in pPlayer:Cities() do
						if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MAYA_PITZ) then
							local iGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
							local iGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent / 100
							local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
											
							local iChange1 = math.floor(10 * iEraModifier * iGameSpeedModifier1)
							local iChange2 = math.floor(10 * iEraModifier * iGameSpeedModifier2)
							
							pPlayer:ChangeFaith(iChange2)
							LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iChange1)
	
							if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
								local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_WHITE]+"..iChange2.."[ICON_PEACE][ENDCOLOR]", 1)
								Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iChange1.."[ICON_RESEARCH][ENDCOLOR]", 1.5)
								pPlayer:AddNotification(0, 'New Baktun:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange1..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange2..' [ICON_PEACE] Faith', 'Bonus Yields in '..pCity:GetName()..'!', pCity:GetX(), pCity:GetY())
							end
						end
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityTrained.Add(KatunAhaw)
GameEvents.PlayerDoTurn.Add(KatunAhawUpgrade)