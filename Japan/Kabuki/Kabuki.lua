-- Kabuki
-- Author: Pineappledan (based on Pogost)
-- DateCreated: 10/02/2017
--------------------------------------------------------------
local jBuilding1 = GameInfoTypes.BUILDING_VP_KABUKI
local jGuild1 = GameInfoTypes.BUILDING_WRITERS_GUILD
local jGuild2 = GameInfoTypes.BUILDING_ARTISTS_GUILD
local jGuild3 = GameInfoTypes.BUILDING_MUSICIANS_GUILD
local jJapGuild1 = GameInfoTypes.BUILDING_MONOGATARI
local jJapGuild2 = GameInfoTypes.TXT_KEY_BUILDING_UKIYOE
local jJapGuild3 = GameInfoTypes.TXT_KEY_BUILDING_GAGAKU

--Kabuki Construction. All guilds in city upgraded

function KabukiBuild(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)

	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_JAPAN then

		if iBuilding == jBuilding1 then
			local pTeam = Teams[pPlayer:GetTeam()]

			if pCity:IsHasBuilding(jGuild1) then
				pCity:SetNumRealBuilding(jGuild1, 0)
				pCity:SetNumRealBuilding(jJapGuild1, 1)
			end

			if pCity:IsHasBuilding(jGuild2) then
				pCity:SetNumRealBuilding(jGuild2, 0)
				pCity:SetNumRealBuilding(jJapGuild2, 1)
			end

			if pCity:IsHasBuilding(jGuild3) then
				pCity:SetNumRealBuilding(jGuild3, 0)
				pCity:SetNumRealBuilding(jJapGuild3, 1)
			end

			NotificationLoad(0, pPlayer, pCity)
		end
	end
end

--Guild Construction. If a kabuki is in the city it is upgraded immediately

function GuildBuild(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)

	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_JAPAN then

		if iBuilding == jGuild1 then
			local pTeam = Teams[pPlayer:GetTeam()]

			if pCity:IsHasBuilding(jBuilding1) then
				pCity:SetNumRealBuilding(jGuild1, 0)
				pCity:SetNumRealBuilding(jJapGuild1, 1)

				NotificationLoad(1, pPlayer, pCity)
			end
		end

		if iBuilding == jGuild2 then
			local pTeam = Teams[pPlayer:GetTeam()]

			if pCity:IsHasBuilding(jBuilding1) then
				pCity:SetNumRealBuilding(jGuild2, 0)
				pCity:SetNumRealBuilding(jJapGuild2, 1)

				NotificationLoad(2, pPlayer, pCity)
			end
		end

		if iBuilding == jGuild3 then
			local pTeam = Teams[pPlayer:GetTeam()]

			if pCity:IsHasBuilding(jBuilding1) then
				pCity:SetNumRealBuilding(jGuild3, 0)
				pCity:SetNumRealBuilding(jJapGuild3, 1)

				NotificationLoad(3, pPlayer, pCity)
			end
		end
	end
end

function NotificationLoad(iSet, pPlayer, pCity)
	if iSet == 0 then
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(0, 
			'Player constructed Kabuki Theater in [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR], revitalizing lost art forms. All guilds in the city have been upgraded.', 
			'Guilds upgraded in '..pCity:GetName(), 
			pCity:GetX(), pCity:GetY())
		end
	elseif iSet == 1 then
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(0, 
			'Player constructed a Writer''s guild building in [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] and received a free upgrade to Monogatari Guild.', 
			'Guild upgraded in '..pCity:GetName(), 
			pCity:GetX(), pCity:GetY())
		end
	elseif iSet == 2 then
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(0, 
			'Player constructed a Artist''s guild building in [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] and received a free upgrade to Ukiyo-e Guild.', 
			'Guild upgraded in '..pCity:GetName(), 
			pCity:GetX(), pCity:GetY())
		end
	else
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			pPlayer:AddNotification(0, 
			'Player constructed a Musician''s guild building in [COLOR_CYAN]'..pCity:GetName()..'[ENDCOLOR] and received a free upgrade to Gagaku Guild.', 
			'Guild upgraded in '..pCity:GetName(), 
			pCity:GetX(), pCity:GetY())
		end
	end
end

GameEvents.CityConstructed.Add(KabukiBuild)
GameEvents.CityConstructed.Add(GuildBuild)
