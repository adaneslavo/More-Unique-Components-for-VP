--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_SONGHAI', 	'UNITCLASS_KNIGHT',	'UNIT_SONGHAI_MUSLIMCAVALRY');
--------------------------------	
-- Civilization_UnitClassOverrides Deletion 
--------------------------------
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_SONGHAI' AND UnitClassType = 'UNITCLASS_HORSEMAN';
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
--------------------------------	
-- Units
--------------------------------
UPDATE Units
SET Cost = 200, Combat = 25, FaithCost = 300, Class = 'UNITCLASS_KNIGHT', PrereqTech = 'TECH_CHIVALRY', ObsoleteTech = 'TECH_COMBUSTION', GoodyHutUpgradeUnitClass = 'UNITCLASS_LANCER'
WHERE Type = 'UNIT_SONGHAI_MUSLIMCAVALRY';

--------------------------------	
-- Unit_ClassUpgrades
--------------------------------
UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_LANCER' WHERE UnitType = 'UNIT_SONGHAI_MUSLIMCAVALRY';
