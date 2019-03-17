--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_NETHERLANDS',	'BUILDINGCLASS_BANK',	'BUILDING_NETHERLANDS_WAAG');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 									IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_NETHERLANDS_ATLAS', 				256, 		'WaagPicture_256.dds',			1, 				1),
			('BUILDING_NETHERLANDS_ATLAS', 				128, 		'WaagPicture_128.dds',			1, 				1),
			('BUILDING_NETHERLANDS_ATLAS', 				64, 		'WaagPicture_064.dds',			1, 				1),
			('BUILDING_NETHERLANDS_ATLAS', 				45, 		'WaagPicture_045.dds',			1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,	GoldMaintenance, Cost,		EspionageModifier, 	Defense, 	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, TrainedFreePromotion, CitySupplyFlat, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, GoldMaintenance, PrereqTech, 			ArtDefineTag, SpecialistType, SpecialistCount, 		MinAreaSize, ConquestProb, HurryCostModifier, PovertyHappinessChange, Help,										Description,							Civilopedia,								Strategy,										IconAtlas,						PortraitIndex)
SELECT		'BUILDING_NETHERLANDS_WAAG', 	BuildingClass,	GoldMaintenance, Cost-150,	-20, 				500, 		EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, TrainedFreePromotion, CitySupplyFlat, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, GoldMaintenance, 'TECH_CIVIL_SERVICE',	ArtDefineTag, SpecialistType, SpecialistCount+1, 	MinAreaSize, ConquestProb, HurryCostModifier, PovertyHappinessChange, 'TXT_KEY_BUILDING_NETHERLANDS_WAAG_HELP',	'TXT_KEY_BUILDING_NETHERLANDS_WAAG',	'TXT_KEY_BUILDING_NETHERLANDS_WAAG_TEXT',	'TXT_KEY_BUILDING_NETHERLANDS_WAAG_STRATEGY',	'BUILDING_NETHERLANDS_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_BANK';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,					Flavor)
VALUES		('BUILDING_NETHERLANDS_WAAG',	'FLAVOR_CITY_DEFENSE',			50),
			('BUILDING_NETHERLANDS_WAAG',	'FLAVOR_CULTURE',				10),
			('BUILDING_NETHERLANDS_WAAG',	'FLAVOR_GOLD',					100),
			('BUILDING_NETHERLANDS_WAAG',	'FLAVOR_PRODUCTION',			50),
			('BUILDING_NETHERLANDS_WAAG',	'FLAVOR_SCIENCE',				40);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
VALUES	('BUILDING_NETHERLANDS_WAAG',	'BUILDINGCLASS_MARKET');
------------------------------	
-- Building_BuildingClassLocalYieldChanges
------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges
			(BuildingType,					BuildingClassType, YieldType, YieldChange)
SELECT		'BUILDING_NETHERLANDS_WAAG',	BuildingClassType, YieldType, YieldChange
FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = 'BUILDING_BANK';
------------------------------	
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					ResourceType, YieldType, Yield)
SELECT		'BUILDING_NETHERLANDS_WAAG',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_BANK';
------------------------------	
-- Building_YieldFromPurchase
------------------------------
INSERT INTO Building_YieldFromPurchase
			(BuildingType,					YieldType, Yield)
SELECT		'BUILDING_NETHERLANDS_WAAG',	YieldType, Yield
FROM Building_YieldFromPurchase WHERE BuildingType = 'BUILDING_BANK';
------------------------------	
-- Building_UnhappinessNeedsFlatReduction
------------------------------
INSERT INTO Building_UnhappinessNeedsFlatReduction 	
			(BuildingType,					YieldType, Yield)
SELECT		'BUILDING_NETHERLANDS_WAAG', 	YieldType, Yield
FROM Building_UnhappinessNeedsFlatReduction WHERE (BuildingType = 'BUILDING_BANK');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_NETHERLANDS_WAAG',	'YIELD_GOLD',			2),
			('BUILDING_NETHERLANDS_WAAG',	'YIELD_PRODUCTION',		2);
--==========================================================================================================================	




