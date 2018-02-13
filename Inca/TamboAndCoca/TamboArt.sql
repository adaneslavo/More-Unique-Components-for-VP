------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 			IconSize, 	Filename, 				IconsPerRow, 	IconsPerColumn)
VALUES		('4UC_COCA_ATLAS', 		256, 		'NewAymaraIcons256.dds',		2, 		1),
		('4UC_COCA_ATLAS', 		128, 		'NewAymaraIcons128.dds',		2, 		1),
		('4UC_COCA_ATLAS', 		80, 		'NewAymaraIcons80.dds',			2, 		1),
		('4UC_COCA_ATLAS', 		64, 		'NewAymaraIcons64.dds',			2, 		1),
		('4UC_COCA_ATLAS', 		45, 		'NewAymaraIcons45.dds',			2, 		1),
		('4UC_COCA_ATLAS', 		32, 		'NewAymaraIcons32.dds',			2,		1);
------------------------------
-- IconFontTextures
------------------------------
INSERT INTO IconFontTextures 
			(IconFontTexture, 						IconFontTextureFile)
VALUES		('RESOURCE_COCA_TEXTURE_ATLAS', 		'Coca_fonticon');
------------------------------
-- IconFontMapping
------------------------------
INSERT INTO IconFontMapping 
		(IconName, 				IconFontTexture,				IconMapping)
VALUES		('ICON_RES_COCA', 		'RESOURCE_COCA_TEXTURE_ATLAS',				1);

--==========================================================================================================================

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
		(StrategicViewType, TileType, 		Asset)
VALUES 		('ART_DEF_COCA', 	'Resource', 	'sv_coca.dds');
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------	
INSERT INTO ArtDefine_LandmarkTypes
		(Type, 			LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_COCA', 	'Resource', 	'RES_COCA');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
	(Era, 		State, 			Scale, 	ImprovementType, 			LayoutHandler, 	ResourceType, 	Model, 					TerrainContour,	Tech)
VALUES 	('Any', 	'Any',			1,	'ART_DEF_IMPROVEMENT_NONE',		'SNAPSHOT',	'ART_DEF_COCA',	'resource_grapes.fxsxml',		1,		null),
	('Ancient', 	'UnderConstruction',	1,	'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',	'ART_DEF_COCA',	'hb_plantation_mid_grapes.fxsxml',	1,		null),
	('Ancient', 	'Constructed',		1,	'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',	'ART_DEF_COCA',	'plantation_mid_grapes.fxsxml',		1,		null),
	('Ancient', 	'Pillaged',		1,	'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',	'ART_DEF_COCA',	'pl_plantation_mid_grapes.fxsxml',	1,		null),
	('Industrial', 	'UnderConstruction',	1,	'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',	'ART_DEF_COCA',	'hb_plantation_ind_grapes.fxsxml',	1,		null),
	('Industrial', 	'Constructed',		1,	'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',	'ART_DEF_COCA',	'plantation_ind_grapes.fxsxml',		1,		null),
	('Industrial', 	'Pillaged',		1,	'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',	'ART_DEF_COCA',	'pl_plantation_ind_grapes.fxsxml',	1,		null);

