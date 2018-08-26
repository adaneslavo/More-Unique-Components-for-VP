--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,										DefaultBuilding,						NoLimit)
VALUES		('BUILDINGCLASS_DUMMYGPPGOLDANDCULTURE',	'BUILDING_DUMMYGPPGOLDANDCULTURE',		1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,								BuildingClass,							Description,								GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	GreatPeopleRateChange,	SpecialistType)
VALUES		('BUILDING_DUMMYGPPGOLDANDCULTURE',	'BUILDINGCLASS_DUMMYGPPGOLDANDCULTURE',	'TXT_KEY_BUILDING_DUMMYGPPGOLDANDCULTURE',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				2,						'SPECIALIST_MERCHANT');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 			YieldType,			Yield)
VALUES		('BUILDING_DUMMYGOLD',	'YIELD_GOLD',		2),
			('BUILDING_DUMMYGOLD',	'YIELD_CULTURE',	2);
--==========================================================================================================================
--==========================================================================================================================
