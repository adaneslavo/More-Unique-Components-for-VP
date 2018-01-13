-- Lamassu Gate
-- Design by Blue Ghost, with help from pineappledan
-- Code by Blue Ghost
-- Art by mikeburnfire

--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_ASSYRIA', 'BUILDINGCLASS_WALLS', 'BUILDING_LAMASSU');


--------------------------------	
-- Buildings
--------------------------------	
INSERT INTO	Buildings
			(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType,
			NeverCapture, Defense, ExtraCityHitPoints, AllowsRangeStrike, CityWall, CitySupplyModifier)
SELECT		'BUILDING_LAMASSU', 'TXT_KEY_BUILDING_LAMASSU', 'TXT_KEY_BUILDING_LAMASSU_TEXT', 'TXT_KEY_BUILDING_LAMASSU_STRATEGY', 'TXT_KEY_BUILDING_LAMASSU_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, 0, 'SARGON_SHRINE_ATLAS', GreatWorkYieldType,
			NeverCapture, Defense, ExtraCityHitPoints, AllowsRangeStrike, CityWall, CitySupplyModifier
FROM		Buildings
WHERE		Type = 'BUILDING_WALLS';

UPDATE		Buildings
SET			SpecialistType = 'SPECIALIST_WRITER', SpecialistCount = 1, CitySupplyModifier = 20, 
			GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 1
WHERE		Type = 'BUILDING_LAMASSU';

--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_LAMASSU', 'FLAVOR_CITY_DEFENSE', 50),
			('BUILDING_LAMASSU', 'FLAVOR_CULTURE', 30),
			('BUILDING_LAMASSU', 'FLAVOR_MILITARY_TRAINING', 20);

--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_LAMASSU', YieldType, Yield
FROM		Building_YieldChanges
WHERE		BuildingType = 'BUILDING_WALLS';

INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_LAMASSU', 'YIELD_CULTURE', 1);




INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('SARGON_SHRINE_ATLAS', 						256, 		'sargon256.dds',				1, 				1),
		('SARGON_SHRINE_ATLAS', 						128, 		'sargon128.dds',				1, 				1),
		('SARGON_SHRINE_ATLAS', 						45, 		'sargon45.dds',				1, 				1),
		('SARGON_SHRINE_ATLAS', 						64, 		'sargon64.dds',				1, 				1);
		