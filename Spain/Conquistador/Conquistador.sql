------------------------------
-- Unit_FreePromotions
------------------------------
INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_SPANISH_CONQUISTADOR',	'PROMOTION_SCOUTING_1'),
			('UNIT_SPANISH_CONQUISTADOR',	'PROMOTION_SCOUTING_2');
--------------------------------
-- Unit_FreePromotions Deletion
--------------------------------
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SPANISH_CONQUISTADOR' AND PromotionType = 'PROMOTION_EXTRA_SIGHT_II';