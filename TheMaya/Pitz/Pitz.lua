-- Pitz
-- Author: adan_eslavo
-- DateCreated: 16/12/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent / 100
local fGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent/ 100
local iMayaBaktun = 0

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
		local sMayaCalendar = pPlayer:GetMayaCalendarString()
		local sMayaBaktun
			
		sMayaBaktun = string.sub(sMayaCalendar, 2, 2)
		
		if sMayaBaktun == "." then 
			sMayaBaktun = string.sub(sMayaCalendar, 1, 1) 
		else 
			sMayaBaktun = string.sub(sMayaCalendar, 1, 2) 
		end
			
		local iMayaActualBaktun = tonumber(sMayaBaktun)
			
		if iMayaActualBaktun > iMayaBaktun then
			iMayaBaktun = iMayaActualBaktun

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
						pPlayer:AddNotification(0, 'Baktun '..iMayaActualBaktun..' has ended:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange1..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange2..' [ICON_PEACE] Faith', 'Bonus Yields in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
					end
				end
			end
		end
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

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityTrained.Add(KatunAhaw)
GameEvents.PlayerDoTurn.Add(KatunAhawUpgrade)