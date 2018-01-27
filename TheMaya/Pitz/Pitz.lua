-- Pitz
-- Author: adan_eslavo
-- DateCreated: 16/12/2017
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")

local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent / 100
local fGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent/ 100

local tEligibleCombats = {
	GameInfoTypes.UNITCOMBAT_RECON,
	GameInfoTypes.UNITCOMBAT_ARCHER,
	GameInfoTypes.UNITCOMBAT_MOUNTED,
	GameInfoTypes.UNITCOMBAT_MELEE,
	GameInfoTypes.UNITCOMBAT_SIEGE,
	GameInfoTypes.UNITCOMBAT_GUN,
	GameInfoTypes.UNITCOMBAT_ARMOR
}

function KatunAhaw(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MAYA) then return end
	
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	for i, iUnitCombatType in pairs(tEligibleCombats) do
		if pUnit and pUnit:GetUnitCombatType() == iUnitCombatType then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW, pPlayer:GetCityByID(iCity):IsHasBuilding(GameInfoTypes.BUILDING_MAYA_PITZ))
		end
	end
end

function KatunAhawUpgrade(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MAYA) then return end
	
	local iCounter = math.floor(20 * fGameSpeedModifier3)
	
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
				-- do nothing. Next condition comes naturally with else statement instead of whole list of promotions unit shouldn't have worn on.
			else
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_1, true)
				pUnit:ChangeExperience(5)
			end
		end
	end
end

function OnBaktunBonus(iPlayer, iBaktun, iBaktunPreviousTurn)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MAYA) then return end
	
	if pPlayer:IsUsingMayaCalendar() then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MAYA_PITZ) then
				local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
											
				local iChange1 = math.floor(20 * iEraModifier * fGameSpeedModifier1)
				local iChange2 = math.floor(20 * iEraModifier * fGameSpeedModifier2)
							
				pPlayer:ChangeFaith(iChange2)
				pPlayer:ChangeOverflowResearch(iChange1)
	
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
					Events.AddPopupTextEvent(vCityPosition, "[COLOR_WHITE]+"..iChange2.."[ICON_PEACE][ENDCOLOR]", 1)
					Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iChange1.."[ICON_RESEARCH][ENDCOLOR]", 1.5)
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_INSTANT_YIELD,
						'Baktun '..iBaktun..' has ended:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange1..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCity:GetName()..': [ENDCOLOR]+'..iChange2..' [ICON_PEACE] Faith',
						'Bonus Yields in '..pCity:GetName(),
						pCity:GetX(), pCity:GetY(), pCity:GetID())
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
GameEvents.PlayerEndOfMayaLongCount.Add(OnBaktunBonus)