--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_POLYNESIA',	'BUILDINGCLASS_GROVE',	'BUILDING_POLYNESIA_FALE_TELE');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_POLYNESIA_ATLAS', 			256, 		'FaleTelePicture_256.dds',			1, 				1),
			('BUILDING_POLYNESIA_ATLAS', 			128, 		'FaleTelePicture_128.dds',			1, 				1),
			('BUILDING_POLYNESIA_ATLAS', 			64, 		'FaleTelePicture_064.dds',			1, 				1),
			('BUILDING_POLYNESIA_ATLAS', 			45, 		'FaleTelePicture_045.dds',			1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType,	SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	Help,											Description,							Civilopedia,									Strategy,											IconAtlas,					PortraitIndex)
SELECT		'BUILDING_POLYNESIA_FALE_TELE',	BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier,	GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType,	SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	'TXT_KEY_BUILDING_POLYNESIA_FALE_TELE_HELP',	'TXT_KEY_BUILDING_POLYNESIA_FALE_TELE', 'TXT_KEY_BUILDING_POLYNESIA_FALE_TELE_TEXT',	'TXT_KEY_BUILDING_POLYNESIA_FALE_TELE_STRATEGY',	'BUILDING_POLYNESIA_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_GROVE';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,			Flavor)
VALUES		('BUILDING_POLYNESIA_FALE_TELE',	'FLAVOR_GOLD',		20),
			('BUILDING_POLYNESIA_FALE_TELE',	'FLAVOR_SCIENCE',	35),
			('BUILDING_POLYNESIA_FALE_TELE',	'FLAVOR_CULTURE',	15),
			('BUILDING_POLYNESIA_FALE_TELE',	'FLAVOR_GROWTH',	5);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_POLYNESIA_FALE_TELE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_GROVE';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						YieldType,			Yield)
VALUES		('BUILDING_POLYNESIA_FALE_TELE',	'YIELD_CULTURE',	1),
			('BUILDING_POLYNESIA_FALE_TELE',	'YIELD_SCIENCE',	1);
------------------------------	
-- Building_YieldFromBirth
------------------------------		
INSERT INTO Building_YieldFromBirth	
			(BuildingType, 						YieldType,			Yield)
VALUES		('BUILDING_POLYNESIA_FALE_TELE',	'YIELD_SCIENCE',	5);
------------------------------	
-- Building_YieldFromConstruction
------------------------------		
INSERT INTO Building_YieldFromConstruction	
			(BuildingType, 						YieldType,			Yield)
VALUES		('BUILDING_POLYNESIA_FALE_TELE',	'YIELD_GOLD',		3),
			('BUILDING_POLYNESIA_FALE_TELE',	'YIELD_FOOD',		3),
			('BUILDING_POLYNESIA_FALE_TELE',	'YIELD_CULTURE',	3);
------------------------------	
-- Building_ImprovementYieldChanges
------------------------------		
--INSERT INTO Building_ImprovementYieldChanges	
--			(BuildingType, 						ImprovementType,				YieldType,		Yield)
--VALUES		('BUILDING_POLYNESIA_FALE_TELE',	'IMPROVEMENT_FISHING_BOATS',	'YIELD_GOLD',	1);
--==========================================================================================================================
--==========================================================================================================================

