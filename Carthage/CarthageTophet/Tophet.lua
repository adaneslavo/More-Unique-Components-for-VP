include("FLuaVector.lua")
include("PlotIterators.lua")
include("InstanceManager")

function TophetXPGain(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_TOPHET) and bGold) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		local oldXP = pUnit:GetExperience()
		local newXP = 2 * oldXP
		
		pUnit:SetExperience(newXP)
	end
end

function TophetCultureGain(iPlayer, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	
	if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_TOPHET) and (bGold or bFaith)) then
		local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
		local iEraModifier = pPlayer:GetCurrentEra() + 1

		local cultureGain = 10 * iEraModifier * iGameSpeedModifier
		
		cultureGain = math.floor(cultureGain)
		
		pPlayer:ChangeJONSCulture(cultureGain)
		
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
					
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+"..cultureGain.." [ICON_CULTURE] Tophet[ENDCOLOR]", 1)
		end
	end
end


function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityTrained.Add(TophetXPGain)
GameEvents.CityTrained.Add(TophetCultureGain)