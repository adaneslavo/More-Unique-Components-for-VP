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
local bIdeologyState
local eCivilizationEthiopia = GameInfoTypes.CIVILIZATION_ETHIOPIA
local ePolicyTraditionFinisher = GameInfoTypes.POLICY_TRADITION_FINISHER
local ePolicyLibertyFinisher = GameInfoTypes.POLICY_LIBERTY_FINISHER
local ePolicyHonorFinisher = GameInfoTypes.POLICY_HONOR_FINISHER
local ePolicyPietyFinisher = GameInfoTypes.POLICY_PIETY_FINISHER
local ePolicyPatronageFinisher = GameInfoTypes.POLICY_PATRONAGE_FINISHER
local ePolicyAestheticsFinisher = GameInfoTypes.POLICY_AESTHETICS_FINISHER
local ePolicyRationalismFinisher = GameInfoTypes.POLICY_RATIONALISM_FINISHER
local ePolicyExplorationFinisher = GameInfoTypes.POLICY_EXPLORATION_FINISHER
local ePolicyCommerceFinisher = GameInfoTypes.POLICY_COMMERCE_FINISHER
local eBuildingMCTradition = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_TRADITION
local eBuildingMCLiberty = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_LIBERTY
local eBuildingMCHonor = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_HONOR
local eBuildingMCPiety = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_PIETY
local eBuildingMCPatronage = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_PATRONAGE
local eBuildingMCAesthetics = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_AESTHETICS
local eBuildingMCRationalism = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_RATIONALISM
local eBuildingMCExploration = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_EXPLORATION
local eBuildingMCCommerce = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_COMMERCE
local eBuildingMCIdeology = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY

-- adds yields after adopting ideology
function OnPolicyAndIdeologyAddYields(iPlayer, iPolicy)
	local pPlayer = Players[iPlayer]
	print("Policy or Ideology adopted")
	if (pPlayer:IsPolicyBranchUnlocked(ePolicyFreedom) == true or pPlayer:IsPolicyBranchUnlocked(ePolicyOrder) == true or pPlayer:IsPolicyBranchUnlocked(ePolicyAutocracy) == true) then
		bIdeologyState = true
		CityPlotChecking(pPlayer)
		print("Ideology")
	end
end

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
		CityPlotChecking(pPlayer)
	end
end

--3. adds yields to all cities for each Monolithic Church worked by that city after enhancing Religion
function OnEnhaningCountMonoChurches(iPlayer, iReligion, iBelief1, iBelief2)
	local pPlayer = Players[iPlayer]
	print("Religia rozszerzona")
	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		print("To jest Hajle")
		iReligionState = 3
		CityPlotChecking(pPlayer)
	end
end

--4. adds yields to all cities for each Monolithic Church worked by that city after reforming Religion
function OnReformingCountMonoChurches(iPlayer, iReligion, iBelief1)
	local pPlayer = Players[iPlayer]
	print("Religia zreformowana")
	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		print("To jest Hajle")
		iReligionState = 4
		CityPlotChecking(pPlayer)
	end
end

--adds yields to all cities after creating or deleting Monolithic Church
function OnTileChangeResetBonuses(iX, iY, iOwner, iOldImprovement, iNewImprovement, bPillaged)
	local pPlayer = Players[iOwner]
	print("Cos pojawilo sie lub zniklo")
	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		print("To jest Hajle")
		if (iNewImprovement == eImprovementMonolithicChurch or iOldImprovement == eImprovementMonolithicChurch) then
			print("To jest MC")
			CityPlotChecking(pPlayer)
		end
	end
end

--plot scanner in all owned cities
function CityPlotChecking(pPlayer)
	for city in pPlayer:Cities() do
		print("Sprawdzam kolejne miasto")
		city:SetNumRealBuilding(eBuildingMCPantheon, 0)
		city:SetNumRealBuilding(eBuildingMCReligion, 0)
		city:SetNumRealBuilding(eBuildingMCEnhancing, 0)
		city:SetNumRealBuilding(eBuildingMCReforming, 0)
		city:SetNumRealBuilding(eBuildingMCIdeology, 0)

		local iMonolithicChurchCount = 0

		for iCityPlot = 1, city:GetNumCityPlots() - 1, 1 do
			print("Sprawdzam hex nr: ", iCityPlot)
			local pSpecificPlot = city:GetCityIndexPlot(iCityPlot)

			if pSpecificPlot:GetImprovementType() == eImprovementMonolithicChurch then
				print("Hex jest w zasiegu i jest na nim MC, wiec dokladam bonus")
				iMonolithicChurchCount = iMonolithicChurchCount + 1
			end
		end

		print("Liczba bonusow: ", iMonolithicChurchCount)

		if iReligionState == 1 then
			city:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
			print("P")
		elseif iReligionState == 2 then
			city:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
			city:SetNumRealBuilding(eBuildingMCReligion, iMonolithicChurchCount)
			print("F")
		elseif iReligionState == 3 then
			city:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
			city:SetNumRealBuilding(eBuildingMCReligion, iMonolithicChurchCount)
			city:SetNumRealBuilding(eBuildingMCEnhancing, iMonolithicChurchCount)
			print("E")
		elseif iReligionState == 4 then
			city:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
			city:SetNumRealBuilding(eBuildingMCReligion, iMonolithicChurchCount)
			city:SetNumRealBuilding(eBuildingMCEnhancing, iMonolithicChurchCount)
			city:SetNumRealBuilding(eBuildingMCReforming, iMonolithicChurchCount)
			print("R")
		end

		if bIdeologyState then
			city:SetNumRealBuilding(eBuildingMCIdeology, iMonolithicChurchCount)
			print("I")
		end
	end
