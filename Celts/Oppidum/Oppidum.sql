--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 									LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_IMPROVEMENT_CELTS_OPPIDUM', 	'Improvement', 	'CELTS_OPPIDUM');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 	State, 					Scale, 	ImprovementType, 						LayoutHandler, 	ResourceType, 			Model, 				TerrainContour)
VALUES 		('Any', 'UnderConstruction', 	0.0018, 'ART_DEF_IMPROVEMENT_CELTS_OPPIDUM', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'castro_hb.fxsxml', 1),
			('Any', 'Constructed', 			0.0018, 'ART_DEF_IMPROVEMENT_CELTS_OPPIDUM', 	'RANDOM', 		'ART_DEF_RESOURCE_ALL', 'castro_01.fxsxml', 1),
			('Any', 'Constructed', 			0.0018, 'ART_DEF_IMPROVEMENT_CELTS_OPPIDUM', 	'RANDOM', 		'ART_DEF_RESOURCE_ALL', 'castro_02.fxsxml', 1),
			('Any', 'Constructed', 			0.0018, 'ART_DEF_IMPROVEMENT_CELTS_OPPIDUM', 	'RANDOM', 		'ART_DEF_RESOURCE_ALL', 'castro_03.fxsxml', 1),
			('Any', 'Pillaged', 			0.0018, 'ART_DEF_IMPROVEMENT_CELTS_OPPIDUM', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'castro_pl.fxsxml', 1);
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 					TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_CELTS_OPPIDUM', 	'Improvement', 	'OppidumIcon_128.dds');

--==========================================================================================================================

--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvements
			(Type, 							Description, 							Civilopedia, 								ArtDefineTag, 							Help, 											SpecificCivRequired, 	CivilizationType, 		PillageGold,	CreatedByGreatPerson,	BuildableOnResources,	Permanent,	DestroyedWhenPillaged, 	PortraitIndex, 	IconAtlas, 					NoTwoAdjacent,	DefenseModifier)
VALUES		('IMPROVEMENT_CELTS_OPPIDUM',	'TXT_KEY_IMPROVEMENT_CELTS_OPPIDUM',	'TXT_KEY_IMPROVEMENT_CELTS_OPPIDUM_TEXT',	'ART_DEF_IMPROVEMENT_CELTS_OPPIDUM',	'TXT_KEY_IMPROVEMENT_CELTS_OPPIDUM_HELP',		1,						'CIVILIZATION_CELTS',	20,				1,						1,						0,			0,						0,				'IMPROVEMENT_CELTS_ATLAS',	1,				100);
------------------------------	
-- Improvement_Flavors
------------------------------		
INSERT INTO Improvement_Flavors	
			(ImprovementType, 				FlavorType,				Flavor)
VALUES		('IMPROVEMENT_CELTS_OPPIDUM',	'FLAVOR_SCIENCE',		10),
			('IMPROVEMENT_CELTS_OPPIDUM',	'FLAVOR_CULTURE',		10),
			('IMPROVEMENT_CELTS_OPPIDUM',	'FLAVOR_GOLD',			20),
			('IMPROVEMENT_CELTS_OPPIDUM',	'FLAVOR_PRODUCTION',	10),
			('IMPROVEMENT_CELTS_OPPIDUM',	'FLAVOR_RELIGION',		10),
			('IMPROVEMENT_CELTS_OPPIDUM',	'FLAVOR_GROWTH',		10),
			('IMPROVEMENT_CELTS_OPPIDUM',	'FLAVOR_CITY_DEFENSE',	20),
			('IMPROVEMENT_CELTS_OPPIDUM',	'FLAVOR_DEFENSE',		10);
------------------------------	
-- Improvement_Yields
------------------------------		
INSERT INTO Improvement_Yields 	
			(ImprovementType, 				YieldType,					Yield)
