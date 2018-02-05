-- Sacrificial Captives
-- Author: adan_eslavo
-- DateCreated: 21/12/2017
--------------------------------------------------------------
local eCivilizationAztec = GameInfoTypes.CIVILIZATION_AZTEC
local ePromotionHumanSacrifice = GameInfoTypes.PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE

-- add Human Sacrifice (dummy) promotion to newly trained or created units
function OnUnitCreateAddHumanSacrificePromotion(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetCivilizationType() ~= eCivilizationAztec then return end

	local pUnit = pPlayer:GetUnitByID(iUnit)

	pUnit:SetHasPromotion(ePromotionHumanSacrifice, pUnit:GetUnitCombatType() >= 0)
end

-- add Human Sacrifice to first Pathfinder of the game at the end of first turn
function OnFirstTurnEndAddHumanSacrificePromotion(iPlayer)
	if Game.GetElapsedGameTurns() ~= 0 then return end

	local pPlayer = Players[iPlayer]

	if pPlayer:GetCivilizationType() ~= eCivilizationAztec then return end

	for unit in pPlayer:Units() do
		if unit:GetUnitCombatType() ~= nil then
			unit:SetHasPromotion(ePromotionHumanSacrifice, unit:GetUnitCombatType() >= 0)
		end
	end
end

GameEvents.UnitCreated.Add(OnUnitCreateAddHumanSacrificePromotion)
GameEvents.PlayerEndTurnCompleted.Add(OnFirstTurnEndAddHumanSacrificePromotion)