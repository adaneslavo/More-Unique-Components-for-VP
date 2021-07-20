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
			('BUILDINGCLASS_D_FOR_OPPIDUM',			'BUILDING_D_FOR_OPPIDUM',		1),
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
			('BUILDINGCLASS_D_FOR_SACHEM_7',		'BUILDING_D_FOR_SACHEM_7',		1),
			('BUILDINGCLASS_D_FOR_CHAEBOL',			'BUILDING_D_FOR_CHAEBOL',		1),
			('BUILDINGCLASS_D_FOR_RIAD',			'BUILDING_D_FOR_RIAD',			1),
			('BUILDINGCLASS_D_FOR_FEITORIA',		'BUILDING_D_FOR_FEITORIA',		1),
			('BUILDINGCLASS_D_FOR_BAAN',			'BUILDING_D_FOR_BAAN',			1),
			('BUILDINGCLASS_D_FOR_WAAG',			'BUILDING_D_FOR_WAAG',			1),
			('BUILDINGCLASS_SHOPHET_DUMMY',			'BUILDING_SHOPHET_DUMMY', 		1),
			('BUILDINGCLASS_D_FOR_GUMEY_LUX',		'BUILDING_D_FOR_GUMEY_LUX',		1),
			('BUILDINGCLASS_D_FOR_ALTICUR',			'BUILDING_D_FOR_ALTICUR', 		1),
			('BUILDINGCLASS_D_FOR_TERSANE',			'BUILDING_D_FOR_TERSANE', 		1),
			('BUILDINGCLASS_D_FOR_QULLQA',			'BUILDING_D_FOR_QULLQA', 		1),
			('BUILDINGCLASS_D_FOR_SALON',			'BUILDING_D_FOR_SALON', 		1),
			('BUILDINGCLASS_D_FOR_SALON_GPP1',		'BUILDING_D_FOR_SALON_GPP1', 	1),
			('BUILDINGCLASS_D_FOR_SALON_GPP2',		'BUILDING_D_FOR_SALON_GPP2', 	1),
			('BUILDINGCLASS_D_FOR_SALON_GPP3',		'BUILDING_D_FOR_SALON_GPP3', 	1),
			('BUILDINGCLASS_D_FOR_SALON_GPP4',		'BUILDING_D_FOR_SALON_GPP4', 	1),
			('BUILDINGCLASS_D_FOR_SALON_GPP5',		'BUILDING_D_FOR_SALON_GPP5', 	1),
			('BUILDINGCLASS_D_FOR_SALON_GPP6',		'BUILDING_D_FOR_SALON_GPP6', 	1),
			('BUILDINGCLASS_D_FOR_SALON_GPP7',		'BUILDING_D_FOR_SALON_GPP7', 	1),
			('BUILDINGCLASS_D_FOR_SALON_GPP8',		'BUILDING_D_FOR_SALON_GPP8', 	1),
			('BUILDINGCLASS_D_FOR_SALON_GPP9',		'BUILDING_D_FOR_SALON_GPP9', 	1),
			('BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',		'BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',		1),
			('BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_PANTHEON',		'BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_PANTHEON',		1),
			('BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER',		'BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER',		1),
			('BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER',		'BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER',		1),
			('BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_REFORMATION',	'BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_REFORMATION',	1),
			('BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_BYZANTIUM',		'BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_BYZANTIUM',	1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,						Description,							CapitalOnly, 	GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex, 	IsDummy, 	ShowInPedia)
VALUES		('BUILDING_D_FOR_BARBICAN',		'BUILDINGCLASS_ARMORY',				'TXT_KEY_BUILDING_D_FOR_BARBICAN',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				0, 			0);

INSERT INTO Buildings 	
			(Type,							BuildingClass,						Description,							CapitalOnly, 	GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex, 	IsDummy)
