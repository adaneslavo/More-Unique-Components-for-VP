--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------
INSERT INTO	Civilization_BuildingClassOverrides
(CivilizationType,						BuildingClassType,		BuildingType)
VALUES		('CIVILIZATION_AMERICA',	'BUILDINGCLASS_STABLE', 'BUILDING_AMERICA_RANCH');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
--------------------------------
-- IconTextureAtlases
--------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 				IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES	('UNIT_AMERICA_ATLAS', 	256, 		'RanchPicture_256.dds',		1, 				1),
		('UNIT_AMERICA_ATLAS', 	128, 		'RanchPicture_128.dds',		1, 				1),
		('UNIT_AMERICA_ATLAS', 	45, 		'RanchPicture_045.dds',		1, 				1),
		('UNIT_AMERICA_ATLAS', 	64, 		'RanchPicture_064.dds',		1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------
-- Buildings
--------------------------------
INSERT INTO	Buildings
			(Type,						Description,						Civilopedia,							Strategy,									Help,									GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas,				GreatWorkYieldType, CitySupplyModifier, PlotCultureCostModifier)
SELECT		'BUILDING_AMERICA_RANCH',	'TXT_KEY_BUILDING_AMERICA_RANCH',	'TXT_KEY_BUILDING_AMERICA_RANCH_TEXT',	'TXT_KEY_BUILDING_AMERICA_RANCH_STRATEGY',	'TXT_KEY_BUILDING_AMERICA_RANCH_HELP',	GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,BuildingClass, ArtDefineTag, PrereqTech, 0,				'UNIT_AMERICA_ATLAS', GreatWorkYieldType, CitySupplyModifier, PlotCultureCostModifier-25
FROM Buildings WHERE Type = 'BUILDING_STABLE';
--------------------------------
-- Building_Flavors
--------------------------------
INSERT INTO	Building_Flavors
			(BuildingType,				FlavorType,					Flavor)
VALUES		('BUILDING_AMERICA_RANCH', 'FLAVOR_MILITARY_TRAINING',	10),
			('BUILDING_AMERICA_RANCH', 'FLAVOR_MOBILE',				10),
			('BUILDING_AMERICA_RANCH', 'FLAVOR_PRODUCTION',			35),
			('BUILDING_AMERICA_RANCH', 'FLAVOR_GROWTH',				40),
			('BUILDING_AMERICA_RANCH', 'FLAVOR_EXPANSION',			50);
--------------------------------
-- Building_ResourceYieldChanges
--------------------------------
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				ResourceType, YieldType, Yield)
SELECT		'BUILDING_AMERICA_RANCH',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_STABLE';

INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				ResourceType,		YieldType,				Yield)
VALUES		('BUILDING_AMERICA_RANCH',	'RESOURCE_HORSE',	'YIELD_FOOD',			2),
			('BUILDING_AMERICA_RANCH',	'RESOURCE_HORSE',	'YIELD_GOLD',			2),
			('BUILDING_AMERICA_RANCH',	'RESOURCE_COW',		'YIELD_FOOD',			2),
			('BUILDING_AMERICA_RANCH',	'RESOURCE_COW',		'YIELD_GOLD',			2),
			('BUILDING_AMERICA_RANCH',	'RESOURCE_SHEEP',	'YIELD_FOOD',			2),
			('BUILDING_AMERICA_RANCH',	'RESOURCE_SHEEP',	'YIELD_GOLD',			2),
			('BUILDING_AMERICA_RANCH',	'RESOURCE_BISON',	'YIELD_PRODUCTION',		2),
			('BUILDING_AMERICA_RANCH',	'RESOURCE_BISON',	'YIELD_FOOD',			2),
			('BUILDING_AMERICA_RANCH',	'RESOURCE_BISON',	'YIELD_GOLD',			2);
--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType,				YieldType, Yield)
SELECT		'BUILDING_AMERICA_RANCH',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_STABLE';
--------------------------------
-- Building_UnitCombatProductionModifiers
--------------------------------
INSERT INTO Building_UnitCombatProductionModifiers
			(BuildingType,				UnitCombatType,			Modifier)
VALUES		('BUILDING_AMERICA_RANCH',	'UNITCOMBAT_MOUNTED',	33);
--==========================================================================================================================
--==========================================================================================================================