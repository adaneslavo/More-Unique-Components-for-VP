--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,				NoLimit)
VALUES		('BUILDINGCLASS_DUMMYCULTURE',	'BUILDINGCLASS_DUMMYCULTURE',	1),
		('BUILDINGCLASS_DUMMYCASTLECULTURE',	'BUILDING_DUMMYCASTLECULTURE',	1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex)
VALUES		('BUILDING_DUMMYCULTURE',	'BUILDINGCLASS_DUMMYCULTURE',	'TXT_KEY_BUILDING_DUMMYCULTURE',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0),
		('BUILDING_DUMMYCASTLECULTURE',	'BUILDINGCLASS_DUMMYCASTLECULTURE',	'TXT_KEY_BUILDING_DUMMYCULTURE',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0);

------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 				YieldType,			Yield)
VALUES		('BUILDING_DUMMYCULTURE',	'YIELD_CULTURE',	1);
--==========================================================================================================================
--==========================================================================================================================
------------------------------	
-- Building_BuildingClassLocalYieldChanges
------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges
			(BuildingType,					BuildingClassType,		YieldType,		YieldChange)
VALUES		('BUILDING_DUMMYCASTLECULTURE',	'BUILDINGCLASS_CASTLE', 'YIELD_CULTURE',	1);
