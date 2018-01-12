--==========================================================================================================================
-- LANGUAGE_EN_US
--==========================================================================================================================	
------------------------------
-- Language_en_US
------------------------------
UPDATE Language_en_US
SET Text = 'Has a unique set of Pantheon Beliefs. Owned Cities with your Religion generate nor receive foreign Religious Pressure. +3 [ICON_PEACE] Faith if city adopted your Pantheon. +2 [ICON_GREAT_MERCHANT] GMP for setting Pantheon, founding Religion, extending it and choosing Reformation Belief.'
WHERE Tag = 'TXT_KEY_TRAIT_FAITH_FROM_NATURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );
--==========================================================================================================================

--==========================================================================================================================
-- TRAIT
--==========================================================================================================================	
------------------------------
-- Trait_YieldFromOwnPantheon
------------------------------
INSERT INTO Trait_YieldFromOwnPantheon
			(TraitType,					YieldType,			Yield)
VALUES		('TRAIT_FAITH_FROM_NATURE', 'YIELD_FAITH',		3);