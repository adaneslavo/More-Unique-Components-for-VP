--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,			NoLimit)
VALUES		('BUILDINGCLASS_DUMMYFAITH',	'BUILDING_DUMMYFAITH',		1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,					BuildingClass,				Description,					GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex)
VALUES		('BUILDING_DUMMYFAITH',	'BUILDINGCLASS_DUMMYFAITH',	'TXT_KEY_BUILDING_DUMMYFAITH',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 			YieldType,		Yield)
VALUES		('BUILDING_DUMMYFAITH',	'YIELD_FAITH',	1);
--==========================================================================================================================
--==========================================================================================================================