VALUES		('BUILDING_D_FOR_HUEY',			'BUILDINGCLASS_D_FOR_HUEY',			'TXT_KEY_BUILDING_D_FOR_HUEY',			0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_HIPPODROME',	'BUILDINGCLASS_D_FOR_HIPPODROME',	'TXT_KEY_BUILDING_D_FOR_HIPPODROME',	0, 				0,					-1,		-1,			-1,				1,				1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_PROXENOS',		'BUILDINGCLASS_D_FOR_PROXENOS',		'TXT_KEY_BUILDING_D_FOR_PROXENOS',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_BUFFALO',		'BUILDINGCLASS_D_FOR_BUFFALO',		'TXT_KEY_BUILDING_D_FOR_BUFFALO',		0, 				0,					-1,		-1,			-1,				0,				1,			100,			-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_FLAX',			'BUILDINGCLASS_D_FOR_FLAX',			'TXT_KEY_BUILDING_D_FOR_FLAX',			0, 				0,					-1,		-1,			-1,				0,				1,			100,			-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_QILA_2',		'BUILDINGCLASS_D_FOR_QILA_2',		'TXT_KEY_BUILDING_D_FOR_QILA_2',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_SACHEM_1',		'BUILDINGCLASS_D_FOR_SACHEM_1',		'TXT_KEY_BUILDING_D_FOR_SACHEM_1',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_SACHEM_2',		'BUILDINGCLASS_D_FOR_SACHEM_2',		'TXT_KEY_BUILDING_D_FOR_SACHEM_2',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_SACHEM_3',		'BUILDINGCLASS_D_FOR_SACHEM_3',		'TXT_KEY_BUILDING_D_FOR_SACHEM_3',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_SACHEM_4',		'BUILDINGCLASS_D_FOR_SACHEM_4',		'TXT_KEY_BUILDING_D_FOR_SACHEM_4',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_SACHEM_5',		'BUILDINGCLASS_D_FOR_SACHEM_5',		'TXT_KEY_BUILDING_D_FOR_SACHEM_5',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_SACHEM_6',		'BUILDINGCLASS_D_FOR_SACHEM_6',		'TXT_KEY_BUILDING_D_FOR_SACHEM_6',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_FEITORIA',		'BUILDINGCLASS_D_FOR_FEITORIA',		'TXT_KEY_BUILDING_D_FOR_FEITORIA',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_BAAN',			'BUILDINGCLASS_D_FOR_BAAN',			'TXT_KEY_BUILDING_D_FOR_BAAN',			0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_GUMEY_LUX',	'BUILDINGCLASS_D_FOR_GUMEY_LUX',	'TXT_KEY_BUILDING_D_FOR_GUMEY_LUX',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_TERSANE',		'BUILDINGCLASS_D_FOR_TERSANE',		'TXT_KEY_BUILDING_D_FOR_TERSANE',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_ALTICUR',		'BUILDINGCLASS_D_FOR_ALTICUR',		'TXT_KEY_BUILDING_D_FOR_ALTICUR',		0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_RIAD',			'BUILDINGCLASS_D_FOR_RIAD',			'TXT_KEY_BUILDING_D_FOR_RIAD',			1, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_SHOPHET_DUMMY',		'BUILDINGCLASS_SHOPHET_DUMMY',		'TXT_KEY_BUILDING_SHOPHET_DUMMY',		0, 				0,					-1,   	-1,			-1,				1,             	1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_QULLQA',		'BUILDINGCLASS_D_FOR_QULLQA',		'TXT_KEY_BUILDING_D_FOR_QULLQA',		0, 				0,					-1,   	-1,			-1,				0,             	1,          100,			-1,					'CIV_COLOR_ATLAS',	0, 				1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	UnmoddedHappiness, 	IsDummy)
VALUES		('BUILDING_D_FOR_SACHEM_7',	'BUILDINGCLASS_D_FOR_SACHEM_7',	'TXT_KEY_BUILDING_D_FOR_SACHEM_7',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1, 					1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	ExtraCityHitPoints, IsDummy)
VALUES		('BUILDING_D_FOR_OPPIDUM',	'BUILDINGCLASS_D_FOR_OPPIDUM',	'TXT_KEY_BUILDING_D_FOR_OPPIDUM',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				10, 				1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	GreatPeopleRateModifier, 	IsDummy)
VALUES		('BUILDING_D_FOR_CHAEBOL',	'BUILDINGCLASS_D_FOR_CHAEBOL',	'TXT_KEY_BUILDING_D_FOR_CHAEBOL',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				2, 							1),
			('BUILDING_D_FOR_SALON',	'BUILDINGCLASS_D_FOR_SALON',	'TXT_KEY_BUILDING_D_FOR_SALON',		0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				10, 						1);

INSERT INTO Buildings 	
			(Type,												BuildingClass,											Description,												CapitalOnly, 	GoldMaintenance,	Cost, FaithCost,	GreatWorkCount, NeverCapture,  NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex, 	IsDummy)
VALUES		('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',	'BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',	'TXT_KEY_BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',		1, 				0,					-1,   -1,			-1,				1,             1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_PANTHEON',	'BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_PANTHEON',	'TXT_KEY_BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_PANTHEON',		1, 				0,					-1,   -1,			-1,				1,             1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER',		'BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER',		'TXT_KEY_BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER',		1, 				0,					-1,   -1,			-1,				1,             1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER',	'BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER',	'TXT_KEY_BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER',		1, 				0,					-1,   -1,			-1,				1,             1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_REFORMATION',	'BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_REFORMATION',	'TXT_KEY_BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_REFORMATION',	1, 				0,					-1,   -1,			-1,				1,             1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_BYZANTIUM',	'BUILDINGCLASS_ETHIOPIA_MONOLITHIC_CHURCH_BYZANTIUM',	'TXT_KEY_BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_BYZANTIUM',	1, 				0,					-1,   -1,			-1,				1,             1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 				1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Defense,	ExtraCityHitPoints,	TrainedFreePromotion, 	IsDummy)
VALUES		('BUILDING_D_FOR_TEUTONIC',	'BUILDINGCLASS_D_FOR_TEUTONIC',	'TXT_KEY_BUILDING_D_FOR_TEUTONIC',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				300,		50,					'PROMOTION_MORALE', 	1);

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Defense, 	ExtraCityHitPoints, 	IsDummy)
VALUES		('BUILDING_D_FOR_QILA_1',	'BUILDINGCLASS_D_FOR_QILA_1',	'TXT_KEY_BUILDING_D_FOR_QILA_1',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				0, 			25, 					1);

INSERT INTO Buildings 	
			(Type,					BuildingClass,				Description,					GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	IsDummy)
VALUES		('BUILDING_D_FOR_WAAG',	'BUILDINGCLASS_D_FOR_WAAG',	'TXT_KEY_BUILDING_D_FOR_WAAG',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1);

INSERT INTO Buildings 	
			(Type,							BuildingClass,						Description,					SpecialistType,				GreatPeopleRateChange, 	GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	IsDummy)
VALUES		('BUILDING_D_FOR_SALON_GPP1',	'BUILDINGCLASS_D_FOR_SALON_GPP1',	'TXT_KEY_BUILDING_D_FOR_SALON',	'SPECIALIST_SCIENTIST', 	5, 						0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1),
			('BUILDING_D_FOR_SALON_GPP2',	'BUILDINGCLASS_D_FOR_SALON_GPP2',	'TXT_KEY_BUILDING_D_FOR_SALON',	'SPECIALIST_ARTIST', 		5, 						0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1),
			('BUILDING_D_FOR_SALON_GPP3',	'BUILDINGCLASS_D_FOR_SALON_GPP3',	'TXT_KEY_BUILDING_D_FOR_SALON',	'SPECIALIST_CIVIL_SERVANT', 5, 						0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1),
			('BUILDING_D_FOR_SALON_GPP4',	'BUILDINGCLASS_D_FOR_SALON_GPP4',	'TXT_KEY_BUILDING_D_FOR_SALON',	'SPECIALIST_ENGINEER', 		5, 						0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1),
			('BUILDING_D_FOR_SALON_GPP5',	'BUILDINGCLASS_D_FOR_SALON_GPP5',	'TXT_KEY_BUILDING_D_FOR_SALON',	null, 						0, 						0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1),
			('BUILDING_D_FOR_SALON_GPP6',	'BUILDINGCLASS_D_FOR_SALON_GPP6',	'TXT_KEY_BUILDING_D_FOR_SALON',	'SPECIALIST_WRITER', 		5, 						0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1),
			('BUILDING_D_FOR_SALON_GPP7',	'BUILDINGCLASS_D_FOR_SALON_GPP7',	'TXT_KEY_BUILDING_D_FOR_SALON',	'SPECIALIST_MUSICIAN', 		5, 						0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1),
			('BUILDING_D_FOR_SALON_GPP8',	'BUILDINGCLASS_D_FOR_SALON_GPP8',	'TXT_KEY_BUILDING_D_FOR_SALON',	null, 						0, 						0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1),
			('BUILDING_D_FOR_SALON_GPP9',	'BUILDINGCLASS_D_FOR_SALON_GPP9',	'TXT_KEY_BUILDING_D_FOR_SALON',	'SPECIALIST_MERCHANT', 		5, 						0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0,				1);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
SELECT		'BUILDING_D_FOR_BARBICAN',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_ARMORY';
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType,				BuildingClassType,					YieldType,			YieldChange)
VALUES		('BUILDING_D_FOR_HUEY',		'BUILDINGCLASS_GRAND_TEMPLE',		'YIELD_FOOD',		3),
			('BUILDING_D_FOR_HUEY',		'BUILDINGCLASS_GRAND_TEMPLE',		'YIELD_FAITH',		3),
			('BUILDING_D_FOR_FEITORIA',	'BUILDINGCLASS_OXFORD_UNIVERSITY',	'YIELD_PRODUCTION',	1),
			('BUILDING_D_FOR_FEITORIA',	'BUILDINGCLASS_OXFORD_UNIVERSITY',	'YIELD_GOLD',		2),
			('BUILDING_D_FOR_ALTICUR',	'BUILDINGCLASS_IRONWORKS',			'YIELD_GOLD',		1);
