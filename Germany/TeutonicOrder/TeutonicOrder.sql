--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType,			BuildingClassType,				BuildingType)
VALUES		('CIVILIZATION_GERMANY',	'BUILDINGCLASS_HEROIC_EPIC',	'BUILDING_GERMANY_TEUTONIC_ORDER');
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,								Description,								Help,											OutsideFriendlyLandsModifier, 	CannotBeChosen,	Sound,				PortraitIndex,	IconAtlas,		 PediaType,		PediaEntry)
VALUES		('PROMOTION_UNIT_GERMANY_CHAPTER',	'TXT_KEY_PROMOTION_UNIT_GERMANY_CHAPTER',	'TXT_KEY_PROMOTION_UNIT_GERMANY_CHAPTER_HELP',	10, 							1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS', 'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_GERMANY_CHAPTER');

INSERT INTO UnitPromotions_UnitCombats
			(PromotionType,						UnitCombatType)
VALUES		('PROMOTION_UNIT_GERMANY_CHAPTER',	'UNITCOMBAT_MELEE');
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------	
-- Buildings
--------------------------------	
UPDATE Buildings SET PortraitIndex = '2', IconAtlas = 'BUILDING_APIG4UC_ATLAS' WHERE Type = 'BUILDING_ORDER';

INSERT INTO	Buildings
			(Type,								Description,								Civilopedia,									Strategy,											Help,											GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, PrereqTech,		PortraitIndex, IconAtlas,			GreatWorkYieldType,	NeverCapture, NukeImmune, NumCityCostMod, TrainedFreePromotion, FreePromotion,						GreatWorkSlotType, GreatWorkCount, NationalPopRequired, CitySupplyModifier, ExtraCityHitPoints,		FreeBuildingThisCity)
SELECT		'BUILDING_GERMANY_TEUTONIC_ORDER',	'TXT_KEY_BUILDING_GERMANY_TEUTONIC_ORDER',	'TXT_KEY_BUILDING_GERMANY_TEUTONIC_ORDER_TEXT', 'TXT_KEY_BUILDING_GERMANY_TEUTONIC_ORDER_STRATEGY', 'TXT_KEY_BUILDING_GERMANY_TEUTONIC_ORDER_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, 'TECH_CHIVALRY',	5,				'COMMUNITY_ATLAS',	GreatWorkYieldType,	NeverCapture, NukeImmune, NumCityCostMod, TrainedFreePromotion, 'PROMOTION_UNIT_GERMANY_CHAPTER',	GreatWorkSlotType, GreatWorkCount, NationalPopRequired, CitySupplyModifier, ExtraCityHitPoints+50,	'BUILDINGCLASS_ARMORY'
FROM Buildings WHERE Type = 'BUILDING_HEROIC_EPIC';
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType,							BuildingClassType)
VALUES		('BUILDING_GERMANY_TEUTONIC_ORDER',	'BUILDINGCLASS_BARRACKS');
--------------------------------	
-- Building_BuildingClassYieldChanges
--------------------------------	
INSERT INTO		Building_BuildingClassYieldChanges
				(BuildingType,						BuildingClassType,			YieldType,		YieldChange)
VALUES			('BUILDING_GERMANY_TEUTONIC_ORDER', 'BUILDINGCLASS_BARRACKS',	'YIELD_FAITH',	2);
--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,						FlavorType,					Flavor)
VALUES		('BUILDING_GERMANY_TEUTONIC_ORDER', 'FLAVOR_RELIGION',			30),
			('BUILDING_GERMANY_TEUTONIC_ORDER', 'FLAVOR_OFFENSE',			15),
			('BUILDING_GERMANY_TEUTONIC_ORDER', 'FLAVOR_DEFENSE',			10),
			('BUILDING_GERMANY_TEUTONIC_ORDER', 'FLAVOR_MILITARY_TRAINING', 50),
			('BUILDING_GERMANY_TEUTONIC_ORDER', 'FLAVOR_PRODUCTION',		15),
			('BUILDING_GERMANY_TEUTONIC_ORDER', 'FLAVOR_CULTURE',			5),
			('BUILDING_GERMANY_TEUTONIC_ORDER', 'FLAVOR_WONDER',			20);
--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges
			(BuildingType,						YieldType,			Yield)
VALUES		('BUILDING_GERMANY_TEUTONIC_ORDER', 'YIELD_CULTURE',	1),
			('BUILDING_GERMANY_TEUTONIC_ORDER', 'YIELD_FAITH',		3);
--------------------------------	
-- Building_YieldChangesPerPop
--------------------------------
INSERT INTO Building_YieldChangesPerPop 	
			(BuildingType,						YieldType,				Yield)
VALUES		('BUILDING_GERMANY_TEUTONIC_ORDER',	'YIELD_PRODUCTION', 	40);
--==========================================================================================================================
--==========================================================================================================================
