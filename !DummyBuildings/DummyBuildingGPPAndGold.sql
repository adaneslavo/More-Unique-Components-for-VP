--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,									DefaultBuilding,					NoLimit)
VALUES		('BUILDINGCLASS_DUMMYGPPANDGOLD',	'BUILDING_DUMMYGPPANDGOLD',		1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,						Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	GreatPeopleRateModifier)
VALUES		('BUILDING_DUMMYGPPANDGOLD',	'BUILDINGCLASS_DUMMYGPPANDGOLD',	'TXT_KEY_BUILDING_DUMMYGPPANDGOLD',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				2);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 				YieldType,			Yield)
VALUES		('BUILDING_DUMMYGPPANDGOLD',	'YIELD_GOLD',	1);
--==========================================================================================================================
--==========================================================================================================================
