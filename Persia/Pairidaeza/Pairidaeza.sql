--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_PERSIA',	'BUILDINGCLASS_GARDEN',	'BUILDING_PERSIA_PAIRIDAEZA');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_PERSIA_ATLAS', 			256, 		'PairidaezaPicture_256.dds',			1, 				1),
			('BUILDING_PERSIA_ATLAS', 			128, 		'PairidaezaPicture_128.dds',			1, 				1),
			('BUILDING_PERSIA_ATLAS', 			64, 		'PairidaezaPicture_064.dds',			1, 				1),
			('BUILDING_PERSIA_ATLAS', 			45, 		'PairidaezaPicture_045.dds',			1, 				1);
--==========================================================================================================================

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass, GoldenAgeModifier, GoldMaintenance, Cost, EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense, NoUnhappfromXSpecialists, ExtraCityHitPoints, TrainedFreePromotion, CitySupplyFlat, DefenseHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, Cost, FreeStartEra, Happiness, NeverCapture, GoldMaintenance, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	BuildingProductionModifier,	UnculturedHappinessChange,	FreshWater,	Help,								Description,					Civilopedia,						Strategy,								IconAtlas,				PortraitIndex)
SELECT		'BUILDING_PERSIA_PAIRIDAEZA', 	BuildingClass, GoldenAgeModifier, GoldMaintenance, Cost, EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense, NoUnhappfromXSpecialists, ExtraCityHitPoints, TrainedFreePromotion, CitySupplyFlat, DefenseHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, 200, FreeStartEra, Happiness, NeverCapture, GoldMaintenance, 'TECH_CURRENCY', ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	BuildingProductionModifier,	UnculturedHappinessChange,	0,			'TXT_KEY_BUILDING_PERSIA_PAIRIDAEZA_HELP',	'TXT_KEY_BUILDING_PERSIA_PAIRIDAEZA', 	'TXT_KEY_BUILDING_PERSIA_PAIRIDAEZA_TEXT',	'TXT_KEY_BUILDING_PERSIA_PAIRIDAEZA_STRATEGY',	'BUILDING_PERSIA_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_GARDEN';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,						Flavor)
VALUES		('BUILDING_PERSIA_PAIRIDAEZA',	'FLAVOR_GREAT_PEOPLE',			30),
			('BUILDING_PERSIA_PAIRIDAEZA',	'FLAVOR_GOLD',					100),
			('BUILDING_PERSIA_PAIRIDAEZA',	'FLAVOR_GROWTH',				10),
			('BUILDING_PERSIA_PAIRIDAEZA',	'FLAVOR_CULTURE',				80),
			('BUILDING_PERSIA_PAIRIDAEZA',	'FLAVOR_RELIGION',				50);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
--INSERT INTO Building_ClassesNeededInCity 	
--			(BuildingType, 					BuildingClassType)
--SELECT		'BUILDING_PERSIA_PAIRIDAEZA',	BuildingClassType
--FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_GARDEN';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_PERSIA_PAIRIDAEZA',	'YIELD_CULTURE',	3),
			('BUILDING_PERSIA_PAIRIDAEZA',	'YIELD_TOURISM',	3);
------------------------------	
-- Building_FeatureYieldChanges
------------------------------		
INSERT INTO Building_FeatureYieldChanges
			(BuildingType, 					FeatureType, 		YieldType, 		Yield)
VALUES		('BUILDING_PERSIA_PAIRIDAEZA', 	'FEATURE_OASIS', 	'YIELD_GOLD',	2);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges	
			(BuildingType,					ResourceType,		YieldType,			Yield)
VALUES		('BUILDING_PERSIA_PAIRIDAEZA',	'RESOURCE_COCOA',	'YIELD_GOLD',		1),
			('BUILDING_PERSIA_PAIRIDAEZA',	'RESOURCE_COCOA',	'YIELD_FOOD',		1),
			('BUILDING_PERSIA_PAIRIDAEZA',	'RESOURCE_CITRUS',	'YIELD_GOLD',		1),
			('BUILDING_PERSIA_PAIRIDAEZA',	'RESOURCE_CITRUS',	'YIELD_FOOD',		1);
--------------------------------	
-- Building_GoldenAgeYieldMod
--------------------------------
INSERT INTO Building_GoldenAgeYieldMod
			(BuildingType,				YieldType,		Yield)
VALUES		('BUILDING_PERSIA_PAIRIDAEZA',	'YIELD_GOLD',	15);
--==========================================================================================================================
--==========================================================================================================================


