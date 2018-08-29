-- Kabuki
-- Author: Pineappledan, adan_eslavo
-- DateCreated: 10/02/2017
--------------------------------------------------------------
local eBuildingKabuki = GameInfoTypes.BUILDING_JAPAN_KABUKI
local eBuildingWritersGuild = GameInfoTypes.BUILDING_WRITERS_GUILD
local eBuildingArtistsGuild = GameInfoTypes.BUILDING_ARTISTS_GUILD
local eBuildingMusiciansGuild = GameInfoTypes.BUILDING_MUSICIANS_GUILD
local eBuildingMonogatari = GameInfoTypes.BUILDING_JAPAN_MONOGATARI
local eBuildingUkiyoe = GameInfoTypes.BUILDING_JAPAN_UKIYOE
local eBuildingGagaku = GameInfoTypes.BUILDING_JAPAN_GAGAKU
local eCivilizationJapan = GameInfoTypes.CIVILIZATION_JAPAN

-- upgrade all guilds on Kabuki construction
function OnConstructionUpgradeGuilds(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationJapan) then return end
	if iBuilding ~= eBuildingKabuki then return end
			
	local pCity = pPlayer:GetCityByID(iCity)
		
	if pCity:IsHasBuilding(eBuildingWritersGuild) then
		pCity:SetNumRealBuilding(eBuildingWritersGuild, 0)
		pCity:SetNumRealBuilding(eBuildingMonogatari, 1)
	end

	if pCity:IsHasBuilding(eBuildingArtistsGuild) then
		pCity:SetNumRealBuilding(eBuildingArtistsGuild, 0)
		pCity:SetNumRealBuilding(eBuildingUkiyoe, 1)
	end

	if pCity:IsHasBuilding(eBuildingMusiciansGuild) then
		pCity:SetNumRealBuilding(eBuildingMusiciansGuild, 0)
		pCity:SetNumRealBuilding(eBuildingGagaku, 1)
	end

	NotificationLoad(0, pPlayer, pCity)
end

-- upgrade guild on its construction
function OnConstructionUpgradeThatGuild(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_JAPAN then return end
	
	local pCity = pPlayer:GetCityByID(iCity)
	
	if not pCity:IsHasBuilding(eBuildingKabuki) then return end
		
	if iBuilding == eBuildingWritersGuild then
		pCity:SetNumRealBuilding(eBuildingWritersGuild, 0)
		pCity:SetNumRealBuilding(eBuildingMonogatari, 1)

		NotificationLoad(1, pPlayer, pCity)
	end

	if iBuilding == eBuildingArtistsGuild then
		pCity:SetNumRealBuilding(eBuildingArtistsGuild, 0)
		pCity:SetNumRealBuilding(eBuildingUkiyoe, 1)

		NotificationLoad(2, pPlayer, pCity)
	end

	if iBuilding == eBuildingMusiciansGuild then
		pCity:SetNumRealBuilding(eBuildingMusiciansGuild, 0)
		pCity:SetNumRealBuilding(eBuildingGagaku, 1)

		NotificationLoad(3, pPlayer, pCity)
	end
end

function NotificationLoad(iSet, pPlayer, pCity)
	if not (pPlayer:IsHuman() and pPlayer:IsTurnActive()) then return end
	
	local sCityName = pCity:GetName()
	local sTitle, sText

	if iSet == 0 then
		sTitle = 'Guilds upgraded in '..sCityName
		sText = 'Player constructed Kabuki Theater in [COLOR_CYAN]'..sCityName..'[ENDCOLOR], revitalizing lost art forms. All guilds in the city have been upgraded.'
	elseif iSet == 1 then
		sTitle = 'Writers\' Guild upgraded in '..sCityName
		sText = 'Player constructed a Writers\' Guild building in [COLOR_CYAN]'..sCityName..'[ENDCOLOR] and received a free upgrade to Monogatari Guild.'
	elseif iSet == 2 then
		sTitle = 'Artists\' Guild upgraded in '..sCityName
		sText = 'Player constructed a Artists\' Guild building in [COLOR_CYAN]'..sCityName..'[ENDCOLOR] and received a free upgrade to Ukiyo-e Guild.'
	else
		sTitle = 'Musicians\' Guild upgraded in '..sCityName
		sText = 'Player constructed a Musicians\' Guild building in [COLOR_CYAN]'..sCityName..'[ENDCOLOR] and received a free upgrade to Gagaku Guild.'
	end

	pPlayer:AddNotification(0, sText, sTitle, pCity:GetX(), pCity:GetY())
end

GameEvents.CityConstructed.Add(OnConstructionUpgradeGuilds)
GameEvents.CityConstructed.Add(OnConstructionUpgradeThatGuild)
