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
			(Type, 									Description, 									Help, 												Sound, 				RangeChange,	OpenDefense,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 				PediaType, 			PediaEntry)
VALUES		('PROMOTION_UNIT_ENGLAND_AGINCOURT', 	'TXT_KEY_PROMOTION_UNIT_ENGLAND_AGINCOURT',		'TXT_KEY_PROMOTION_UNIT_ENGLAND_AGINCOURT_HELP', 	'AS2D_IF_LEVELUP',	0,				0,				0,				0,			0,			0,					0,			0,					1, 				40, 			'promoMUC_atlas_00', 	'PEDIA_RANGED', 	'TXT_KEY_PROMOTION_UNIT_ENGLAND_AGINCOURT');
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
UPDATE Units SET Range = '2' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
UPDATE Units SET FaithCost = '300' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
--UPDATE Units SET RangedCombat = '23' WHERE Type = 'UNIT_ENGLISH_LONGBOWMAN';
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
