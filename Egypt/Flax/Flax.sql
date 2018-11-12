--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize, 	Filename,				IconsPerRow, 	IconsPerColumn)
VALUES		('RESOURCE_EGYPT_ATLAS',		256, 		'FlaxIcon_256.dds',		1, 				1),
			('RESOURCE_EGYPT_ATLAS',		128, 		'FlaxIcon_128.dds',		1, 				1),
			('RESOURCE_EGYPT_ATLAS',		80, 		'FlaxIcon_080.dds',		1, 				1),
			('RESOURCE_EGYPT_ATLAS',		64, 		'FlaxIcon_064.dds',		1, 				1),
			('RESOURCE_EGYPT_ATLAS',		45, 		'FlaxIcon_045.dds',		1, 				1),
			('RESOURCE_EGYPT_ATLAS',		32, 		'FlaxIcon_032.dds',		1, 				1);
--==========================================================================================================================

--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
------------------------------
-- IconFontTextures
------------------------------
INSERT INTO IconFontTextures 
			(IconFontTexture, 						IconFontTextureFile)
VALUES		('RESOURCE_EGYPT_TEXTURE_ATLAS', 		'FlaxFontIcon_022');	
------------------------------
-- IconFontMapping
------------------------------
INSERT INTO IconFontMapping 
			(IconName, 				IconFontTexture,							IconMapping)
VALUES		('ICON_RES_FLAX', 		'RESOURCE_EGYPT_TEXTURE_ATLAS',				1);
--==========================================================================================================================

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 								LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_RESOURCE_EGYPT_FLAX', 	'Resource', 	'EGYPT_FLAX');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 			State, 					Scale, 	ImprovementType, 					LayoutHandler, 	ResourceType, 						Model, 										TerrainContour,	Tech)
VALUES 		('Any', 		'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',		'ART_DEF_RESOURCE_EGYPT_FLAX',		'resource_flax.fxsxml',						1,				null),
			('Ancient', 	'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_EGYPT_FLAX',		'hb_plantation_mid_flax.fxsxml',			1,				null),
			('Ancient', 	'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_EGYPT_FLAX',		'plantation_mid_flax.fxsxml',				1,				null),
			('Ancient', 	'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_EGYPT_FLAX',		'pl_plantation_mid_flax.fxsxml',			1,				null),
			('Industrial', 	'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_EGYPT_FLAX',		'hb_plantation_ind_flax.fxsxml',			1,				null),
			('Industrial', 	'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_EGYPT_FLAX',		'plantation_ind_flax.fxsxml',				1,				null),
			('Industrial', 	'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_EGYPT_FLAX',		'pl_plantation_ind_flax.fxsxml',			1,				null);
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 				TileType, 		Asset)
VALUES 		('ART_DEF_RESOURCE_EGYPT_FLAX', 	'Resource', 	'FlaxIcon_256f.dds');
--==========================================================================================================================

--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
------------------------------
-- Resources
------------------------------
INSERT INTO Resources 
			(Type,					TechReveal,		TechCityTrade, 		Description,					Civilopedia, 						Help,	ResourceClassType, 		ArtDefineTag, 					CivilizationType,		OnlyMinorCivs,  Happiness,  IconString, 		PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_EGYPT_FLAX',	null,			null,				'TXT_KEY_RESOURCE_EGYPT_FLAX',	'TXT_KEY_RESOURCE_EGYPT_FLAX_TEXT',	null,	'RESOURCECLASS_BONUS',	'ART_DEF_RESOURCE_EGYPT_FLAX',	'CIVILIZATION_EGYPT',	0,				0,			'[ICON_RES_FLAX]',	0, 				'RESOURCE_EGYPT_ATLAS');
------------------------------
-- Resource_YieldChanges
------------------------------
INSERT INTO Resource_YieldChanges 	
			(ResourceType, 				YieldType, 			Yield)
VALUES			('RESOURCE_EGYPT_FLAX',		'YIELD_GOLD',		1);
------------------------------
-- Resource_Flavors
------------------------------
INSERT INTO Resource_Flavors 	
			(ResourceType, 			FlavorType, 				Flavor)
VALUES		('RESOURCE_EGYPT_FLAX',	'FLAVOR_GOLD',				10),
		('RESOURCE_EGYPT_FLAX',	'FLAVOR_PRODUCTION',			10),
		('RESOURCE_EGYPT_FLAX',	'FLAVOR_CULTURE',			10),
		('RESOURCE_EGYPT_FLAX',	'FLAVOR_RELIGION',			10);
--==========================================================================================================================

--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvement_ResourceTypes
			(ResourceType, 			ImprovementType)
VALUES		('RESOURCE_EGYPT_FLAX',	'IMPROVEMENT_PLANTATION');
------------------------------
-- Improvement_ResourceType_Yields
------------------------------
INSERT INTO Improvement_ResourceType_Yields
			(ResourceType, 			ImprovementType,			YieldType,			Yield)
VALUES		('RESOURCE_EGYPT_FLAX',	'IMPROVEMENT_PLANTATION',	'YIELD_CULTURE',		1),
		('RESOURCE_EGYPT_FLAX',	'IMPROVEMENT_PLANTATION', 	'YIELD_PRODUCTION',		1);
--==========================================================================================================================

--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================				
------------------------------
-- Building_ResourceYieldChanges
------------------------------		
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					ResourceType,			YieldType,			Yield)
VALUES		('BUILDING_BURIAL_TOMB',		'RESOURCE_EGYPT_FLAX',	'YIELD_GOLD',		1),
			('BUILDING_BURIAL_TOMB',		'RESOURCE_EGYPT_FLAX',	'YIELD_FAITH',	1),
			('BUILDING_CARAVANSARY',		'RESOURCE_EGYPT_FLAX',	'YIELD_GOLD',		1),
			('BUILDING_CARAVANSARY',		'RESOURCE_EGYPT_FLAX',	'YIELD_FAITH',	1);
--==========================================================================================================================
--==========================================================================================================================
