--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_ENGLAND',	'BUILDINGCLASS_FACTORY',		'BUILDING_STEAM_MILL');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('BUILDING_ENGLAND_ATLAS', 			256, 		'WhiteTowerPicture_256.dds',			1, 				1),
		('BUILDING_ENGLAND_ATLAS', 			128, 		'WhiteTowerPicture_128.dds',			1, 				1),
		('BUILDING_ENGLAND_ATLAS', 			64, 		'WhiteTowerPicture_064.dds',			1, 				1),
		('BUILDING_ENGLAND_ATLAS', 			45, 		'WhiteTowerPicture_045.dds',			1, 				1);
--==========================================================================================================================

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type,			BuildingClass, Cost, 		GoldMaintenance, 	PrereqTech, 		Help, 					Description, 			Civilopedia, 					Strategy, 				ArtDefineTag, SpecialistType, SpecialistCount,	TradeRouteTargetBonus, 	TradeRouteRecipientBonus, 	MinAreaSize, ConquestProb, HurryCostModifier, IconAtlas, 		PortraitIndex)		 	
SELECT		'BUILDING_STEAM_MILL',	BuildingClass, Cost-250, 	6, 			'TECH_STEAM_POWER', 	'TXT_KEY_BUILDING_STEAM_MILL_HELP', 	'TXT_KEY_BUILDING_STEAM_MILL', 	'TXT_KEY_CIV5_BUILDINGS_STEAM_MILL_TEXT', 	'TXT_KEY_BUILDING_STEAM_MILL_STRATEGY', ArtDefineTag, SpecialistType, 2, 		3, 			3, 				MinAreaSize, ConquestProb, HurryCostModifier, 'COMMUNITY_ATLAS',	36
FROM Buildings WHERE Type = 'BUILDING_FACTORY';	

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_STEAM_MILL', 'IMPROVEMENT_MANUFACTORY', 'YIELD_PRODUCTION', 4);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_STEAM_MILL', 'YIELD_PRODUCTION', 5);

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_STEAM_MILL', 'FLAVOR_PRODUCTION', 50),
	('BUILDING_STEAM_MILL', 'FLAVOR_SCIENCE', 15);

INSERT INTO Building_YieldFromInternalTREnd
	(BuildingType, YieldType, Yield)
VALUES	('BUILDING_STEAM_MILL', 'YIELD_PRODUCTION', 50);

INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_STEAM_MILL', 'BUILDINGCLASS_WORKSHOP');

INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_STEAM_MILL', 'YIELD_PRODUCTION', 50);
	
INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_STEAM_MILL', 'RESOURCE_COAL', 'YIELD_PRODUCTION', 3);
