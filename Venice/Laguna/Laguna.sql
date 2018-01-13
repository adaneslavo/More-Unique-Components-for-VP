INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
SELECT 'ATLAS_LAGUNA', 256, 'Laguna256.dds', 1, 1 UNION ALL
SELECT 'ATLAS_LAGUNA', 214, 'Laguna214.dds', 1, 1 UNION ALL
SELECT 'ATLAS_LAGUNA', 128, 'Laguna128.dds', 1, 1 UNION ALL
SELECT 'ATLAS_LAGUNA', 80, 'Laguna80.dds', 1, 1 UNION ALL
SELECT 'ATLAS_LAGUNA', 64, 'Laguna64.dds', 1, 1 UNION ALL
SELECT 'ATLAS_LAGUNA', 45, 'Laguna45.dds', 1, 1 UNION ALL
SELECT 'ATLAS_LAGUNA', 40, 'Laguna40.dds', 1, 1;


INSERT INTO Buildings 
		(Type, 				BuildingClass, 			Cost, 	GoldMaintenance, 	Water, 	PrereqTech, 	Help, 							Description, 				Civilopedia, 						Strategy, 							ArtDefineTag, 	MinAreaSize, 	HurryCostModifier, 	IconAtlas, 		PortraitIndex, 	DisplayPosition, 	ArtInfoEraVariation, 	CitySupplyModifier, FinishSeaTRTourism, TradeRouteSeaDistanceModifier, 	TradeRouteSeaGoldBonus, ExtraCityHitPoints, ConquestProb)
SELECT 	'BUILDING_LAGUNA', 	'BUILDINGCLASS_HARBOR', 350, 	2, 					1, 		'TECH_COMPASS', 'TXT_KEY_BUILDING_LAGUNA_TEXT', 'TXT_KEY_BUILDING_LAGUNA', 	'TXT_KEY_BUILDING_LAGUNA_PEDIA', 	'TXT_KEY_BUILDING_LAGUNA_STRATEGY', 'HARBOR', 		10, 			-20, 				'ATLAS_LAGUNA', 0, 				16, 				1, 						10, 				10, 				75, 							400, 					100, 				66;

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_LAGUNA', 'YIELD_GOLD', 3),
	('BUILDING_LAGUNA', 'YIELD_FOOD', 3),
	('BUILDING_LAGUNA', 'YIELD_CULTURE', 3);
	
INSERT INTO Building_SeaPlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_LAGUNA', 'YIELD_FOOD', 1);
	
INSERT INTO Building_SeaResourceYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_LAGUNA', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_LAGUNA', 'FLAVOR_GOLD', 20),
	('BUILDING_LAGUNA', 'FLAVOR_I_SEA_TRADE_ROUTE', 10),
	('BUILDING_LAGUNA', 'FLAVOR_WATER_CONNECTION', 40),
	('BUILDING_LAGUNA', 'FLAVOR_I_TRADE_ORIGIN', 20),
	('BUILDING_LAGUNA', 'FLAVOR_CULTURE', 30);

INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType)
SELECT 'BUILDING_LAGUNA', 'BUILDINGCLASS_LIGHTHOUSE';

INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType)
SELECT 'CIVILIZATION_VENICE', 'BUILDINGCLASS_HARBOR', 'BUILDING_LAGUNA';

INSERT INTO Building_BuildingClassYieldChanges 
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_LAGUNA', 'BUILDINGCLASS_RIALTO_DISTRICT', 'YIELD_GOLD', 3),
	('BUILDING_LAGUNA', 'BUILDINGCLASS_RIALTO_DISTRICT', 'YIELD_FOOD', 2),
	('BUILDING_LAGUNA', 'BUILDINGCLASS_VENETIAN_ARSENALE', 'YIELD_PRODUCTION', 2),
	('BUILDING_LAGUNA', 'BUILDINGCLASS_VENETIAN_ARSENALE', 'YIELD_SCIENCE', 2),
	('BUILDING_LAGUNA', 'BUILDINGCLASS_MURANO_GLASSWORKS', 'YIELD_TOURISM', 2),
	('BUILDING_LAGUNA', 'BUILDINGCLASS_MURANO_GLASSWORKS', 'YIELD_CULTURE', 2);


INSERT INTO Building_FeatureYieldChanges (BuildingType, FeatureType, YieldType, Yield)
SELECT 'BUILDING_LAGUNA', 'FEATURE_ATOLL', 'YIELD_FOOD', 2 UNION ALL
SELECT 'BUILDING_LAGUNA', 'FEATURE_ATOLL', 'YIELD_PRODUCTION', 2;
