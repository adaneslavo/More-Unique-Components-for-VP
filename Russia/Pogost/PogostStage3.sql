--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,								DefaultBuilding)
VALUES		('BUILDINGCLASS_RUSSIA_POGOST_3',	'BUILDING_RUSSIA_POGOST_3');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_RUSSIA3_ATLAS', 			256, 		'Pogost3Picture_256.dds',			1, 				1),
			('BUILDING_RUSSIA3_ATLAS', 			128, 		'Pogost3Picture_128.dds',			1, 				1),
			('BUILDING_RUSSIA3_ATLAS', 			64, 		'Pogost3Picture_064.dds',			1, 				1),
			('BUILDING_RUSSIA3_ATLAS', 			45, 		'Pogost3Picture_045.dds',			1, 				1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,						BuildingClass,						CivilizationRequired,	GoldMaintenance, Cost,	FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech,			ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier,	Help,									Description,						IconAtlas,					PortraitIndex)
SELECT		'BUILDING_RUSSIA_POGOST_3',	'BUILDINGCLASS_RUSSIA_POGOST_3',	'CIVILIZATION_RUSSIA',	0,				-1,		-1,			EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, 'TECH_ARCHITECTURE', ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_RUSSIA_POGOST_3_HELP',	'TXT_KEY_BUILDING_RUSSIA_POGOST_3',	'BUILDING_RUSSIA3_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_MINT';
------------------------------	
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_RUSSIA_POGOST_2',	'YIELD_FAITH',	2);
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,					Flavor)
VALUES		('BUILDING_RUSSIA_POGOST_3',	'FLAVOR_RELIGION',			50);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
VALUES	('BUILDING_RUSSIA_POGOST_3',	'BUILDINGCLASS_RUSSIA_POGOST_2');
------------------------------	
-- Building_BuildingClassLocalYieldChanges
------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges 	
			(BuildingType,					BuildingClassType,		YieldType,		YieldChange)
VALUES		('BUILDING_RUSSIA_POGOST_3',	'BUILDINGCLASS_MONASTERY',	'YIELD_FAITH',	2),
			('BUILDING_RUSSIA_POGOST_3',	'BUILDINGCLASS_SHRINE',	'YIELD_FAITH',	2),
			('BUILDING_RUSSIA_POGOST_3',	'BUILDINGCLASS_TEMPLE',	'YIELD_FAITH',	2);
--==========================================================================================================================
--==========================================================================================================================

