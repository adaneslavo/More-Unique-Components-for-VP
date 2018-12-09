--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
------------------------------	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type,									DefaultBuilding,				NoLimit)
VALUES		('BUILDINGCLASS_D_FOR_HUEY',				'BUILDING_D_FOR_HUEY',			1),
			('BUILDINGCLASS_D_FOR_HIPPODROME',		'BUILDING_D_FOR_HIPPODROME',		1),
			('BUILDINGCLASS_D_FOR_BUFFALO',			'BUILDING_D_FOR_BUFFALO',		1),
			('BUILDINGCLASS_D_FOR_FLAX',			'BUILDING_D_FOR_FLAX',			1),
			('BUILDINGCLASS_D_FOR_DRUIDIC_1',		'BUILDING_D_FOR_DRUIDIC_1',		1),
			('BUILDINGCLASS_D_FOR_DRUIDIC_2',		'BUILDING_D_FOR_DRUIDIC_2',		1),
			('BUILDINGCLASS_D_FOR_DRUIDIC_3',		'BUILDING_D_FOR_DRUIDIC_3',		1),
			('BUILDINGCLASS_D_FOR_DRUIDIC_4',		'BUILDING_D_FOR_DRUIDIC_4',		1),
			('BUILDINGCLASS_D_FOR_OPPIDUM',			'BUILDING_D_FOR_OPPIDUM',		1),
			('BUILDINGCLASS_D_FOR_EXAM',			'BUILDING_D_FOR_EXAM',			1),
			('BUILDINGCLASS_D_FOR_TOWER',			'BUILDING_D_FOR_TOWER',			1),
			('BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',		'BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',			1),
			('BUILDINGCLASS_D_FOR_TEUTONIC',		'BUILDING_D_FOR_TEUTONIC',		1),
			('BUILDINGCLASS_D_FOR_PROXENOS',		'BUILDING_D_FOR_PROXENOS',		1),
			('BUILDINGCLASS_D_FOR_QILA_1',			'BUILDING_D_FOR_QILA_1',		1),
			('BUILDINGCLASS_D_FOR_QILA_2',			'BUILDING_D_FOR_QILA_2',		1),
			('BUILDINGCLASS_D_FOR_SACHEM_1',		'BUILDING_D_FOR_SACHEM_1',		1),
			('BUILDINGCLASS_D_FOR_SACHEM_2',		'BUILDING_D_FOR_SACHEM_2',		1),
			('BUILDINGCLASS_D_FOR_SACHEM_3',		'BUILDING_D_FOR_SACHEM_3',		1),
			('BUILDINGCLASS_D_FOR_SACHEM_4',		'BUILDING_D_FOR_SACHEM_4',		1),
			('BUILDINGCLASS_D_FOR_SACHEM_5',		'BUILDING_D_FOR_SACHEM_5',		1),
			('BUILDINGCLASS_D_FOR_SACHEM_6',		'BUILDING_D_FOR_SACHEM_6',		1),
			('BUILDINGCLASS_D_FOR_CHAEBOL',			'BUILDING_D_FOR_CHAEBOL',		1),
			('BUILDINGCLASS_D_FOR_RIAD',			'BUILDING_D_FOR_RIAD',			1),
			('BUILDINGCLASS_D_FOR_WAAG',			'BUILDING_D_FOR_WAAG',			1),
			('BUILDINGCLASS_D_FOR_FEITORIA',		'BUILDING_D_FOR_FEITORIA',		1),
			('BUILDINGCLASS_D_FOR_BAAN',			'BUILDING_D_FOR_BAAN',			1),
			('BUILDINGCLASS_D_FOR_GUMEY',			'BUILDING_D_FOR_GUMEY',			1),
			('BUILDINGCLASS_D_FOR_GUMEY_LUX',		'BUILDING_D_FOR_GUMEY_LUX',		1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,						Description,							GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex, IsDummy)
