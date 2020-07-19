-- Iron Chariot
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
-- 2018-01-27 updated by Infixo
--------------------------------------------------------------
function IronChariotResourceCheck(iPlayer)
	local pPlayer = Players[iPlayer]
	local tIronChariots = {}
	
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitType() == GameInfoTypes.UNIT_ASSYRIA_IRON_CHARIOT then
			table.insert(tIronChariots, pUnit)
		end
	end
	
	if #tIronChariots <= 0 then return end

	local iResourceBonuses = 0
	
	if (pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_HORSE, 1) >= #tIronChariots) then
		iResourceBonuses = iResourceBonuses + 1
	end

	if (pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_IRON, 1) >= #tIronChariots) then
		iResourceBonuses = iResourceBonuses + 1
	end

	for i, pIronChariot in pairs(tIronChariots) do
		if iResourceBonuses == 0 then
			pIronChariot:SetBaseCombatStrength(12)
		elseif iResourceBonuses == 1 then
			pIronChariot:SetBaseCombatStrength(14)
		else
			pIronChariot:SetBaseCombatStrength(16)
		end
	end
end

GameEvents.PlayerDoTurn.Add(IronChariotResourceCheck)
