--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType,		BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_EGYPT', 'BUILDINGCLASS_WATERMILL',	'BUILDING_EGYPT_NILOMETER'),
		('CIVILIZATION_EGYPT', 'BUILDINGCLASS_WELL',	null);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------	
-- Buildings
--------------------------------	
INSERT INTO	Buildings
		(Type,				Description,				Civilopedia,					Strategy,					Help,						River,	MutuallyExclusiveGroup,	GoldMaintenance, 	Cost, HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas,		GreatWorkYieldType)
SELECT		'BUILDING_EGYPT_NILOMETER',	'TXT_KEY_BUILDING_EGYPT_NILOMETER',	'TXT_KEY_CIV5_BUILDINGS_NILOMETER_TEXT',	'TXT_KEY_BUILDING_EGYPT_NILOMETER_STRATEGY',	'TXT_KEY_BUILDING_EGYPT_NILOMETER_HELP',	0,	MutuallyExclusiveGroup,	0, 			Cost, HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, PrereqTech, 2,		'BUILDING_EGYPT_ATLAS',	GreatWorkYieldType
FROM Buildings WHERE Type = 'BUILDING_WATERMILL';
--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType,				BuildingClassType)
SELECT		'BUILDING_EGYPT_NILOMETER', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_WATERMILL';
--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,					FlavorType,				Flavor)
VALUES		('BUILDING_EGYPT_NILOMETER',	'FLAVOR_GROWTH',		50),
			('BUILDING_EGYPT_NILOMETER',	'FLAVOR_PRODUCTION',	50),
			('BUILDING_EGYPT_NILOMETER',	'FLAVOR_GOLD',			20),
			('BUILDING_EGYPT_NILOMETER',	'FLAVOR_CULTURE',		20);
--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges
			(BuildingType,				YieldType, Yield)
SELECT		'BUILDING_EGYPT_NILOMETER',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_WATERMILL';

INSERT INTO Building_YieldChanges
			(BuildingType,					YieldType,			Yield)
VALUES		('BUILDING_EGYPT_NILOMETER',	'YIELD_CULTURE',	1);
--------------------------------	
-- Building_YieldChangesPerPop
--------------------------------	
INSERT INTO Building_YieldChangesPerPop
			(BuildingType,					YieldType,			Yield)
VALUES		('BUILDING_EGYPT_NILOMETER',	'YIELD_PRODUCTION', 40);
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_EGYPT_ATLAS', 			256, 		'BuildingPortraits256_DLC_WonderPack.dds',		2, 				2),
			('BUILDING_EGYPT_ATLAS', 			128, 		'BuildingPortraits128_DLC_WonderPack.dds',		2, 				2),
			('BUILDING_EGYPT_ATLAS', 			64, 		'BuildingPortraits64_DLC_WonderPack.dds',		2, 				2),
			('BUILDING_EGYPT_ATLAS', 			45, 		'BuildingPortraits45_DLC_WonderPack.dds',		2, 				2);
--==========================================================================================================================
--==========================================================================================================================
