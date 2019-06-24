--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_MAYA',	'BUILDINGCLASS_COLOSSEUM',	'BUILDING_MAYA_PITZ');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_MAYA_ATLAS', 			256, 		'PitzPicture_256.dds',			1, 				1),
			('BUILDING_MAYA_ATLAS', 			128, 		'PitzPicture_128.dds',			1, 				1),
			('BUILDING_MAYA_ATLAS', 			64, 		'PitzPicture_064.dds',			1, 				1),
			('BUILDING_MAYA_ATLAS', 			45, 		'PitzPicture_045.dds',			1, 				1);
--==========================================================================================================================

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,					BuildingClass,	GoldMaintenance, Cost, EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense, ExtraCityHitPoints, TrainedFreePromotion, 				CitySupplyFlat, DefenseHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, Cost, FreeStartEra, Happiness, NeverCapture,	GoldMaintenance, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb,	HurryCostModifier,	BuildingProductionModifier,	UnculturedHappinessChange,	Help,								Description,					Civilopedia,						Strategy,								IconAtlas,				PortraitIndex)
SELECT		'BUILDING_MAYA_PITZ', 	BuildingClass,	GoldMaintenance, Cost, EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense, ExtraCityHitPoints, 'PROMOTION_UNIT_MAYA_KATUN_AHAW_0', 	CitySupplyFlat, DefenseHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, Cost, FreeStartEra, Happiness, 1,				GoldMaintenance, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, 0,				HurryCostModifier,	BuildingProductionModifier,	UnculturedHappinessChange,	'TXT_KEY_BUILDING_MAYA_PITZ_HELP',	'TXT_KEY_BUILDING_MAYA_PITZ', 	'TXT_KEY_BUILDING_MAYA_PITZ_TEXT',	'TXT_KEY_BUILDING_MAYA_PITZ_STRATEGY',	'BUILDING_MAYA_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_COLOSSEUM';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType,						Flavor)
VALUES		('BUILDING_MAYA_PITZ',	'FLAVOR_PRODUCTION',			30),
			('BUILDING_MAYA_PITZ',	'FLAVOR_GOLD',					10),
			('BUILDING_MAYA_PITZ',	'FLAVOR_GROWTH',				10),
			('BUILDING_MAYA_PITZ',	'FLAVOR_SCIENCE',				80),
			('BUILDING_MAYA_PITZ',	'FLAVOR_CULTURE',				100),
			('BUILDING_MAYA_PITZ',	'FLAVOR_RELIGION',				80),
			('BUILDING_MAYA_PITZ',	'FLAVOR_MILITARY_TRAINING',		50);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 			BuildingClassType)
SELECT		'BUILDING_MAYA_PITZ',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_COLOSSEUM';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges	
			(BuildingType, 			YieldType,			Yield)
VALUES		('BUILDING_MAYA_PITZ',	'YIELD_FAITH',		2),
			('BUILDING_MAYA_PITZ',	'YIELD_CULTURE',	2),
			('BUILDING_MAYA_PITZ',	'YIELD_TOURISM',	2);
------------------------------	
-- Building_BuildingClassLocalYieldChanges
------------------------------		
INSERT INTO Building_BuildingClassLocalYieldChanges
			(BuildingType, 			BuildingClassType, YieldType, YieldChange)
SELECT		'BUILDING_MAYA_PITZ',	BuildingClassType, YieldType, YieldChange
FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = 'BUILDING_COLOSSEUM';
------------------------------	
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges	
			(BuildingType,			ResourceType,		YieldType,			Yield)
SELECT		'BUILDING_MAYA_PITZ',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_COLOSSEUM';
------------------------------	
-- Building_UnhappinessNeedsFlatReduction
------------------------------
INSERT INTO Building_UnhappinessNeedsFlatReduction 	
			(BuildingType,			YieldType, Yield)
SELECT		'BUILDING_MAYA_PITZ', 	YieldType, Yield
FROM Building_UnhappinessNeedsFlatReduction WHERE (BuildingType = 'BUILDING_COLOSSEUM');
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 									Description, 								Help, 												Sound, 				FriendlyHealChange,	BarbarianCombatBonus,	MovesChange,	CombatPercent,	ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 		IconAtlas, 				PediaType, 		PediaEntry)
VALUES		('PROMOTION_UNIT_MAYA_KATUN_AHAW_0', 	'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_0',	'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_0_HELP', 	'AS2D_IF_LEVELUP',	0,					0,						0,				0,				0,					0,			0,					1, 				59, 				'promoMUC_atlas_00', 	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_0'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_1',	'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_1',	'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_1_HELP', 	'AS2D_IF_LEVELUP',	0,					0,						0,				5,				0,					0,			0,					1, 				60, 				'promoMUC_atlas_00', 	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_1'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_2',	'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_2',	'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_2_HELP', 	'AS2D_IF_LEVELUP',	0,					0,						0,				10,				0,					0,			0,					1, 				61, 				'promoMUC_atlas_00', 	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_2'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_3',	'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_3',	'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_3_HELP', 	'AS2D_IF_LEVELUP',	0,					0,						0,				10,				0,					0,			0,					1, 				62, 				'promoMUC_atlas_00', 	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_3'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_4',	'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_4',	'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_4_HELP', 	'AS2D_IF_LEVELUP',	10,					0,						0,				10,				0,					0,			0,					1, 				63, 				'promoMUC_atlas_00', 	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_UNIT_MAYA_KATUN_AHAW_4');
------------------------------	
-- UnitPromotions_UnitCombats
------------------------------		
INSERT INTO UnitPromotions_UnitCombats  	
			(PromotionType, 						UnitCombatType)
VALUES		('PROMOTION_UNIT_MAYA_KATUN_AHAW_0',	'UNITCOMBAT_RECON'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_0',	'UNITCOMBAT_ARCHER'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_0',	'UNITCOMBAT_MOUNTED'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_0',	'UNITCOMBAT_MELEE'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_0',	'UNITCOMBAT_SIEGE'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_0',	'UNITCOMBAT_GUN'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_0',	'UNITCOMBAT_ARMOR'),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_0',	'UNITCOMBAT_HELICOPTER');
------------------------------
-- UnitPromotions_Features
------------------------------
INSERT INTO UnitPromotions_Features
			(PromotionType, 					FeatureType,		Defense)
VALUES		('PROMOTION_UNIT_MAYA_KATUN_AHAW_2',	'FEATURE_FOREST',	5),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_2',	'FEATURE_JUNGLE',	5),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_3',	'FEATURE_FOREST',	15),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_3',	'FEATURE_JUNGLE',	15),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_4',	'FEATURE_FOREST',	15),
			('PROMOTION_UNIT_MAYA_KATUN_AHAW_4',	'FEATURE_JUNGLE',	15);
--==========================================================================================================================
--==========================================================================================================================


