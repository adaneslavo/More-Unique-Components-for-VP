--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType,		BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_EGYPT', 'BUILDINGCLASS_WATERMILL',	'BUILDING_VP_NILOMETER');
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------	
-- Buildings
--------------------------------	
INSERT INTO	Buildings
			(Type,						Description,						Civilopedia,								Strategy,									Help,									River,	MutuallyExclusiveGroup,	GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas,						GreatWorkYieldType)
SELECT		'BUILDING_VP_NILOMETER',	'TXT_KEY_BUILDING_VP_NILOMETER',	'TXT_KEY_CIV5_BUILDINGS_NILOMETER_TEXT',	'TXT_KEY_BUILDING_VP_NILOMETER_STRATEGY',	'TXT_KEY_BUILDING_VP_NILOMETER_HELP',	0,		-1,						GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, PrereqTech, 2,				'WONDER_BUILDING_ATLAS_3UC',	GreatWorkYieldType
FROM Buildings WHERE Type = 'BUILDING_WATERMILL';
--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType, BuildingClassType)
SELECT		'BUILDING_VP_NILOMETER', BuildingClassType
FROM		Building_ClassesNeededInCity
WHERE		BuildingType = 'BUILDING_WATERMILL';
--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,				FlavorType,				Flavor)
VALUES		('BUILDING_VP_NILOMETER',	'FLAVOR_GROWTH',		50),
			('BUILDING_VP_NILOMETER',	'FLAVOR_PRODUCTION',	50),
			('BUILDING_VP_NILOMETER',	'FLAVOR_GOLD',			20),
			('BUILDING_VP_NILOMETER',	'FLAVOR_CULTURE',		20);
--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges
			(BuildingType,				YieldType, Yield)
SELECT		'BUILDING_VP_NILOMETER',	YieldType, Yield
FROM	Building_YieldChanges
WHERE		BuildingType = 'BUILDING_WATERMILL';

INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_VP_NILOMETER', 'YIELD_CULTURE', 2);
--------------------------------	
-- Building_YieldChangesPerPop
--------------------------------	
INSERT INTO Building_YieldChangesPerPop
			(BuildingType,				YieldType,			Yield)
VALUES		('BUILDING_VP_NILOMETER',	'YIELD_PRODUCTION', 40);
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES		('WONDER_BUILDING_ATLAS_3UC', 			128, 		'BuildingPortraits128_DLC_WonderPack.dds',		2, 				2),
			('WONDER_BUILDING_ATLAS_3UC', 			64, 		'BuildingPortraits64_DLC_WonderPack.dds',		2, 				2),
			('WONDER_BUILDING_ATLAS_3UC', 			45, 		'BuildingPortraits45_DLC_WonderPack.dds',		2, 				2);
--==========================================================================================================================
--==========================================================================================================================