VALUES		('IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_CULTURE',			1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_FAITH',				1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_GOLD',				1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_FOOD',				2),
			('IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_PRODUCTION',			1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_SCIENCE',			1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_GOLDEN_AGE_POINTS',	1);
------------------------------	
-- Improvement_ResourceTypes
------------------------------		
INSERT INTO Improvement_ResourceTypes	
			(ImprovementType, 				ResourceType,			ResourceMakesValid)
VALUES		('IMPROVEMENT_CELTS_OPPIDUM',	'RESOURCE_HORSE',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'RESOURCE_IRON',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'RESOURCE_COAL',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'RESOURCE_OIL',			1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'RESOURCE_ALUMINUM',	1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'RESOURCE_URANIUM',		1);
------------------------------
-- Improvement_AdjacentYieldChanges
------------------------------
INSERT INTO Improvement_AdjacentImprovementYieldChanges
			(ImprovementType,				OtherImprovementType,				YieldType,			Yield)
VALUES		('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_CAMP',					'YIELD_FAITH',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_CAMP',					'YIELD_FOOD',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_FARM',					'YIELD_PRODUCTION', 1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_FARM',					'YIELD_FOOD',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_MINE',					'YIELD_PRODUCTION', 1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_MINE',					'YIELD_GOLD',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_QUARRY',				'YIELD_SCIENCE',	1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_QUARRY',				'YIELD_PRODUCTION', 1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_PLANTATION',			'YIELD_CULTURE',	1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_PLANTATION',			'YIELD_GOLD',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_PASTURE',				'YIELD_FAITH',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_PASTURE',				'YIELD_PRODUCTION',	1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_LUMBERMILL_JUNGLE',	'YIELD_FOOD',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_LUMBERMILL_JUNGLE',	'YIELD_CULTURE',	1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_LUMBERMILL',			'YIELD_FOOD',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_LUMBERMILL',			'YIELD_SCIENCE',	1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_FISHING_BOATS',		'YIELD_GOLD',		1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'IMPROVEMENT_FISHING_BOATS',		'YIELD_FAITH',		1);
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,				TechType,					YieldType,					Yield)
VALUES		('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_IRON_WORKING',		'YIELD_PRODUCTION',			1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_IRON_WORKING',		'YIELD_CULTURE',			1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_THEOLOGY',			'YIELD_FAITH',				1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_THEOLOGY',			'YIELD_SCIENCE',			1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_ECONOMICS',			'YIELD_GOLD',				1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_ECONOMICS',			'YIELD_GOLDEN_AGE_POINTS',	1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_INDUSTRIALIZATION',	'YIELD_PRODUCTION',			1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_INDUSTRIALIZATION',	'YIELD_SCIENCE',			1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_FLIGHT',				'YIELD_CULTURE',			1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_FLIGHT',				'YIELD_GOLD',				1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_COMPUTERS',			'YIELD_FAITH',				1),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TECH_COMPUTERS',			'YIELD_GOLDEN_AGE_POINTS',	1);
------------------------------	
-- Improvement_ValidTerrains
------------------------------		
INSERT INTO Improvement_ValidTerrains 	
			(ImprovementType, 				TerrainType)
VALUES		('IMPROVEMENT_CELTS_OPPIDUM',	'TERRAIN_PLAINS'),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TERRAIN_GRASS'),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TERRAIN_TUNDRA'),
			('IMPROVEMENT_CELTS_OPPIDUM',	'TERRAIN_DESERT'),			
			('IMPROVEMENT_CELTS_OPPIDUM',	'TERRAIN_SNOW');			
--==========================================================================================================================

--==========================================================================================================================
-- BUILDS
--==========================================================================================================================				
------------------------------
-- Builds
------------------------------		
INSERT INTO Builds		
			(Type,					PrereqTech,			ImprovementType, 				Description, 					Help, 								Recommendation, 					EntityEvent, 			OrderPriority, 	Kill, 	IconIndex, 	IconAtlas)
