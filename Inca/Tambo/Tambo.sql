--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_INCA', 	'BUILDINGCLASS_CARAVANSARY', 	'BUILDING_INCA_TAMBO');
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 					BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteLandDistanceModifier, AlwaysHeal, 	TradeRouteLandGoldBonus, CityConnectionGoldModifier, 	FinishLandTRTourism, Description, 					Civilopedia, 							Help, 								Strategy,									PlotBuyCostModifier, ArtDefineTag, 	ArtInfoEraVariation, FreeStartEra, DisplayPosition, MinAreaSize, ConquestProb, 	GreatPeopleRateModifier, FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_INCA_TAMBO',	BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteLandDistanceModifier, 5,				TradeRouteLandGoldBonus, CityConnectionGoldModifier+10,	FinishLandTRTourism, 'TXT_KEY_BUILDING_INCA_TAMBO', 'TXT_KEY_BUILDING_INCA_TAMBO_TEXT', 	'TXT_KEY_BUILDING_INCA_TAMBO_HELP', 'TXT_KEY_BUILDING_INCA_TAMBO_STRATEGY',		PlotBuyCostModifier, ArtDefineTag,	ArtInfoEraVariation, FreeStartEra, DisplayPosition, MinAreaSize, 100, 			GreatPeopleRateModifier, FreshWater, HurryCostModifier, 0, 				'BUILDING_APIG4UC_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';		
------------------------------	
-- Building_Yields
------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType,			 YieldType,			Yield)
VALUES		('BUILDING_INCA_TAMBO', 'YIELD_GOLD',		2);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType,			BuildingClassType,			YieldType,			YieldChange)
VALUES		('BUILDING_INCA_TAMBO', 'BUILDINGCLASS_GRANARY',	'YIELD_PRODUCTION', 2);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,			ResourceType, YieldType, Yield)
SELECT		'BUILDING_INCA_TAMBO',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_CARAVANSARY';		
------------------------------	
-- Building_SpecialistYieldChangesLocal
------------------------------
INSERT INTO Building_SpecialistYieldChangesLocal
			(BuildingType,			SpecialistType, YieldType, Yield)
SELECT		'BUILDING_INCA_TAMBO',	SpecialistType, YieldType, Yield
FROM Building_SpecialistYieldChangesLocal WHERE BuildingType = 'BUILDING_CARAVANSARY';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,				Flavor)
VALUES	('BUILDING_INCA_TAMBO',		'FLAVOR_HAPPINESS',		40),
		('BUILDING_INCA_TAMBO',		'FLAVOR_PRODUCTION',	20),
		('BUILDING_INCA_TAMBO',		'FLAVOR_CULTURE',		20),
		('BUILDING_INCA_TAMBO',		'FLAVOR_GOLD',			40);
--==========================================================================================================================
--==========================================================================================================================	
