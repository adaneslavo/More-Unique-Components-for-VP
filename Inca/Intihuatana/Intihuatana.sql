--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
	(CivilizationType, 	BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_INCA',	'BUILDINGCLASS_OBSERVATORY',	'BUILDING_INCA_INTIHUATANA');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 		IconSize, 	Filename, 			IconsPerRow, IconsPerColumn)
VALUES		('BUILDING_INCA_ATLAS', 256, 		'IntihuatanaPicture_256.dds',	1, 		1),
		('BUILDING_INCA_ATLAS', 128, 		'IntihuatanaPicture_128.dds',	1, 		1),
		('BUILDING_INCA_ATLAS', 64, 		'IntihuatanaPicture_064.dds',	1, 		1),
		('BUILDING_INCA_ATLAS', 45, 		'IntihuatanaPicture_045.dds',	1, 		1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type,				BuildingClass,	GoldMaintenance,	Cost, 		FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, 	ArtDefineTag, IlliteracyHappinessChange, GreatPeopleRateChange,	SpecialistType,	SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	Help,						Description,				Civilopedia,					Strategy,					IconAtlas,		PortraitIndex)
SELECT		'BUILDING_INCA_INTIHUATANA',	BuildingClass,	0,			Cost-200, 	FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, 'TECH_THEOLOGY', 	ArtDefineTag, IlliteracyHappinessChange, GreatPeopleRateChange,	SpecialistType,	SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_INCA_INTIHUATANA_HELP', 	'TXT_KEY_BUILDING_INCA_INTIHUATANA', 	'TXT_KEY_BUILDING_INCA_INTIHUATANA_TEXT',	'TXT_KEY_BUILDING_INCA_INTIHUATANA_STRATEGY',	'BUILDING_INCA_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_OBSERVATORY';

INSERT INTO Buildings 	
		(Type,				BuildingClass,	GoldMaintenance,	Cost, 		FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, 	ArtDefineTag, IlliteracyHappinessChange, GreatPeopleRateChange,	SpecialistType,	SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	Help,						Description,				Civilopedia,					Strategy,					IconAtlas,		PortraitIndex)
SELECT		'BUILDING_INCA_INTIHUATANA_2',	BuildingClass,	0,			Cost-200, 	FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, 'TECH_THEOLOGY', 	ArtDefineTag, IlliteracyHappinessChange, GreatPeopleRateChange,	SpecialistType,	SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_INCA_INTIHUATANA_HELP',	'TXT_KEY_BUILDING_INCA_INTIHUATANA', 	'TXT_KEY_BUILDING_INCA_INTIHUATANA_TEXT',	'TXT_KEY_BUILDING_INCA_INTIHUATANA_STRATEGY',	'BUILDING_INCA_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_OBSERVATORY';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,		Flavor)
VALUES		('BUILDING_INCA_INTIHUATANA',	'FLAVOR_RELIGION',	20),
		('BUILDING_INCA_INTIHUATANA',	'FLAVOR_GREAT_PEOPLE',	20),
		('BUILDING_INCA_INTIHUATANA',	'FLAVOR_GROWTH',	50),
		('BUILDING_INCA_INTIHUATANA',	'FLAVOR_SCIENCE',	50),
		('BUILDING_INCA_INTIHUATANA', 	'FLAVOR_SPACESHIP', 	10),
		('BUILDING_INCA_INTIHUATANA_2',	'FLAVOR_RELIGION',	20),
		('BUILDING_INCA_INTIHUATANA_2',	'FLAVOR_GREAT_PEOPLE',	20),
		('BUILDING_INCA_INTIHUATANA_2',	'FLAVOR_GROWTH',	50),
		('BUILDING_INCA_INTIHUATANA_2',	'FLAVOR_SCIENCE',	50),
		('BUILDING_INCA_INTIHUATANA_2', 'FLAVOR_SPACESHIP', 	10);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType,		Yield)
VALUES		('BUILDING_INCA_INTIHUATANA',	'YIELD_SCIENCE',	4),
		('BUILDING_INCA_INTIHUATANA',	'YIELD_FAITH',		2),
		('BUILDING_INCA_INTIHUATANA_2',	'YIELD_SCIENCE',	8),
		('BUILDING_INCA_INTIHUATANA_2',	'YIELD_FAITH',		2);
------------------------------	
-- Building_YieldPerXTerrainTimes100
------------------------------
INSERT INTO Building_YieldPerXTerrainTimes100
		(BuildingType, 			TerrainType, 		YieldType, 		Yield)
VALUES		('BUILDING_INCA_INTIHUATANA', 	'TERRAIN_MOUNTAIN', 	'YIELD_SCIENCE', 	200),
		('BUILDING_INCA_INTIHUATANA', 	'TERRAIN_MOUNTAIN', 	'YIELD_FOOD', 		200),
		('BUILDING_INCA_INTIHUATANA_2', 'TERRAIN_MOUNTAIN', 	'YIELD_SCIENCE', 	200),
		('BUILDING_INCA_INTIHUATANA_2', 'TERRAIN_MOUNTAIN', 	'YIELD_FOOD', 		200);
------------------------------	
-- Building_SpecialistYieldChanges
------------------------------			
INSERT INTO Building_SpecialistYieldChanges 	
		(BuildingType, 			SpecialistType, 	YieldType,	Yield)
VALUES		('BUILDING_INCA_INTIHUATANA',	'SPECIALIST_SCIENTIST', 'YIELD_FAITH',	1),
		('BUILDING_INCA_INTIHUATANA_2',	'SPECIALIST_SCIENTIST', 'YIELD_FAITH',	1);
--==========================================================================================================================
--==========================================================================================================================
