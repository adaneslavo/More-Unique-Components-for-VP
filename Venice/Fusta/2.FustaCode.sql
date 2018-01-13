
--==========================================================================================================================	
-- UNITCLASSES
--==========================================================================================================================	
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses
			(Type,						Description,					DefaultUnit)
VALUES		('UNITCLASS_VENICE_FUSTA',	'TXT_KEY_UNIT_VENICE_FUSTA',	'NONE');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_VENICE', 	'UNITCLASS_VENICE_FUSTA',	'UNIT_JFD_LANTERNAS'),
			('CIVILIZATION_VENICE', 	'UNITCLASS_GALLEASS',		'UNIT_VENETIAN_GALLEASS');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
--------------------------------	
-- Units
--------------------------------



UPDATE Units SET MinorCivGift = '0' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET Class = 'UNITCLASS_GALLEASS' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET Cost = '175' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET PrereqTech = 'TECH_GUILDS' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET ObsoleteTech = 'TECH_DYNAMITE' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET Combat = '15' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET RangedCombat = '25' WHERE Type = 'UNIT_VENETIAN_GALLEASS';
UPDATE Units SET Moves = '3' WHERE Type = 'UNIT_VENETIAN_GALLEASS';

UPDATE Unit_Flavors SET Flavor = '20' WHERE UnitType = 'UNIT_VENETIAN_GALLEASS' AND FlavorType = 'FLAVOR_NAVAL';

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_JFD_LANTERNAS','BUILDINGCLASS_HARBOR';
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_VENETIAN_GALLEASS','BUILDINGCLASS_HARBOR';

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_FRIGATE' WHERE UnitType = 'UNIT_VENETIAN_GALLEASS';

DELETE FROM UnitClasses WHERE Type = 'UNIT_VENETIAN_GALLEASS';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 						Class, 						PurchaseOnly,	NoMaintenance,	PrereqTech, 	ObsoleteTech, 		RangedCombat, 	Range, 	Special, Combat, 	Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 						Strategy, 									  Help, 									Civilopedia, 						Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,						MoveRate)
SELECT	'UNIT_JFD_LANTERNAS',		'UNITCLASS_VENICE_FUSTA',	0,				1, 				'TECH_GUILDS', 	'TECH_DYNAMITE',	RangedCombat-3, Range, 	Special, Combat-3, 	Cost-50, 150, 		RequiresFaithPurchaseEnabled, Moves+1, 	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_LANTERNAS',		'TXT_KEY_UNIT_JFD_LANTERNAS_STRATEGY',		  'TXT_KEY_UNIT_HELP_JFD_LANTERNAS',		'TXT_KEY_CIV5_JFD_LANTERNAS_TEXT',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JFD_LANTERNAS',		0,					'JFD_LANTERNAS_FLAG_ART_ATLAS',	3, 				'JFD_BYZANTIUM_ALEXIOS_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_GALLEASS';																																																								  
																																																																		  
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_LANTERNAS',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GALLEASS';

--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_LANTERNAS',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GALLEASS';


INSERT INTO Unit_FreePromotions 
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_LANTERNAS', 		'PROMOTION_WITHDRAW_BEFORE_MELEE');

INSERT INTO		Unit_FreePromotions
				(UnitType, 			PromotionType)
SELECT			'UNIT_JFD_LANTERNAS', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GALLEASS';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_LANTERNAS',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GALLEASS';	
	
--------------------------------	
-- Galleass Text Update
--------------------------------	

UPDATE Language_en_US 
SET Text = 'Unique Venetian Galleass. This Unit is stronger than the Galleas it replaces'
WHERE Tag = 'TXT_KEY_UNIT_HELP_VENETIAN_GALLEASS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

UPDATE Language_en_US 
SET Text = 'The Great Galleass is slightly more powerful than the normal Galleass. The Venetian fleet''s terrible bombarding was famous in the Medieval Era and is well represented with this unit.'
WHERE Tag = 'TXT_KEY_UNIT_VENETIAN_GALLEASS_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );
