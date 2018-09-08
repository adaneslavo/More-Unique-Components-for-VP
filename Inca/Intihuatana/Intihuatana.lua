-- Intihuatana
-- Author: pineappledan, adan_eslavo
-- DateCreated: 20/02/2018
----------------------------------------------------------------
local eBuildingIntihuatana = GameInfoTypes.BUILDING_INCA_INTIHUATANA
local eBuildingIntihuatana2 = GameInfoTypes.BUILDING_INCA_INTIHUATANA_2
local ePolicyScientificRevolution = GameInfoTypes.POLICY_SECULARISM
local eCivilizationInca = GameInfoTypes.CIVILIZATION_INCA

-- upgrade Intihuatana after adopting Scientific Revolution policy
function OnPolicyAdoptSubstituteBuilding(iPlayer, iPolicy)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationInca) then return end
	if iPolicy ~= ePolicyScientificRevolution then return end
	
	local iNumberOfIntis = pPlayer:CountNumBuildings(eBuildingIntihuatana)
	local sText, sTitle

	if iNumberOfIntis > 0 then
		local iCurrentInti = 0
	
		for city in pPlayer:Cities() do	
			if city:IsHasBuilding(eBuildingIntihuatana) then
				city:SetNumRealBuilding(eBuildingIntihuatana, 0)
				city:SetNumRealBuilding(eBuildingIntihuatana2, 1)

				iCurrentInti = iCurrentInti + 1

				if iCurrentInti == iNumberOfIntis then
					break
				end
			end
		end

		sText = 'Player has adopted the Scientific Revolution policy. All Intihuatana in the Empire have been upgraded.'
		sTitle = 'Intihuatanas upgraded across the Empire'
	else
		sText = 'Player has adopted the Scientific Revolution policy. There was no Intihuatana in the Empire ready for upgrade.'
		sTitle = 'Scientific Revolution adopted'
	end
	
	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		local pCapital = pPlayer:GetCapitalCity()
		local iX, iY = pCapital:GetX(), pCapital:GetY()
	
		pPlayer:AddNotification(0, sText, sTitle, iX, iY)
	end
end

-- upgrade Intihuatana after construction if Scientific Revolution Policy is adopted
function OnConstructionSubstituteBuilding(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetCivilizationType() ~= eCivilizationInca then return end
	if not pPlayer:HasPolicy(ePolicyScientificRevolution) then return end
	if iBuilding ~= eBuildingIntihuatana then return end
	
	local pCity = pPlayer:GetCityByID(iCity)

	pCity:SetNumRealBuilding(eBuildingIntihuatana, 0)
	pCity:SetNumRealBuilding(eBuildingIntihuatana2, 1)
end

GameEvents.PlayerAdoptPolicy.Add(OnPolicyAdoptSubstituteBuilding)
GameEvents.CityConstructed.Add(OnConstructionSubstituteBuilding)
