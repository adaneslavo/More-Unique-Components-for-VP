-- Sambadrome
-- Code by Blue Ghost

--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------
INSERT INTO	Civilization_BuildingClassOverrides
(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_BRAZIL', 'BUILDINGCLASS_OPERA_HOUSE', 'BUILDING_VP_SAMBADROME');


--------------------------------
-- Buildings
--------------------------------
INSERT INTO	Buildings
			(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType,
			UnlockedByBelief, CultureRateModifier, GreatWorkSlotType, GreatWorkCount)
SELECT		'BUILDING_VP_SAMBADROME', 'TXT_KEY_BUILDING_VP_SAMBADROME', 'TXT_KEY_BUILDING_VP_SAMBADROME', 'TXT_KEY_BUILDING_VP_SAMBADROME_STRATEGY', 'TXT_KEY_BUILDING_VP_SAMBADROME_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, 7, 'SAMBA_TECH_ATLAS', GreatWorkYieldType,
			UnlockedByBelief, CultureRateModifier, GreatWorkSlotType, GreatWorkCount
FROM		Buildings
WHERE		Type = 'BUILDING_OPERA_HOUSE';

UPDATE		Buildings
SET			SpecialistType = 'SPECIALIST_MUSICIAN', SpecialistCount = 1, CultureRateModifier = 7, EnhancedYieldTech = 'TECH_RADIO', TechEnhancedTourism = 3
WHERE		Type = 'BUILDING_VP_SAMBADROME';


--------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------
INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT		'BUILDING_VP_SAMBADROME', BuildingClassType, YieldType, YieldChange
FROM		Building_BuildingClassYieldChanges
WHERE		BuildingType = 'BUILDING_OPERA_HOUSE';

INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES		('BUILDING_VP_SAMBADROME', 'BUILDINGCLASS_MUSICIANS_GUILD', 'YIELD_GOLDEN_AGE_POINTS', 2);

--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType, BuildingClassType)
SELECT		'BUILDING_VP_SAMBADROME', BuildingClassType
FROM		Building_ClassesNeededInCity
WHERE		BuildingType = 'BUILDING_OPERA_HOUSE';


--------------------------------
-- Building_Flavors
--------------------------------
INSERT INTO	Building_Flavors
			(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_VP_SAMBADROME', 'FLAVOR_CULTURE', 50),
			('BUILDING_VP_SAMBADROME', 'FLAVOR_GREAT_PEOPLE', 5);

--------------------------------
-- Building_SpecificGreatPersonRateModifier
--------------------------------
INSERT INTO Building_SpecificGreatPersonRateModifier
			(BuildingType, SpecialistType, Modifier)
SELECT		'BUILDING_VP_SAMBADROME', SpecialistType, Modifier
FROM		Building_SpecificGreatPersonRateModifier
WHERE		BuildingType = 'BUILDING_OPERA_HOUSE';

--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VP_SAMBADROME', YieldType, Yield
FROM		Building_YieldChanges
WHERE		BuildingType = 'BUILDING_OPERA_HOUSE';

UPDATE	Building_YieldChanges
SET		Yield = 5
WHERE	BuildingType = 'BUILDING_VP_SAMBADROME'
AND		YieldType = 'YIELD_CULTURE';

INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_VP_SAMBADROME', 'YIELD_GOLDEN_AGE_POINTS', 5);




--------------------------------
-- IconTextureAtlases
--------------------------------

INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('SAMBA_TECH_ATLAS', 						256, 		'Samba_Atlas_256.dds',				3, 				3),
		('SAMBA_TECH_ATLAS', 						128, 		'Samba_Atlas_128.dds',				3, 				3),
		('SAMBA_TECH_ATLAS', 						45, 		'Samba_Atlas_45.dds',				3, 				3),
		('SAMBA_TECH_ATLAS', 						64, 		'Samba_Atlas_64.dds',				3, 				3);
		