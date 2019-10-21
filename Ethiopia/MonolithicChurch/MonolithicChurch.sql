--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 												LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH', 	'Improvement', 	'ETHIOPIA_MONOLITHIC_CHURCH');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 	State, 					Scale, 		ImprovementType, 									LayoutHandler, 	ResourceType, 			Model, 					TerrainContour)
VALUES 		('Any', 'UnderConstruction', 	0.75,		'ART_DEF_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'Lalibela_HB.fxsxml',	1),
			('Any', 'Constructed', 			0.75,		'ART_DEF_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'Lalibela_B.fxsxml',	1),
			('Any', 'Pillaged', 			0.75,		'ART_DEF_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL', 'Lalibela_PL.fxsxml',	1);
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 								TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH', 	'Improvement', 	'MonolithicChurchIcon_128.dds');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('IMPROVEMENT_ETHIOPIA_ATLAS', 			256, 		'MonolithicChurchIcons_256.dds',			1, 				2),
		('IMPROVEMENT_ETHIOPIA_ATLAS', 			64, 		'MonolithicChurchIcons_064.dds',			1, 				2),
		('IMPROVEMENT_ETHIOPIA_ATLAS', 			45, 		'MonolithicChurchIcons_045.dds',			1, 				2);
--==========================================================================================================================

--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvements
			(Type, 											Description, 										Civilopedia, 											ArtDefineTag, 										Help, 													SpecificCivRequired, 	CivilizationType, 			PillageGold,	CreatedByGreatPerson,	BuildableOnResources,	DestroyedWhenPillaged, 	HillsMakesValid,	PortraitIndex, 	IconAtlas, 						NoTwoAdjacent,	DefenseModifier,	AdjacentLuxury)
VALUES		('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH',	'TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_TEXT',	'ART_DEF_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH',	'TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HELP',	1,						'CIVILIZATION_ETHIOPIA',	20,				0,						0,						0,						1,					0,				'IMPROVEMENT_ETHIOPIA_ATLAS',	1,				0,					0);

INSERT INTO Improvements
			(Type, 												Description, 										Civilopedia, 											ArtDefineTag, 										Help, 													PillageGold,	CreatedByGreatPerson,	BuildableOnResources,	DestroyedWhenPillaged, 	HillsMakesValid,	PortraitIndex, 	IconAtlas, 						NoTwoAdjacent,	DefenseModifier,	AdjacentLuxury, ShowInPedia, 	ShowInTechTree)
VALUES		('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH',	'TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_TEXT',	'ART_DEF_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH',	'TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HELP',	20,				0,						0,						0,						0,					0,				'IMPROVEMENT_ETHIOPIA_ATLAS',	0,				0,					0, 				0, 				0);
------------------------------	
-- Improvement_Flavors
------------------------------		
INSERT INTO Improvement_Flavors	
			(ImprovementType, 									FlavorType,				Flavor)
VALUES		('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',		'FLAVOR_GOLD',			5),
			('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',		'FLAVOR_PRODUCTION',	80),
			('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',		'FLAVOR_RELIGION',		80),
			('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',		'FLAVOR_CULTURE',		10),
			('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'FLAVOR_GOLD',			5),
			('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'FLAVOR_PRODUCTION',	80),
			('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'FLAVOR_RELIGION',		80),
			('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'FLAVOR_CULTURE',		10);
------------------------------	
-- Improvement_ValidTerrains
------------------------------		
INSERT INTO Improvement_ValidTerrains 	
			(ImprovementType, 								TerrainType)
VALUES		('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'TERRAIN_HILL');
------------------------------	
-- Improvement_Yields
------------------------------		
INSERT INTO Improvement_Yields 	
			(ImprovementType, 									YieldType,			Yield)
VALUES		('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',		'YIELD_PRODUCTION',	1),
			('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',		'YIELD_FAITH',		1),
			('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_PRODUCTION',	1),
			('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_FAITH',		1);
------------------------------	
-- Improvement_ResourceTypes
------------------------------		
INSERT INTO Improvement_ResourceTypes	
			(ImprovementType, 									ResourceType,			ResourceMakesValid)
VALUES		('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'RESOURCE_STONE',		1);
--==========================================================================================================================

--==========================================================================================================================
-- BUILDS
--==========================================================================================================================				
------------------------------
-- Builds
------------------------------		
INSERT INTO Builds		
			(Type,										PrereqTech,			ImprovementType, 								Description, 								Help, 												Recommendation, 								EntityEvent, 			Time,	OrderPriority, 	Kill, 	IconIndex, 	IconAtlas)
VALUES		('BUILD_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'TECH_THEOLOGY',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'TXT_KEY_BUILD_ETHIOPIA_MONOLITHIC_CHURCH',	'TXT_KEY_BUILD_ETHIOPIA_MONOLITHIC_CHURCH_HELP',	'TXT_KEY_BUILD_ETHIOPIA_MONOLITHIC_CHURCH_REC',	'ENTITY_EVENT_MINE',	1000,	95,				0,		1,			'IMPROVEMENT_ETHIOPIA_ATLAS'),
			('BUILD_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'TECH_THEOLOGY',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'TXT_KEY_BUILD_ETHIOPIA_MONOLITHIC_CHURCH',	'TXT_KEY_BUILD_ETHIOPIA_MONOLITHIC_CHURCH_HELP',	'TXT_KEY_BUILD_ETHIOPIA_MONOLITHIC_CHURCH_REC',	'ENTITY_EVENT_MINE',	1000,	95,				0,		1,			'IMPROVEMENT_ETHIOPIA_ATLAS');
------------------------------				
-- Unit_Builds
------------------------------				
INSERT INTO Unit_Builds	
			(UnitType, 			BuildType)
VALUES		('UNIT_WORKER',		'BUILD_ETHIOPIA_MONOLITHIC_CHURCH_HILL');
------------------------------				
-- Trait_BuildsUnitClasses
------------------------------				
INSERT INTO Trait_BuildsUnitClasses	
			(TraitType, 					UnitClassType, 			BuildType)
VALUES		('TRAIT_BONUS_AGAINST_TECH', 	'UNITCLASS_WORKER',		'BUILD_ETHIOPIA_MONOLITHIC_CHURCH_STONE');
------------------------------				
-- BuildFeatures
------------------------------				
INSERT INTO BuildFeatures	
			(BuildType, 								FeatureType, PrereqTech, Time, Production, Remove)
SELECT		'BUILD_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	FeatureType, PrereqTech, Time, Production, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_CHATEAU';

INSERT INTO BuildFeatures	
			(BuildType, 								FeatureType, PrereqTech, Time, Production, Remove)
SELECT		'BUILD_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	FeatureType, PrereqTech, Time, Production, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_CHATEAU';
--==========================================================================================================================

--==========================================================================================================================
-- POLICY
--==========================================================================================================================				
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------		
INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType,					ImprovementType,								YieldType,			Yield)
VALUES		('POLICY_FIVE_YEAR_PLAN',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_PRODUCTION',	1),
			('POLICY_MOBILIZATION',			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_SCIENCE',	3),
			('POLICY_URBANIZATION',			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_FOOD',		2),
			('POLICY_TRADITION_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_CULTURE',	1),
			('POLICY_LIBERTY_FINISHER',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_CULTURE',	1),
			('POLICY_HONOR_FINISHER',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_CULTURE',	1),
			('POLICY_PIETY_FINISHER',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_FAITH',		1),
			('POLICY_PATRONAGE_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_FAITH',		1),
			('POLICY_AESTHETICS_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_FAITH',		1),
			('POLICY_RATIONALISM_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_SCIENCE',	1),
			('POLICY_EXPLORATION_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_SCIENCE',	1),
			('POLICY_COMMERCE_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL',	'YIELD_SCIENCE',	1),
			('POLICY_FIVE_YEAR_PLAN',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_PRODUCTION',	1),
			('POLICY_MOBILIZATION',			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_SCIENCE',	3),
			('POLICY_URBANIZATION',			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_FOOD',		2),
			('POLICY_TRADITION_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_CULTURE',	1),
			('POLICY_LIBERTY_FINISHER',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_CULTURE',	1),
			('POLICY_HONOR_FINISHER',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_CULTURE',	1),
			('POLICY_PIETY_FINISHER',		'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_FAITH',		1),
			('POLICY_PATRONAGE_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_FAITH',		1),
			('POLICY_AESTHETICS_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_FAITH',		1),
			('POLICY_RATIONALISM_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_SCIENCE',	1),
			('POLICY_EXPLORATION_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_SCIENCE',	1),
			('POLICY_COMMERCE_FINISHER',	'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE',	'YIELD_SCIENCE',	1);
------------------------------
-- Belief_ImprovementYieldChanges
------------------------------	
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 								YieldType, 		Yield)
SELECT	Type, 			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL', 	'YIELD_FAITH', 	1
FROM Beliefs WHERE Pantheon = 1;

INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 								YieldType, 		Yield)
SELECT	Type, 			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL', 	'YIELD_CULTURE', 	1
FROM Beliefs WHERE Founder = 1;

INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 								YieldType, 				Yield)
SELECT	Type, 			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL', 	'YIELD_PRODUCTION', 	1
FROM Beliefs WHERE Follower = 1;

INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 								YieldType, 			Yield)
SELECT	Type, 			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL', 	'YIELD_CULTURE', 	1
FROM Beliefs WHERE Enhancer = 1;

INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 								YieldType, 		Yield)
SELECT	Type, 			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL', 	'YIELD_GOLD', 	1
FROM Beliefs WHERE Reformation = 1;

INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 									YieldType, 		Yield)
SELECT	Type, 			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE', 	'YIELD_FAITH', 	1
FROM Beliefs WHERE Pantheon = 1;

INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 									YieldType, 		Yield)
SELECT	Type, 			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE', 	'YIELD_CULTURE', 	1
FROM Beliefs WHERE Founder = 1;

INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 									YieldType, 				Yield)
SELECT	Type, 			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE', 	'YIELD_PRODUCTION', 	1
FROM Beliefs WHERE Follower = 1;

INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 									YieldType, 			Yield)
SELECT	Type, 			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE', 	'YIELD_CULTURE', 	1
FROM Beliefs WHERE Enhancer = 1;

INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 									YieldType, 		Yield)
SELECT	Type, 			'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE', 	'YIELD_GOLD', 	1
FROM Beliefs WHERE Reformation = 1;
--==========================================================================================================================
--==========================================================================================================================
