-- Examination Hall
-- Author: Blue Ghost
-- DateCreated:
-- 2018-01-20 updated by Infixo
-- 2018-03-03 updated by Infixo (highest points)
--------------------------------------------------------------
include("FLuaVector.lua")

local iBuilding = GameInfoTypes.BUILDING_CHINA_EXAMINATION_HALL
local iDummy = GameInfoTypes.BUILDING_DUMMYGPP

-- build table of valid specialists and corresponding GPs
local tGPs = {}
for sp in GameInfo.Specialists() do 
	if sp.GreatPeopleRateChange > 0 then
		local spec = { GPType = sp.ID, GPStr = Locale.ConvertTextKey(GameInfo.UnitClasses[ GameInfoTypes[sp.GreatPeopleUnitClass] ].Description) }
		table.insert(tGPs, spec)
	end
end
--for k,v in pairs(tGPs) do print(k, v.GPType, v.GPStr) end -- debug

function WLTKDGreatPersonBonus(iPlayer)
	local pPlayer = Players[iPlayer]
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iBuilding) and pCity:GetWeLoveTheKingDayCounter() > 0 then
			pCity:SetNumRealBuilding(iDummy, 1)
		else
			pCity:SetNumRealBuilding(iDummy, 0)
		end
	end
end

function GPPOnGrowth(iX, iY, iOld, iNew)
	local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GreatPeoplePercent / 100
	
	if iNew > iOld and iNew > 1 then
		local pPlot = Map.GetPlot(iX, iY)
		if pPlot then
			local pCity = pPlot:GetPlotCity()
			if pCity and pCity:IsHasBuilding(iBuilding) then
				local iPlayer = pCity:GetOwner()
				local pPlayer = Players[iPlayer]
				local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
				
				local iGPP = 7.5 * iEraModifier * iGameSpeedModifier
				iGPP = math.floor(iGPP)
				
				--local tGP = tGPs[ math.random( #tGPs ) ] -- pick random GP
				-- Find GP with highest points
				local tGP, iGPPMax = nil, 0
				for _,spec in ipairs(tGPs) do
					local gpProgress = city:GetSpecialistGreatPersonProgressTimes100(spec.GPType);
					if gpProgress > iGPPMax then iGPPMax = gpProgress; tGP = spec end
				end
				if not tGP then
					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
						Events.AddPopupTextEvent(vCityPosition, "[COLOR_RED]No Great People Points produced in the City so far[ENDCOLOR]", 1)
					end
					return 
				end
				
				--print("Civil Examinations", tGP.GPType, tGP.GPStr, iGPP) -- debug
				pCity:ChangeSpecialistGreatPersonProgressTimes100(tGP.GPType, iGPP * 100)
				
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
					Events.AddPopupTextEvent(vCityPosition, "[COLOR_GREAT_PEOPLE_STORED]+"..iGPP.."[ICON_GREAT_PEOPLE][ENDCOLOR]", 1)
					pPlayer:AddNotification(
						NotificationTypes.NOTIFICATION_CITY_GROWTH,
						'New [ICON_CITIZEN] Citizen born in '..pCity:GetName()..'. City gained '..iGPP..' [ICON_GREAT_PEOPLE] Great Person Points towards '..tGP.GPStr..'.',
						'Citizen born in '..pCity:GetName(),
						pCity:GetX(), pCity:GetY(), pCity:GetID())
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(WLTKDGreatPersonBonus)
GameEvents.SetPopulation.Add(GPPOnGrowth)
