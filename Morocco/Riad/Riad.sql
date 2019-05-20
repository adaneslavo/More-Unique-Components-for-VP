--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType,			BuildingClassType,		BuildingType)
VALUES		('CIVILIZATION_MOROCCO',	'BUILDINGCLASS_GARDEN', 'BUILDING_MAROCCO_RIAD');
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO	Buildings
			(Type,						Description,						Civilopedia,							Strategy,									Help,									GoldMaintenance,	Cost, NoUnhappfromXSpecialists, ResourceDiversityModifier, HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas,					GreatWorkYieldType,	GreatPeopleRateModifier)
SELECT		'BUILDING_MAROCCO_RIAD',	'TXT_KEY_BUILDING_MAROCCO_RIAD',	'TXT_KEY_BUILDING_MAROCCO_RIAD_TEXT',	'TXT_KEY_BUILDING_MAROCCO_RIAD_STRATEGY',	'TXT_KEY_BUILDING_MAROCCO_RIAD_HELP',	0,					Cost, NoUnhappfromXSpecialists, ResourceDiversityModifier, HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, PrereqTech, 0,				'BUILDING_MAROCCO_ATLAS',	GreatWorkYieldType,	GreatPeopleRateModifier
FROM Buildings WHERE Type = 'BUILDING_GARDEN';
--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType,				BuildingClassType)
SELECT		'BUILDING_MAROCCO_RIAD',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_GARDEN';
--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,				FlavorType,					Flavor)
VALUES		('BUILDING_MAROCCO_RIAD',	'FLAVOR_GREAT_PEOPLE',		35),
			('BUILDING_MAROCCO_RIAD',	'FLAVOR_CULTURE',			10),
			('BUILDING_MAROCCO_RIAD',	'FLAVOR_I_TRADE_ORIGIN',	20);
--------------------------------	
-- Building_ResourceYieldChanges
--------------------------------	
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				ResourceType, YieldType, Yield)
SELECT		'BUILDING_MAROCCO_RIAD',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GARDEN';
--------------------------------	
-- Building_FeatureYieldChanges
--------------------------------	
INSERT INTO Building_FeatureYieldChanges
			(BuildingType,				FeatureType,		YieldType,		Yield)
VALUES		('BUILDING_MAROCCO_RIAD',	'FEATURE_OASIS',	'YIELD_GOLD',	3),
			('BUILDING_MAROCCO_RIAD',	'FEATURE_OASIS',	'YIELD_FOOD',	1);
--------------------------------
-- Building_HurryModifiersLocal
--------------------------------
INSERT INTO Building_HurryModifiersLocal
	(BuildingType, HurryType, HurryCostModifier)
VALUES
	('BUILDING_MAROCCO_RIAD', 'HURRY_GOLD', -5);
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_MAROCCO_ATLAS', 				256, 		'RiadPicture_256.dds',				1, 				1),
			('BUILDING_MAROCCO_ATLAS', 				128, 		'RiadPicture_128.dds',				1, 				1),
			('BUILDING_MAROCCO_ATLAS', 				45, 		'RiadPicture_045.dds',				1, 				1),
			('BUILDING_MAROCCO_ATLAS', 				64, 		'RiadPicture_064.dds',				1, 				1);
--==========================================================================================================================
--==========================================================================================================================
