-- Riad
-- Code by Blue Ghost

--------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_MOROCCO', 'BUILDINGCLASS_GARDEN', 'BUILDING_VP_RIAD');


--------------------------------	
-- Buildings
--------------------------------	
INSERT INTO	Buildings
			(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType)
SELECT		'BUILDING_VP_RIAD', 'TXT_KEY_BUILDING_VP_RIAD', 'TXT_KEY_BUILDING_VP_RIAD_TEXT', 'TXT_KEY_BUILDING_VP_RIAD_STRATEGY', 'TXT_KEY_BUILDING_VP_RIAD_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, 0, 'RIAD_ATLAS', GreatWorkYieldType
FROM		Buildings
WHERE		Type = 'BUILDING_GARDEN';

UPDATE		Buildings
SET			GoldMaintenance = 0, GreatPeopleRateModifier = 30
WHERE		Type = 'BUILDING_VP_RIAD';

--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType, BuildingClassType)
SELECT		'BUILDING_VP_RIAD', BuildingClassType
FROM		Building_ClassesNeededInCity
WHERE		BuildingType = 'BUILDING_GARDEN';

--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_VP_RIAD', 'FLAVOR_GREAT_PEOPLE', 35),
			('BUILDING_VP_RIAD', 'FLAVOR_CULTURE', 10),
			('BUILDING_VP_RIAD', 'FLAVOR_I_TRADE_ORIGIN', 20);

--------------------------------	
-- Building_ResourceYieldChanges
--------------------------------	
INSERT INTO Building_ResourceYieldChanges
			(BuildingType, ResourceType, YieldType, Yield)
SELECT		'BUILDING_VP_RIAD', ResourceType, YieldType, Yield
FROM		Building_ResourceYieldChanges
WHERE		BuildingType = 'BUILDING_GARDEN';

--------------------------------	
-- Building_FeatureYieldChanges
--------------------------------	
INSERT INTO Building_FeatureYieldChanges
			(BuildingType, FeatureType, YieldType, Yield)
VALUES		('BUILDING_VP_RIAD', 'FEATURE_OASIS', 'YIELD_GOLD', 3),
			('BUILDING_VP_RIAD', 'FEATURE_OASIS', 'YIELD_FOOD', 1);

--------------------------------	
-- Building_YieldChangesPerPop
--------------------------------	
INSERT INTO	Building_YieldChangesPerPop
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_VP_RIAD', 'YIELD_CULTURE', 20);
--------------------------------	
-- Building_GoldenAgeYieldMod
--------------------------------
INSERT INTO Building_GoldenAgeYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_STELE', 'YIELD_GOLD', 15);
--------------------------------
-- IconTextureAtlases
--------------------------------

INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('RIAD_ATLAS', 							256, 		'Riad_Icon_256.dds',				1, 				1),
		('RIAD_ATLAS', 							128, 		'Riad_Icon_128.dds',				1, 				1),
		('RIAD_ATLAS', 							45, 		'Riad_Icon_045.dds',				1, 				1),
		('RIAD_ATLAS', 							64, 		'Riad_Icon_064.dds',				1, 				1);
		
