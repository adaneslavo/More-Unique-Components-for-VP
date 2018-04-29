--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
------------------------------
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses
			(Type,								DefaultBuilding,				NoLimit)
VALUES		('BUILDINGCLASS_DUMMYHORSEYIELDS',	'BUILDING_DUMMYHORSEYIELDS',	1);
--==========================================================================================================================

--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings
			(Type,							BuildingClass,						Description,							GoldMaintenance,	Cost, FaithCost,	GreatWorkCount, NeverCapture,  NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex)
VALUES		('BUILDING_DUMMYHORSEYIELDS',	'BUILDINGCLASS_DUMMYHORSEYIELDS',	'TXT_KEY_BUILDING_DUMMYHORSEYIELDS',	0,					-1,   -1,			-1,				1,             1,          0,				-1,					'CIV_COLOR_ATLAS',	0);
------------------------------
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					ResourceType,     YieldType,			Yield)
VALUES		('BUILDING_DUMMYHORSEYIELDS',	'RESOURCE_HORSE', 'YIELD_CULTURE',		1),
			('BUILDING_DUMMYHORSEYIELDS',	'RESOURCE_HORSE', 'YIELD_GOLD',			1);
--==========================================================================================================================
--==========================================================================================================================
