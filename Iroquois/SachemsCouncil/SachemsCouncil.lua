-- Sachem's Council
-- Author: adan_eslavo
-- DateCreated: 22/10/2017
--------------------------------------------------------------
local eCivilizationIroquois = GameInfoTypes.CIVILIZATION_IROQUOIS
local eBuildingSachemsCouncil = GameInfoTypes.BUILDING_IROQUOIS_SACHEMS_COUNCIL
local eUnitGreatDiplomat = GameInfoTypes.UNIT_GREAT_DIPLOMAT
local ePromotionDiplomaticReciprocity = GameInfoTypes.PROMOTION_UNIT_IROQUOIS_DIPLOMATIC_RECIPROCITY
local eBuildingDummyForSachem1 = GameInfoTypes.BUILDING_D_FOR_SACHEM_1
local eBuildingDummyForSachem2 = GameInfoTypes.BUILDING_D_FOR_SACHEM_2
local eBuildingDummyForSachem3 = GameInfoTypes.BUILDING_D_FOR_SACHEM_3
local eBuildingDummyForSachem4 = GameInfoTypes.BUILDING_D_FOR_SACHEM_4
local eBuildingDummyForSachem5 = GameInfoTypes.BUILDING_D_FOR_SACHEM_5
local eBuildingDummyForSachem6 = GameInfoTypes.BUILDING_D_FOR_SACHEM_6
local eBuildingDummyForSachem7 = GameInfoTypes.BUILDING_D_FOR_SACHEM_7

-- increase global happiness for each war or defensive pact
function OnTurnAddHappinessFromDefOrWar(iPlayer)
	local pPlayer = Players[iPlayer]

	if pPlayer and pPlayer:GetCivilizationType() == eCivilizationIroquois then
		local iNumberOfSachems = pPlayer:CountNumBuildings(eBuildingSachemsCouncil)
		
		if iNumberOfSachems > 0 then
			local pTeam = Teams[Players[iPlayer]:GetTeam()]
			local iHappiness = 0

			for id, team in pairs(Teams) do
				if (team:IsEverAlive() and id ~= iPlayer and team:GetName() ~= "" and not Players[id]:IsMinorCiv()) then
					if pTeam:IsDefensivePact(id) or pTeam:IsAtWar(id) then
						iHappiness = iHappiness + 1
					end
				end
			end

			local pCapital = pPlayer:GetCapitalCity()
			
			pCapital:SetNumRealBuilding(eBuildingDummyForSachem7, iHappiness)
		end
	end
end

-- add Diplomatic Reciprocity on creation of GD
--[[function OnCreateGiveReciprocity(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationIroquois) then return end

	if iUnitType == eUnitGreatDiplomat then
		local iNumberOfSachems = pPlayer:CountNumBuildings(eBuildingSachemsCouncil)

		if iNumberOfSachems > 0 then
			local pUnit = pPlayer:GetUnitByID(iUnit)

			pUnit:SetHasPromotion(ePromotionDiplomaticReciprocity, true)
		end
	end
end
]]--

-- add yields if GD creates an Embassy
function OnEmbassyAddYields(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationIroquois) then return end
	if iUnitType ~= eUnitGreatDiplomat then return end

	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(ePromotionDiplomaticReciprocity) then
		local pPlot = Map.GetPlot(iX, iY)
		local pMinor = Players[pPlot:GetOwner()]
		local pCapital = pPlayer:GetCapitalCity()
		
		local function YieldCalculation(pPlot, pPlayer, pCapital, iDivisor)
			local iFood = pPlot:GetYield(0) / iDivisor
			local iProduction = pPlot:GetYield(1) / iDivisor
			local iGold = pPlot:GetYield(2) / iDivisor
			local iScience = pPlot:GetYield(3) / iDivisor
			local iCulture = pPlot:GetYield(4) / iDivisor
			local iFaith = pPlot:GetYield(5) / iDivisor

			pCapital:SetNumRealBuilding(eBuildingDummyForSachem1, pCapital:GetNumRealBuilding(eBuildingDummyForSachem1) + iFood)
			pCapital:SetNumRealBuilding(eBuildingDummyForSachem2, pCapital:GetNumRealBuilding(eBuildingDummyForSachem2) + iProduction)
			pCapital:SetNumRealBuilding(eBuildingDummyForSachem3, pCapital:GetNumRealBuilding(eBuildingDummyForSachem3) + iGold)
			pCapital:SetNumRealBuilding(eBuildingDummyForSachem4, pCapital:GetNumRealBuilding(eBuildingDummyForSachem4) + iScience)
			pCapital:SetNumRealBuilding(eBuildingDummyForSachem5, pCapital:GetNumRealBuilding(eBuildingDummyForSachem5) + iCulture)
			pCapital:SetNumRealBuilding(eBuildingDummyForSachem6, pCapital:GetNumRealBuilding(eBuildingDummyForSachem6) + iFaith)

			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local sName = pCapital:GetName()
				
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_INSTANT_YIELD, 
					'[ICON_INFLUENCE] Diplomatic Mission performed by Great Diplomat. The City of '..sName..' gained additional permanent yields:[NEWLINE][ICON_BULLET]+'..iFood..' [ICON_FOOD] Food[NEWLINE][ICON_BULLET]+'..iProduction..' [ICON_PRODUCTION] Production[NEWLINE][ICON_BULLET]+'..iGold..' [ICON_GOLD] Gold[NEWLINE][ICON_BULLET]+'..iScience..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET]+'..iCulture..' [ICON_CULTURE] Culture[NEWLINE][ICON_BULLET]+'..iFaith..' [ICON_PEACE] Faith',
					'Yields added in '..sName, 
					pPlot:GetX(), pPlot:GetY(), pCapital:GetID())
			end
		end
				
		if pMinor:IsAllies(iPlayer) then
			YieldCalculation(pPlot, pPlayer, pCapital, 1)
		else
			YieldCalculation(pPlot, pPlayer, pCapital, 2)
		end
	end
end

if Game.IsCivEverActive(eCivilizationIroquois) then
	GameEvents.PlayerDoTurn.Add(OnTurnAddHappinessFromDefOrWar)
--	GameEvents.UnitCreated.Add(OnCreateGiveReciprocity)
	GameEvents.GreatPersonExpended.Add(OnEmbassyAddYields)
end

