-- Baan Chang
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
include("FLuaVector.lua")
include("InstanceManager")
		
local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].ConstructPercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100

function BaanChangCSBonus(iPlayer)
	local pPlayer = Players[iPlayer]

	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_SIAM_BAAN_CHANG) then
			local iStrategicResourcesFromMinors = 0.5 * (pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_HORSE) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_IRON) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_COAL) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_OIL) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_ALUMINUM) + pPlayer:GetResourceFromMinors(GameInfoTypes.RESOURCE_URANIUM))
			
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYGOLD, iStrategicResourcesFromMinors)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYPRODUCTION, iStrategicResourcesFromMinors)
		end
	end
end

function BaanChangGetsUnitFromCS(iMinor, iMajor, iUnitType)
	local pPlayer = Players[iMajor]
	local pPlayer2 = Players[iMinor]
	local iNumberOfBaanChangs = 0

	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_SIAM_BAAN_CHANG) then
			iNumberOfBaanChangs = iNumberOfBaanChangs + 1
		end
	end

	if iNumberOfBaanChangs > 0 then
		local pCapital = pPlayer:GetCapitalCity()

		local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)

		local iGain1 = math.floor(5 * iNumberOfBaanChangs * iEraModifier * fGameSpeedModifier1)
		local iGain2 = math.floor(5 * iNumberOfBaanChangs * iEraModifier * fGameSpeedModifier2)
				
		pCapital:ChangeProduction(iGain1)
		pPlayer:ChangeJONSCulture(iGain2)

		if pPlayer:IsHuman() then
			local vCapitalPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())

			Events.AddPopupTextEvent(vCapitalPosition, "[COLOR_YIELD_PRODUCTION]+ "..iGain1.." [ICON_PRODUCTION][ENDCOLOR]", 1)
			Events.AddPopupTextEvent(vCapitalPosition, "[COLOR_MAGENTA]+ "..iGain2.." [ICON_CULTURE][ENDCOLOR]", 1.5)
			pPlayer:AddNotification(0, 
			'City-State gift:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCapital:GetName()..': [ENDCOLOR]+'..iGain1..' [ICON_PRODUCTION] Production[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'..pCapital:GetName()..': [ENDCOLOR]+'..iGain2..' [ICON_CULTURE] Culture', 
			'Bonus Yields in '..pCapital:GetName(), 
			pCapital:GetX(), pCapital:GetY())
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(BaanChangCSBonus)
GameEvents.MinorGiftUnit.Add(BaanChangGetsUnitFromCS)