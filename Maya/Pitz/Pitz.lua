-- Pitz
-- Author: adan_eslavo
-- DateCreated: 16/12/2017
-- 2018-01-25 updated by Infixo
--------------------------------------------------------------
include("FLuaVector.lua")

local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].FaithPercent / 100
local fGameSpeedModifier3 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent/ 100
local eCivilizationMaya = GameInfoTypes.CIVILIZATION_MAYA
local ePromotionKhatun = GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW
local ePromotionKhatun1 = GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_1
local ePromotionKhatun2 = GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_2
local ePromotionKhatun3 = GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_3
local ePromotionKhatun4 = GameInfoTypes.PROMOTION_UNIT_MAYA_KATUN_AHAW_4
local eBuildingPitz = GameInfoTypes.BUILDING_MAYA_PITZ

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
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationMaya) then return end
	
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	for i, iUnitCombatType in pairs(tEligibleCombats) do
		if pUnit and pUnit:GetUnitCombatType() == iUnitCombatType then
			pUnit:SetHasPromotion(ePromotionKhatun, pPlayer:GetCityByID(iCity):IsHasBuilding(eBuildingPitz))
		end
	end
end

function KatunAhawUpgrade(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationMaya) then return end
	
	local iCounter = math.floor(20 * fGameSpeedModifier3)
	
	if Game.GetElapsedGameTurns() % iCounter ~= 0 then return end

	for unit in pPlayer:Units() do
		if unit:IsHasPromotion(ePromotionKhatun) then
			if unit:IsHasPromotion(ePromotionKhatun1) then
				unit:SetHasPromotion(ePromotionKhatun2, true)
				unit:SetHasPromotion(ePromotionKhatun1, false)
				unit:ChangeExperience(10)
			elseif unit:IsHasPromotion(ePromotionKhatun2) then
				unit:SetHasPromotion(ePromotionKhatun3, true)
				unit:SetHasPromotion(ePromotionKhatun2, false)
				unit:ChangeExperience(10)
			elseif unit:IsHasPromotion(ePromotionKhatun3) then
				unit:SetHasPromotion(ePromotionKhatun4, true)
				unit:SetHasPromotion(ePromotionKhatun3, false)
				unit:ChangeExperience(15)
			elseif unit:IsHasPromotion(ePromotionKhatun4) then
				-- do nothing. Next condition comes naturally with else statement instead of whole list of promotions unit shouldn't have worn on.
			else
				unit:SetHasPromotion(ePromotionKhatun1, true)
				unit:ChangeExperience(5)
			end
		end
	end
end

function OnBaktunBonus(iPlayer, iBaktun, iBaktunPreviousTurn)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationMaya) then return end
	
	if pPlayer:IsUsingMayaCalendar() then
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingPitz) then
				local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
											
				local iChange1 = math.floor(20 * iEraModifier * fGameSpeedModifier1)
				local iChange2 = math.floor(20 * iEraModifier * fGameSpeedModifier2)
							
				pPlayer:ChangeFaith(iChange2)
				pPlayer:ChangeOverflowResearch(iChange1)
	
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vCityPosition = PositionCalculator(city:GetX(), city:GetY())
				
					Events.AddPopupTextEvent(vCityPosition, "[COLOR_WHITE]+"..iChange2.."[ICON_PEACE][ENDCOLOR]", 1)
					Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iChange1.."[ICON_RESEARCH][ENDCOLOR]", 1.5)
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_INSTANT_YIELD,
						'Baktun '..iBaktun..' has ended:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..city:GetName()..': [ENDCOLOR]+'..iChange1..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..city:GetName()..': [ENDCOLOR]+'..iChange2..' [ICON_PEACE] Faith',
						'Bonus Yields in '..city:GetName(),
						city:GetX(), city:GetY(), city:GetID())
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