--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,				NoLimit)
VALUES		('BUILDINGCLASS_DUMMYCULTURE',	'BUILDINGCLASS_DUMMYCULTURE',	1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex)
VALUES		('BUILDING_DUMMYCULTURE',	'BUILDINGCLASS_DUMMYCULTURE',	'TXT_KEY_BUILDING_DUMMYCULTURE',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 				YieldType,			Yield)
VALUES		('BUILDING_DUMMYCULTURE',	'YIELD_CULTURE',	1);
--==========================================================================================================================
--==========================================================================================================================
