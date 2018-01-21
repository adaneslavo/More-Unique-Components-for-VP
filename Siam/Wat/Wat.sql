------------------------------
-- Buildings
------------------------------
UPDATE Buildings SET BlockUnrestSpies = '1' WHERE Type = 'BUILDING_WAT';
UPDATE Buildings SET BlockWWDestructionSpies = '1' WHERE Type = 'BUILDING_WAT';
UPDATE Buildings SET GreatWorkCount = '2' WHERE Type = 'BUILDING_WAT';
UPDATE Buildings SET GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE' WHERE Type = 'BUILDING_WAT';
UPDATE Buildings SET ThemingBonusHelp = 'TXT_KEY_BUILDING_WAT_THEMING_BONUS_HELP' WHERE Type = 'BUILDING_WAT';

------------------------------
-- Building_FeatureYieldChanges
------------------------------
DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_WAT';

------------------------------	
-- Building_ThemingYieldBonus
------------------------------
INSERT INTO Building_ThemingYieldBonus
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_WAT', 'YIELD_SCIENCE', 	2),
			('BUILDING_WAT', 'YIELD_FAITH',		2);
------------------------------	
-- Building_ThemingBonuses
------------------------------	
INSERT INTO Building_ThemingBonuses	
			(BuildingType,				Description,								  Bonus,	SameEra,	RequiresSamePlayer,	AIPriority)
VALUES		('BUILDING_WAT',	'TXT_KEY_THEMING_BONUS_WAT',	2,		  1,		    1,						          2);
