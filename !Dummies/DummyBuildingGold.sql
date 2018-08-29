--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,						DefaultBuilding,			NoLimit)
VALUES		('BUILDINGCLASS_DUMMYGOLD',	'BUILDING_DUMMYGOLD',		1),
		('BUILDINGCLASS_DUMMYCOURTHOUSEGOLD',	'BUILDING_DUMMYCOURTHOUSEGOLD',		1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,					BuildingClass,			Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex)
VALUES		('BUILDING_DUMMYGOLD',	'BUILDINGCLASS_DUMMYGOLD',	'TXT_KEY_BUILDING_DUMMYGOLD',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0),
		('BUILDING_DUMMYCOURTHOUSEGOLD', 'BUILDINGCLASS_DUMMYCOURTHOUSEGOLD',	'TXT_KEY_BUILDING_DUMMYGOLD',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0);

------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 			YieldType,		Yield)
VALUES		('BUILDING_DUMMYGOLD',	'YIELD_GOLD',	1);
------------------------------	
-- Building_BuildingClassLocalYieldChanges
------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges
			(BuildingType,					BuildingClassType,		YieldType,		YieldChange)
VALUES		('BUILDING_DUMMYCOURTHOUSEGOLD',	'BUILDINGCLASS_COURTHOUSE', 'YIELD_GOLD',	1);

--==========================================================================================================================
--==========================================================================================================================
