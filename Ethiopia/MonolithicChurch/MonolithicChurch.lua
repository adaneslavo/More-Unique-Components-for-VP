-- Monolithic Church
-- Author: adan_eslavo
-- DateCreated: 22/11/2017
--------------------------------------------------------------
local ePolicyFreedom = GameInfoTypes.POLICY_BRANCH_FREEDOM
local ePolicyOrder = GameInfoTypes.POLICY_BRANCH_ORDER
local ePolicyAutocracy = GameInfoTypes.POLICY_BRANCH_AUTOCRACY 
local eImprovementMonolithicChurch = GameInfoTypes.IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH
local eBuildingMCPantheon = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_PANTHEON
local eBuildingMCReligion = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER
local eBuildingMCEnhancing = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER
local eBuildingMCReforming = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_REFORMATION
local eReligionState
local eCivilizationEthiopia = GameInfoTypes.CIVILIZATION_ETHIOPIA

-- adds yields after adopting ideology
function OnIdeologyAddYields(iPlayer, iPolicy)
	local pPlayer = Players[iPlayer]
	
	if (pPlayer:IsPolicyBranchUnlocked(ePolicyFreedom) == true or pPlayer:IsPolicyBranchUnlocked(ePolicyOrder) == true or pPlayer:IsPolicyBranchUnlocked(ePolicyAutocracy) == true) then
		local pTeam = Teams[pPlayer:GetTeam()]
		
		if pTeam:GetImprovementYieldChange(eImprovementMonolithicChurch, 2) == 0 then
			pTeam:ChangeImprovementYieldChange(eImprovementMonolithicChurch, 2, 2)
		end
	end
end

GameEvents.PlayerAdoptPolicy.Add(OnIdeologyAddYields)

--1. adds yields to all cities for each Monolithic Church worked by that city after setting Pantheon
function OnPatheonCountMonoChurches(iPlayer, iCapitalCity, iReligion, iBelief1)
	local pPlayer = Players[iPlayer]
	print("Panteon zalozony")
	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		print("To jest Hajle")
		iReligionState = 1
		CityPlotChecking(pPlayer)
	end
end

--2. adds yields to all cities for each Monolithic Church worked by that city after founding Religion
function OnReligionCountMonoChurches(iPlayer, iHolyCity, iReligion, iBelief1, iBelief2, iBelief3, iBelief4, iBelief5)
	local pPlayer = Players[iPlayer]
	print("Religia zalozona")
	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		print("To jest Hajle")
		iReligionState = 2
		CityPlotChecking(pPlayer, iReligionState)
	end
end

--3. adds yields to all cities for each Monolithic Church worked by that city after enhancing Religion
function OnEnhaningCountMonoChurches(iPlayer, iReligion, iBelief1, iBelief2)
	local pPlayer = Players[iPlayer]
	print("Religia rozszerzona")
	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		print("To jest Hajle")
		iReligionState = 3
		CityPlotChecking(pPlayer, iReligionState)
	end
end

--4. adds yields to all cities for each Monolithic Church worked by that city after reforming Religion
function OnReformingCountMonoChurches(iPlayer, iReligion, iBelief1)
	local pPlayer = Players[iPlayer]
	print("Religia zreformowana")
	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		print("To jest Hajle")
		iReligionState = 4
		CityPlotChecking(pPlayer, iReligionState)
	end
end

--plot scanner in all owned cities
function CityPlotChecking(pPlayer, iReligionState)
	for city in pPlayer:Cities() do
		print("Sprawdzam kolejne miasto")
		for iCityPlot = 1, city:GetNumCityPlots() - 1, 1 do
			print("Sprawdzam hex nr: ", iCityPlot)
			local pSpecificPlot = city:GetCityIndexPlot(iCityPlot)

			if pSpecificPlot:GetImprovementType() == eImprovementMonolithicChurch then
				print("Hex jest w zasiegu i jest na nim MC, wiec dokladam bonus")
				if iReligionState == 1 then
					city:SetNumRealBuilding(eBuildingMCPantheon, 0)
					city:SetNumRealBuilding(eBuildingMCPantheon, city:GetNumRealBuilding(eBuildingMCPantheon) + 1)
					print("Liczba bonusow - Panteon: ", city:GetNumRealBuilding(eBuildingMCPantheon))
				elseif iReligionState == 2 then
					city:SetNumRealBuilding(eBuildingMCPantheon, 0)
					city:SetNumRealBuilding(eBuildingMCReligion, 0)
					city:SetNumRealBuilding(eBuildingMCPantheon, city:GetNumRealBuilding(eBuildingMCPantheon) + 1)
					city:SetNumRealBuilding(eBuildingMCReligion, city:GetNumRealBuilding(eBuildingMCReligion) + 1)
					print("Liczba bonusow - Panteon: ", city:GetNumRealBuilding(eBuildingMCPantheon))
					print("Liczba bonusow - Religion: ", city:GetNumRealBuilding(eBuildingMCReligion))
				elseif iReligionState == 3 then
					city:SetNumRealBuilding(eBuildingMCPantheon, 0)
					city:SetNumRealBuilding(eBuildingMCReligion, 0)
					city:SetNumRealBuilding(eBuildingMCEnhancing, 0)
					city:SetNumRealBuilding(eBuildingMCPantheon, city:GetNumRealBuilding(eBuildingMCPantheon) + 1)
					city:SetNumRealBuilding(eBuildingMCReligion, city:GetNumRealBuilding(eBuildingMCReligion) + 1)
					city:SetNumRealBuilding(eBuildingMCEnhancing, city:GetNumRealBuilding(eBuildingMCEnhancing) + 1)
					print("Liczba bonusow - Panteon: ", city:GetNumRealBuilding(eBuildingMCPantheon))
					print("Liczba bonusow - Religion: ", city:GetNumRealBuilding(eBuildingMCReligion))
					print("Liczba bonusow - Enhancing: ", city:GetNumRealBuilding(eBuildingMCEnhancing))
				elseif iReligionState == 4 then
					city:SetNumRealBuilding(eBuildingMCPantheon, 0)
					city:SetNumRealBuilding(eBuildingMCReligion, 0)
					city:SetNumRealBuilding(eBuildingMCEnhancing, 0)
					city:SetNumRealBuilding(eBuildingMCReforming, 0)
					city:SetNumRealBuilding(eBuildingMCPantheon, city:GetNumRealBuilding(eBuildingMCPantheon) + 1)
					city:SetNumRealBuilding(eBuildingMCReligion, city:GetNumRealBuilding(eBuildingMCReligion) + 1)
					city:SetNumRealBuilding(eBuildingMCEnhancing, city:GetNumRealBuilding(eBuildingMCEnhancing) + 1)
					city:SetNumRealBuilding(eBuildingMCReforming, city:GetNumRealBuilding(eBuildingMCReforming) + 1)
					print("Liczba bonusow - Panteon: ", city:GetNumRealBuilding(eBuildingMCPantheon))
					print("Liczba bonusow - Religion: ", city:GetNumRealBuilding(eBuildingMCReligion))
					print("Liczba bonusow - Enhancing: ", city:GetNumRealBuilding(eBuildingMCEnhancing))
					print("Liczba bonusow - Reforming: ", city:GetNumRealBuilding(eBuildingMCReforming))
				end
			end
		end
	end
end

GameEvents.PantheonFounded.Add(OnPatheonCountMonoChurches)
GameEvents.ReligionFounded.Add(OnReligionCountMonoChurches)
GameEvents.ReligionEnhanced.Add(OnEnhaningCountMonoChurches)
GameEvents.ReligionReformed.Add(OnReformingCountMonoChurches)