--------------------------------	
-- Promotions
--------------------------------	

INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 												Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_HORSE_ARCHER',			'TXT_KEY_PROMOTION_HORSE_ARCHER',				'TXT_KEY_PROMOTION_HORSE_ARCHER_HELP', 				'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_HORSE_ARCHER'),
		('PROMOTION_MIGRATION',				'TXT_KEY_PROMOTION_MIGRATION',					'TXT_KEY_PROMOTION_MIGRATION_HELP', 				'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_MIGRATION'),
		('PROMOTION_SACKER',				'TXT_KEY_PROMOTION_SACKER',						'TXT_KEY_PROMOTION_SACKER_HELP', 					'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SACKER');

--------------------------------	
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						Class,	PrereqTech, Special, Combat, Cost, ObsoleteTech, 		GoodyHutUpgradeUnitClass, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI,	 Help, 									Description, 					  Civilopedia, 							Strategy, 		 							Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,						 	PortraitIndex, 	IconAtlas,			 MoveRate)
SELECT	'UNIT_JFD_ALAN_CAVALRY',	Class,	PrereqTech, Special, Combat, Cost-5, 'TECH_METALLURGY', GoodyHutUpgradeUnitClass, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain,  DefaultUnitAI,  'TXT_KEY_UNIT_JFD_ALAN_CAVALRY_HELP', 	'TXT_KEY_UNIT_JFD_ALAN_CAVALRY',  'TXT_KEY_UNIT_JFD_ALAN_CAVALRY_TEXT',	'TXT_KEY_UNIT_JFD_ALAN_CAVALRY_STRATEGY',  	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JFD_ALAN_CAVALRY',	0,					'UNIT_JFD_ALAN_CAVALRY_ALPHA_ATLAS',	2, 				'JFD_VANDALS_ATLAS', MoveRate
FROM Units WHERE Type = 'UNIT_HORSEMAN';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------		
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_ALAN_CAVALRY',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_ALAN_CAVALRY', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HORSEMAN';	

INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_ALAN_CAVALRY',  'PROMOTION_MIGRATION'),
		('UNIT_JFD_ALAN_CAVALRY',  'PROMOTION_SACKER');

--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_HUNS',	'UNITCLASS_HORSEMAN',	'UNIT_JFD_ALAN_CAVALRY');

--------------------------------	
-- Text Update on Horse Archer
--------------------------------
UPDATE Language_en_US 
SET Text = 'Unique Hunnic Skirmisher. If all the unit''s moves are used without attacking, attacks a valid target automatically.[NEWLINE][NEWLINE]Does not require Horses.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_HUN_HORSE_ARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Language_en_US 
SET Text = 'Horse Archers are fast ranged units, deadly on open terrain. Horse Archers have the unique ability to automatically attack a random nearby target if they have run out of moves, but have not attacked yet. As a mounted unit, the Horse Archer is vulnerable to Spearmen. Unlike the Skirmisher, the Horse Archer does not require Horses.'
WHERE Tag = 'TXT_KEY_UNIT_HUN_HORSE_ARCHER_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
