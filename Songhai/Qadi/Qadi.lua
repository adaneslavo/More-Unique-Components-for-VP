-- Qadi
-- Author: pineappledan
-- DateCreated: 25/01/2018
-- 2018-02-04 Modified by Infixo
--------------------------------------------------------------
function OnPlayerDoTurnQadi(iPlayer)
	local pPlayer = Players[iPlayer]

	if pPlayer and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SONGHAI then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_SONGHAI_QADI_COURT) then
				-- culture
				local iCultureChange = math.floor( 0.1 * pCity:GetBaseYieldRate(YieldTypes.YIELD_PRODUCTION) )
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCULTURE, iCultureChange)
				-- gold for non-followers
				if pPlayer:GetMajorityReligion() ~= -1 then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYCOURTHOUSEGOLD, pCity:GetPopulation() - pCity:GetNumFollowers(pPlayer:GetMajorityReligion()))
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(OnPlayerDoTurnQadi)
