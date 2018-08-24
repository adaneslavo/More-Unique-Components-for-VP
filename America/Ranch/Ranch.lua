-- Ranch
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------
include("FLuaVector.lua")

local fGameSpeedModifier1 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GrowthPercent / 100
local fGameSpeedModifier2 = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
local eBuildingRanch = GameInfoTypes.BUILDING_AMERICA_RANCH
local eCivilizationAmerica = GameInfoTypes.CIVILIZATION_AMERICA
local eResourceHorse = GameInfoTypes.RESOURCE_HORSE
local eResourceCattle = GameInfoTypes.RESOURCE_COW
local eResourceSheep = GameInfoTypes.RESOURCE_SHEEP
local eResourceBison = GameInfoTypes.RESOURCE_BISON

-- aquires new tiles on construction of Ranch (Cattle, Horse, Sheep and Bison), 3 range of city
function OnConstructionClaimResources(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetCivilizationType() == eCivilizationAmerica then
		if iBuilding == eBuildingRanch then
			local pCity = pPlayer:GetCityByID(iCity)
			local pPlotClaimer = 0
			
			for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
				local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)
				local iPlotOwner = pSpecificPlot:GetOwner()
				local iResourceTypeOnTile = pSpecificPlot:GetResourceType()
				
				if iResourceTypeOnTile == eResourceHorse or iResourceTypeOnTile == eResourceCattle or iResourceTypeOnTile == eResourceSheep or iResourceTypeOnTile == eResourceBison then
					if iPlotOwner == -1 then
						pSpecificPlot:SetOwner(iPlayer, iCity, 1, 1)
						pPlotClaimer = pPlotClaimer + 1
					end
				end
			end

			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
			local iYield = (20 * pPlotClaimer * iEraModifier)

			pCity:ChangeProduction(iYield)
				
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vCityPosition = PositionCalculator(iCityX, iCityY)
				local sCityName = pCity:GetName()
				
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_PRODUCTION]+"..iYield.." [ICON_PRODUCTION][ENDCOLOR]", 1)
			
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_CITY_TILE,
					'The City of [COLOR_CYAN]'..sCityName..'[ENDCOLOR] constructed Homestead and automatically claimed tiles with [ICON_RES_HORSE] Horses, [ICON_RES_SHEEP] Sheep, [ICON_RES_COW] Cattle or [ICON_RES_BISON] Bison within city range.',
					'New resources claimed by '..sCityName,
					pCity:GetX(), pCity:GetY(), iCity)
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityConstructed.Add(OnConstructionClaimResources)
