-- Kabuki
-- Author: Pineappledan, adan_eslavo
-- DateCreated: 10/02/2017
--------------------------------------------------------------
include("FLuaVector.lua")

local eBuildingKabuki = GameInfoTypes.BUILDING_JAPAN_KABUKI
local eBuildingWritersGuild = GameInfoTypes.BUILDING_WRITERS_GUILD
local eBuildingArtistsGuild = GameInfoTypes.BUILDING_ARTISTS_GUILD
local eBuildingMusiciansGuild = GameInfoTypes.BUILDING_MUSICIANS_GUILD
local eBuildingMonogatari = GameInfoTypes.BUILDING_JAPAN_MONOGATARI
local eBuildingUkiyoe = GameInfoTypes.BUILDING_JAPAN_UKIYOE
local eBuildingGagaku = GameInfoTypes.BUILDING_JAPAN_GAGAKU
local eCivilizationJapan = GameInfoTypes.CIVILIZATION_JAPAN
local ePopDummy = GameInfoTypes.BUILDING_D_FOR_OPPIDUM

-- upgrade all guilds on Kabuki construction
function OnConstructionUpgradeGuilds(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationJapan) then return end
	if iBuilding ~= eBuildingKabuki then return end
			
	local pCity = pPlayer:GetCityByID(iCity)
	pCity:SetNumRealBuilding(ePopDummy, pCity:GetPopulation())
	
	if pCity:IsHasBuilding(eBuildingWritersGuild) then
		pCity:SetPopulation(0, true)
		pCity:SetNumRealBuilding(eBuildingWritersGuild, 0)
		pCity:SetNumRealBuilding(eBuildingMonogatari, 1)
	end

	if pCity:IsHasBuilding(eBuildingArtistsGuild) then
		pCity:SetPopulation(0, true)
		pCity:SetNumRealBuilding(eBuildingArtistsGuild, 0)
		pCity:SetNumRealBuilding(eBuildingUkiyoe, 1)
	end

	if pCity:IsHasBuilding(eBuildingMusiciansGuild) then
		pCity:SetPopulation(0, true)
		pCity:SetNumRealBuilding(eBuildingMusiciansGuild, 0)
		pCity:SetNumRealBuilding(eBuildingGagaku, 1)
	end

	pCity:SetPopulation(pCity:GetNumRealBuilding(ePopDummy), true)
	pCity:SetNumRealBuilding(ePopDummy, 0)
	NotificationLoad(0, pPlayer, pCity)
end
-- upgrade guild on its construction
function OnConstructionUpgradeThatGuild(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationJapan) then return end
	
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

function JapGuildsExpendBonus(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationJapan) then return end

	local pUnit = pPlayer:GetUnitByID(iUnit)
	local pPlot = Map.GetPlot(iX, iY)
	
	if pUnit:GetUnitType() == GameInfoTypes.UNIT_WRITER and (pPlayer:CountNumBuildings(eBuildingMonogatari) > 0) then 
		local iWriterBonus = math.floor(pUnit:GetGivePoliciesCulture()*0.03*pPlayer:CountNumBuildings(eBuildingMonogatari))
		pPlayer:ChangeGold(iWriterBonus)
		pPlayer:ChangeJONSCulture(iWriterBonus)
		
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vUnitPosition = PositionCalculator(iX, iY)

			Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+"..iWriterBonus.."[ICON_CULTURE][ENDCOLOR]", 1)
			Events.AddPopupTextEvent(vUnitPosition, "[COLOR_YIELD_GOLD]+"..iWriterBonus.."[ICON_GOLD][ENDCOLOR]", 1.5)

			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC,
				'A Great Writer has emerged. The Monogatari guilds celebrate.',
				'Yields from Monogatari Guilds',
				iX, iY)
		end
	
	elseif pUnit:GetUnitType() == GameInfoTypes.UNIT_ARTIST and (pPlayer:CountNumBuildings(eBuildingUkiyoe) > 0) then 
		local iArtistBonus = math.floor(pUnit:GetGAPAmount()*0.03*pPlayer:CountNumBuildings(eBuildingUkiyoe))
		pPlayer:ChangeOverflowResearch(iArtistBonus)
		pPlayer:ChangeGoldenAgeProgressMeter(iArtistBonus)

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vUnitPosition = PositionCalculator(iX, iY)

			Events.AddPopupTextEvent(vUnitPosition, "[COLOR_WHITE]+"..iArtistBonus.."[ICON_GOLDEN_AGE][ENDCOLOR]", 1)
			Events.AddPopupTextEvent(vUnitPosition, "[COLOR_BLUE]+"..iArtistBonus.."[ICON_RESEARCH][ENDCOLOR]", 1.5)

			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC,
				'A Great Artist has emerged. The Ukiyo-e guilds celebrate.',
				'Yields from Ukiyo-e Guilds',
				iX, iY)
		end

	elseif pUnit:GetUnitType() == GameInfoTypes.UNIT_MUSICIAN and (pPlayer:CountNumBuildings(eBuildingGagaku) > 0) then 
		local iMusicianBonus = math.floor(pUnit:GetBlastTourism()*0.03*pPlayer:CountNumBuildings(eBuildingGagaku))
		local iTourismEvent = GameInfoTypes['PLAYER_EVENT_CHOICE_GAGAKU_TOURISM']
		pPlayer:ChangeFaith(iMusicianBonus)
		pPlayer:DoEventChoice(iTourismEvent)
		pPlayer:DoCancelEventChoice(iTourismEvent)

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vUnitPosition = PositionCalculator(iX, iY)

			Events.AddPopupTextEvent(vUnitPosition, "[COLOR_WHITE]+"..iMusicianBonus.."[ICON_PEACE][ENDCOLOR]", 1.5)

			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC,
				'A Great Musician has emerged. The Gagaku guilds celebrate.',
				'Yields from Gagaku Guilds',
				iX, iY)
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationJapan) then
	GameEvents.CityConstructed.Add(OnConstructionUpgradeGuilds)
	GameEvents.CityConstructed.Add(OnConstructionUpgradeThatGuild)
	GameEvents.UnitCreated.Add(JapGuildsExpendBonus)
end


