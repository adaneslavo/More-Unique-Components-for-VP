--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,										DefaultBuilding,						NoLimit)
VALUES		('BUILDINGCLASS_DUMMYDEFENSEHPPROMOTION',	'BUILDING_DUMMYDEFENSEHPPROMOTION',		1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,								BuildingClass,								GoldMaintenance,	Cost,	FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatWorkSlotType, GreatWorkCount,	FreshWater, FreeStartEra, UnmoddedHappiness,	Happiness,	NeverCapture,	PrereqTech, ArtDefineTag, GreatPeopleRateChange,	SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	Description,								IconAtlas,			PortraitIndex)
SELECT		'BUILDING_DUMMYDEFENSEHPPROMOTION',	'BUILDINGCLASS_DUMMYDEFENSEHPPROMOTION',	0,					-1,		-1,			EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, 500,		50,					'PROMOTION_MORALE',		CitySupplyFlat,	DefenseHappinessChange,	GreatWorkSlotType, -1,				FreshWater, FreeStartEra, 0,					0,			1,				PrereqTech, ArtDefineTag, GreatPeopleRateChange,	SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, -1,					'TXT_KEY_BUILDING_DUMMYDEFENSEHPPROMOTION', 'CIV_COLOR_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_PALACE';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 							FlavorType,				Flavor)
VALUES		('BUILDING_DUMMYDEFENSEHPPROMOTION',	'FLAVOR_CITY_DEFENSE',	-999);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_DUMMYDEFENSEHPPROMOTION',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_PALACE';
------------------------------	
-- Building_ResourceQuantityRequirements
------------------------------
INSERT INTO Building_ResourceQuantityRequirements 	
			(BuildingType,						ResourceType, Cost)
SELECT		'BUILDING_DUMMYDEFENSEHPPROMOTION',	ResourceType, Cost
FROM Building_ResourceQuantityRequirements WHERE BuildingType = 'BUILDING_PALACE';
--==========================================================================================================================
--==========================================================================================================================
