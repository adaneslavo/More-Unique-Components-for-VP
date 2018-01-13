-- Ranch
-- Code by Blue Ghost
-- Art by Janboruta

--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------
INSERT INTO	Civilization_BuildingClassOverrides
(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_AMERICA', 'BUILDINGCLASS_STABLE', 'BUILDING_RANCH');


--------------------------------
-- IconTextureAtlases
--------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('3UC_RANCH_ICON_ATLAS', 						256, 		'3uc_ranch256.dds',				1, 				1),
		('3UC_RANCH_ICON_ATLAS', 						128, 		'3uc_ranch128.dds',				1, 				1),
		('3UC_RANCH_ICON_ATLAS', 						45, 		'3uc_ranch45.dds',				1, 				1),
		('3UC_RANCH_ICON_ATLAS', 						64, 		'3uc_ranch64.dds',				1, 				1);
		
--------------------------------
-- Buildings
--------------------------------
INSERT INTO	Buildings
(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType,
CitySupplyModifier)
SELECT		'BUILDING_RANCH', 'TXT_KEY_BUILDING_RANCH', 'TXT_KEY_BUILDING_RANCH', 'TXT_KEY_BUILDING_RANCH_STRATEGY', 'TXT_KEY_BUILDING_RANCH_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
BuildingClass, ArtDefineTag, PrereqTech, 0, '3UC_RANCH_ICON_ATLAS', GreatWorkYieldType,
CitySupplyModifier
FROM		Buildings
WHERE		Type = 'BUILDING_STABLE';

UPDATE Buildings
SET PlotCultureCostModifier = '-25'
WHERE Type = 'BUILDING_RANCH';


--------------------------------
-- Building_Flavors
--------------------------------
INSERT INTO	Building_Flavors
(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_RANCH', 'FLAVOR_MILITARY_TRAINING', 6),
('BUILDING_RANCH', 'FLAVOR_MOBILE', 6),
('BUILDING_RANCH', 'FLAVOR_PRODUCTION', 35),
('BUILDING_RANCH', 'FLAVOR_GROWTH', 25),
('BUILDING_RANCH', 'FLAVOR_EXPANSION', 25);


--------------------------------
-- Building_ResourceYieldChanges
--------------------------------
INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
SELECT		'BUILDING_RANCH', ResourceType, YieldType, Yield
FROM		Building_ResourceYieldChanges
WHERE		BuildingType = 'BUILDING_STABLE';

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
VALUES		('BUILDING_RANCH', 'RESOURCE_HORSE', 'YIELD_FOOD', 2);

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
VALUES		('BUILDING_RANCH', 'RESOURCE_HORSE', 'YIELD_GOLD', 2);

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
VALUES		('BUILDING_RANCH', 'RESOURCE_COW', 'YIELD_FOOD', 2);

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
VALUES		('BUILDING_RANCH', 'RESOURCE_COW', 'YIELD_GOLD', 2);

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
VALUES		('BUILDING_RANCH', 'RESOURCE_SHEEP', 'YIELD_FOOD', 2);

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
VALUES		('BUILDING_RANCH', 'RESOURCE_SHEEP', 'YIELD_GOLD', 2);

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
VALUES		('BUILDING_RANCH', 'RESOURCE_BISON', 'YIELD_PRODUCTION', 2);

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
VALUES		('BUILDING_RANCH', 'RESOURCE_BISON', 'YIELD_FOOD', 2);

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
VALUES		('BUILDING_RANCH', 'RESOURCE_BISON', 'YIELD_GOLD', 2);
--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield)
SELECT		'BUILDING_RANCH', YieldType, Yield
FROM		Building_YieldChanges
WHERE		BuildingType = 'BUILDING_STABLE';