-- Examination Hall
-- Author: Blue Ghost
-- DateCreated:
-- 2018-01-20 updated by Infixo
-- 2018-03-03 updated by Infixo (highest points)
--------------------------------------------------------------
include("FLuaVector.lua")

local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GreatPeoplePercent / 100
local eBuildingExamHall = GameInfoTypes.BUILDING_CHINA_EXAMINATION_HALL
local eBuildingDummyForExamHall = GameInfoTypes.BUILDING_D_FOR_EXAM
local eCivilizationChina = GameInfoTypes.CIVILIZATION_CHINA
local eCivilizationRome = GameInfoTypes.CIVILIZATION_ROME

-- entry function
	-- build table of valid specialists and corresponding GPs
	local tGPs = {}

	for specialist in GameInfo.Specialists() do 
		if specialist.GreatPeopleRateChange > 0 then
			local spec = {
				GPType = specialist.ID, 
				GPStr = Locale.ConvertTextKey(GameInfo.UnitClasses[GameInfoTypes[specialist.GreatPeopleUnitClass]].Description)
			}
			
			table.insert(tGPs, spec)
		end
	end

-- double great people generation during WLTKDs
function OnWLTKDIncreaseGPGeneration(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationChina or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	local iNumberOfExamHalls = pPlayer:CountNumBuildings(eBuildingExamHall)

	if iNumberOfExamHalls > 0 then
		for city in pPlayer:Cities() do
			iCurrentExamHall = 0

			if city:IsHasBuilding(eBuildingExamHall) then
				iCurrentExamHall = iCurrentExamHall + 1

				if city:GetWeLoveTheKingDayCounter() > 0 then
					city:SetNumRealBuilding(eBuildingDummyForExamHall, 1)
				else
					city:SetNumRealBuilding(eBuildingDummyForExamHall, 0)
				end

				if iCurrentExamHall == iNumberOfExamHalls then
					break
				end
			end
		end
	end
end

-- adds GP points to the most advanced GP in city on citizen bierth
function OnBirthAddGPPointsToTheBest(iX, iY, iOld, iNew)
	if not (iNew > iOld and iNew > 1) then return end

	local pPlot = Map.GetPlot(iX, iY)
	
	if not pPlot then return end

	local pPlayer = Players[pPlot:GetOwner()]

	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationChina or pPlayer:GetCivilizationType() == eCivilizationRome)) then return end
	
	local pCity = pPlot:GetPlotCity()
	
	if pCity and pCity:IsHasBuilding(eBuildingExamHall) then
		local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
				
		-- find GP with highest points
		local bBestGP = nil
		local tBestGP = {} 
		local iGPMax = 0
		
		for _, spec in ipairs(tGPs) do
			local iGPProgress = pCity:GetSpecialistGreatPersonProgressTimes100(spec.GPType)
			
			if iGPProgress > iGPMax then 
				iGPMax = iGPProgress
				tBestGP = {}
				bBestGP = true
				table.insert(tBestGP, spec)
			elseif iGPMax ~= 0 and iGPProgress == iGPMax then
				table.insert(tBestGP, spec)
			end
		end

		local iX, iY = pCity:GetX(), pCity:GetY()
		local vCityPosition = PositionCalculator(iX, iY)

		-- not found
		if not bBestGP then
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_RED]No Great People Points produced in the City so far[ENDCOLOR]", 1)
			end

			return 
		end
		
		-- found
		local iGPP = math.floor(7.5 * iEraModifier * iGameSpeedModifier)
		
		for _, spec in ipairs(tBestGP) do		
			pCity:ChangeSpecialistGreatPersonProgressTimes100(spec.GPType, iGPP * 100)
				
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_GREAT_PEOPLE_STORED]+"..iGPP.."[ICON_GREAT_PEOPLE][ENDCOLOR]", 1)
			
				sName = pCity:GetName()

				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_CITY_GROWTH,
					'New [ICON_CITIZEN] Citizen born in '..sName..'. City gained '..iGPP..' [ICON_GREAT_PEOPLE] Great Person Points towards '..spec.GPStr..'.',
					'Citizen born in '..sName,
					iX, iY, pCity:GetID())
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(OnWLTKDIncreaseGPGeneration)
GameEvents.SetPopulation.Add(OnBirthAddGPPointsToTheBest)
