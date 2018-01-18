include("Sukritact_ChangeResearchProgress.lua")
include("FLuaVector.lua")
include("InstanceManager")

local greatPeople = { GameInfoTypes.UNIT_GREAT_GENERAL, GameInfoTypes.UNIT_GREAT_ADMIRAL, GameInfoTypes.UNIT_PROPHET, GameInfoTypes.UNIT_ARTIST, GameInfoTypes.UNIT_WRITER, GameInfoTypes.UNIT_MUSICIAN, GameInfoTypes.UNIT_SCIENTIST, GameInfoTypes.UNIT_MERCHANT, GameInfoTypes.UNIT_ENGINEER, GameInfoTypes.UNIT_GREAT_DIPLOMAT }

function IsGreatPerson(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	for _, unitType in pairs(greatPeople) do
		if (unitType == pUnit:GetUnitType()) then
			return true
		end
	end
	return false
end

function MadrasahScienceUnit(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100
	local iEraModifier = (pPlayer:GetCurrentEra() + 1) / 3

	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_ARABIA_MADRASAH) and bFaith) then
		local iScience
		
		if IsGreatPerson(iPlayer, iUnit) then
			iScience = 100 * iEraModifier * iGameSpeedModifier
		else
			iScience = 20 * iEraModifier * iGameSpeedModifier
		end

		iScience = math.floor(iScience)

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iScience.."[ICON_RESEARCH] from Madrasah[ENDCOLOR]", 1)
		end

		LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iScience)
	end
end

function MadrasahScienceBuilding(iPlayer, iCity, iBuilding, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_ARABIA_MADRASAH) and bFaith) then
		local iEraModifier = (pPlayer:GetCurrentEra() + 1) / 3
		local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ResearchPercent / 100

		local iScience = math.floor(20 * iEraModifier * iGameSpeedModifier)
		
		if iPlayer == Game:GetActivePlayer() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ALERT_MADRASAH_SCIENCE", iScience, pCity:GetName()))
		end

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_BLUE]+"..iScience.."[ICON_RESEARCH] from Madrasah[ENDCOLOR]", 1)
		end

		LuaEvents.Sukritact_ChangeResearchProgress(iPlayer, iScience)
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityTrained.Add(MadrasahScienceUnit)
GameEvents.CityConstructed.Add(MadrasahScienceBuilding)