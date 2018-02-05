--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,									DefaultBuilding,						NoLimit)
VALUES		('BUILDINGCLASS_DUMMYEXPANDCLASSYIELD',	'BUILDING_DUMMYEXPANDCLASSYIELD',		1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,								BuildingClass,							Description,								GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex)
VALUES		('BUILDING_DUMMYEXPANDCLASSYIELD',	'BUILDINGCLASS_DUMMYEXPANDCLASSYIELD',	'TXT_KEY_BUILDING_DUMMYEXPANDCLASSYIELD',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType,						BuildingClassType,				YieldType,		YieldChange)
VALUES		('BUILDING_DUMMYEXPANDCLASSYIELD',	'BUILDINGCLASS_GRAND_TEMPLE',	'YIELD_FOOD',	3),
			('BUILDING_DUMMYEXPANDCLASSYIELD',	'BUILDINGCLASS_GRAND_TEMPLE',	'YIELD_FAITH',	3);
------------------------------	
-- Building_DomainFreeExperiences
------------------------------
INSERT INTO Building_DomainFreeExperiences
			(BuildingType,						DomainType,		Experience)
VALUES		('BUILDING_DUMMYEXPANDCLASSYIELD',	'DOMAIN_LAND',	3),
			('BUILDING_DUMMYEXPANDCLASSYIELD',	'DOMAIN_AIR',	3),
			('BUILDING_DUMMYEXPANDCLASSYIELD',	'DOMAIN_SEA',	3);
--==========================================================================================================================
--==========================================================================================================================