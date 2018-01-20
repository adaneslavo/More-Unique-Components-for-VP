--==========================================================================================================================	
-- UNITCLASSES
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_KOREA', 	'UNITCLASS_CARAVEL',		'UNIT_KOREAN_TURTLE_SHIP');
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	

INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, OrderPriority, PortraitIndex, IconAtlas, PediaType, CannotBeChosen)
VALUES
	('PROMOTION_COAST_MOVE', 'TXT_KEY_PROMOTION_COAST_MOVE', 'TXT_KEY_PROMOTION_COAST_MOVE_HELP', 'AS2D_IF_LEVELUP', 99, 44, 'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 1),
	('PROMOTION_DECK_SPIKES', 'TXT_KEY_PROMOTION_DECK_SPIKES', 'TXT_KEY_PROMOTION_DECK_SPIKES_HELP', 'AS2D_IF_LEVELUP', 99, 25, 'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 1);

INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, DoubleMove)
VALUES
	('PROMOTION_COAST_MOVE', 'TERRAIN_COAST', 1);

INSERT INTO UnitPromotions_UnitCombatMods
	(PromotionType, UnitCombatType, Modifier)
VALUES
	('PROMOTION_DECK_SPIKES', 'UNITCOMBAT_NAVALMELEE', 25);	


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
				(UnitType, 			PromotionType)
SELECT			'UNIT_KOREAN_TURTLE_SHIP', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CARAVEL';

INSERT INTO		Unit_FreePromotions
				(UnitType, 					PromotionType)
VALUES			('UNIT_KOREAN_TURTLE_SHIP', 'PROMOTION_COAST_MOVE'),
				('UNIT_KOREAN_TURTLE_SHIP', 'PROMOTION_DECK_SPIKES');
--------------------------------	
-- Galleass Text Update
--------------------------------	

UPDATE Language_en_US 
SET Text = 'Unique Korean Caravel. This Unit is much stronger than the Caravel it replaces, but moves slowly in Deep Ocean.'
WHERE Tag = 'TXT_KEY_UNIT_KOREAN_TURTLE_SHIP_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Language_en_US 
SET Text = 'The Turtle Ship is an early incarnation of the Ironclad for tactical purposes, and is best used to defend coastlines. Thanks to its high Combat Strength, it can easily fight off enemy Caravels and even Frigates. Its main drawback is that, unlike the Caravel that it replaces, it cannot move easily through deep oceans.'
WHERE Tag = 'TXT_KEY_UNIT_KOREAN_TURTLE_SHIP_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
