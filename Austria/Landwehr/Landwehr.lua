-- Landwehr
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------

function GrenzerCombatStrength(iPlayer, iUnit, iPromotionType)
	local pPlayer = Players[iPlayer]
	if not (pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_AUSTRIA) then return end
	
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if (pUnit:GetUnitType() == GameInfoTypes.UNIT_AUSTRIA_LANDWEHR)then
		local iMarriageCount = 0

		for player in pairs(Players) do
			local MinorPlayer = Players[player]
			if (MinorPlayer:IsAlive() and MinorPlayer:IsMinorCiv()) then
				if MinorPlayer:IsMarried() then
					iMarriageCount = (iMarriageCount + 1)
				end
			end
		end
		pUnit:SetBaseCombatStrength(33 + iMarriageCount)	
	end
end

GameEvents.UnitPromoted.Add(GrenzerCombatStrength)

--pPlayer:GetTeam():GetID()
--or eTeam:IsVassal(pPlayer:GetTeam())