end

GameEvents.PlayerAdoptPolicy.Add(OnPolicyAndIdeologyAddYields)
GameEvents.PantheonFounded.Add(OnPatheonCountMonoChurches)
GameEvents.ReligionFounded.Add(OnReligionCountMonoChurches)
GameEvents.ReligionEnhanced.Add(OnEnhaningCountMonoChurches)
GameEvents.ReligionReformed.Add(OnReformingCountMonoChurches)
GameEvents.TileImprovementChanged.Add(OnTileChangeResetBonuses)

--adds yields to the captured city for each Monolithic Church in range
function OnCityCaptureResetBonuses(iPlayer, iCapital, iX, iY, iNewPlayer, iConquest1, iConquest2)
	print("Miasto zdobyte...")
	local pNewPlayer = Players[iNewPlayer]
	local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
	
	if pNewPlayer:GetCivilizationType() == eCivilizationEthiopia then
		print("...przez Etiopie")
		OneCityPlotChecking(pPlayer, pCity)
	else
		pCity:SetNumRealBuilding(eBuildingMCPantheon, 0)
		pCity:SetNumRealBuilding(eBuildingMCReligion, 0)
		pCity:SetNumRealBuilding(eBuildingMCEnhancing, 0)
		pCity:SetNumRealBuilding(eBuildingMCReforming, 0)
		pCity:SetNumRealBuilding(eBuildingMCIdeology, 0)
	end
end

--adds yields for each MC in range on city founding
function OnCityFoundAddBonuses(iPlayer, iX, iY)
	print("Miasto zalozone...")
	local pPlayer = Players[iPlayer]
	local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
	
	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		print("...przez Etiopie")
		OneCityPlotChecking(pPlayer, pCity)
	end
end

--plot scanner in one owned city
function OneCityPlotChecking(pPlayer, pCity)
	local iMonolithicChurchCount = 0

	for iCityPlot = 1, city:GetNumCityPlots() - 1, 1 do
		print("Sprawdzam hex nr: ", iCityPlot)
		local pSpecificPlot = city:GetCityIndexPlot(iCityPlot)

		if pSpecificPlot:GetImprovementType() == eImprovementMonolithicChurch then
			print("Hex jest w zasiegu i jest na nim MC, wiec dokladam bonus")
			iMonolithicChurchCount = iMonolithicChurchCount + 1
		end
	end

	print("Liczba bonusow: ", iMonolithicChurchCount)

	if iReligionState == 1 then
		city:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
		print("P")
	elseif iReligionState == 2 then
		city:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
		city:SetNumRealBuilding(eBuildingMCReligion, iMonolithicChurchCount)
		print("F")
	elseif iReligionState == 3 then
		city:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
		city:SetNumRealBuilding(eBuildingMCReligion, iMonolithicChurchCount)
		city:SetNumRealBuilding(eBuildingMCEnhancing, iMonolithicChurchCount)
		print("E")
	elseif iReligionState == 4 then
		city:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
		city:SetNumRealBuilding(eBuildingMCReligion, iMonolithicChurchCount)
		city:SetNumRealBuilding(eBuildingMCEnhancing, iMonolithicChurchCount)
		city:SetNumRealBuilding(eBuildingMCReforming, iMonolithicChurchCount)
		print("R")
	end

	if bIdeologyState then
		city:SetNumRealBuilding(eBuildingMCIdeology, iMonolithicChurchCount)
		print("I")
	end
end

GameEvents.CityCaptureComplete.Add(OnCityCaptureResetBonuses)
GameEvents.PlayerCityFounded.Add(OnCityFoundAddBonuses)