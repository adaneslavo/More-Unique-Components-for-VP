include("FLuaVector.lua")
include("InstanceManager")

local iBuilding = GameInfoTypes.BUILDING_VP_EXAMINATION_HALL
local iDummy = GameInfoTypes.BUILDING_VP_EXAMINATION_HALL_DUMMY
--[[
local iWriter = GameInfoTypes['SPECIALIST_WRITER']
local iArtist = GameInfoTypes['SPECIALIST_ARTIST']
local iMusician = GameInfoTypes['SPECIALIST_MUSICIAN']
local iScientist = GameInfoTypes['SPECIALIST_SCIENTIST']
local iEngineer = GameInfoTypes['SPECIALIST_ENGINEER']
local iMerchant = GameInfoTypes['SPECIALIST_MERCHANT']
local iDiplomat = GameInfoTypes['SPECIALIST_CIVIL_SERVANT']
--]]
-- build table of valid specialists and corresponding GPs
local tGPs = {}
for sp in GameInfo.Specialists() do 
	if sp.GreatPeopleRateChange > 0 then
		local spec = { GPType = sp.ID, GPStr = Locale.ConvertTextKey(GameInfo.UnitClasses[ GameInfoTypes[sp.GreatPeopleUnitClass] ].Description) }
		table.insert(tGPs, spec)
	end
end
--for k,v in pairs(tGPs) do print(k, v.GPType, v.GPStr) end -- debug
print("Detected GPs", #tGPs) -- debug

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
				
				local tGP = tGPs[ math.random( #tGPs ) ] -- pick random GP
				--[[
				local rand = math.random(7)
				local GPType = iDiplomat
				local GPStr = "Great Diplomat"
				if rand == 1 then
					GPType = iWriter
					GPStr = "Great Writer"
				elseif rand == 2 then
					GPType = iArtist
					GPStr = "Great Artist"
				elseif rand == 3 then
					GPType = iMusician
					GPStr = "Great Musician"
				elseif rand == 4 then
					GPType = iScientist
					GPStr = "Great Scientist"
				elseif rand == 5 then
					GPType = iEngineer
					GPStr = "Great Engineer"
				elseif rand == 6 then
					GPType = iMerchant
					GPStr = "Great Merchant"
				elseif rand == 7 then
					GPType = iDiplomat
					GPStr = "Great Diplomat"
				end
				--]]
				--print("Civil Examinations", tGP.GPType, tGP.GPStr, iGPP) -- debug
				pCity:ChangeSpecialistGreatPersonProgressTimes100(tGP.GPType, iGPP * 100)
				
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
				
					Events.AddPopupTextEvent(vCityPosition, "[COLOR_GREAT_PEOPLE_STORED]+"..iGPP.."[ICON_GREAT_PEOPLE][ENDCOLOR]", 1)
					pPlayer:AddNotification(0, 'New [ICON_CITIZEN] Citizen appeared in '..pCity:GetName()..'. City gained '..iGPP..' [ICON_GREAT_PEOPLE] Great Person Points towards '..tGP.GPStr..'.', 'Citizen born in '..pCity:GetName(), pCity:GetX(), pCity:GetY())
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