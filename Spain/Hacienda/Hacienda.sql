--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 									LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_IMPROVEMENT_SPAIN_HACIENDA', 	'Improvement', 	'SPAIN_HACIENDA');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 	State, 					Scale, 	ImprovementType, 						LayoutHandler, 	ResourceType, 			Model, 					TerrainContour)
VALUES 		('Any', 'UnderConstruction', 	0.8,	'ART_DEF_IMPROVEMENT_SPAIN_HACIENDA', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'hacienda_hb.fxsxml',	1),
			('Any', 'Constructed', 			0.8,	'ART_DEF_IMPROVEMENT_SPAIN_HACIENDA', 	'SNAPSHOT', 		'ART_DEF_RESOURCE_ALL', 'hacienda.fxsxml',		1),
			('Any', 'Pillaged', 			0.8,	'ART_DEF_IMPROVEMENT_SPAIN_HACIENDA', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'hacienda_pl.fxsxml',	1);
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 					TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_SPAIN_HACIENDA', 	'Improvement', 	'HaciendaIcon_128.dds');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('IMPROVEMENT_SPAIN_ATLAS', 			256, 		'HaciendaIcons_256.dds',			2, 				1),
		('IMPROVEMENT_SPAIN_ATLAS', 			64, 		'HaciendaIcons_064.dds',			2, 				1),
		('IMPROVEMENT_SPAIN_ATLAS', 			45, 		'HaciendaIcons_045.dds',			2, 				1);
--==========================================================================================================================

--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvements
			(Type, 							Description, 							Civilopedia, 								ArtDefineTag, 							Help, 										SpecificCivRequired, 	CivilizationType, 		PillageGold,	CreatedByGreatPerson,	BuildableOnResources,	DestroyedWhenPillaged, 	PortraitIndex, 	IconAtlas, 					NoTwoAdjacent,	DefenseModifier,	AdjacentLuxury)
VALUES		('IMPROVEMENT_SPAIN_HACIENDA',	'TXT_KEY_IMPROVEMENT_SPAIN_HACIENDA',	'TXT_KEY_IMPROVEMENT_SPAIN_HACIENDA_TEXT',	'ART_DEF_IMPROVEMENT_SPAIN_HACIENDA',	'TXT_KEY_IMPROVEMENT_SPAIN_HACIENDA_HELP',	1,						'CIVILIZATION_SPAIN',	20,				0,						0,						0,						0,				'IMPROVEMENT_SPAIN_ATLAS',	1,				0,					1);
------------------------------	
-- Improvement_Flavors
------------------------------		
INSERT INTO Improvement_Flavors	
			(ImprovementType, 				FlavorType,				Flavor)
VALUES		('IMPROVEMENT_SPAIN_HACIENDA',	'FLAVOR_GOLD',			80),
			('IMPROVEMENT_SPAIN_HACIENDA',	'FLAVOR_PRODUCTION',	70),
			('IMPROVEMENT_SPAIN_HACIENDA',	'FLAVOR_RELIGION',		5),
			('IMPROVEMENT_SPAIN_HACIENDA',	'FLAVOR_GROWTH',		15);
------------------------------	
-- Improvement_ValidTerrains
------------------------------		
INSERT INTO Improvement_ValidTerrains 	
			(ImprovementType, 				TerrainType)
VALUES		('IMPROVEMENT_SPAIN_HACIENDA',	'TERRAIN_PLAINS'),
			('IMPROVEMENT_SPAIN_HACIENDA',	'TERRAIN_GRASS'),
			('IMPROVEMENT_SPAIN_HACIENDA',	'TERRAIN_TUNDRA'),
			('IMPROVEMENT_SPAIN_HACIENDA',	'TERRAIN_DESERT'),			
			('IMPROVEMENT_SPAIN_HACIENDA',	'TERRAIN_SNOW');
------------------------------	
-- Improvement_Yields
------------------------------		
INSERT INTO Improvement_Yields 	
			(ImprovementType, 				YieldType,			Yield)
VALUES		('IMPROVEMENT_SPAIN_HACIENDA',	'YIELD_PRODUCTION',	1),
			('IMPROVEMENT_SPAIN_HACIENDA',	'YIELD_GOLD',		1),
			('IMPROVEMENT_SPAIN_HACIENDA',	'YIELD_FOOD',		3);
------------------------------	
-- Improvement_AdjacentCityYields
------------------------------		
INSERT INTO Improvement_AdjacentCityYields 	
			(ImprovementType, 				YieldType,			Yield)
