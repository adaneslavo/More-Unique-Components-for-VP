--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 										LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_IMPROVEMENT_ROME_LATIFUNDIUM', 	'Improvement', 	'ROME_LATIFUNDIUM');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 	State, 					Scale, 		ImprovementType, 							LayoutHandler, 	ResourceType, 				Model, 								TerrainContour)
VALUES 		('Any', 'UnderConstruction', 	0.85,		'ART_DEF_IMPROVEMENT_ROME_LATIFUNDIUM', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL',		'Mediterranean Villa_HB.fxsxml',	1),
			('Any', 'Constructed', 			0.85,		'ART_DEF_IMPROVEMENT_ROME_LATIFUNDIUM', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL',		'Mediterranean Villa_B.fxsxml',		1),
			('Any', 'Pillaged', 			0.85,		'ART_DEF_IMPROVEMENT_ROME_LATIFUNDIUM', 	'SNAPSHOT', 	'ART_DEF_RESOURCE_ALL',		'Mediterranean Villa_PL.fxsxml',	1);
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 						TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_ROME_LATIFUNDIUM', 	'Improvement', 	'LatifundiumIcon_128.dds');
--==========================================================================================================================

--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvements
			(Type, 								Description, 							Civilopedia, 									ArtDefineTag, 							Help, 											SpecificCivRequired, 	CivilizationType, 		PillageGold,	CreatedByGreatPerson,	BuildableOnResources,	DestroyedWhenPillaged, 	Permanent,	PortraitIndex, 	IconAtlas, 					NoTwoAdjacent,	DefenseModifier,	AdjacentLuxury)
VALUES		('IMPROVEMENT_ROME_LATIFUNDIUM',	'TXT_KEY_IMPROVEMENT_ROME_LATIFUNDIUM',	'TXT_KEY_IMPROVEMENT_ROME_LATIFUNDIUM_TEXT',	'ART_DEF_IMPROVEMENT_ROME_LATIFUNDIUM',	'TXT_KEY_IMPROVEMENT_ROME_LATIFUNDIUM_HELP',	1,						'CIVILIZATION_ROME',	25,				0,						0,						0,						1,			0,				'IMPROVEMENT_ROME_ATLAS',	1,				0,					0);
------------------------------	
-- Improvement_Flavors
------------------------------		
INSERT INTO Improvement_Flavors	
			(ImprovementType, 							FlavorType,				Flavor)
VALUES		('IMPROVEMENT_ROME_LATIFUNDIUM',			'FLAVOR_GROWTH',		100),
			('IMPROVEMENT_ROME_LATIFUNDIUM',			'FLAVOR_PRODUCTION',	30),
			('IMPROVEMENT_ROME_LATIFUNDIUM',			'FLAVOR_CULTURE',		50),
			('IMPROVEMENT_ROME_LATIFUNDIUM',			'FLAVOR_GOLD',			60);
------------------------------	
-- Improvement_Yields
------------------------------		
INSERT INTO Improvement_Yields 	
			(ImprovementType, 							YieldType,			Yield)
VALUES		('IMPROVEMENT_ROME_LATIFUNDIUM',			'YIELD_CULTURE',	1),
			('IMPROVEMENT_ROME_LATIFUNDIUM',			'YIELD_FOOD',		1);
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,							TechType,				YieldType,			Yield)
VALUES		('IMPROVEMENT_ROME_LATIFUNDIUM',			'TECH_CURRENCY',		'YIELD_GOLD',		2),
			('IMPROVEMENT_ROME_LATIFUNDIUM',			'TECH_CIVIL_SERVICE',	'YIELD_FOOD',		1),
			('IMPROVEMENT_ROME_LATIFUNDIUM',			'TECH_CIVIL_SERVICE',	'YIELD_PRODUCTION',	1),
			('IMPROVEMENT_ROME_LATIFUNDIUM',			'TECH_ECONOMICS',		'YIELD_GOLD',		1),
			('IMPROVEMENT_ROME_LATIFUNDIUM',			'TECH_FERTILIZER',		'YIELD_FOOD',		1),
			('IMPROVEMENT_ROME_LATIFUNDIUM',			'TECH_FERTILIZER',		'YIELD_PRODUCTION',	1);
------------------------------	
-- Improvement_ResourceTypes
------------------------------		
INSERT INTO Improvement_ResourceTypes	
			(ImprovementType, 							ResourceType,			ResourceMakesValid,	ResourceTrade)
VALUES		('IMPROVEMENT_ROME_LATIFUNDIUM',			'RESOURCE_WHEAT',		1,					1);	

INSERT INTO Improvement_ResourceTypes	
			(ImprovementType,				ResourceType,	ResourceMakesValid,		ResourceTrade)
SELECT		'IMPROVEMENT_ROME_LATIFUNDIUM',	ResourceType,	1,						1
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';

CREATE TRIGGER VP_LatifundiaCompatibility_Resource1
AFTER INSERT ON Improvement_ResourceTypes 
WHEN NEW.ImprovementType IN('IMPROVEMENT_PLANTATION')
BEGIN
	INSERT INTO Improvement_ResourceTypes
				(ImprovementType, 				ResourceType, 		ResourceMakesValid,	ResourceTrade)
	SELECT		'IMPROVEMENT_ROME_LATIFUNDIUM', NEW.ResourceType, 	1, 					1;
END;

CREATE TRIGGER VP_LatifundiaCompatibility_Resource2
AFTER INSERT ON Improvement_ResourceTypes 
WHEN NEW.ImprovementType IN('IMPROVEMENT_FARM')
BEGIN
	INSERT INTO Improvement_ResourceTypes
				(ImprovementType, 				ResourceType, 		ResourceMakesValid,	ResourceTrade)
	SELECT		'IMPROVEMENT_ROME_LATIFUNDIUM', NEW.ResourceType, 	1, 					1;
END;
------------------------------
-- Improvement_AdjacentYieldChanges
------------------------------
INSERT INTO Improvement_AdjacentImprovementYieldChanges
			(ImprovementType,							OtherImprovementType,		YieldType,			Yield)
VALUES		('IMPROVEMENT_ROME_LATIFUNDIUM',			'IMPROVEMENT_PLANTATION',	'YIELD_CULTURE',	1);
--==========================================================================================================================

--==========================================================================================================================
-- BUILDS
--==========================================================================================================================				
------------------------------
-- Builds
------------------------------		
INSERT INTO Builds		
			(Type,						PrereqTech,			ImprovementType, 				Description, 						Help, 									Recommendation, 						EntityEvent, 				Time,	OrderPriority, 	Kill, 	IconIndex, 	IconAtlas)
VALUES		('BUILD_ROME_LATIFUNDIUM',	'TECH_CALENDAR',	'IMPROVEMENT_ROME_LATIFUNDIUM',	'TXT_KEY_BUILD_ROME_LATIFUNDIUM',	'TXT_KEY_BUILD_ROME_LATIFUNDIUM_HELP',	'TXT_KEY_BUILD_ROME_LATIFUNDIUM_REC',	'ENTITY_EVENT_IRRIGATE',	950,	95,				0,		0,			'IMPROVEMENT_ROME_2_ATLAS');
------------------------------				
-- Unit_Builds
------------------------------				
INSERT INTO Unit_Builds	
			(UnitType, 			BuildType)
VALUES		('UNIT_WORKER',		'BUILD_ROME_LATIFUNDIUM');
------------------------------				
-- BuildFeatures
------------------------------				
INSERT INTO BuildFeatures	
			(BuildType, 				FeatureType, PrereqTech, Time, Production, Remove)
SELECT		'BUILD_ROME_LATIFUNDIUM',	FeatureType, PrereqTech, Time, Production, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_CHATEAU';
--==========================================================================================================================

--==========================================================================================================================
-- POLICY
--==========================================================================================================================				
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------		
INSERT INTO Policy_ImprovementYieldChanges
(PolicyType, ImprovementType, YieldType, Yield)
SELECT PolicyType, 'IMPROVEMENT_ROME_LATIFUNDIUM', YieldType, Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_ENCAMPMENT_SHOSHONE';
--==========================================================================================================================
--==========================================================================================================================
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('IMPROVEMENT_ROME_ATLAS', 			256, 		'LatifundiumIcons_256.dds',				1, 				1),
			('IMPROVEMENT_ROME_ATLAS', 			64, 		'LatifundiumIcons_064.dds',				1, 				1),
			('IMPROVEMENT_ROME_ATLAS', 			45, 		'LatifundiumIcons_045.dds',				1, 				1),
			('IMPROVEMENT_ROME_2_ATLAS', 		64, 		'LatifundiumBuildIcons_064.dds',		1, 				1),
			('IMPROVEMENT_ROME_2_ATLAS', 		45, 		'LatifundiumBuildIcons_045.dds',		1, 				1);