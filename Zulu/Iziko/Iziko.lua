-- Iziko
-- Author: pineappledan
--------------------------------------------------------------

function IzikoCulture(iPlayer, iUnit, iPromotionType)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local eBuildingIziko = GameInfoTypes.BUILDING_IZIKO
	
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(eBuildingIziko) then
			pPlayer:ChangeJONSCulture((GetLevel(pUnit)-1)*GetCurrentEra())
		end
	end
end

GameEvents.UnitPromoted.Add(IzikoCulture)
