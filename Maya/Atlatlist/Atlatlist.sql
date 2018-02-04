--==========================================================================================================================	
-- UNITPROMOTIONS
--==========================================================================================================================	
--------------------------------	
-- UnitPromotions
--------------------------------
UPDATE UnitPromotions SET LostWithUpgrade = '0' WHERE Type = 'PROMOTION_ATLATL_ATTACK';
UPDATE UnitPromotions SET AttackWoundedMod = '33' WHERE Type = 'PROMOTION_ATLATL_ATTACK';
--==========================================================================================================================	

--==========================================================================================================================	
-- LANGUAGE
--==========================================================================================================================	
--------------------------------	
-- Language_en_US 
--------------------------------
UPDATE Language_en_US SET Text = 'Poisoned Weapon' WHERE Tag = 'TXT_KEY_PROMOTION_ATLATL_ATTACK';
UPDATE Language_en_US SET Text = '+33% [ICON_RANGE_STRENGTH] Ranged Combat Strength [COLOR_POSITIVE_TEXT]against Wounded Units[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_ATLATL_ATTACK_HELP';