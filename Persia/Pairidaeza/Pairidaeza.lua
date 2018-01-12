-- Pairidaeza
-- Author: adan_eslavo
-- DateCreated: 19/12/2017
--------------------------------------------------------------
function PairidaezaGoldenAgeStartBonus(iPlayer, bStart, iTurns)
	local pPlayer = Players[iPlayer]
	
	if bStart then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_PERSIA_PAIRIDAEZA) then
				local iPairidaezaEraPlusOne = 3

				pPlayer:ChangeJONSCulture(30 * ((pPlayer:GetCurrentEra() + 1) / iPairidaezaEraPlusOne))
			end
		end
	end
end

GameEvents.PlayerGoldenAge.Add(PairidaezaGoldenAgeStartBonus)