--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,				NoLimit)
VALUES		('BUILDINGCLASS_DUMMYDEFENSE',	'BUILDING_DUMMYDEFENSE',		1),
		('BUILDINGCLASS_DUMMY_1_DEFENSE',	'BUILDING_DUMMY_1_DEFENSE',		1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,					GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Defense)
VALUES		('BUILDING_DUMMYDEFENSE',	'BUILDINGCLASS_DUMMYDEFENSE',	'TXT_KEY_BUILDING_DUMMYDEFENSE', 0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				500),
		('BUILDING_DUMMY_1_DEFENSE',	'BUILDINGCLASS_DUMMY_1_DEFENSE',	'TXT_KEY_BUILDING_DUMMY_1_DEFENSE', 0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				100);			
--==========================================================================================================================
--==========================================================================================================================
