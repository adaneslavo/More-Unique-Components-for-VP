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
local eBuildingDummyForSachem7 = GameInfoTypes.BUILDING_D_FOR_TOWER --same as for White Tower

function DefensivePactOrWar(iPlayer)
	local pPlayer = Players[iPlayer]

	if pPlayer and pPlayer:GetCivilizationType() == eCivilizationIroquois then
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingSachemsCouncil) then
				local pTeam = Teams[Players[iPlayer]:GetTeam()]
				local iHappiness = 0

				for id, team in pairs(Teams) do
					if (team:IsEverAlive() and id < 43 and id ~= iPlayer and team:GetName() ~= "") then
						if pTeam:IsDefensivePact(id) then
							iHappiness = iHappiness + 1
						end
					end
				end

				for id, team in pairs(Teams) do
					if (team:IsEverAlive() and id < 43 and id ~= iPlayer and team:GetName() ~= "") then
						if pTeam:IsAtWar(id) then
							iHappiness = iHappiness + 1
						end
					end
				end
			
				local pCapital = pPlayer:GetCapitalCity()
			
				pCapital:SetNumRealBuilding(eBuildingDummyForSachem7, iHappiness)
				break
			end
		end
	end
end

function GiveDiplomaticReciprocityPromotion(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]

	if pPlayer and pPlayer:GetCivilizationType() == eCivilizationIroquois then
		local pUnit = pPlayer:GetUnitByID(iUnit)

		if iUnitType == eUnitGreatDiplomat then
			for city in pPlayer:Cities() do
				if city:IsHasBuilding(eBuildingSachemsCouncil) then
					city:ChangeWeLoveTheKingDayCounter(5)
					pUnit:SetHasPromotion(ePromotionDiplomaticReciprocity, true)
					break
				end
			end
		end
	end
end

function DiplomaticReciprocityEmbassy(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]

	if pPlayer and pPlayer:GetCivilizationType() == eCivilizationIroquois then
		if iUnitType == eUnitGreatDiplomat then
			local pUnit = pPlayer:GetUnitByID(iUnit)

			if pUnit:IsHasPromotion(ePromotionDiplomaticReciprocity) then
				local pPlot = Map.GetPlot(iX, iY)
				local pMinor = Players[pPlot:GetOwner()]
				local pCapital = pPlayer:GetCapitalCity()
				
				local iFood = 0
				local iProduction = 0
				local iGold = 0
				local iScience = 0
				local iCulture = 0
				local iFaith = 0
				
				if pMinor:IsAllies(iPlayer) then
					iFood = pPlot:GetYield(0)
					iProduction = pPlot:GetYield(1)
					iGold = pPlot:GetYield(2)
					iScience = pPlot:GetYield(3)
					iCulture = pPlot:GetYield(4)
					iFaith = pPlot:GetYield(5)

					pCapital:SetNumRealBuilding(eBuildingDummyForSachem1, pCapital:GetNumRealBuilding(eBuildingDummyForSachem1) + iFood)
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem2, pCapital:GetNumRealBuilding(eBuildingDummyForSachem2) + iProduction)
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem3, pCapital:GetNumRealBuilding(eBuildingDummyForSachem3) + iGold)
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem4, pCapital:GetNumRealBuilding(eBuildingDummyForSachem4) + iScience)
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem5, pCapital:GetNumRealBuilding(eBuildingDummyForSachem5) + iCulture)
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem6, pCapital:GetNumRealBuilding(eBuildingDummyForSachem6) + iFaith)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						pPlayer:AddNotification(0, '[ICON_INFLUENCE] Diplomatic Mission performed by Great Diplomat. The City of '..pCapital:GetName()..' gained additional permanent yields:[NEWLINE][ICON_BULLET]+'..iFood..' [ICON_FOOD] Food[NEWLINE][ICON_BULLET]+'..iProduction..' [ICON_PRODUCTION] Production[NEWLINE][ICON_BULLET]+'..iGold..' [ICON_GOLD] Gold[NEWLINE][ICON_BULLET]+'..iScience..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET]+'..iCulture..' [ICON_CULTURE] Culture[NEWLINE][ICON_BULLET]+'..iFaith..' [ICON_PEACE] Faith', 'Yields added in '..pCapital:GetName(), pPlot:GetX(), pPlot:GetY())
					end
				else
					iFood = pPlot:GetYield(0) / 2
					iProduction = pPlot:GetYield(1) / 2
					iGold = pPlot:GetYield(2) / 2
					iScience = pPlot:GetYield(3) / 2
					iCulture = pPlot:GetYield(4) / 2
					iFaith = pPlot:GetYield(5) / 2
					
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem1, pCapital:GetNumRealBuilding(eBuildingDummyForSachem1) + iFood)
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem2, pCapital:GetNumRealBuilding(eBuildingDummyForSachem2) + iProduction)
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem3, pCapital:GetNumRealBuilding(eBuildingDummyForSachem3) + iGold)
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem4, pCapital:GetNumRealBuilding(eBuildingDummyForSachem4) + iScience)
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem5, pCapital:GetNumRealBuilding(eBuildingDummyForSachem5) + iCulture)
					pCapital:SetNumRealBuilding(eBuildingDummyForSachem6, pCapital:GetNumRealBuilding(eBuildingDummyForSachem6) + iFaith)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						pPlayer:AddNotification(0, '[ICON_INFLUENCE] Diplomatic Mission performed by Great Diplomat. The City of '..pCapital:GetName()..' gained additional permanent yields:[NEWLINE][ICON_BULLET]+'..iFood..' [ICON_FOOD] Food[NEWLINE][ICON_BULLET]+'..iProduction..' [ICON_PRODUCTION] Production[NEWLINE][ICON_BULLET]+'..iGold..' [ICON_GOLD] Gold[NEWLINE][ICON_BULLET]+'..iScience..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET]+'..iCulture..' [ICON_CULTURE] Culture[NEWLINE][ICON_BULLET]+'..iFaith..' [ICON_PEACE] Faith', 'Yields added in '..pCapital:GetName(), pPlot:GetX(), pPlot:GetY())
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DefensivePactOrWar)
GameEvents.UnitCreated.Add(GiveDiplomaticReciprocityPromotion)
GameEvents.GreatPersonExpended.Add(DiplomaticReciprocityEmbassy)