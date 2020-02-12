-- Monolithic Church
-- Author: adan_eslavo
-- DateCreated: 22/11/2017
--------------------------------------------------------------
local bIdeologyState = false
local eBuildingMCIdeology = GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY

-- adds yields to all Monolitihic Churches in the world after adopting ideology or finishing policy branch
function OnIdeologyAddYields(iPlayer, iPolicy)
	local pPlayer = Players[iPlayer]

	if not bIdeologyState and (pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_FREEDOM) == true or pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_ORDER) == true or pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_AUTOCRACY ) == true) then
		bIdeologyState = true
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY, 1)
	end
end

function OnCaptureResetMonoBonus(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pOldPlayer = Players[iOldOwner]
	
	if not bIsCapital then return end
	
	if bIdeologyState == true then
		pOldPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY, 1)
	end
end	

if Game.IsCivEverActive(GameInfoTypes.CIVILIZATION_ETHIOPIA) then
	GameEvents.PlayerAdoptPolicy.Add(OnIdeologyAddYields)
	GameEvents.CityCaptureComplete.Add(OnCaptureResetMonoBonus)
end


--[[local eImprovementMonolithicChurch = GameInfoTypes.IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH
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

-- adds yields to all Monolitihic Churches in the world after adopting ideology or finishing policy branch
function OnPolicyAndIdeologyAddYields(iPlayer, iPolicy)
	local pPlayer = Players[iPlayer]

	if pPlayer:IsPolicyBranchFinished(eBranchTraditionFinisher) and not bTraditionFinisherState then
		bTraditionFinisherState = true
		SetDummiesInCities()
	elseif pPlayer:IsPolicyBranchFinished(eBranchLibertyFinisher) and not bLibertyFinisherState then
		bLibertyFinisherState = true
		SetDummiesInCities()
	elseif pPlayer:IsPolicyBranchFinished(eBranchHonorFinisher) and not bHonorFinisherState then
		bHonorFinisherState = true
		SetDummiesInCities()
	elseif pPlayer:IsPolicyBranchFinished(eBranchPietyFinisher) and not bPietyFinisherState then
		bPietyFinisherState = true
		SetDummiesInCities()
	elseif pPlayer:IsPolicyBranchFinished(eBranchPatronageFinisher) and not bPatronageFinisherState then
		bPatronageFinisherState = true
		SetDummiesInCities()
	elseif pPlayer:IsPolicyBranchFinished(eBranchAestheticsFinisher) and not bAestheticsFinisherState then
		bAestheticsFinisherState = true
		SetDummiesInCities()
	elseif pPlayer:IsPolicyBranchFinished(eBranchRationalismFinisher) and not bRationalismFinisherState then
		bRationalismFinisherState = true
		SetDummiesInCities()
	elseif pPlayer:IsPolicyBranchFinished(eBranchExplorationFinisher) and not bExplorationFinisherState then
		bExplorationFinisherState = true
		SetDummiesInCities()
	elseif pPlayer:IsPolicyBranchFinished(eBranchCommerceFinisher) and not bCommerceFinisherState then
		bCommerceFinisherState = true
		SetDummiesInCities()
	end

	if not bIdeologyState and (pPlayer:IsPolicyBranchUnlocked(eBranchFreedom) == true or pPlayer:IsPolicyBranchUnlocked(eBranchOrder) == true or pPlayer:IsPolicyBranchUnlocked(eBranchAutocracy) == true) then
		bIdeologyState = true
		SetDummiesInCities()
	end
end

--1. adds yields to Monolithic Churches in the world from founded Pantheon
function OnPatheonCountMonoChurches(iPlayer, iCapitalCity, iReligion, iBelief1)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		iReligionState = 1
		SetDummiesInCities()
	end
end

--2. adds yields to Monolithic Churches in the world from founding Religion
function OnReligionCountMonoChurches(iPlayer, iHolyCity, iReligion, iBelief1, iBelief2, iBelief3, iBelief4, iBelief5)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		iReligionState = 2
		SetDummiesInCities()
	end
end

--3. adds yields to Monolithic Churches in the world from enhancing Religion
function OnEnhaningCountMonoChurches(iPlayer, iReligion, iBelief1, iBelief2)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		iReligionState = 3
		SetDummiesInCities()
	end
end

--4. adds yields to Monolithic Churches in the world from reforming Religion
function OnReformingCountMonoChurches(iPlayer, iReligion, iBelief1)
	local pPlayer = Players[iPlayer]

	if pPlayer:GetCivilizationType() == eCivilizationEthiopia then
		iReligionState = 4
		SetDummiesInCities()
	end
end

--iterator through all cities of all players
function SetDummiesInCities()
	for id, player in pairs(Players) do
		for city in player:Cities() do
			CountAndSet(city)
		end
	end
end	

GameEvents.PlayerAdoptPolicy.Add(OnPolicyAndIdeologyAddYields)
GameEvents.PantheonFounded.Add(OnPatheonCountMonoChurches)
GameEvents.ReligionFounded.Add(OnReligionCountMonoChurches)
GameEvents.ReligionEnhanced.Add(OnEnhaningCountMonoChurches)
GameEvents.ReligionReformed.Add(OnReformingCountMonoChurches)

--adds yields for each MC in range on city founding
function OnCityFoundAddBonuses(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
	
	CountAndSet(pCity)
end

GameEvents.CityCaptureComplete.Add(OnCityCaptureResetBonuses)
GameEvents.PlayerCityFounded.Add(OnCityFoundAddBonuses)

--sets complete list of dummy buildings depending on Ethiopia's level of developement
function CountAndSet(pCity)
	if iReligionState == 1 then
		pCity:SetNumRealBuilding(eBuildingMCPantheon, 1)
	elseif iReligionState == 2 then
		pCity:SetNumRealBuilding(eBuildingMCPantheon, 1)
		pCity:SetNumRealBuilding(eBuildingMCReligion, 1)
	elseif iReligionState == 3 then
		pCity:SetNumRealBuilding(eBuildingMCPantheon, 1)
		pCity:SetNumRealBuilding(eBuildingMCReligion, 1)
		pCity:SetNumRealBuilding(eBuildingMCEnhancing, 1)
	elseif iReligionState == 4 then
		pCity:SetNumRealBuilding(eBuildingMCPantheon, 1)
		pCity:SetNumRealBuilding(eBuildingMCReligion, 1)
		pCity:SetNumRealBuilding(eBuildingMCEnhancing, 1)
		pCity:SetNumRealBuilding(eBuildingMCReforming, 1)
	end

	if bIdeologyState then
		pCity:SetNumRealBuilding(eBuildingMCIdeology, 1)
	end

	if bTraditionFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCTradition, 1)
	end

	if bLibertyFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCLiberty, 1)
	end

	if bHonorFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCHonor, 1)
	end

	if bPietyFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCPiety, 1)
	end

	if bPatronageFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCPatronage, 1)
	end

	if bAestheticsFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCAesthetics, 1)
	end

	if bRationalismFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCRationalism, 1)
	end

	if bExplorationFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCExploration, 1)
	end

	if bCommerceFinisherState then
		pCity:SetNumRealBuilding(eBuildingMCCommerce, 1)
	end
end ]]--
