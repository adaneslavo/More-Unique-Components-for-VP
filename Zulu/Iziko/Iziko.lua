-- Iziko
-- Author: pineappledan
-- 2018-02-26 updated by Infixo
--------------------------------------------------------------

function IzikoCulture(iPlayer, iUnit, iPromotionType)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local eBuildingIziko = GameInfoTypes.BUILDING_IZIKO
	local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
	
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(eBuildingIziko) then
			pPlayer:ChangeJONSCulture( math.max(pUnit:GetLevel()-1, 0) * iEraModifier )
		end
	end
end

GameEvents.UnitPromoted.Add(IzikoCulture)
