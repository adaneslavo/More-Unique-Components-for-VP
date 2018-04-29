--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 										LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_IMPROVEMENT_INDONESIA_KAMPONG', 	'Improvement', 	'INDONESIA_KAMPONG');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 	State, 					Scale, 		ImprovementType, 							LayoutHandler, 	ResourceType, 			Model, 						TerrainContour)
VALUES 		('Any', 'UnderConstruction', 	0.6,		'ART_DEF_IMPROVEMENT_INDONESIA_KAMPONG', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'Water Village HB.fxsxml',	1),
			('Any', 'Constructed', 			0.6,		'ART_DEF_IMPROVEMENT_INDONESIA_KAMPONG', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'Water Village B.fxsxml',	1),
			('Any', 'Pillaged', 			0.6,		'ART_DEF_IMPROVEMENT_INDONESIA_KAMPONG', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'Water Village PL.fxsxml',	1);
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 						TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_INDONESIA_KAMPONG', 	'Improvement', 	'KampongIcon_128.dds');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('IMPROVEMENT_INDONESIA_ATLAS', 			256, 		'KampongIcons_256.dds',			1, 				2),
		('IMPROVEMENT_INDONESIA_ATLAS', 			64, 		'KampongIcons_064.dds',			1, 				2),
		('IMPROVEMENT_INDONESIA_ATLAS', 			45, 		'KampongIcons_045.dds',			1, 				2);
--==========================================================================================================================

--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvements
			(Type,										Water,	SpecificCivRequired,	CivilizationType,			GoldMaintenance,	NoTwoAdjacent,	 Description,									Civilopedia,										Help, 											ArtDefineTag,								DestroyedWhenPillaged,	Permanent,	PillageGold,	BuildableOnResources,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_INDONESIA_KAMPONG',			1,		1,						'CIVILIZATION_INDONESIA',	0,					1,				'TXT_KEY_IMPROVEMENT_INDONESIA_KAMPONG',		'TXT_KEY_IMPROVEMENT_INDONESIA_KAMPONG_TEXT',		'TXT_KEY_IMPROVEMENT_INDONESIA_KAMPONG_HELP',	'ART_DEF_IMPROVEMENT_INDONESIA_KAMPONG', 	1,						0,			10,				0,						0,				'IMPROVEMENT_INDONESIA_ATLAS');
------------------------------	
-- Improvement_Flavors
------------------------------		
INSERT INTO Improvement_Flavors	
			(ImprovementType, 					FlavorType,				Flavor)
VALUES		('IMPROVEMENT_INDONESIA_KAMPONG',	'FLAVOR_GROWTH',		30),
			('IMPROVEMENT_INDONESIA_KAMPONG',	'FLAVOR_CULTURE',		60),
			('IMPROVEMENT_INDONESIA_KAMPONG',	'FLAVOR_SCIENCE',		5),
			('IMPROVEMENT_INDONESIA_KAMPONG',	'FLAVOR_PRODUCTION',	5);
------------------------------	
-- Improvement_ValidTerrains
------------------------------		
INSERT INTO Improvement_ValidTerrains 	
			(ImprovementType, 				TerrainType)
VALUES		('IMPROVEMENT_INDONESIA_KAMPONG',	'TERRAIN_COAST'),
			('IMPROVEMENT_INDONESIA_KAMPONG',	'TERRAIN_OCEAN');
------------------------------	
-- Improvement_Yields
------------------------------		
INSERT INTO Improvement_Yields 	
			(ImprovementType, 				YieldType,				Yield)
VALUES		('IMPROVEMENT_INDONESIA_KAMPONG',	'YIELD_CULTURE',	1),
			('IMPROVEMENT_INDONESIA_KAMPONG',	'YIELD_FOOD',		1);
------------------------------
-- Improvement_AdjacentYieldChanges
------------------------------
INSERT INTO Improvement_AdjacentImprovementYieldChanges
			(ImprovementType,					OtherImprovementType,			YieldType,				Yield)
VALUES		('IMPROVEMENT_INDONESIA_KAMPONG',	'IMPROVEMENT_FISHING_BOATS',		'YIELD_PRODUCTION',		1);
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,						TechType,			YieldType,			Yield)
VALUES		('IMPROVEMENT_INDONESIA_KAMPONG',		'TECH_COMPASS',		'YIELD_PRODUCTION',	1),
			('IMPROVEMENT_INDONESIA_KAMPONG',		'TECH_NAVIGATION',	'YIELD_CULTURE',	1),
			('IMPROVEMENT_INDONESIA_KAMPONG',		'TECH_DYNAMITE',	'YIELD_FOOD',		1),
			('IMPROVEMENT_INDONESIA_KAMPONG',		'TECH_ECOLOGY',		'YIELD_SCIENCE',	1);
--==========================================================================================================================

--==========================================================================================================================
-- BUILDS
--==========================================================================================================================				
------------------------------
-- Builds
------------------------------		
INSERT INTO Builds
			(Type,						PrereqTech,				Water,	CanBeEmbarked,	Time,			ImprovementType,						Description,							Help,											Recommendation,							EntityEvent,				OrderPriority,	IconIndex,	IconAtlas)
VALUES		('BUILD_INDONESIA_KAMPONG',	'TECH_OPTICS',			1,		1,				700,            'IMPROVEMENT_INDONESIA_KAMPONG',		'TXT_KEY_BUILD_INDONESIA_KAMPONG',		'TXT_KEY_BUILD_INDONESIA_KAMPONG_HELP',			'TXT_KEY_BUILD_INDONESIA_KAMPONG_REC',	'ENTITY_EVENT_CHOP',		96,				1,			'IMPROVEMENT_INDONESIA_ATLAS');
------------------------------				
-- Unit_Builds
------------------------------				
INSERT INTO Unit_Builds	
			(UnitType, 			BuildType)
VALUES		('UNIT_WORKER',		'BUILD_INDONESIA_KAMPONG');
--==========================================================================================================================

--==========================================================================================================================
-- POLICY
--==========================================================================================================================				
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------		
INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType,					ImprovementType,				YieldType,			Yield)
VALUES		('POLICY_FIVE_YEAR_PLAN',		'IMPROVEMENT_INDONESIA_KAMPONG',	'YIELD_PRODUCTION',	1),
			('POLICY_MOBILIZATION',			'IMPROVEMENT_INDONESIA_KAMPONG',	'YIELD_SCIENCE',	3),
			('POLICY_URBANIZATION',			'IMPROVEMENT_INDONESIA_KAMPONG',	'YIELD_FOOD',		2);
