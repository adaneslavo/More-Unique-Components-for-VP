--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,										DefaultBuilding,						NoLimit)
VALUES		('BUILDINGCLASS_DUMMYDEFENSEHPPROMOTION',	'BUILDING_DUMMYDEFENSEHPPROMOTION',		1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,									BuildingClass,								Description,								GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Defense,	ExtraCityHitPoints,	TrainedFreePromotion)
VALUES		('BUILDING_DUMMYDEFENSEHPPROMOTION',	'BUILDINGCLASS_DUMMYDEFENSEHPPROMOTION',	'TXT_KEY_BUILDING_DUMMYDEFENSEHPPROMOTION', 0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				500,		50,					'PROMOTION_MORALE');
--==========================================================================================================================
--==========================================================================================================================
