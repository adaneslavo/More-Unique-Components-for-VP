-- Sachem's Council
-- Author: adan_eslavo
-- DateCreated: 22/10/2017
--------------------------------------------------------------
function DefensivePactOrWar(iPlayer)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetName() == "Hiawatha" then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_IROQUOIS_SACHEMS_COUNCIL) then
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
			
				pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYHAPPINESS, iHappiness)
				break
			end
		end
	end
end

function GiveDiplomaticReciprocityPromotion(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetName() == "Hiawatha" then
		local pUnit = pPlayer:GetUnitByID(iUnit)

		if iUnitType == GameInfoTypes.UNIT_GREAT_DIPLOMAT then
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(GameInfoTypes.BUILDING_IROQUOIS_SACHEMS_COUNCIL) then
					pCity:ChangeWeLoveTheKingDayCounter(5)
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_IROQUOIS_DIPLOMATIC_RECIPROCITY, true)
					break
				end
			end
		end
	end
end

function DiplomaticReciprocityEmbassy(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetName() == "Hiawatha" then
		if iUnitType == GameInfoTypes.UNIT_GREAT_DIPLOMAT then
			local pUnit = pPlayer:GetUnitByID(iUnit)

			if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_IROQUOIS_DIPLOMATIC_RECIPROCITY) then
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

					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYFOOD, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYFOOD) + iFood)
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYPRODUCTION, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYPRODUCTION) + iProduction)
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGOLD, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGOLD) + iGold)
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYSCIENCE, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYSCIENCE) + iScience)
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCULTURE, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCULTURE) + iCulture)
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYFAITH, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYFAITH) + iFaith)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						pPlayer:AddNotification(0, 'Your unit performed [ICON_INFLUENCE] Diplomatic Mission. City of '..pCapital:GetName()..' gained additional permanent yields:[NEWLINE][ICON_BULLET]+'..iFood..' [ICON_FOOD] Food[NEWLINE][ICON_BULLET]+'..iProduction..' [ICON_PRODUCTION] Production[NEWLINE][ICON_BULLET]+'..iGold..' [ICON_GOLD] Gold[NEWLINE][ICON_BULLET]+'..iScience..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET]+'..iCulture..' [ICON_CULTURE] Culture[NEWLINE][ICON_BULLET]+'..iFaith..' [ICON_PEACE] Faith', 'Yields added in '..pCapital:GetName()..'!', pPlot:GetX(), pPlot:GetY())
					end
				else
					iFood = pPlot:GetYield(0) / 2
					iProduction = pPlot:GetYield(1) / 2
					iGold = pPlot:GetYield(2) / 2
					iScience = pPlot:GetYield(3) / 2
					iCulture = pPlot:GetYield(4) / 2
					iFaith = pPlot:GetYield(5) / 2
					
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYFOOD, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYFOOD) + iFood)
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYPRODUCTION, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYPRODUCTION) + iProduction)
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGOLD, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGOLD) + iGold)
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYSCIENCE, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYSCIENCE) + iScience)
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCULTURE, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCULTURE) + iCulture)
					pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYFAITH, pCapital:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYFAITH) + iFaith)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						pPlayer:AddNotification(0, 'Your unit Unit performed [ICON_INFLUENCE] Diplomatic Mission. City of '..pCapital:GetName()..' gained additional permanent yields:[NEWLINE][ICON_BULLET]+'..iFood..' [ICON_FOOD] Food[NEWLINE][ICON_BULLET]+'..iProduction..' [ICON_PRODUCTION] Production[NEWLINE][ICON_BULLET]+'..iGold..' [ICON_GOLD] Gold[NEWLINE][ICON_BULLET]+'..iScience..' [ICON_RESEARCH] Science[NEWLINE][ICON_BULLET]+'..iCulture..' [ICON_CULTURE] Culture[NEWLINE][ICON_BULLET]+'..iFaith..' [ICON_PEACE] Faith', 'Yields added in '..pCapital:GetName()..'!', pPlot:GetX(), pPlot:GetY())
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DefensivePactOrWar)
GameEvents.UnitCreated.Add(GiveDiplomaticReciprocityPromotion)
GameEvents.GreatPersonExpended.Add(DiplomaticReciprocityEmbassy)