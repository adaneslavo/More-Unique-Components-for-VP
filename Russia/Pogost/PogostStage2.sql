--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,								DefaultBuilding)
VALUES		('BUILDINGCLASS_RUSSIA_POGOST_2',	'BUILDING_RUSSIA_POGOST_2');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_RUSSIA2_ATLAS', 			256, 		'Pogost2Picture_256.dds',			1, 				1),
			('BUILDING_RUSSIA2_ATLAS', 			128, 		'Pogost2Picture_128.dds',			1, 				1),
			('BUILDING_RUSSIA2_ATLAS', 			64, 		'Pogost2Picture_064.dds',			1, 				1),
			('BUILDING_RUSSIA2_ATLAS', 			45, 		'Pogost2Picture_045.dds',			1, 				1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,						BuildingClass,						CivilizationRequired,	CityConnectionTradeRouteModifier,	GoldMaintenance, Cost,	FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech,		ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier,	Help,									Description,						IconAtlas,					PortraitIndex)
SELECT		'BUILDING_RUSSIA_POGOST_2',	'BUILDINGCLASS_RUSSIA_POGOST_2',	'CIVILIZATION_RUSSIA',	5,									0,				-1,		-1,			EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, 'TECH_BANKING',	ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_RUSSIA_POGOST_2_HELP',	'TXT_KEY_BUILDING_RUSSIA_POGOST_2',	'BUILDING_RUSSIA2_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_MINT';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,					Flavor)
VALUES		('BUILDING_RUSSIA_POGOST_2',	'FLAVOR_GOLD',				50),
			('BUILDING_RUSSIA_POGOST_2',	'FLAVOR_SCIENCE',			5);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
VALUES	('BUILDING_RUSSIA_POGOST_2',	'BUILDINGCLASS_MINT');
------------------------------	
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_RUSSIA_POGOST_2',	'YIELD_SCIENCE',	2);
--==========================================================================================================================
--==========================================================================================================================

