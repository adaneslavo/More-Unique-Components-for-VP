--------------------------------	
-- Unit
--------------------------------
UPDATE Units SET RangedCombat = '12' WHERE Type = 'UNIT_HUN_HORSE_ARCHER';
--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions 
			(Type, 									Description, 								Help, 												Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_UNIT_HUNS_HORSE_ARCHER',	'TXT_KEY_PROMOTION_UNIT_HUNS_HORSE_ARCHER',	'TXT_KEY_PROMOTION_UNIT_HUNS_HORSE_ARCHER_HELP', 	'AS2D_IF_LEVELUP',	1, 				31, 			'PROMOTION_ATLAS', 	'PEDIA_MOUNTED',	'TXT_KEY_PROMOTION_UNIT_HUNS_HORSE_ARCHER');
--------------------------------	
-- Promotions Deletion
--------------------------------
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HUN_HORSE_ARCHER' AND PromotionType = 'PROMOTION_ACCURACY_1';
--------------------------------	
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_HUN_HORSE_ARCHER',  'PROMOTION_UNIT_HUNS_HORSE_ARCHER');
