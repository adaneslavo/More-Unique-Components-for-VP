INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 		IconsPerRow, 	IconsPerColumn)
VALUES	('INTIHUATANA_ATLAS', 		256, 		'INTIHUATANA_256.dds',		2, 				1),
		('INTIHUATANA_ATLAS', 		128, 		'INTIHUATANA_128.dds',		2, 				1),
		('INTIHUATANA_ATLAS', 		80, 		'INTIHUATANA_80.dds',		2, 				1),
		('INTIHUATANA_ATLAS', 		64, 		'INTIHUATANA_64.dds',		2, 				1),
		('INTIHUATANA_ATLAS', 		45, 		'INTIHUATANA_45.dds',		2, 				1),
		('INTIHUATANA_ATLAS', 		32, 		'INTIHUATANA_32.dds',		2,				1);

--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_INCA',	'BUILDINGCLASS_OBSERVATORY',	'BUILDING_4UC_INTIHUATANA');
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,	GoldMaintenance,	Cost, 	FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, 		ArtDefineTag, IlliteracyHappinessChange,	GreatPeopleRateChange,	SpecialistType,			SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	Help,										Description,						Civilopedia,								Strategy,										IconAtlas,				PortraitIndex)
SELECT		'BUILDING_4UC_INTIHUATANA',		BuildingClass,	0,					300, 	FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, 'TECH_THEOLOGY', 	ArtDefineTag, IlliteracyHappinessChange,	GreatPeopleRateChange,	SpecialistType,			SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_4UC_INTIHUATANA_HELP',	'TXT_KEY_BUILDING_4UC_INTIHUATANA', 'TXT_KEY_BUILDING_4UC_INTIHUATANA_TEXT',	'TXT_KEY_BUILDING_4UC_INTIHUATANA_STRATEGY',	'INTIHUATANA_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDINGCLASS_OBSERVATORY';	

INSERT INTO Buildings 	
			(Type,							BuildingClass,	GoldMaintenance,	Cost, 	FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, 		ArtDefineTag, IlliteracyHappinessChange,	GreatPeopleRateChange,	SpecialistType,			SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	Help,										Description,						Civilopedia,								Strategy,										IconAtlas,				PortraitIndex)
SELECT		'BUILDING_4UC_INTIHUATANA_2',	BuildingClass,	0,					300, 	FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, 'TECH_THEOLOGY', 	ArtDefineTag, IlliteracyHappinessChange,	GreatPeopleRateChange,	SpecialistType,			SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_4UC_INTIHUATANA_2_HELP',	'TXT_KEY_BUILDING_4UC_INTIHUATANA_2', 'TXT_KEY_BUILDING_4UC_INTIHUATANA_2_TEXT',	'TXT_KEY_BUILDING_4UC_INTIHUATANA_2_STRATEGY',	'INTIHUATANA_ATLAS',	1
FROM Buildings WHERE Type = 'BUILDINGCLASS_OBSERVATORY';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,					Flavor)
VALUES		('BUILDING_4UC_INTIHUATANA',	'FLAVOR_RELIGION',				20),
			('BUILDING_4UC_INTIHUATANA',	'FLAVOR_GREAT_PEOPLE',			20),
			('BUILDING_4UC_INTIHUATANA',	'FLAVOR_GROWTH',				50),
			('BUILDING_4UC_INTIHUATANA',	'FLAVOR_SCIENCE',				50),
			('BUILDING_4UC_INTIHUATANA', 	'FLAVOR_SPACESHIP', 			10),
			('BUILDING_4UC_INTIHUATANA_2',	'FLAVOR_RELIGION',				20),
			('BUILDING_4UC_INTIHUATANA_2',	'FLAVOR_GREAT_PEOPLE',			20),
			('BUILDING_4UC_INTIHUATANA_2',	'FLAVOR_GROWTH',				50),
			('BUILDING_4UC_INTIHUATANA_2',	'FLAVOR_SCIENCE',				50),
			('BUILDING_4UC_INTIHUATANA_2', 	'FLAVOR_SPACESHIP', 			10);

------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_4UC_INTIHUATANA',	'YIELD_SCIENCE',	2),
			('BUILDING_4UC_INTIHUATANA',	'YIELD_FAITH',		2),
			('BUILDING_4UC_INTIHUATANA_2',	'YIELD_SCIENCE',	6),
			('BUILDING_4UC_INTIHUATANA_2',	'YIELD_FAITH',		2);
			

INSERT INTO Building_YieldPerXTerrainTimes100
		(BuildingType, 				TerrainType, 		YieldType, 			Yield)
VALUES	('BUILDING_4UC_INTIHUATANA', 'TERRAIN_MOUNTAIN', 'YIELD_SCIENCE', 	200),
		('BUILDING_4UC_INTIHUATANA', 'TERRAIN_MOUNTAIN', 'YIELD_FOOD', 		200),
		('BUILDING_4UC_INTIHUATANA_2', 'TERRAIN_MOUNTAIN', 'YIELD_SCIENCE', 	200),
		('BUILDING_4UC_INTIHUATANA_2', 'TERRAIN_MOUNTAIN', 'YIELD_FOOD', 		200);
			
INSERT INTO Building_SpecialistYieldChanges 	
			(BuildingType, 					SpecialistType, 		YieldType,			Yield)
VALUES		('BUILDING_4UC_INTIHUATANA',	'SPECIALIST_SCIENTIST', 'YIELD_FAITH',		1),
			('BUILDING_4UC_INTIHUATANA_2',	'SPECIALIST_SCIENTIST', 'YIELD_FAITH',		1);