VALUES		('BUILDING_D_FOR_BARBICAN',		'BUILDINGCLASS_ARMORY',				'TXT_KEY_BUILDING_D_FOR_BARBICAN',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 0),
			('BUILDING_D_FOR_HUEY',			'BUILDINGCLASS_D_FOR_HUEY',			'TXT_KEY_BUILDING_D_FOR_HUEY',			0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_HIPPODROME',	'BUILDINGCLASS_D_FOR_HIPPODROME',	'TXT_KEY_BUILDING_D_FOR_HIPPODROME',	0,					-1,		-1,			-1,				1,				1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_PROXENOS',		'BUILDINGCLASS_D_FOR_PROXENOS',		'TXT_KEY_BUILDING_D_FOR_PROXENOS',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_BUFFALO',		'BUILDINGCLASS_D_FOR_BUFFALO',		'TXT_KEY_BUILDING_D_FOR_BUFFALO',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_FLAX',			'BUILDINGCLASS_D_FOR_FLAX',		'TXT_KEY_BUILDING_D_FOR_FLAX',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_QILA_2',		'BUILDINGCLASS_D_FOR_QILA_2',		'TXT_KEY_BUILDING_D_FOR_QILA_2',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_SACHEM_1',		'BUILDINGCLASS_D_FOR_SACHEM_1',		'TXT_KEY_BUILDING_D_FOR_SACHEM_1',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_SACHEM_2',		'BUILDINGCLASS_D_FOR_SACHEM_2',		'TXT_KEY_BUILDING_D_FOR_SACHEM_2',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_SACHEM_3',		'BUILDINGCLASS_D_FOR_SACHEM_3',		'TXT_KEY_BUILDING_D_FOR_SACHEM_3',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_SACHEM_4',		'BUILDINGCLASS_D_FOR_SACHEM_4',		'TXT_KEY_BUILDING_D_FOR_SACHEM_4',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_SACHEM_5',		'BUILDINGCLASS_D_FOR_SACHEM_5',		'TXT_KEY_BUILDING_D_FOR_SACHEM_5',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_SACHEM_6',		'BUILDINGCLASS_D_FOR_SACHEM_6',		'TXT_KEY_BUILDING_D_FOR_SACHEM_6',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_FEITORIA',		'BUILDINGCLASS_D_FOR_FEITORIA',		'TXT_KEY_BUILDING_D_FOR_FEITORIA',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_BAAN',			'BUILDINGCLASS_D_FOR_BAAN',			'TXT_KEY_BUILDING_D_FOR_BAAN',			0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_D_FOR_GUMEY_LUX',	'BUILDINGCLASS_D_FOR_GUMEY_LUX',	'TXT_KEY_BUILDING_D_FOR_GUMEY_LUX',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1);

INSERT INTO Buildings 	
			(Type,							BuildingClass,						Description,							GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	GreatPeopleRateChange,	SpecialistType, IsDummy)
VALUES		('BUILDING_D_FOR_DRUIDIC_1',	'BUILDINGCLASS_D_FOR_DRUIDIC_1',	'TXT_KEY_BUILDING_D_FOR_DRUIDIC',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				2,						'SPECIALIST_MERCHANT', 1),
			('BUILDING_D_FOR_DRUIDIC_2',	'BUILDINGCLASS_D_FOR_DRUIDIC_2',	'TXT_KEY_BUILDING_D_FOR_DRUIDIC',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				4,						'SPECIALIST_MERCHANT', 1),
			('BUILDING_D_FOR_DRUIDIC_3',	'BUILDINGCLASS_D_FOR_DRUIDIC_3',	'TXT_KEY_BUILDING_D_FOR_DRUIDIC',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				6,						'SPECIALIST_MERCHANT', 1),
			('BUILDING_D_FOR_DRUIDIC_4',	'BUILDINGCLASS_D_FOR_DRUIDIC_4',	'TXT_KEY_BUILDING_D_FOR_DRUIDIC',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				8,						'SPECIALIST_MERCHANT', 1),
			('BUILDING_D_FOR_RIAD',			'BUILDINGCLASS_D_FOR_RIAD',			'TXT_KEY_BUILDING_D_FOR_RIAD',			0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				2,						'SPECIALIST_MERCHANT', 1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	ExtraCityHitPoints, IsDummy)
VALUES		('BUILDING_D_FOR_OPPIDUM',	'BUILDINGCLASS_D_FOR_OPPIDUM',	'TXT_KEY_BUILDING_D_FOR_OPPIDUM',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				10, 1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	GreatPeopleRateModifier, IsDummy)
VALUES		('BUILDING_D_FOR_EXAM',		'BUILDINGCLASS_D_FOR_EXAM',		'TXT_KEY_BUILDING_D_FOR_EXAM',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				5, 1),
			('BUILDING_D_FOR_CHAEBOL',	'BUILDINGCLASS_D_FOR_CHAEBOL',	'TXT_KEY_BUILDING_D_FOR_CHAEBOL',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				2, 1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	UnmoddedHappiness, IsDummy)
VALUES		('BUILDING_D_FOR_TOWER',	'BUILDINGCLASS_D_FOR_TOWER',	'TXT_KEY_BUILDING_D_FOR_TOWER',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1, 1);

INSERT INTO Buildings 	
			(Type,												BuildingClass,											Description,												GoldMaintenance,	Cost, FaithCost,	GreatWorkCount, NeverCapture,  NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex, IsDummy)
VALUES		('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',	'BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',	'TXT_KEY_BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',		0,					-1,   -1,			-1,				1,             1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Defense,	ExtraCityHitPoints,	TrainedFreePromotion, IsDummy)
VALUES		('BUILDING_D_FOR_TEUTONIC',	'BUILDINGCLASS_D_FOR_TEUTONIC',	'TXT_KEY_BUILDING_D_FOR_TEUTONIC',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				500,		50,					'PROMOTION_MORALE', 1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Defense, IsDummy)
VALUES		('BUILDING_D_FOR_QILA_1',	'BUILDINGCLASS_D_FOR_QILA_1',	'TXT_KEY_BUILDING_D_FOR_QILA_1',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				100, 1);

