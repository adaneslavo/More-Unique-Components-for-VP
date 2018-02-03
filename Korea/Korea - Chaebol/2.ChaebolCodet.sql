INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('CHAEBOL_ATLAS', 		256, 		'Chaebol_Isolated_256.dds',		1, 				1),
		('CHAEBOL_ATLAS', 		128, 		'Chaebol_Isolated_128.dds',		1, 				1),
		('CHAEBOL_ATLAS', 		80, 		'Chaebol_Isolated_80.dds',		1, 				1),
		('CHAEBOL_ATLAS', 		64, 		'Chaebol_Isolated_64.dds',		1, 				1),
		('CHAEBOL_ATLAS', 		45, 		'Chaebol_Isolated_45.dds',		1, 				1),
		('CHAEBOL_ATLAS', 		32, 		'Chaebol_Isolated_32.dds',		1,				1);

--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_KOREA',	'BUILDINGCLASS_STOCK_EXCHANGE',	'BUILDING_C15_SKOREA_CHAEBOL');
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,	GoldMaintenance,	Cost, FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, IlliteracyHappinessChange,		GreatPeopleRateChange,	SpecialistType,			SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	Help,											Description,							Civilopedia,									Strategy,											IconAtlas,					PortraitIndex)
SELECT		'BUILDING_C15_SKOREA_CHAEBOL',	BuildingClass,	GoldMaintenance,	Cost, FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, IlliteracyHappinessChange,	GreatPeopleRateChange,	SpecialistType,			SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_C15_SKOREA_CHAEBOL_HELP',	'TXT_KEY_BUILDING_C15_SKOREA_CHAEBOL', 'TXT_KEY_BUILDING_C15_SKOREA_CHAEBOL_PEDIA',	'TXT_KEY_BUILDING_C15_SKOREA_CHAEBOL_STRATEGY',	'CHAEBOL_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_STOCK_EXCHANGE';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,					Flavor)
VALUES		('BUILDING_C15_SKOREA_CHAEBOL',	'FLAVOR_GOLD',					90),
			('BUILDING_C15_SKOREA_CHAEBOL',	'FLAVOR_GREAT_PEOPLE',			10),
			('BUILDING_C15_SKOREA_CHAEBOL',	'FLAVOR_PRODUCTION',			50),
			('BUILDING_C15_SKOREA_CHAEBOL',	'FLAVOR_CULTURE',				30),
			('BUILDING_C15_SKOREA_CHAEBOL',	'FLAVOR_SCIENCE',				30);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_C15_SKOREA_CHAEBOL',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE';


------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_C15_SKOREA_CHAEBOL',	'YIELD_GOLD',		5)
			('BUILDING_C15_SKOREA_CHAEBOL',	'YIELD_PRODUCTION',	3);


------------------------------	
-- Building_YieldChangesPerPop
------------------------------
INSERT INTO Building_YieldChangesPerPop 	
			(BuildingType,						YieldType,			Yield)
SELECT	'BUILDING_C15_SKOREA_CHAEBOL',	YieldType, Yield
FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE';

INSERT INTO Building_HurryModifiersLocal
	(BuildingType, HurryType, HurryCostModifier)
SELECT	'BUILDING_C15_SKOREA_CHAEBOL',	HurryType, HurryCostModifier
FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE';

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_C15_SKOREA_CHAEBOL', 'BUILDINGCLASS_FACTORY', 'YIELD_PRODUCTION', 3),

INSERT INTO Building_BuildingClassYieldChanges 
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_C15_SKOREA_CHAEBOL', 'BUILDINGCLASS_STOCK_EXCHANGE', 'YIELD_GOLD', 		2),
	('BUILDING_C15_SKOREA_CHAEBOL', 'BUILDINGCLASS_STOCK_EXCHANGE', 'YIELD_CULTURE', 	2),
	('BUILDING_C15_SKOREA_CHAEBOL', 'BUILDINGCLASS_STOCK_EXCHANGE', 'YIELD_SCIENCE', 	2);