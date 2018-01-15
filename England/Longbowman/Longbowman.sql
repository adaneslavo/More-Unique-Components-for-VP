--==========================================================================================================================	

--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_ENGLAND',	'UNITCLASS_CROSSBOWMAN',	'UNIT_ENGLISH_LONGBOWMAN');
--==========================================================================================================================

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 									Description, 									Help, 												Sound, 				RangeChange,	OpenDefense,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_UNIT_ENGLAND_AGINCOURT', 	'TXT_KEY_PROMOTION_UNIT_ENGLAND_AGINCOURT',		'TXT_KEY_PROMOTION_UNIT_ENGLAND_AGINCOURT_HELP', 	'AS2D_IF_LEVELUP',	0,				0,				0,				0,			0,			0,					0,			0,					1, 				9, 				'PROMOTION_ATLAS', 	'PEDIA_RANGED', 	'TXT_KEY_PROMOTION_UNIT_ENGLAND_AGINCOURT');
------------------------------
-- UnitPromotions_UnitCombatMods
------------------------------
INSERT INTO UnitPromotions_UnitCombatMods
			(PromotionType, 						UnitCombatType,			Modifier)
VALUES		('PROMOTION_UNIT_ENGLAND_AGINCOURT',	'UNITCOMBAT_ARMOR',		20),
			('PROMOTION_UNIT_ENGLAND_AGINCOURT',	'UNITCOMBAT_MOUNTED',	20);
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
--------------------------------	
-- Units
--------------------------------
UPDATE Units SET MinorCivGift = '0' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
UPDATE Units SET Class = 'UNITCLASS_CROSSBOWMAN' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
UPDATE Units SET Cost = '180' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
UPDATE Units SET ObsoleteTech = 'TECH_DYNAMITE' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
UPDATE Units SET RangedCombat = '23' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
UPDATE Units SET Range = '2' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
--------------------------------	
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_ENGLISH_LONGBOWMAN',	'PROMOTION_UNIT_ENGLAND_AGINCOURT');
--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_ENGLISH_LONGBOWMAN', 'BUILDINGCLASS_BARRACKS';
--------------------------------	
-- Unit_Flavors
--------------------------------
UPDATE Unit_Flavors SET Flavor = '16' WHERE UnitType = 'UNIT_ENGLISH_LONGBOWMAN' AND FlavorType = 'FLAVOR_OFFENSE';
UPDATE Unit_Flavors SET Flavor = '12' WHERE UnitType = 'UNIT_ENGLISH_LONGBOWMAN' AND FlavorType = 'FLAVOR_DEFENSE';
UPDATE Unit_Flavors SET Flavor = '20' WHERE UnitType = 'UNIT_ENGLISH_LONGBOWMAN' AND FlavorType = 'FLAVOR_RANGED';
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITSCLASSES
--==========================================================================================================================	
--------------------------------	
-- UnitClasses
--------------------------------
DELETE FROM UnitClasses WHERE Type = 'UNITCLASS_LONGBOWMAN';
--==========================================================================================================================	

--==========================================================================================================================	
-- LANGUAGE
--==========================================================================================================================	
--------------------------------	
-- Language_en_US 
--------------------------------
UPDATE Language_en_US 
SET Text = 'Unique ranged unit of the English civilization. Replaces the Crossbowman. Begins with the [COLOR_POSITIVE_TEXT]Range[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Agincourt[ENDCOLOR] Promotions, giving increased attack range and a bonus against Mounted units.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_LONGBOWMAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Language_en_US 
SET Text = ' The Longbowman has a greater range than the Crossbowman, allowing it to attack enemies three hexes away, often destroying them before they can strike back. Longbows also are more effective against Mounted opponents, thanks to their Agincourt Promotion. Like other ranged units, Longbowmen are vulnerable to melee attack.'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_LONGBOWMAN_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

--==========================================================================================================================
--==========================================================================================================================