INSERT INTO Buildings 	
			(Type,					BuildingClass,				Description,					GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	GreatPeopleRateModifier,	Defense, IsDummy)
VALUES		('BUILDING_D_FOR_WAAG',	'BUILDINGCLASS_D_FOR_WAAG',	'TXT_KEY_BUILDING_D_FOR_WAAG',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				2,							100, 1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,					GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	TradeRouteRecipientBonus, 	TradeRouteTargetBonus, IsDummy)
VALUES		('BUILDING_D_FOR_GUMEY',	'BUILDINGCLASS_D_FOR_GUMEY',	'TXT_KEY_BUILDING_D_FOR_GUMEY',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				2, 							2, 1);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType,				BuildingClassType,					YieldType,			YieldChange)
VALUES		('BUILDING_D_FOR_HUEY',		'BUILDINGCLASS_GRAND_TEMPLE',		'YIELD_FOOD',		3),
			('BUILDING_D_FOR_HUEY',		'BUILDINGCLASS_GRAND_TEMPLE',		'YIELD_FAITH',		3),
			('BUILDING_D_FOR_FEITORIA',	'BUILDINGCLASS_OXFORD_UNIVERSITY',	'YIELD_PRODUCTION',	1),
			('BUILDING_D_FOR_FEITORIA',	'BUILDINGCLASS_OXFORD_UNIVERSITY',	'YIELD_GOLD',		2),
			('BUILDING_D_FOR_GUMEY',	'BUILDINGCLASS_CARAVANSARY',		'YIELD_CULTURE',	1);
------------------------------	
-- Building_BuildingClassLocalYieldChanges
------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges
			(BuildingType,				BuildingClassType,			YieldType,			YieldChange)
VALUES		('BUILDING_D_FOR_QILA_2',	'BUILDINGCLASS_CASTLE',		'YIELD_CULTURE',	1),
			('BUILDING_D_FOR_RIAD',		'BUILDINGCLASS_GARDEN',		'YIELD_CULTURE',	2),
			('BUILDING_D_FOR_RIAD',		'BUILDINGCLASS_GARDEN',		'YIELD_GOLD',		2),
			('BUILDING_D_FOR_BAAN',		'BUILDINGCLASS_WORKSHOP',	'YIELD_PRODUCTION',	1),
			('BUILDING_D_FOR_BAAN',		'BUILDINGCLASS_WORKSHOP',	'YIELD_GOLD',		1);
------------------------------	
-- Building_DomainFreeExperiences
------------------------------
INSERT INTO Building_DomainFreeExperiences
			(BuildingType,			DomainType,		Experience)
VALUES		('BUILDING_D_FOR_HUEY',	'DOMAIN_LAND',	3),
			('BUILDING_D_FOR_HUEY',	'DOMAIN_AIR',	3),
			('BUILDING_D_FOR_HUEY',	'DOMAIN_SEA',	3);
------------------------------
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					ResourceType,     YieldType,			Yield)
VALUES		('BUILDING_D_FOR_HIPPODROME',	'RESOURCE_HORSE', 'YIELD_CULTURE',		1),
			('BUILDING_D_FOR_HIPPODROME',	'RESOURCE_HORSE', 'YIELD_GOLD',			1);
			
INSERT INTO Building_ResourceYieldChanges	
			(BuildingType,		ResourceType,	YieldType,		Yield)
SELECT		'BUILDING_D_FOR_GUMEY_LUX',	Type,			'YIELD_GOLD',	1
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';
------------------------------	
-- Building_WLTKDYieldMod
------------------------------
INSERT INTO Building_WLTKDYieldMod	
			(BuildingType,						YieldType,			Yield)
VALUES		('BUILDING_D_FOR_HIPPODROME',	'YIELD_CULTURE',	15),
			('BUILDING_D_FOR_HIPPODROME',	'YIELD_GOLD',		15);
------------------------------	
-- Building_ImprovementYieldChanges
------------------------------		
INSERT INTO Building_ImprovementYieldChangesGlobal	
			(BuildingType, 										ImprovementType,							YieldType,			Yield)
VALUES		('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH',	'YIELD_GOLD',		2);

------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 				YieldType,			Yield)
VALUES		('BUILDING_D_FOR_PROXENOS',	'YIELD_GOLD',		2),
			('BUILDING_D_FOR_SACHEM_1',	'YIELD_FOOD',		1),
			('BUILDING_D_FOR_SACHEM_2',	'YIELD_PRODUCTION',	1),
			('BUILDING_D_FOR_SACHEM_3',	'YIELD_GOLD',		1),
			('BUILDING_D_FOR_SACHEM_4',	'YIELD_SCIENCE',	1),
			('BUILDING_D_FOR_SACHEM_5',	'YIELD_CULTURE',	1),
			('BUILDING_D_FOR_SACHEM_6',	'YIELD_FAITH',		1);
--==========================================================================================================================
--==========================================================================================================================
