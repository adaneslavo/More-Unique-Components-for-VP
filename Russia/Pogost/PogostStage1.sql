--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 					BuildingType)
VALUES	('CIVILIZATION_RUSSIA',	'BUILDINGCLASS_MINT',				'BUILDING_RUSSIA_POGOST_1');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_RUSSIA_ATLAS', 			256, 		'PogostPicture_256.dds',			1, 				1),
			('BUILDING_RUSSIA_ATLAS', 			128, 		'PogostPicture_128.dds',			1, 				1),
			('BUILDING_RUSSIA_ATLAS', 			64, 		'PogostPicture_064.dds',			1, 				1),
			('BUILDING_RUSSIA_ATLAS', 			45, 		'PogostPicture_045.dds',			1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,						BuildingClass,	GoldMaintenance, CityConnectionGoldModifier, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	PovertyHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	FinishLandTRTourism,	FinishSeaTRTourism,		Help,										Description,						Civilopedia,								Strategy,									IconAtlas,					PortraitIndex)
SELECT		'BUILDING_RUSSIA_POGOST_1',	BuildingClass,	GoldMaintenance, 10, 				Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	PovertyHappinessChange,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	TradeRouteRecipientBonus+2,	TradeRouteTargetBonus,	FinishLandTRTourism,	FinishSeaTRTourism,		'TXT_KEY_BUILDING_RUSSIA_POGOST_1_HELP',	'TXT_KEY_BUILDING_RUSSIA_POGOST_1',	'TXT_KEY_BUILDING_RUSSIA_POGOST_TEXT',		'TXT_KEY_BUILDING_RUSSIA_POGOST_STRATEGY',	'BUILDING_RUSSIA_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_MINT';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,					Flavor)
VALUES		('BUILDING_RUSSIA_POGOST_1',	'FLAVOR_GOLD',				120),
			('BUILDING_RUSSIA_POGOST_1',	'FLAVOR_CULTURE',			60),
			('BUILDING_RUSSIA_POGOST_1',	'FLAVOR_RELIGION',			20);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_RUSSIA_POGOST_1',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_MINT';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_RUSSIA_POGOST_1',	'YIELD_CULTURE',	3),
			('BUILDING_RUSSIA_POGOST_1',	'YIELD_GOLD',		2);
------------------------------
-- Building_ImprovementYieldChanges
------------------------------		
INSERT INTO Building_ImprovementYieldChanges	
			(BuildingType, 					ImprovementType,					YieldType,		Yield)
VALUES		('BUILDING_RUSSIA_POGOST_1',	'IMPROVEMENT_TRADING_POST', 		'YIELD_GOLD',	1),
			('BUILDING_RUSSIA_POGOST_1',	'IMPROVEMENT_CUSTOMS_HOUSE',		'YIELD_GOLD',	1),
			('BUILDING_RUSSIA_POGOST_1',	'IMPROVEMENT_CUSTOMS_HOUSE_VENICE',	'YIELD_GOLD',	1),
			('BUILDING_RUSSIA_POGOST_1',	'IMPROVEMENT_CELTS_OPPIDUM',		'YIELD_GOLD',	1);
--==========================================================================================================================
--==========================================================================================================================

