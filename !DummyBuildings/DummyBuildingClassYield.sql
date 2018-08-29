--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,										DefaultBuilding,					NoLimit)
VALUES		('BUILDINGCLASS_DUMMYCLASSYIELD',			'BUILDING_DUMMYCLASSYIELD',			1),
			('BUILDINGCLASS_DUMMYSONGHAICLASSYIELD',	'BUILDING_DUMMYSONGHAICLASSYIELD',	1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,								BuildingClass,							Description,								TradeRouteRecipientBonus, 	TradeRouteTargetBonus, GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex)
VALUES		('BUILDING_DUMMYCLASSYIELD',		'BUILDINGCLASS_DUMMYCLASSYIELD',		'TXT_KEY_BUILDING_DUMMYCLASSYIELD',			0, 							0, 						0,				-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0),
			('BUILDING_DUMMYSONGHAICLASSYIELD',	'BUILDINGCLASS_DUMMYSONGHAICLASSYIELD',	'TXT_KEY_BUILDING_DUMMYSONGHAICLASSYIELD',	2, 							2, 						0,				-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType,						BuildingClassType,					YieldType,			YieldChange)
VALUES		('BUILDING_DUMMYCLASSYIELD',		'BUILDINGCLASS_OXFORD_UNIVERSITY',	'YIELD_GOLD',		2),
			('BUILDING_DUMMYCLASSYIELD',		'BUILDINGCLASS_OXFORD_UNIVERSITY',	'YIELD_PRODUCTION',	2),
			('BUILDING_DUMMYSONGHAICLASSYIELD',	'BUILDINGCLASS_CARAVANSARY',		'YIELD_CULTURE',	2),
			('BUILDING_DUMMYSONGHAICLASSYIELD',	'BUILDINGCLASS_CARAVANSARY',		'YIELD_PRODUCTION',	2);
--==========================================================================================================================
--==========================================================================================================================