------------------------------	
-- Building_BuildingClassLocalYieldChanges
------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges
			(BuildingType,					BuildingClassType,			YieldType,						YieldChange)
VALUES		('BUILDING_D_FOR_QILA_2',		'BUILDINGCLASS_CASTLE',		'YIELD_CULTURE',				1),
			('BUILDING_D_FOR_BAAN',			'BUILDINGCLASS_WORKSHOP',	'YIELD_PRODUCTION',				1),
			('BUILDING_D_FOR_BAAN',			'BUILDINGCLASS_WORKSHOP',	'YIELD_GOLD',					1),
			('BUILDING_D_FOR_WAAG',			'BUILDINGCLASS_BANK',		'YIELD_GOLD',					1),
			('BUILDING_D_FOR_WAAG',			'BUILDINGCLASS_BANK',		'YIELD_CULTURE',				1),
			('BUILDING_D_FOR_WAAG',			'BUILDINGCLASS_BANK',		'YIELD_PRODUCTION',				1),
			('BUILDING_D_FOR_SALON',		'BUILDINGCLASS_MUSEUM',		'YIELD_SCIENCE',				3),
			('BUILDING_D_FOR_SALON_GPP5',	'BUILDINGCLASS_MUSEUM',		'YIELD_GREAT_GENERAL_POINTS',	8),
			('BUILDING_D_FOR_SALON_GPP8',	'BUILDINGCLASS_MUSEUM',		'YIELD_GREAT_ADMIRAL_POINTS',	8);
