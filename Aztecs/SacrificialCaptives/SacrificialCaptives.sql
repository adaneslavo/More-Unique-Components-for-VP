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
			(Type, 										Description, 									Help, 													Sound, 				VisibilityChange,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 				PediaType, 		PediaEntry)
VALUES		('PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE_HELP',	'AS2D_IF_LEVELUP',	0,					0,				0,			0,			0,					0,			0,					1, 				30, 			'promoMUC_atlas_01', 	'PEDIA_MELEE', 'TXT_KEY_PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE');
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
--------------------------------	
-- Trait_FreePromotionUnitCombats
--------------------------------
INSERT INTO Trait_FreePromotionUnitCombats
	(TraitType, UnitCombatType, PromotionType)
VALUES
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_RECON', 		'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_ARCHER', 		'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_MELEE', 		'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_SIEGE', 		'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_GUN', 			'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_HELICOPTER', 	'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_NAVALMELEE', 	'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_NAVALRANGED', 	'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_FIGHTER', 		'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_BOMBER', 		'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_MOUNTED', 		'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE'),
	('TRAIT_CULTURE_FROM_KILLS', 'UNITCOMBAT_ARMOR', 		'PROMOTION_UNIT_AZTEC_HUMAN_SACRIFICE');

--==========================================================================================================================
--==========================================================================================================================
