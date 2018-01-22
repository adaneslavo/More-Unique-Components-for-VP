-- Pitz
-- Author: adan_eslavo
-- DateCreated: 16/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent / 100
local fGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent/ 100
local tBaktunTurn = {}

if Game.GetGameSpeedType() == 3 then
	tBaktunTurn[0] = 22
	tBaktunTurn[1] = 28
	tBaktunTurn[2] = 35
	tBaktunTurn[3] = 42
	tBaktunTurn[4] = 48
	tBaktunTurn[5] = 57
	tBaktunTurn[6] = 67
	tBaktunTurn[7] = 77
	tBaktunTurn[8] = 88
	tBaktunTurn[9] = 102
	tBaktunTurn[10] = 122
	tBaktunTurn[11] = 152
	tBaktunTurn[12] = 293
elseif Game.GetGameSpeedType() == 2 then
	tBaktunTurn[0] = 33
	tBaktunTurn[1] = 42
	tBaktunTurn[2] = 52
	tBaktunTurn[3] = 62
	tBaktunTurn[4] = 72
	tBaktunTurn[5] = 86
	tBaktunTurn[6] = 101
	tBaktunTurn[7] = 117
	tBaktunTurn[8] = 133
	tBaktunTurn[9] = 152
	tBaktunTurn[10] = 183
	tBaktunTurn[11] = 234
	tBaktunTurn[12] = 433
elseif Game.GetGameSpeedType() == 1 then
	tBaktunTurn[0] = 52
	tBaktunTurn[1] = 68
	tBaktunTurn[2] = 83
	tBaktunTurn[3] = 99
	tBaktunTurn[4] = 115
	tBaktunTurn[5] = 131
	tBaktunTurn[6] = 150
	tBaktunTurn[7] = 177
	tBaktunTurn[8] = 203
	tBaktunTurn[9] = 229
	tBaktunTurn[10] = 268
	tBaktunTurn[11] = 344
else
	tBaktunTurn[0] = 86
	tBaktunTurn[1] = 118
	tBaktunTurn[2] = 158
	tBaktunTurn[3] = 197
	tBaktunTurn[4] = 236
	tBaktunTurn[5] = 276
	tBaktunTurn[6] = 315
	tBaktunTurn[7] = 355
	tBaktunTurn[8] = 394
	tBaktunTurn[9] = 467
	tBaktunTurn[10] = 545
	tBaktunTurn[11] = 705
	tBaktunTurn[12] = 1248
end

function KatunAhaw(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MAYA then
		local pCity = pPlayer:GetCityByID(iCity)
	
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MAYA_PITZ) then	
			local pUnit = pPlayer:GetUnitByID(iUnit)
			
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW, pUnit:GetUnitCombatType() <= 6)
		end
	end
end

function KatunAhawUpgrade(iPlayer)
	local pPlayer = Players[iPlayer]
	local iCounter = math.floor(20 * fGameSpeedModifier3)

	if not pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MAYA then return end
	
	local pTeam = Teams[pPlayer:GetTeam()]

	if pTeam:GetTeamTechs():HasTech(GameInfoTypes.TECH_MATHEMATICS) then
		BaktunBonus(iPlayer, tBaktunTurn)
	end
	
	if Game.GetElapsedGameTurns() % iCounter ~= 0 then return end

	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW) then
			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_1) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_2, true)
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_1, false)
				pUnit:ChangeExperience(10)
			elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_2) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_3, true)
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_2, false)
				pUnit:ChangeExperience(10)
			elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_3) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_4, true)
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_3, false)
				pUnit:ChangeExperience(15)
			elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_4) then
			else
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_1, true)
				pUnit:ChangeExperience(5)
			end
		end
	end
end

function BaktunBonus(iPlayer, tBaktunTurn)
	local pPlayer = Players[iPlayer]

	for i, t in ipairs(tBaktunTurn) do
		if Game.GetElapsedGameTurns() == t then
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MAYA_PITZ) then
					local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
											
					local iChange1 = math.floor(20 * iEraModifier * fGameSpeedModifier1)
					local iChange2 = math.floor(20 * iEraModifier * fGameSpeedModifier2)
							
					pPlayer:ChangeFaith(iChange2)
					LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iChange1)
	
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_WHITE]+"..iChange2.."[ICON_PEACE][ENDCOLOR]", 1)
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iChange1.."[ICON_RESEARCH][ENDCOLOR]", 1.5)
						pPlayer:AddNotification(0, 'Baktun '..(i + 1)..' has ended:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange1..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange2..' [ICON_PEACE] Faith', 'Bonus Yields in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
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