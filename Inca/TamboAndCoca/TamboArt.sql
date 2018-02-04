INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('4UC_COCA_ATLAS', 		256, 		'NewAymaraIcons256.dds',		2, 				1),
		('4UC_COCA_ATLAS', 		128, 		'NewAymaraIcons128.dds',		2, 				1),
		('4UC_COCA_ATLAS', 		80, 		'NewAymaraIcons80.dds',			2, 				1),
		('4UC_COCA_ATLAS', 		64, 		'NewAymaraIcons64.dds',			2, 				1),
		('4UC_COCA_ATLAS', 		45, 		'NewAymaraIcons45.dds',			2, 				1),
		('4UC_COCA_ATLAS', 		32, 		'NewAymaraIcons32.dds',			2,				1);
-----------------These are already in the other mod
--		('BUILDING_APIG4UC_ATLAS', 		256, 		'tambo.stnd.UofC.Ord.256.dds',		4, 				1),
---		('BUILDING_APIG4UC_ATLAS', 		128, 		'tambo.stnd.UofC.Ord.128.dds',		4, 				1),
--		('BUILDING_APIG4UC_ATLAS', 		80, 		'tambo.stnd.UofC.Ord.80.dds',			4, 				1),
---		('BUILDING_APIG4UC_ATLAS', 		64, 		'tambo.stnd.UofC.Ord.64.dds',			4, 				1),
--		('BUILDING_APIG4UC_ATLAS', 		45, 		'tambo.stnd.UofC.Ord.45.dds',			4, 				1),
--		('BUILDING_APIG4UC_ATLAS', 		32, 		'tambo.stnd.UofC.Ord.32.dds',			4,				1);	
		
INSERT INTO ArtDefine_StrategicView
		(StrategicViewType, TileType, 		Asset)
VALUES 		('ART_DEF_COCA', 	'Resource', 	'sv_coca.dds');

INSERT INTO ArtDefine_LandmarkTypes
		(Type, 			LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_COCA', 	'Resource', 	'RES_COCA');

INSERT INTO IconFontTextures 
			(IconFontTexture, 						IconFontTextureFile)
VALUES		('RESOURCE_COCA_TEXTURE_ATLAS', 		'Coca_fonticon');

INSERT INTO IconFontMapping 
		(IconName, 				IconFontTexture,				IconMapping)
VALUES		('ICON_RES_COCA', 		'RESOURCE_COCA_TEXTURE_ATLAS',				1);


