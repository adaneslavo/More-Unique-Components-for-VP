--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_ENGLAND',	'BUILDINGCLASS_HERMITAGE',		'BUILDING_ENGLAND_WHITE_TOWER');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('BUILDING_ENGLAND_ATLAS', 			256, 		'WhiteTowerPicture_256.dds',			1, 				1),
		('BUILDING_ENGLAND_ATLAS', 			128, 		'WhiteTowerPicture_128.dds',			1, 				1),
		('BUILDING_ENGLAND_ATLAS', 			64, 		'WhiteTowerPicture_064.dds',			1, 				1),
		('BUILDING_ENGLAND_ATLAS', 			45, 		'WhiteTowerPicture_045.dds',			1, 				1);
--==========================================================================================================================

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,				FreeArtifacts, 	FreeGreatWork,					GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,		ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier,	GreatWorkSlotType,	GreatWorkCount,		FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, 		ArtDefineTag, GreatPeopleRateChange,	SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	GlobalEspionageModifier, NationalPopRequired,	NumCityCostMod,	NukeImmune,	Help,											ThemingBonusHelp, 							Description,							Civilopedia,										Strategy,											IconAtlas,						PortraitIndex)
SELECT		'BUILDING_ENGLAND_WHITE_TOWER',	'BUILDINGCLASS_HERMITAGE',	0, 				'GREAT_WORK_THE_CROWN_JEWELS',	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense+500,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier,	GreatWorkSlotType,	GreatWorkCount,		FreshWater, FreeStartEra, Happiness, NeverCapture, 'TECH_BANKING',	ArtDefineTag, GreatPeopleRateChange,	SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	GlobalEspionageModifier, NationalPopRequired-10,	NumCityCostMod,	NukeImmune,	'TXT_KEY_BUILDING_ENGLAND_WHITE_TOWER_HELP',	'TXT_KEY_THEMING_BONUS_WHITE_TOWER_HELP', 	'TXT_KEY_BUILDING_ENGLAND_WHITE_TOWER', 'TXT_KEY_BUILDING_ENGLAND_WHITE_TOWER_TEXT',		'TXT_KEY_BUILDING_ENGLAND_WHITE_TOWER_STRATEGY',	'BUILDING_ENGLAND_ATLAS',		0
FROM Buildings WHERE Type = 'BUILDING_HERMITAGE';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,				Flavor)
VALUES		('BUILDING_ENGLAND_WHITE_TOWER',	'FLAVOR_DEFENSE',		10),
			('BUILDING_ENGLAND_WHITE_TOWER',	'FLAVOR_GOLD',			50),
			('BUILDING_ENGLAND_WHITE_TOWER',	'FLAVOR_GROWTH',		25),
			('BUILDING_ENGLAND_WHITE_TOWER',	'FLAVOR_CULTURE',		100);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						YieldType,			Yield)
VALUES		('BUILDING_ENGLAND_WHITE_TOWER',	'YIELD_CULTURE',	2);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges 	
			(BuildingType,						BuildingClassType,			YieldType,				YieldChange)
VALUES		('BUILDING_ENGLAND_WHITE_TOWER',	'BUILDINGCLASS_CASTLE',		'YIELD_CULTURE',		3),
			('BUILDING_ENGLAND_WHITE_TOWER',	'BUILDINGCLASS_CONSTABLE',	'YIELD_GOLD',		3),
			('BUILDING_ENGLAND_WHITE_TOWER',	'BUILDINGCLASS_THEATRE',	'YIELD_GOLD',			3),
			('BUILDING_ENGLAND_WHITE_TOWER',	'BUILDINGCLASS_ARSENAL',	'YIELD_CULTURE',		3);
------------------------------	
-- Building_BuildingClassLocalYieldChanges
------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges 	
			(BuildingType,						BuildingClassType,			YieldType,				YieldChange)
VALUES		('BUILDING_ENGLAND_WHITE_TOWER',	'BUILDINGCLASS_CONSTABLE',	'YIELD_GOLD',			3),
			('BUILDING_ENGLAND_WHITE_TOWER',	'BUILDINGCLASS_ARSENAL',	'YIELD_FOOD',			3);
------------------------------	
-- Building_YieldChangesPerPop
------------------------------	
INSERT INTO Building_YieldChangesPerPop
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_ENGLAND_WHITE_TOWER', 'YIELD_CULTURE', 25);
------------------------------	
-- Building_ThemingYieldBonus
------------------------------
INSERT INTO Building_ThemingYieldBonus
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_ENGLAND_WHITE_TOWER', 'YIELD_CULTURE', 	5),
			('BUILDING_ENGLAND_WHITE_TOWER', 'YIELD_GOLD',		5);
------------------------------	
-- Building_ThemingBonuses
------------------------------	
INSERT INTO Building_ThemingBonuses	
			(BuildingType,						Description,									Bonus,	RequiresOwner,	RequiresUniquePlayers,	MustBeArtifact,	AIPriority)
VALUES		('BUILDING_ENGLAND_WHITE_TOWER',	'TXT_KEY_THEMING_BONUS_WHITE_TOWER_NATIONAL',	10,		1,				0,						1,				1),
			('BUILDING_ENGLAND_WHITE_TOWER',	'TXT_KEY_THEMING_BONUS_WHITE_TOWER_GLOBAL',		10,		0,				1,						1,				1);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 						BuildingClassType)
VALUES		('BUILDING_ENGLAND_WHITE_TOWER',	'BUILDINGCLASS_CASTLE');
--==========================================================================================================================

--==========================================================================================================================	
-- GREAT WORKS
--==========================================================================================================================	
------------------------------
-- GreatWorks																																	
------------------------------	
INSERT INTO GreatWorks 
			(Type, 							GreatWorkClassType,		ArtifactClassType,	Description,								Quote,												Audio,	Image)
VALUES		('GREAT_WORK_THE_CROWN_JEWELS', 'GREAT_WORK_ARTIFACT',	'ARTIFACT_CROWN',	'TXT_KEY_GREAT_WORK_THE_CROWN_JEWELS',		'TXT_KEY_GREAT_WORK_THE_CROWN_JEWELS_QUOTE',		null,	'TheJewelSplash.dds');
------------------------------
-- GreatWorkArtifactClasses																																	
------------------------------	
INSERT INTO GreatWorkArtifactClasses
			(Type, 				Value)
VALUES		('ARTIFACT_CROWN',	8);
--==========================================================================================================================
--==========================================================================================================================
