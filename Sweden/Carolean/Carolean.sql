--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_SWEDEN', 	'UNITCLASS_RIFLEMAN',	'UNIT_SWEDISH_CAROLEAN');
--------------------------------	
-- Civilization_UnitClassOverrides Deletion 
--------------------------------
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_SWEDEN' AND UnitClassType = 'UNITCLASS_TERCIO';
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
--------------------------------	
-- Units
--------------------------------
UPDATE Units SET Cost = '625', FaithCost = '600' WHERE Type = 'UNIT_SWEDISH_CAROLEAN';
UPDATE Units SET Class = 'UNITCLASS_RIFLEMAN' WHERE Type = 'UNIT_SWEDISH_CAROLEAN';
UPDATE Units SET PrereqTech = 'TECH_RIFLING' WHERE Type = 'UNIT_SWEDISH_CAROLEAN';
UPDATE Units SET Combat = '42' WHERE Type = 'UNIT_SWEDISH_CAROLEAN';
UPDATE Units SET ObsoleteTech = 'TECH_COMBINED_ARMS' WHERE Type = 'UNIT_SWEDISH_CAROLEAN'; 
UPDATE Units SET GoodyHutUpgradeUnitClass = 'UNITCLASS_GREAT_WAR_INFANTRY' WHERE Type = 'UNIT_SWEDISH_CAROLEAN';
INSERT INTO Unit_FreePromotions (UnitType, PromotionType) SELECT 'UNIT_SWEDISH_CAROLEAN', 'PROMOTION_FIELD_WORKS_1';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------
UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_GREAT_WAR_INFANTRY' WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN';
--------------------------------	
-- Unit_Flavors
--------------------------------
UPDATE Unit_Flavors SET Flavor = '20' WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN' AND FlavorType = 'FLAVOR_OFFENSE';
UPDATE Unit_Flavors SET Flavor = '20' WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN' AND FlavorType = 'FLAVOR_DEFENSE';
--==========================================================================================================================	
--==========================================================================================================================	