VALUES		('BUILD_CELTS_OPPIDUM',	null,				'IMPROVEMENT_CELTS_OPPIDUM',	'TXT_KEY_BUILD_CELTS_OPPIDUM',	'TXT_KEY_BUILD_CELTS_OPPIDUM_HELP',	'TXT_KEY_BUILD_CELTS_OPPIDUM_REC',	'ENTITY_EVENT_MINE',	95,				1,		1,			'IMPROVEMENT_CELTS_ATLAS');
------------------------------				
-- Unit_Builds
------------------------------				
INSERT INTO Unit_Builds	
			(UnitType, 				BuildType)
VALUES		('UNIT_MERCHANT',		'BUILD_CELTS_OPPIDUM'),
			('UNIT_ENGINEER',		'BUILD_CELTS_OPPIDUM'),
			('UNIT_SCIENTIST',		'BUILD_CELTS_OPPIDUM'),
			('UNIT_GREAT_GENERAL',	'BUILD_CELTS_OPPIDUM');
------------------------------				
-- BuildFeatures
------------------------------				
INSERT INTO BuildFeatures	
			(BuildType, 			FeatureType, PrereqTech, Production, Remove)
SELECT		'BUILD_CELTS_OPPIDUM',	FeatureType, PrereqTech, Production, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_CUSTOMS_HOUSE';
------------------------------				
-- Unit_ScalingFromOwnedImprovements
------------------------------	
INSERT INTO Unit_ScalingFromOwnedImprovements	
			(UnitType, 			ImprovementType, 				Amount)
VALUES		('UNIT_MERCHANT', 	'IMPROVEMENT_CELTS_OPPIDUM', 	10),
			('UNIT_SCIENTIST', 	'IMPROVEMENT_CELTS_OPPIDUM', 	5),
			('UNIT_ENGINEER', 	'IMPROVEMENT_CELTS_OPPIDUM', 	10);

--==========================================================================================================================

--==========================================================================================================================
-- POLICY
--==========================================================================================================================				
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------		
INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType,					ImprovementType,				YieldType,			Yield)
VALUES		('POLICY_NEW_DEAL',				'IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_FAITH',		5),
			('POLICY_TRADITION_FINISHER',	'IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_FOOD',		1),
			('POLICY_FIVE_YEAR_PLAN',		'IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_PRODUCTION',	1),
			('POLICY_MOBILIZATION',			'IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_SCIENCE',	3),
			('POLICY_URBANIZATION',			'IMPROVEMENT_CELTS_OPPIDUM',	'YIELD_FOOD',		2);
--==========================================================================================================================
-- BUILDING
--==========================================================================================================================				
------------------------------
-- Building_ImprovementYieldChangesGlobal
------------------------------	
INSERT INTO Building_ImprovementYieldChangesGlobal
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_MURANO_GLASSWORKS', 'IMPROVEMENT_CELTS_OPPIDUM', 'YIELD_FOOD', 2),
	('BUILDING_MURANO_GLASSWORKS', 'IMPROVEMENT_CELTS_OPPIDUM', 'YIELD_TOURISM', 2);
--==========================================================================================================================
-- BELIEF
--==========================================================================================================================				
------------------------------
-- Belief_ImprovementYieldChanges
------------------------------	
INSERT INTO Belief_ImprovementYieldChanges
	(BeliefType, ImprovementType, YieldType, Yield)
VALUES
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_CELTS_OPPIDUM', 'YIELD_FAITH', 4),
	('BELIEF_UNITY_OF_PROPHETS', 'IMPROVEMENT_CELTS_OPPIDUM', 'YIELD_SCIENCE', 4);
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES		('IMPROVEMENT_CELTS_ATLAS', 			256, 		'OppidumIcons_256.dds',			2, 				1),
			('IMPROVEMENT_CELTS_ATLAS', 			64, 		'OppidumIcons_064.dds',			2, 				1),
			('IMPROVEMENT_CELTS_ATLAS', 			45, 		'OppidumIcons_045.dds',			2, 				1);