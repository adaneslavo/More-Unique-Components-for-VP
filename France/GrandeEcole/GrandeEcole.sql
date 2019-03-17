--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_FRANCE',	'BUILDINGCLASS_PUBLIC_SCHOOL',	'BUILDING_FRANCE_GRANDE_ECOLE');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_FRANCE_ATLAS', 			256, 		'GrandeEcolePicture_256.dds',			1, 				1),
			('BUILDING_FRANCE_ATLAS', 			128, 		'GrandeEcolePicture_128.dds',			1, 				1),
			('BUILDING_FRANCE_ATLAS', 			64, 		'GrandeEcolePicture_064.dds',			1, 				1),
			('BUILDING_FRANCE_ATLAS', 			45, 		'GrandeEcolePicture_045.dds',			1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,	GoldMaintenance,	Cost, FaithCost,	UnlockedByBelief,	EnhancedYieldTech,	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, IlliteracyHappinessChange, GreatPeopleRateChange, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	Help,											Description,							Civilopedia,									Strategy,											IconAtlas,					PortraitIndex)
SELECT		'BUILDING_FRANCE_GRANDE_ECOLE',	BuildingClass,	GoldMaintenance+1,	Cost, FaithCost,	UnlockedByBelief,	'TECH_COMPUTERS',	TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, IlliteracyHappinessChange, GreatPeopleRateChange, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_HELP',	'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE', 'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_TEXT',	'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_STRATEGY',	'BUILDING_FRANCE_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_PUBLIC_SCHOOL';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,					Flavor)
VALUES		('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_GREAT_PEOPLE',			10),
			('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_PRODUCTION',			80),
			('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_CULTURE',				10),
			('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_SCIENCE',				100);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						YieldType,			Yield)
VALUES		('BUILDING_FRANCE_GRANDE_ECOLE',	'YIELD_CULTURE',	1),
			('BUILDING_FRANCE_GRANDE_ECOLE',	'YIELD_PRODUCTION',	5),
			('BUILDING_FRANCE_GRANDE_ECOLE',	'YIELD_SCIENCE',	5);
------------------------------	
-- Building_YieldChangesPerPop
------------------------------
INSERT INTO Building_YieldChangesPerPop 	
			(BuildingType,						YieldType,			Yield)
VALUES		('BUILDING_FRANCE_GRANDE_ECOLE',	'YIELD_SCIENCE',	50);
------------------------------	
-- Building_TechEnhancedYieldChanges
------------------------------
--INSERT INTO Building_TechEnhancedYieldChanges 	
--			(BuildingType,						YieldType,			Yield)
--VALUES		('BUILDING_FRANCE_GRANDE_ECOLE',	'YIELD_PRODUCTION',	2),
--			('BUILDING_FRANCE_GRANDE_ECOLE',	'YIELD_SCIENCE',	2);
------------------------------	
-- Building_UnhappinessNeedsFlatReduction
------------------------------
INSERT INTO Building_UnhappinessNeedsFlatReduction 	
			(BuildingType,					YieldType, Yield)
SELECT		'BUILDING_FRANCE_GRANDE_ECOLE', YieldType, Yield
FROM Building_UnhappinessNeedsFlatReduction WHERE (BuildingType = 'BUILDING_PUBLIC_SCHOOL');
------------------------------	
-- Building_SpecialistYieldChangesLocal
------------------------------
INSERT INTO Building_SpecialistYieldChangesLocal 	
			(BuildingType,						SpecialistType,			YieldType,			Yield)
VALUES		('BUILDING_FRANCE_GRANDE_ECOLE',	'SPECIALIST_SCIENTIST',	'YIELD_PRODUCTION',	2),
			('BUILDING_FRANCE_GRANDE_ECOLE',	'SPECIALIST_ENGINEER',	'YIELD_SCIENCE',	2);
--==========================================================================================================================
--==========================================================================================================================

