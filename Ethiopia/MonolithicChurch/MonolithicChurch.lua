-- Monolithic Church
-- Author: adan_eslavo
-- DateCreated: 22/11/2017
--------------------------------------------------------------
local eImprovementMonolithicChurch = GameInfoTypes.IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH
local eCivilizationEthiopia = GameInfoTypes.CIVILIZATION_ETHIOPIA

local eBranchFreedom = GameInfoTypes.POLICY_BRANCH_FREEDOM
local eBranchOrder = GameInfoTypes.POLICY_BRANCH_ORDER
local eBranchAutocracy = GameInfoTypes.POLICY_BRANCH_AUTOCRACY 
local eBranchTraditionFinisher = GameInfoTypes.POLICY_BRANCH_TRADITION
local eBranchLibertyFinisher = GameInfoTypes.POLICY_BRANCH_LIBERTY
local eBranchHonorFinisher = GameInfoTypes.POLICY_BRANCH_HONOR
local eBranchPietyFinisher = GameInfoTypes.POLICY_BRANCH_PIETY
local eBranchPatronageFinisher = GameInfoTypes.POLICY_BRANCH_PATRONAGE
local eBranchAestheticsFinisher = GameInfoTypes.POLICY_BRANCH_AESTHETICS
local eBranchRationalismFinisher = GameInfoTypes.POLICY_BRANCH_RATIONALISM
local eBranchExplorationFinisher = GameInfoTypes.POLICY_BRANCH_EXPLORATION
local eBranchCommerceFinisher = GameInfoTypes.POLICY_BRANCH_COMMERCE

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

local eBuildingMCPantheon = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_PANTHEON
local eBuildingMCReligion = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER
local eBuildingMCEnhancing = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER
local eBuildingMCReforming = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_REFORMATION

local eReligionState
local bIdeologyState
local bTraditionFinisherState
local bLibertyFinisherState
local bHonorFinisherState
local bPietyFinisherState
local bPatronageFinisherState
local bAestheticsFinisherState
local bRationalismFinisherState
local bExplorationFinisherState
local bCommerceFinisherState

-- adds yields after adopting ideology
function OnPolicyAndIdeologyAddYields(iPlayer, iPolicy)
	local pPlayer = Players[iPlayer]
	print("Policy or Ideology adopted", iPolicy)
	if pPlayer:IsPolicyBranchFinished(eBranchTraditionFinisher) and not bTraditionFinisherState then
		bTraditionFinisherState = true
		print("Tr")
		CityPlotChecking(pPlayer)
	elseif pPlayer:IsPolicyBranchFinished(eBranchLibertyFinisher) and not bLibertyFinisherState then
		bLibertyFinisherState = true
		print("Li")
		CityPlotChecking(pPlayer)
	elseif pPlayer:IsPolicyBranchFinished(eBranchHonorFinisher) and not bHonorFinisherState then
		bHonorFinisherState = true
		print("Ho")
		CityPlotChecking(pPlayer)
	elseif pPlayer:IsPolicyBranchFinished(eBranchPietyFinisher) and not bPietyFinisherState then
		bPietyFinisherState = true
		print("Pi")
		CityPlotChecking(pPlayer)
	elseif pPlayer:IsPolicyBranchFinished(eBranchPatronageFinisher) and not bPatronageFinisherState then
		bPatronageFinisherState = true
		print("Pa")
		CityPlotChecking(pPlayer)
	elseif pPlayer:IsPolicyBranchFinished(eBranchAestheticsFinisher) and not bAestheticsFinisherState then
		bAestheticsFinisherState = true
		print("Ae")
		CityPlotChecking(pPlayer)
	elseif pPlayer:IsPolicyBranchFinished(eBranchRationalismFinisher) and not bRationalismFinisherState then
		bRationalismFinisherState = true
		print("Ra")
		CityPlotChecking(pPlayer)
	elseif pPlayer:IsPolicyBranchFinished(eBranchExplorationFinisher) and not bExplorationFinisherState then
		bExplorationFinisherState = true
		print("Ex")
		CityPlotChecking(pPlayer)
	elseif pPlayer:IsPolicyBranchFinished(eBranchCommerceFinisher) and not bCommerceFinisherState then
		bCommerceFinisherState = true
		print("Co")
		CityPlotChecking(pPlayer)
	end

	if not bIdeologyState and (pPlayer:IsPolicyBranchUnlocked(eBranchFreedom) == true or pPlayer:IsPolicyBranchUnlocked(eBranchOrder) == true or pPlayer:IsPolicyBranchUnlocked(eBranchAutocracy) == true) then
		bIdeologyState = true
		print("Ideology")
		CityPlotChecking(pPlayer)
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
	print("Cos pojawilo sie lub zniklo", iOwner, iOldImprovement, iNewImprovement)
	if (iNewImprovement == eImprovementMonolithicChurch or iOldImprovement == eImprovementMonolithicChurch) then
		print("To jest MC")
			if pPlayer and pPlayer:GetCivilizationType() == eCivilizationEthiopia then
			print("To jest Hajle")
			CityPlotChecking(pPlayer)
		end
	else
		for id, player in pairs(Players) do
			if player == pPlayer then
				CityPlotChecking(pPlayer)
			end
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

		CountAndSet(city)
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
		CountAndSet(pCity)
	else
		print("kasuje dane miasta")
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
		CountAndSet(pCity)
	end
