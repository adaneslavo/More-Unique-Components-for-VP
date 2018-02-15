--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 					IconSize, 	Filename, 				IconsPerRow, 	IconsPerColumn)
VALUES		('RESOURCE_INCA_ATLAS', 	256, 		'CocaIcon_256.dds',		1, 				1),
			('RESOURCE_INCA_ATLAS', 	128, 		'CocaIcon_128.dds',		1, 				1),
			('RESOURCE_INCA_ATLAS', 	80, 		'CocaIcon_080.dds',		1, 				1),
			('RESOURCE_INCA_ATLAS', 	64, 		'CocaIcon_064.dds',		1, 				1),
			('RESOURCE_INCA_ATLAS', 	45, 		'CocaIcon_045.dds',		1, 				1);
--==========================================================================================================================

--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
------------------------------
-- IconFontTextures
------------------------------
INSERT INTO IconFontTextures 
			(IconFontTexture, 						IconFontTextureFile)
VALUES		('RESOURCE_INCA_COCA_TEXTURE_ATLAS', 	'CocaFontIcon_022');
------------------------------
-- IconFontMapping
------------------------------
INSERT INTO IconFontMapping 
			(IconName, 				IconFontTexture,					IconMapping)
VALUES		('ICON_RES_COCA', 		'RESOURCE_INCA_COCA_TEXTURE_ATLAS',	1);
--==========================================================================================================================

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, TileType, 		Asset)
VALUES 		('ART_DEF_COCA', 	'Resource', 	'CocaIcon_256f.dds');
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------	
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 				LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_COCA', 	'Resource', 	'RES_COCA');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 			State, 					Scale, 	ImprovementType, 					LayoutHandler, 	ResourceType, 	Model, 								TerrainContour,	Tech)
VALUES 		('Any', 		'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',		'ART_DEF_COCA',	'resource_grapes.fxsxml',			1,				null),
			('Ancient', 	'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_COCA',	'hb_plantation_mid_grapes.fxsxml',	1,				null),
			('Ancient', 	'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_COCA',	'plantation_mid_grapes.fxsxml',		1,				null),
			('Ancient', 	'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_COCA',	'pl_plantation_mid_grapes.fxsxml',	1,				null),
			('Industrial', 	'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_COCA',	'hb_plantation_ind_grapes.fxsxml',	1,				null),
			('Industrial', 	'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_COCA',	'plantation_ind_grapes.fxsxml',		1,				null),
			('Industrial', 	'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_COCA',	'pl_plantation_ind_grapes.fxsxml',	1,				null);
--==========================================================================================================================

--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
------------------------------
-- Resources
------------------------------
INSERT INTO Resources 
			(Type,					TechReveal,	TechCityTrade, 		Description,					Civilopedia, 						Help,	ResourceClassType,		IsMonopoly, 	ArtDefineTag, 	CivilizationType,		OnlyMinorCivs,  Happiness, 	IconString, 		PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_INCA_COCA',	null,		'TECH_CURRENCY',	'TXT_KEY_RESOURCE_INCA_COCA',	'TXT_KEY_RESOURCE_INCA_COCA_TEXT',	null,	'RESOURCECLASS_LUXURY',	1,				'ART_DEF_COCA',	'CIVILIZATION_INCA',	0,				4,			'[ICON_RES_COCA]',	0, 				'RESOURCE_INCA_ATLAS');
------------------------------
-- Resource_YieldChanges
------------------------------
INSERT INTO Resource_YieldChanges 	
			(ResourceType, 			YieldType, 			Yield)
VALUES		('RESOURCE_INCA_COCA',	'YIELD_PRODUCTION',	2);
------------------------------
-- Resource_Flavors
------------------------------
INSERT INTO Resource_Flavors 	
			(ResourceType, 			FlavorType, 			Flavor)
VALUES		('RESOURCE_INCA_COCA',	'FLAVOR_PRODUCTION',	20);
--==========================================================================================================================

--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvement_ResourceTypes
			(ResourceType, 			ImprovementType)
VALUES		('RESOURCE_INCA_COCA',	'IMPROVEMENT_PLANTATION');
------------------------------
-- Improvement_ResourceType_Yields
------------------------------
INSERT INTO Improvement_ResourceType_Yields
			(ResourceType, 			ImprovementType,			YieldType,		Yield)
VALUES		('RESOURCE_INCA_COCA',	'IMPROVEMENT_PLANTATION',	'YIELD_GOLD',	2);
--==========================================================================================================================

--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 									WorkRateMod,	MountainsDoubleMove, 	Description, 									Help, 												Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			LostWithUpgrade, PediaType,		PediaEntry)
VALUES		('PROMOTION_UNIT_INCA_COCA_MILITARY',	0,				1,						'TXT_KEY_PROMOTION_UNIT_INCA_COCA_MILITARY',	'TXT_KEY_PROMOTION_UNIT_INCA_COCA_MILITARY_HELP',	'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS', 	1, 				'PEDIA_SHARED',	'TXT_KEY_PROMOTION_UNIT_INCA_COCA_MILITARY'),
			('PROMOTION_UNIT_INCA_COCA_WORKER',		15,				0,						'TXT_KEY_PROMOTION_UNIT_INCA_COCA_WORKER',		'TXT_KEY_PROMOTION_UNIT_INCA_COCA_WORKER_HELP', 	'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS', 	1, 				'PEDIA_SHARED',	'TXT_KEY_PROMOTION_UNIT_INCA_COCA_WORKER');
------------------------------
-- UnitPromotions_Terrains
------------------------------
INSERT INTO UnitPromotions_Terrains
			(PromotionType, 						TerrainType, 		Attack, Defense)
VALUES		('PROMOTION_UNIT_INCA_COCA_MILITARY',	'TERRAIN_MOUNTAIN', 10, 	10);
--==========================================================================================================================
--==========================================================================================================================
