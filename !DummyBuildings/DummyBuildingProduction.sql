--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,								DefaultBuilding,				NoLimit)
VALUES		('BUILDINGCLASS_DUMMYPRODUCTION',	'BUILDING_DUMMYPRODUCTION',		1),
		('BUILDINGCLASS_FEITORIADUMMY',		'BUILDING_FEITORIADUMMY',		1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,						Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex)
VALUES		('BUILDING_DUMMYPRODUCTION',	'BUILDINGCLASS_DUMMYPRODUCTION',	'TXT_KEY_BUILDING_DUMMYPRODUCTION',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0),
		('BUILDING_FEITORIADUMMY',	'BUILDINGCLASS_FEITORIADUMMY',	'TXT_KEY_BUILDING_DUMMYPRODUCTION',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_DUMMYPRODUCTION',	'YIELD_PRODUCTION',	1);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType,						BuildingClassType,				YieldType,		YieldChange)
VALUES		('BUILDING_FEITORIADUMMY',	'BUILDINGCLASS_OXFORD_UNIVERSITY',	'YIELD_PRODUCTION',	1),
		('BUILDING_FEITORIADUMMY',	'BUILDINGCLASS_OXFORD_UNIVERSITY',	'YIELD_GOLD',	2);
--==========================================================================================================================
--==========================================================================================================================
