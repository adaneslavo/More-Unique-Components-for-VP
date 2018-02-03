INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 				IconsPerRow, 	IconsPerColumn)
VALUES	
		('IZIKO_ATLAS', 						256, 		'Iziko256.dds',			1, 				1),
		('IZIKO_ATLAS', 						128, 		'Iziko128.dds',			1, 				1),
		('IZIKO_ATLAS', 						64, 		'Iziko64.dds',				1, 				1),
		('IZIKO_ATLAS', 						45, 		'Iziko45.dds',				1, 				1);

--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_ZULU',	'BUILDINGCLASS_AMPHITHEATER', 	'BUILDING_IZIKO');
--==========================================================================================================================
--==========================================================================================================================

INSERT INTO Buildings 	
		(Type, 				BuildingClass, Cost, GoldMaintenance, 	PrereqTech,	Water, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, Description, 					Civilopedia, 					Help, 							Strategy,								PlotBuyCostModifier, ArtDefineTag, 	ArtInfoEraVariation, FreeStartEra, DisplayPosition, AllowsWaterRoutes, MinAreaSize, ConquestProb, 	GreatPeopleRateModifier, FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_IZIKO',	BuildingClass, Cost, 0, 				PrereqTech, Water, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, 'TXT_KEY_BUILDING_IZIKO', 	'TXT_KEY_BUILDING_IZIKO_TEXT', 	'TXT_KEY_BUILDING_IZIKO_HELP', 	'TXT_KEY_BUILDING_IZIKO_STRATEGY',		PlotBuyCostModifier, 'COLESSEUM',	ArtInfoEraVariation, 'ERA_RENAISSANCE', DisplayPosition, AllowsWaterRoutes, -1, 66, 					GreatPeopleRateModifier, FreshWater, HurryCostModifier, 0,			 	'IZIKO_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER';	

------------------------------	
-- Building_Yields
------------------------------
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_IZIKO', 'YIELD_FAITH', 2),
	('BUILDING_IZIKO', 'YIELD_CULTURE', 3);

INSERT INTO Building_YieldFromUnitLevelUp
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_IZIKO', 'YIELD_CULTURE', 5);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
SELECT	'BUILDING_IZIKO', ResourceType, YieldType, Yield
FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER';

INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 		BuildingClassType, YieldType, YieldChange)
SELECT	'BUILDING_IZIKO', 	BuildingClassType, YieldType, YieldChange
FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER';
	
INSERT INTO Building_SpecificGreatPersonRateModifier
		(BuildingType, 		SpecialistType, Modifier)
SELECT	'BUILDING_IZIKO', 	SpecialistType, Modifier
FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER';
	
INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_IZIKO', 'BUILDINGCLASS_MONUMENT');
	
INSERT INTO Building_GreatWorkYieldChanges
		(BuildingType, YieldType, Yield)
VALUES	('BUILDING_IZIKO', 'YIELD_CULTURE', 1);
	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,				Flavor)
VALUES	
	('BUILDING_IZIKO',		'FLAVOR_FAITH',		20),
	('BUILDING_IZIKO',		'FLAVOR_CULTURE',		50),
	('BUILDING_IZIKO',		'FLAVOR_GOLD',		20);