------------------------------	
-- Building_DomainFreeExperiences
------------------------------
INSERT INTO Building_DomainFreeExperiences
			(BuildingType,				DomainType,		Experience)
VALUES		('BUILDING_D_FOR_HUEY',		'DOMAIN_LAND',	3),
			('BUILDING_D_FOR_HUEY',		'DOMAIN_AIR',	3),
			('BUILDING_D_FOR_HUEY',		'DOMAIN_SEA',	3),
			('BUILDING_D_FOR_TERSANE',	'DOMAIN_SEA',	10);
------------------------------	
-- Building_DomainFreeExperiences
------------------------------
INSERT INTO Building_DomainProductionModifiers
			(BuildingType,				DomainType,		Modifier)
VALUES		('BUILDING_D_FOR_TERSANE',	'DOMAIN_SEA',	25);			
------------------------------
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges	
			(BuildingType,				ResourceType,	YieldType,		Yield)
SELECT		'BUILDING_D_FOR_GUMEY_LUX',	Type,			'YIELD_GOLD',	1
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

CREATE TRIGGER MUCfVP_GumeyLuxuryGoldTrigger
AFTER INSERT ON Resources 
WHEN NEW.ResourceClassType = 'RESOURCECLASS_LUXURY'
BEGIN
	INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				ResourceType,	YieldType,		Yield)
	SELECT	'BUILDING_D_FOR_GUMEY_LUX', NEW.Type, 		'YIELD_GOLD',	1;
