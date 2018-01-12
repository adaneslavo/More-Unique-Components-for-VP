--==========================================================================================================================	
-- ART_DEFINE
--==========================================================================================================================	
--------------------------------	
-- ArtDefine_StrategicView
--------------------------------
UPDATE ArtDefine_StrategicView SET Asset = 'PenteconterFlag_128.dds' WHERE StrategicViewType = 'ART_DEF_UNIT_U_BYZANTIUM_DROMON';
--------------------------------	
-- ArtDefine_UnitMemberInfos
--------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Model = 'battle_galley.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON';
UPDATE ArtDefine_UnitMemberInfos SET Scale = '0.09' WHERE Type = 'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON';
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('UNIT_PENTECONTER_ATLAS', 			256, 		'PenteconterPicture_256.dds',			1, 				1),
			('UNIT_PENTECONTER_ATLAS', 			128, 		'PenteconterPicture_128.dds',			1, 				1),
			('UNIT_PENTECONTER_ATLAS', 			80, 		'PenteconterPicture_080.dds',			1, 				1),
			('UNIT_PENTECONTER_ATLAS', 			64, 		'PenteconterPicture_064.dds',			1, 				1),
			('UNIT_PENTECONTER_ATLAS', 			45, 		'PenteconterPicture_045.dds',			1, 				1),
			('UNIT_PENTECONTER_FLAG_ATLAS', 	32, 		'PenteconterFlag_032.dds',				1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- Units
--==========================================================================================================================	
--------------------------------	
-- Units
--------------------------------
UPDATE Units SET Description = 'TXT_KEY_UNIT_PENTECONTER' WHERE Type = 'UNIT_BYZANTINE_DROMON';
UPDATE Units SET Civilopedia = 'TXT_KEY_UNIT_PENTECONTER_TEXT' WHERE Type = 'UNIT_BYZANTINE_DROMON';
UPDATE Units SET Strategy = 'TXT_KEY_UNIT_PENTECONTER_STRATEGY' WHERE Type = 'UNIT_BYZANTINE_DROMON';
UPDATE Units SET Help = 'TXT_KEY_UNIT_PENTECONTER_HELP' WHERE Type = 'UNIT_BYZANTINE_DROMON';
UPDATE Units SET UnitFlagIconOffset = '0' WHERE Type = 'UNIT_BYZANTINE_DROMON';
UPDATE Units SET UnitFlagAtlas = 'UNIT_PENTECONTER_FLAG_ATLAS' WHERE Type = 'UNIT_BYZANTINE_DROMON';
UPDATE Units SET PortraitIndex = '0' WHERE Type = 'UNIT_BYZANTINE_DROMON';
UPDATE Units SET IconAtlas = 'UNIT_PENTECONTER_ATLAS' WHERE Type = 'UNIT_BYZANTINE_DROMON';