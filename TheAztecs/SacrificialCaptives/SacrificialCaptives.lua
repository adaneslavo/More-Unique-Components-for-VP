-- Sacrificial Captives
-- Author: adan_eslavo
-- DateCreated: 21/12/2017
--------------------------------------------------------------
function AztecHumanSacrificeOnTraining(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	
	if pPlayer:GetName() == "Montezuma" then
		local pUnit = pPlayer:GetUnitByID(unitID)

		if pUnit:GetUnitCombatType() ~= nil then	
			pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE"], true)
		end
	end
end

function AztecHumanSacrificeOnCreation(playerID, unitID, iUnitType, iX, iY)
	local pPlayer = Players[playerID]
	
	if pPlayer:GetName() == "Montezuma" then
		local pUnit = pPlayer:GetUnitByID(unitID)

		if pUnit:GetUnitCombatType() ~= nil then	
			pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE"], true)
		end
	end
end

function AztecStartingHumanSacrifice(iPlayer)
	if Game.GetElapsedGameTurns() == 1 then
		local pPlayer = Players[iPlayer]

		if pPlayer:GetName() == "Montezuma" then
			for pUnit in pPlayer:Units() do
				if pUnit:GetUnitCombatType() ~= nil then	
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE"], true)
				end
			end
		end
	end
end

GameEvents.CityTrained.Add(AztecHumanSacrificeOnTraining)
GameEvents.UnitCreated.Add(AztecHumanSacrificeOnCreation)
GameEvents.PlayerDoTurn.Add(AztecStartingHumanSacrifice)