END;
------------------------------	
-- Building_WLTKDYieldMod
------------------------------
INSERT INTO Building_WLTKDYieldMod	
			(BuildingType,					YieldType,			Yield)
VALUES		('BUILDING_D_FOR_HIPPODROME',	'YIELD_CULTURE',	15),
			('BUILDING_D_FOR_HIPPODROME',	'YIELD_GOLD',		15);
------------------------------	
-- Building_ImprovementYieldChanges
------------------------------		
INSERT INTO Building_ImprovementYieldChangesGlobal	
			(BuildingType, 										ImprovementType,								YieldType,			Yield)
VALUES		('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_GOLD',		2),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_IDEOLOGY',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_GOLD',		2),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_PANTHEON',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_FAITH',		1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_PANTHEON',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_FAITH',		1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_CULTURE',	1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_CULTURE',	1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_PRODUCTION',	1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_PRODUCTION',	1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_CULTURE',	1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_CULTURE',	1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_PRODUCTION',	1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_ENHANCER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_PRODUCTION',	1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_REFORMATION',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_GOLD',		1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_REFORMATION',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_GOLD',		1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_BYZANTIUM',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_CULTURE',	1),
			('BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_BYZANTIUM',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_CULTURE',	1);
--------------------------------	
-- Building_ClassYieldChanges
--------------------------------	
INSERT INTO	Building_BuildingClassYieldChanges
			(BuildingType,  		BuildingClassType, 		YieldType, 			YieldChange)
VALUES		('BUILDING_D_FOR_RIAD',	'BUILDINGCLASS_GARDEN',	'YIELD_GOLD',		1),
			('BUILDING_D_FOR_RIAD',	'BUILDINGCLASS_GARDEN',	'YIELD_TOURISM',	1);
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
			('BUILDING_D_FOR_SACHEM_6',	'YIELD_FAITH',		1),
			('BUILDING_SHOPHET_DUMMY', 	'YIELD_CULTURE', 	2),
			('BUILDING_SHOPHET_DUMMY', 	'YIELD_FAITH', 		2);
------------------------------	
-- Building_ResourceQuantity
------------------------------		
INSERT INTO Building_ResourceQuantity 	
			(BuildingType, 				ResourceType,		Quantity)
VALUES		('BUILDING_D_FOR_QULLQA',	'RESOURCE_COCA',	1);
--==========================================================================================================================
--==========================================================================================================================
