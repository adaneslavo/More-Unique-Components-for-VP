-- Baan Chang
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
include("FLuaVector.lua")
		
local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ConstructPercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
local eBuildingBaanChang = GameInfoTypes.BUILDING_SIAM_BAAN_CHANG
local eBuildingDummyForBaanChang = GameInfoTypes.BUILDING_D_FOR_BAAN
local eCivilizationSiam = GameInfoTypes.CIVILIZATION_SIAM
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME

-- adds bonus yields for each 2 strategic resources importet from CSs
function OnTurnUpdateYieldsFromStrategic(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationSiam or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	for city in pPlayer:Cities() do
		if city:IsHasBuilding(eBuildingBaanChang) then
			local iStrategicResourcesFromMinors = 0.5 * (pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_HORSE) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_IRON) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_COAL) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_OIL) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_ALUMINUM) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_URANIUM))
			
			city:SetNumRealBuilding(eBuildingDummyForBaanChang, iStrategicResourcesFromMinors)
		end
	end
end

-- gains yields for every unit gifted from CSs
function OnCSGiftGiveYields(iMinor, iMajor, iUnitType)
	local pPlayer = Players[iMajor]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationSiam or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end

	local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)

	for city in pPlayer:Cities() do
		if city:IsHasBuilding(eBuildingBaanChang) then
			local iGain1 = math.floor(10 * iEraModifier * fGameSpeedModifier1)
			local iGain2 = math.floor(10 * iEraModifier * fGameSpeedModifier2)
				
			city:ChangeProduction(iGain1)
			pPlayer:ChangeJONSCulture(iGain2)

			local sCityName = city:GetName()
			local iX, iY = city:GetX(), city:GetY()
			
			if pPlayer:IsHuman() then
				local vCityPosition = PositionCalculator(iX, iY)

				Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_PRODUCTION]+ "..iGain1.." [ICON_PRODUCTION][ENDCOLOR]", 1)
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+ "..iGain2.." [ICON_CULTURE][ENDCOLOR]", 1.5)
				pPlayer:AddNotification(0, 
					'City-State gift:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..sCityName..': [ENDCOLOR]+'..iGain1..' [ICON_PRODUCTION] Production[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..sCityName..': [ENDCOLOR]+'..iGain2..' [ICON_CULTURE] Culture', 
					'Bonus Yields in '..sCityName, 
					iX, iY)
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(OnTurnUpdateYieldsFromStrategic)
GameEvents.MinorGiftUnit.Add(OnCSGiftGiveYields)