end

GameEvents.CityCaptureComplete.Add(OnCityCaptureResetBonuses)
GameEvents.PlayerCityFounded.Add(OnCityFoundAddBonuses)

function CountAndSet(pCity)
	local iMonolithicChurchCount = 0

	for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pSpecificPlot = pCity:GetCityIndexPlot(iCityPlot)

		if pSpecificPlot:GetImprovementType() == eImprovementMonolithicChurch then
			iMonolithicChurchCount = iMonolithicChurchCount + 1
		end
	end

	print("Liczba bonusow: ", iMonolithicChurchCount)

	if iReligionState == 1 then
		pCity:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
		print("P")
	elseif iReligionState == 2 then
		pCity:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
		pCity:SetNumRealBuilding(eBuildingMCReligion, iMonolithicChurchCount)
		print("F")
	elseif iReligionState == 3 then
		pCity:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
		pCity:SetNumRealBuilding(eBuildingMCReligion, iMonolithicChurchCount)
		pCity:SetNumRealBuilding(eBuildingMCEnhancing, iMonolithicChurchCount)
		print("E")
	elseif iReligionState == 4 then
		pCity:SetNumRealBuilding(eBuildingMCPantheon, iMonolithicChurchCount)
		pCity:SetNumRealBuilding(eBuildingMCReligion, iMonolithicChurchCount)
		pCity:SetNumRealBuilding(eBuildingMCEnhancing, iMonolithicChurchCount)
		pCity:SetNumRealBuilding(eBuildingMCReforming, iMonolithicChurchCount)
		print("R")
	end

	if bIdeologyState then
		pCity:SetNumRealBuilding(eBuildingMCIdeology, iMonolithicChurchCount)
		print("I")
	end

	if bTraditionFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCTradition, iMonolithicChurchCount)
		print("TrF")
	end

	if bLibertyFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCLiberty, iMonolithicChurchCount)
		print("LiF")
	end

	if bHonorFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCHonor, iMonolithicChurchCount)
		print("HoF")
	end

	if bPietyFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCPiety, iMonolithicChurchCount)
		print("PiF")
	end

	if bPatronageFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCPatronage, iMonolithicChurchCount)
		print("PaF")
	end

	if bAestheticsFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCAesthetics, iMonolithicChurchCount)
		print("AeF")
	end

	if bRationalismFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCRationalism, iMonolithicChurchCount)
		print("RaF")
	end

	if bExplorationFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCExploration, iMonolithicChurchCount)
		print("ExF")
	end

	if bCommerceFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCCommerce, iMonolithicChurchCount)
		print("CoF")
	end
end