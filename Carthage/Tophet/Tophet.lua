-- Tophet
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------	
include("FLuaVector.lua")

local eBuildingTophet = GameInfoTypes.BUILDING_CARTHAGE_TOPHET
local eCivilizationCarthage = GameInfoTypes.CIVILIZATION_CARTHAGE
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME
local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100

-- xp scaling
	-- check XP scaling
	local bXPScaling = true -- default VP

	for t in GameInfo.CustomModOptions{Name="BALANCE_CORE_SCALING_XP"} do 
		bXPScaling = (t.Value == 1) 
	end

	-- acquire game speed modifier
	local fGameSpeedModifier2 = 1.0 -- it is float, so use 'f' at begining

	if bXPScaling then 
		fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].TrainPercent / 100 
	end

-- two abilities: additional xp on purchasing and culture to the city on purchasing
function OnTrainAddXPAndYields(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationCarthage or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end

	local pCity = pPlayer:GetCityByID(iCity)

	if not pCity:IsHasBuilding(eBuildingTophet) then return end
		
	if bGold or bFaith then
		-- adds 5 XP to purchased units
		local pUnit = pPlayer:GetUnitByID(iUnit)
			
		pUnit:ChangeExperience(math.floor(5 * fGameSpeedModifier2), -1, 1)

		-- yields culture on purchasing
		local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
		local iCultureGain = math.floor(20 * iEraModifier * fGameSpeedModifier)
		
		pPlayer:ChangeJONSCulture(iCultureGain)
		
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local iX, iY = pCity:GetX(), pCity:GetY()
			local vCityPosition = PositionCalculator(iX, iY)
							
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..iCultureGain.." [ICON_CULTURE][ENDCOLOR]", 1)
			
			local sCityName = pCity:GetName()
			local sCurrency

			if bGold then
				sCurrency = '[ICON_GOLD] '
			elseif bFaith then
				sCurrency = '[ICON_PEACE] '
			end	

			pPlayer:AddNotification(0, 
				sCurrency..' Unit Purchase:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..sCityName..': [ENDCOLOR]+'..iCultureGain..' [ICON_CULTURE] Culture', 
				'Bonus Yields in '..sCityName, 
				iX, iY)
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationCarthage) then
	GameEvents.CityTrained.Add(OnTrainAddXPAndYields)
end
