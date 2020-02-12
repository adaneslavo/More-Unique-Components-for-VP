--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 		UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_ROME', 	'UNITCLASS_CATAPULT',	'UNIT_ROMAN_BALLISTA');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
--------------------------------	
-- Units
--------------------------------
UPDATE Units SET MinorCivGift = '0' WHERE Type = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET Class = 'UNITCLASS_CATAPULT' WHERE Type = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET Cost = '100' WHERE Type = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET FaithCost = '200' WHERE Type = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET ObsoleteTech = 'TECH_GUNPOWDER' WHERE Type = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET Combat = '8' WHERE Type = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET RangedCombat = '14' WHERE Type = 'UNIT_ROMAN_BALLISTA';
--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_ROMAN_BALLISTA', 'BUILDINGCLASS_BARRACKS';
--------------------------------	
-- Unit_Flavors
--------------------------------
UPDATE Unit_Flavors SET Flavor = '3' WHERE UnitType = 'UNIT_ROMAN_BALLISTA' AND FlavorType = 'FLAVOR_OFFENSE';
UPDATE Unit_Flavors SET Flavor = '6' WHERE UnitType = 'UNIT_ROMAN_BALLISTA' AND FlavorType = 'FLAVOR_RANGED';
--==========================================================================================================================

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 													Description, 												Help, 																Sound, 				CombatPercent,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 				PediaType, 		PediaEntry)
VALUES	('PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA',	'TXT_KEY_PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA',	'TXT_KEY_PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA_HELP',	'AS2D_IF_LEVELUP',	0,				0,				0,			0,			0,					0,			0, 					1,				16, 			'promoMUC_atlas_01', 	'PEDIA_SIEGE',	'TXT_KEY_PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA'),
		('PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT',			'TXT_KEY_PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT',		'TXT_KEY_PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT_HELP',			'AS2D_IF_LEVELUP',	0,				1,				0,			0,			0,					0,			0, 					1,				33, 			'PROMOTION_ATLAS', 		'PEDIA_SIEGE',	'TXT_KEY_PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_EFFECT');
--------------------------------	
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions
			(UnitType,				PromotionType)
VALUES		('UNIT_ROMAN_BALLISTA', 'PROMOTION_UNIT_ROME_LEGATUS_LEGIONIS_ON_BALLISTA');
--------------------------------	
-- Unit_FreePromotions Deletion
--------------------------------
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ROMAN_BALLISTA' AND PromotionType = 'PROMOTION_SIEGE_INACCURACY';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ROMAN_BALLISTA' AND PromotionType = 'PROMOTION_SIGHT_PENALTY';
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITSCLASSES
--==========================================================================================================================	
--------------------------------	
-- UnitClasses
--------------------------------
DELETE FROM UnitClasses WHERE Type = 'UNITCLASS_BALLISTA';
--==========================================================================================================================
--==========================================================================================================================
