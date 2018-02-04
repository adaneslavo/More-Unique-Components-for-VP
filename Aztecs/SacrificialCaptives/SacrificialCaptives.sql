--==========================================================================================================================
-- LANGUAGE_EN_US
--==========================================================================================================================	
-- Language_en_US
------------------------------
INSERT INTO Language_en_US
			(Tag,														Text)
VALUES		('TXT_KEY_PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE',			'Human Sacrifice'),
			('TXT_KEY_PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE_HELP',		'Unit gains [ICON_PEACE] Faith and [ICON_GOLD] Gold [COLOR_POSITIVE_TEXT]on Kill[ENDCOLOR].');
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 										Description, 									Help, 													Sound, 				VisibilityChange,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 						PediaType, 		PediaEntry)
VALUES		('PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE_HELP',	'AS2D_IF_LEVELUP',	0,					0,				0,			0,			0,					0,			0,					1, 				0, 				'UNIT_POLAND_PROMOTION_ATLAS', 	'PEDIA_MELEE', 'TXT_KEY_PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE');
--==========================================================================================================================
--==========================================================================================================================