VALUES		('IMPROVEMENT_SPAIN_HACIENDA',	'YIELD_PRODUCTION',	2);
------------------------------	
-- Improvement_AdjacentResourceYieldChanges
------------------------------		
INSERT INTO Improvement_AdjacentResourceYieldChanges	
			(ImprovementType, 				ResourceType,			YieldType,			Yield)
VALUES		('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_AMBER',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_BRAZILWOOD',	'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_CITRUS',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_CLOVES',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_COCOA',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_COFFEE',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_COPPER',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_CORAL',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_COTTON',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_CRAB',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_DYE',			'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_FUR',			'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_GEMS',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_GOLD',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_INCENSE',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_IVORY',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_JADE',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_LAPIS',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_MARBLE',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_NUTMEG',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_OLIVE',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_PEARLS',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_PEPPER',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_PERFUME',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_PORCELAIN',	'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_SALT',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_SILK',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_SILVER',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_SPICES',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_SUGAR',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_TEA',			'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_TOBACCO',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_TRUFFLES',	'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_WHALE',		'YIELD_GOLD',		2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'RESOURCE_WINE',		'YIELD_GOLD',		2);
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,				TechType,					YieldType,			Yield)
VALUES		('IMPROVEMENT_SPAIN_HACIENDA',	'TECH_ARCHITECTURE',		'YIELD_CULTURE',	2),
			('IMPROVEMENT_SPAIN_HACIENDA',	'TECH_FERTILIZER',			'YIELD_GOLD',		1),
			('IMPROVEMENT_SPAIN_HACIENDA',	'TECH_FERTILIZER',			'YIELD_PRODUCTION',	1);
--==========================================================================================================================

--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Building_ImprovementYieldChanges
------------------------------		
INSERT INTO Building_ImprovementYieldChanges	
			(BuildingType, 			ImprovementType,				YieldType,		Yield)
VALUES		('BUILDING_MISSION',	'IMPROVEMENT_SPAIN_HACIENDA',	'YIELD_FAITH',	1);	
--==========================================================================================================================

--==========================================================================================================================
-- BUILDS
--==========================================================================================================================				
------------------------------
-- Builds
------------------------------		
INSERT INTO Builds		
			(Type,						PrereqTech,				ImprovementType, 				Description, 					Help, 									Recommendation, 					EntityEvent, 			Time,	OrderPriority, 	Kill, 	IconIndex, 	IconAtlas)
VALUES		('BUILD_SPAIN_HACIENDA',	'TECH_CIVIL_SERVICE',	'IMPROVEMENT_SPAIN_HACIENDA',	'TXT_KEY_BUILD_SPAIN_HACIENDA',	'TXT_KEY_BUILD_SPAIN_HACIENDA_HELP',	'TXT_KEY_BUILD_SPAIN_HACIENDA_REC',	'ENTITY_EVENT_BUILD',	800,	95,				0,		1,			'IMPROVEMENT_SPAIN_ATLAS');
------------------------------				
-- Unit_Builds
------------------------------				
INSERT INTO Unit_Builds	
			(UnitType, 			BuildType)
VALUES		('UNIT_WORKER',		'BUILD_SPAIN_HACIENDA');
------------------------------				
-- BuildFeatures
------------------------------				
INSERT INTO BuildFeatures	
			(BuildType, 				FeatureType, 		PrereqTech,					Time, 		Production,	Remove)
VALUES		('BUILD_SPAIN_HACIENDA',	'FEATURE_JUNGLE',	'TECH_IRON_WORKING',		500,		20,			1),
			('BUILD_SPAIN_HACIENDA',	'FEATURE_FOREST',	'TECH_BRONZE_WORKING',		400,		30,			1),
			('BUILD_SPAIN_HACIENDA',	'FEATURE_MARSH',	'TECH_MACHINERY',			600,		0,			1);
--==========================================================================================================================

--==========================================================================================================================
-- POLICY
--==========================================================================================================================				
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------		
INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType,					ImprovementType,				YieldType,			Yield)
VALUES		('POLICY_FIVE_YEAR_PLAN',		'IMPROVEMENT_SPAIN_HACIENDA',	'YIELD_PRODUCTION',	1),
			('POLICY_MOBILIZATION',			'IMPROVEMENT_SPAIN_HACIENDA',	'YIELD_SCIENCE',	3),
			('POLICY_URBANIZATION',			'IMPROVEMENT_SPAIN_HACIENDA',	'YIELD_FOOD',		2);