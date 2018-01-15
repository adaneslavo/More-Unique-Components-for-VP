-- Standschützen
-- Code by Blue Ghost
-- Art by Sukritact

--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_AUSTRIA', 'BUILDINGCLASS_ARSENAL', 'BUILDING_VP_STANDSCHUTZEN');


--------------------------------	
-- Buildings
--------------------------------	
INSERT INTO	Buildings
			(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType,
			NeverCapture, AllowsRangeStrike, Defense, ExtraCityHitPoints, CitySupplyModifier)
SELECT		'BUILDING_VP_STANDSCHUTZEN', 'TXT_KEY_BUILDING_VP_STANDSCHUTZEN', 'TXT_KEY_BUILDING_VP_STANDSCHUTZEN_TEXT', 'TXT_KEY_BUILDING_VP_STANDSCHUTZEN_STRATEGY', 'TXT_KEY_BUILDING_VP_STANDSCHUTZEN_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, 1, 'BUILDING_APIG4UC_ATLAS', GreatWorkYieldType,
			NeverCapture, AllowsRangeStrike, Defense, ExtraCityHitPoints, CitySupplyModifier
FROM		Buildings
WHERE		Type = 'BUILDING_ARSENAL';

UPDATE		Buildings
SET			Cost = 750, Defense = 2500, ExtraCityHitPoints = 200
WHERE		Type = 'BUILDING_VP_STANDSCHUTZEN';

--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType, BuildingClassType)
SELECT		'BUILDING_VP_STANDSCHUTZEN', BuildingClassType
FROM		Building_ClassesNeededInCity
WHERE		BuildingType = 'BUILDING_ARSENAL';

--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_VP_STANDSCHUTZEN', 'FLAVOR_CITY_DEFENSE', 50),
			('BUILDING_VP_STANDSCHUTZEN', 'FLAVOR_DIPLOMACY', 30),
			('BUILDING_VP_STANDSCHUTZEN', 'FLAVOR_GOLD', 10),
			('BUILDING_VP_STANDSCHUTZEN', 'FLAVOR_CULTURE', 6);

--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VP_STANDSCHUTZEN', YieldType, Yield
FROM		Building_YieldChanges
WHERE		BuildingType = 'BUILDING_ARSENAL';

--------------------------------	
-- Building_YieldPerAlly
--------------------------------	
INSERT INTO Building_YieldPerAlly
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_VP_STANDSCHUTZEN', 'YIELD_GOLD', 2),
			('BUILDING_VP_STANDSCHUTZEN', 'YIELD_CULTURE', 1);

--------------------------------	
-- Building_DomainProductionModifiers
--------------------------------	
INSERT INTO Building_DomainProductionModifiers
			(BuildingType, DomainType, Modifier)
VALUES		('BUILDING_VP_STANDSCHUTZEN', 'DOMAIN_LAND', 20);