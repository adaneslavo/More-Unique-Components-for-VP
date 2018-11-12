--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_INCA', 		'BUILDINGCLASS_CARAVANSARY', 	'BUILDING_INCA_TAMBO');
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
------------------------------	
-- Buildings
------------------------------
INSERT INTO Buildings 	
		(Type, 					BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteLandDistanceModifier, AlwaysHeal, 	Defense, 	TradeRouteLandGoldBonus, CityConnectionGoldModifier, 	FinishLandTRTourism, Description, 					Civilopedia, 						Help, 								Strategy,								PlotBuyCostModifier, ArtDefineTag, 	ArtInfoEraVariation, FreeStartEra, DisplayPosition, MinAreaSize, ConquestProb, 	GreatPeopleRateModifier, FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_INCA_TAMBO',	BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteLandDistanceModifier, 5,				500, 		TradeRouteLandGoldBonus, CityConnectionGoldModifier,	FinishLandTRTourism, 'TXT_KEY_BUILDING_INCA_TAMBO', 'TXT_KEY_BUILDING_INCA_TAMBO_TEXT', 'TXT_KEY_BUILDING_INCA_TAMBO_HELP', 'TXT_KEY_BUILDING_INCA_TAMBO_STRATEGY',	PlotBuyCostModifier, ArtDefineTag,	ArtInfoEraVariation, FreeStartEra, DisplayPosition, MinAreaSize, ConquestProb, 	GreatPeopleRateModifier, FreshWater, HurryCostModifier, 0, 				'BUILDING_INCA_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	
------------------------------	
-- Building_Yields
------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType, 			YieldType, 			Yield)
VALUES		('BUILDING_INCA_TAMBO', 'YIELD_GOLD', 		1);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges
			(BuildingType, 				ResourceType, YieldType, Yield)
SELECT 		'BUILDING_INCA_TAMBO', 		ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_CARAVANSARY';		
------------------------------	
-- Building_SpecialistYieldChangesLocal
------------------------------
INSERT INTO Building_SpecialistYieldChangesLocal
		(BuildingType, 			SpecialistType, YieldType, Yield)
SELECT 	'BUILDING_INCA_TAMBO', 	SpecialistType, YieldType, Yield
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
-- ARTDEFINES
--==========================================================================================================================	
------------------------------	
-- IconTextureAtlases
------------------------------		
INSERT INTO IconTextureAtlases 
		(Atlas, 					IconSize, 	Filename, 				IconsPerRow, 	IconsPerColumn)
VALUES	('BUILDING_INCA_ATLAS', 	256, 		'TamboIcon_256.dds',	1, 				1),
		('BUILDING_INCA_ATLAS', 	128, 		'TamboIcon_128.dds',	1, 				1),
		('BUILDING_INCA_ATLAS', 	64, 		'TamboIcon_064.dds',	1, 				1),
		('BUILDING_INCA_ATLAS', 	45, 		'TamboIcon_45.dds',		1, 				1);
--==========================================================================================================================
--==========================================================================================================================