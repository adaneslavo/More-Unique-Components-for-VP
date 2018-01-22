--------------------------------
-- Field Gun
--------------------------------
/*
DELETE FROM Unit_FreePromotions	WHERE UnitType = 'UNIT_FIELD_GUN' AND PromotionType = 'PROMOTION_SIEGE_INACCURACY';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 			PromotionType)
VALUES		('UNIT_FIELD_GUN', 'PROMOTION_SIEGE_INACCURACY');
--------------------------------
-- Hussar
--------------------------------
DELETE FROM Unit_FreePromotions	WHERE UnitType = 'UNIT_AUSTRIAN_HUSSAR' AND PromotionType = 'PROMOTION_EXTRA_SIGHT_I';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
VALUES		('UNIT_AUSTRIAN_HUSSAR',	'PROMOTION_EXTRA_SIGHT_I');
--------------------------------
-- ConquestProbability
--------------------------------
UPDATE Buildings SET ConquestProb = '0' WHERE Type = 'BUILDING_SIEGE_WORKSHOP';
UPDATE Buildings SET ConquestProb = '0' WHERE Type = 'BUILDING_SATRAPS_COURT';
UPDATE Buildings SET ConquestProb = '0' WHERE Type = 'BUILDING_INDUS_CANAL';
UPDATE Buildings SET ConquestProb = '0' WHERE Type = 'BUILDING_FLAVIAN_COLOSSEUM';
--------------------------------
-- ConquestProbability
--------------------------------
UPDATE Buildings SET NeverCapture = '1' WHERE Type = 'BUILDING_ARTISTS_GUILD';
UPDATE Buildings SET NeverCapture = '1' WHERE Type = 'BUILDING_MUSICIANS_GUILD';
UPDATE Buildings SET NeverCapture = '1' WHERE Type = 'BUILDING_WRITERS_GUILD';
UPDATE Buildings SET NeverCapture = '1' WHERE Type = 'BUILDING_EHRENHALLE';
UPDATE Buildings SET NeverCapture = '1' WHERE Type = 'BUILDING_FINANCE_CENTER';
UPDATE Buildings SET NeverCapture = '1' WHERE Type = 'BUILDING_HOTEL';
UPDATE Buildings SET NeverCapture = '1' WHERE Type = 'BUILDING_KREPOST';
UPDATE Buildings SET NeverCapture = '1' WHERE Type = 'BUILDING_PALACE_SCIENCE_CULTURE';
UPDATE Buildings SET NeverCapture = '1' WHERE Type = 'BUILDING_STABLE';
*/