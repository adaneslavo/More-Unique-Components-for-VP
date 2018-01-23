--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_CARTHAGE', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_SHOPHET');



--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 												Sound, 				IgnoreZoC,  CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_SHOPHET_ADMIRAL',	'TXT_KEY_PROMOTION_JFD_SHOPHET_ADMIRAL',		'TXT_KEY_PROMOTION_JFD_SHOPHET_ADMIRAL_HELP', 		'AS2D_IF_LEVELUP',	0, 			1, 				48, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SHOPHET_ADMIRAL'),
		('PROMOTION_JFD_SHOPHET_GENERAL',	'TXT_KEY_PROMOTION_JFD_SHOPHET_GENERAL',		'TXT_KEY_PROMOTION_JFD_SHOPHET_GENERAL_HELP', 		'AS2D_IF_LEVELUP',	0, 			1, 				48, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SHOPHET_GENERAL'),
		('PROMOTION_JFD_SHOPHET_ZOC',		'TXT_KEY_PROMOTION_JFD_SHOPHET_ZOC',			'TXT_KEY_PROMOTION_JFD_SHOPHET_ZOC_HELP',			'AS2D_IF_LEVELUP',	1, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SHOPHET_ZOC');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
------------------------------	
INSERT INTO Units 	
		(Type, 				Class, Cost, Moves, Special, SupplyCapBoost, 	MoveAfterPurchase, Domain, DefaultUnitAI, Description,					Civilopedia,						Strategy,								Help,								AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo,  				 UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate, PortraitIndex, IconAtlas)
SELECT	'UNIT_JFD_SHOPHET',	Class, Cost, Moves, Special, 2, 				MoveAfterPurchase,	Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_SHOPHET',	'TXT_KEY_UNIT_JFD_SHOPHET_TEXT',	'TXT_KEY_UNIT_JFD_SHOPHET_STRATEGY',	'TXT_KEY_UNIT_JFD_SHOPHET_HELP',	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, 'ART_DEF_UNIT_JFD_SHOPHET',  0,					'JFD_UNIT_FLAG_SHOPHET_ATLAS',	MoveRate, 0, 			 'JFD_CARTHAGE_HANNIBAL_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_SHOPHET', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_SHOPHET', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_SHOPHET', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------
-- Unit_Builds
--------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
VALUES	('UNIT_JFD_SHOPHET', 	'BUILD_CITADEL');

--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_SHOPHET', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_SHOPHET', 	'PROMOTION_JFD_SHOPHET_GENERAL'),
		('UNIT_JFD_SHOPHET', 	'PROMOTION_JFD_SHOPHET_ZOC');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 				UniqueName)
VALUES	('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_1'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_2'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_3'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_4'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_5'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_6'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_7'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_8'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_9'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_10'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_11'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_12'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_13'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_14'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_15'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_16'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_17'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_18'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_19'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_20'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_21'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_22'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_23'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_24'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_25');