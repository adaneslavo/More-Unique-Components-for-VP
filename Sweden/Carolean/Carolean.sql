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
UPDATE Units SET Cost = '625' WHERE Type = 'UNIT_SWEDISH_CAROLEAN';
UPDATE Units SET Class = 'UNITCLASS_RIFLEMAN' WHERE Type = 'UNIT_SWEDISH_CAROLEAN';
UPDATE Units SET PrereqTech = 'TECH_RIFLING' WHERE Type = 'UNIT_SWEDISH_CAROLEAN';
UPDATE Units SET Combat = '38' WHERE Type = 'UNIT_SWEDISH_CAROLEAN';
UPDATE Units SET ObsoleteTech = 'TECH_COMBINED_ARMS' WHERE Type = 'UNIT_SWEDISH_CAROLEAN'; 
UPDATE Units SET GoodyHutUpgradeUnitClass = 'UNITCLASS_GREAT_WAR_INFANTRY' WHERE Type = 'UNIT_SWEDISH_CAROLEAN';
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
-- LANGUAGE
--==========================================================================================================================	
--------------------------------	
-- Language_en_US 
--------------------------------
UPDATE Language_en_US 
SET Text = 'Caroleans are the backbone of the Industrial era Swedish army. They start with the March promotion that allows it to Heal every turn, even if it performs an action. The Carolean also receives a 15% combat bonus when stacked with a Great General, and deals damage to all adjacent units after advancing from killing a unit.'
WHERE Tag = 'TXT_KEY_UNIT_SWEDISH_CAROLEAN_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );