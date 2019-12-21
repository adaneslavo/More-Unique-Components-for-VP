--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_SWEDEN', 	'UNITCLASS_LANCER',		'UNIT_SWEDISH_HAKKAPELIITTA');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
--------------------------------	
-- Units
--------------------------------
UPDATE Units SET MinorCivGift = '0' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';
UPDATE Units SET Class = 'UNITCLASS_LANCER' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';
UPDATE Units SET Cost = '325' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';
UPDATE Units SET FaithCost = '400' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';
UPDATE Units SET PrereqTech = 'TECH_METALLURGY' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';
UPDATE Units SET ObsoleteTech = 'TECH_COMBINED_ARMS' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';
UPDATE Units SET Combat = '39' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';
--------------------------------	
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions
			(UnitType, PromotionType)
VALUES		('UNIT_SWEDISH_HAKKAPELIITTA', 'PROMOTION_SPAWN_GENERALS_II'),
			('UNIT_SWEDISH_HAKKAPELIITTA', 'PROMOTION_CHARGE');
--------------------------------	
-- Unit_FreePromotions Deletion
--------------------------------
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA' AND PromotionType = 'PROMOTION_FORMATION_1';
--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_SWEDISH_HAKKAPELIITTA', 'BUILDINGCLASS_STABLE';
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_SWEDISH_HAKKAPELIITTA', 'BUILDINGCLASS_ARMORY';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------
UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_WWI_TANK' WHERE UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA';
--------------------------------	
-- Unit_Flavors
--------------------------------
UPDATE Unit_Flavors SET Flavor = '20' WHERE UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA' AND FlavorType = 'FLAVOR_OFFENSE';
UPDATE Unit_Flavors SET Flavor = '2' WHERE UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA' AND FlavorType = 'FLAVOR_DEFENSE';
UPDATE Unit_Flavors SET Flavor = '14' WHERE UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA' AND FlavorType = 'FLAVOR_MOBILE';
UPDATE Unit_Flavors SET Flavor = '4' WHERE UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA' AND FlavorType = 'FLAVOR_GREAT_PEOPLE';
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITSCLASSES
--==========================================================================================================================	
--------------------------------	
-- UnitClasses
--------------------------------
DELETE FROM UnitClasses WHERE Type = 'UNITCLASS_SWEDISH_HAKKAPELIITTA';
--==========================================================================================================================	
--==========================================================================================================================	
