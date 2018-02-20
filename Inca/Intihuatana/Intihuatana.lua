--------------------------------------------------------------------------------------------------------------------------
-- INTIHUATANA
--------------------------------------------------------------------------------------------------------------------------
--Upgrade all existing Intihuatana on adoption of Scientific Revolution Policy
local eBuildingInti = GameInfoTypes.BUILDING_4UC_INTIHUATANA
local eBuildingInti2 = GameInfoTypes.BUILDING_4UC_INTIHUATANA_2
local ePolicySciRev = GameInfoTypes.POLICY_SECULARISM

-- upgrade all guilds on Kabuki construction
function IntiOnAdoption(iPlayer, iPolicy)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_INCA then return end
	if iPolicy ~= ePolicySciRev then return end
			
	local pCity = pPlayer:GetCityByID(iCity)
		
	if pCity:IsHasBuilding(eBuildingInti) then
		pCity:SetNumRealBuilding(eBuildingInti, 0)
		pCity:SetNumRealBuilding(eBuildingInti2, 1)
	end

	NotificationLoad(0, pPlayer, pCity)
end

-- upgrade constructed Intihuatana if Scientific Revolution Policy is adopted
function IntiOnBuild(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_INCA then return end
	
	if not iPlayer:HasPolicy(ePolicySciRev) then return end

	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding == eBuildingInti then
		pCity:SetNumRealBuilding(eBuildingInti, 0)
		pCity:SetNumRealBuilding(eBuildingInti2, 1)
	end
end

function NotificationLoad(iSet, pPlayer, pCity)
	if not (pPlayer:IsHuman() and pPlayer:IsTurnActive()) then return end
	
	local sCityName = pCity:GetName()
	local sTitle, sText

	if iSet == 0 then
		sTitle = 'Intihuatana upgraded across the Empire'
    sText = 'Player has adopted the Scientific Revolution policy. All Intihuatana in the Empire have been upgraded.'
  end

  pPlayer:AddNotification(0, sText, sTitle, pCity:GetX(), pCity:GetY())
end

GameEvents.PlayerAdoptPolicy.Add(IntiOnAdoption)
GameEvents.CityConstructed.Add(IntiOnBuild)
