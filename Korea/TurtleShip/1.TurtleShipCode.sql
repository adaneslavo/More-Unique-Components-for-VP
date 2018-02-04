--==========================================================================================================================	
-- CIVILIZATION
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 		UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_KOREA', 	'UNITCLASS_CARAVEL',	'UNIT_KOREAN_TURTLE_SHIP');
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================
INSERT INTO UnitPromotions
			(Type,						Description,						Help,									Sound,				PortraitIndex,	CannotBeChosen,	IconAtlas,			PediaType,			PediaEntry)
VALUES		('PROMOTION_COAST_MOVE',	'TXT_KEY_PROMOTION_COAST_MOVE',		'TXT_KEY_PROMOTION_COAST_MOVE_HELP',	'AS2D_IF_LEVELUP',	44,				1,				'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_COAST_MOVE'),
			('PROMOTION_DECK_SPIKES',	'TXT_KEY_PROMOTION_DECK_SPIKES',	'TXT_KEY_PROMOTION_DECK_SPIKES_HELP',	'AS2D_IF_LEVELUP',	25,				1,				'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DECK_SPIKES');

INSERT INTO UnitPromotions_Terrains
			(PromotionType,				TerrainType,		DoubleMove)
VALUES		('PROMOTION_COAST_MOVE',	'TERRAIN_COAST',	1);

INSERT INTO UnitPromotions_UnitCombatMods
			(PromotionType,				UnitCombatType,				Modifier)
VALUES		('PROMOTION_DECK_SPIKES',	'UNITCOMBAT_NAVALMELEE',	25);	
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
--------------------------------	
-- Units
--------------------------------
UPDATE Units SET MinorCivGift = '0' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
UPDATE Units SET Class = 'UNITCLASS_CARAVEL' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
UPDATE Units SET Cost = '185' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
UPDATE Units SET PrereqTech = 'TECH_COMPASS' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
UPDATE Units SET ObsoleteTech = 'TECH_INDUSTRIALIZATION' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
UPDATE Units SET Combat = '32' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
UPDATE Units SET Moves = '2' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_KOREAN_TURTLE_SHIP','BUILDINGCLASS_HARBOR';

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_PRIVATEER' WHERE UnitType = 'UNIT_KOREAN_TURTLE_SHIP';

DELETE FROM UnitClasses WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================

--------------------------------	
-- FreePromotions
--------------------------------		

INSERT INTO		Unit_FreePromotions
				(UnitType, 					PromotionType)
SELECT			'UNIT_KOREAN_TURTLE_SHIP', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CARAVEL';

INSERT INTO		Unit_FreePromotions
				(UnitType, 					PromotionType)
VALUES			('UNIT_KOREAN_TURTLE_SHIP', 'PROMOTION_COAST_MOVE'),
				('UNIT_KOREAN_TURTLE_SHIP', 'PROMOTION_DECK_SPIKES');
