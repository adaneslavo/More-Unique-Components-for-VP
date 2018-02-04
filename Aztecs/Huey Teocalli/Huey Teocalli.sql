-- Huey Teocalli
-- Code by Blue Ghost

--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_AZTEC', 'BUILDINGCLASS_GRAND_TEMPLE', 'BUILDING_VP_HUEY_TEOCALLI');


--------------------------------	
-- Buildings
--------------------------------	
INSERT INTO	Buildings
			(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType,
			GoldenAge, NeverCapture, NukeImmune, NumCityCostMod, GreatWorkSlotType, GreatWorkCount,
			NationalPopRequired, MinorityHappinessChange)
SELECT		'BUILDING_VP_HUEY_TEOCALLI', 'TXT_KEY_BUILDING_VP_HUEY_TEOCALLI', 'TXT_KEY_BUILDING_VP_HUEY_TEOCALLI_TEXT', 'TXT_KEY_BUILDING_VP_HUEY_TEOCALLI_STRATEGY', 'TXT_KEY_BUILDING_VP_HUEY_TEOCALLI_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, 0, 'BW_ATLAS_TEMPLO', GreatWorkYieldType,
			GoldenAge, NeverCapture, NukeImmune, NumCityCostMod, GreatWorkSlotType, GreatWorkCount,
			NationalPopRequired, MinorityHappinessChange
FROM		Buildings
WHERE		Type = 'BUILDING_GRAND_TEMPLE';

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_TEMPLE', GoldenAge = 1
WHERE Type = 'BUILDING_VP_HUEY_TEOCALLI';



--------------------------------	
-- Building_ClassYieldChanges
--------------------------------	
INSERT INTO	Building_BuildingClassYieldChanges
			(BuildingType,  BuildingClassType, YieldType, YieldChange)
SELECT		'BUILDING_VP_HUEY_TEOCALLI', BuildingClassType, YieldType, YieldChange
FROM		Building_BuildingClassYieldChanges
WHERE		BuildingType = 'BUILDING_GRAND_TEMPLE';

INSERT INTO	Building_BuildingClassYieldChanges
			(BuildingType,  BuildingClassType, YieldType, YieldChange)
VALUES		('BUILDING_VP_HUEY_TEOCALLI', 'BUILDINGCLASS_BARRACKS', 'YIELD_CULTURE', 2);

INSERT INTO	Building_BuildingClassYieldChanges
			(BuildingType,  BuildingClassType, YieldType, YieldChange)
VALUES		('BUILDING_VP_HUEY_TEOCALLI', 'BUILDINGCLASS_WATERMILL', 'YIELD_FOOD', 2);

--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_VP_HUEY_TEOCALLI', 'FLAVOR_RELIGION', 50),
			('BUILDING_VP_HUEY_TEOCALLI', 'FLAVOR_WONDER', 30),
			('BUILDING_VP_HUEY_TEOCALLI', 'FLAVOR_GROWTH', 20),
			('BUILDING_VP_HUEY_TEOCALLI', 'FLAVOR_MILITARY_TRAINING', 20);

--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VP_HUEY_TEOCALLI', YieldType, Yield
FROM		Building_YieldChanges
WHERE		BuildingType = 'BUILDING_GRAND_TEMPLE';

--------------------------------	
-- Dummy building
--------------------------------	

INSERT INTO BuildingClasses
			(Type,										DefaultBuilding,					NoLimit)
VALUES		('BUILDINGCLASS_VP_HUEY_TEOCALLI_DUMMY',	'BUILDING_VP_HUEY_TEOCALLI_DUMMY',  1);

INSERT INTO Buildings
			(Type,										BuildingClass,	
			Cost,	FaithCost,	GreatWorkCount, PrereqTech, NeverCapture,	NukeImmune)
VALUES		('BUILDING_VP_HUEY_TEOCALLI_DUMMY',		'BUILDINGCLASS_VP_HUEY_TEOCALLI_DUMMY',
			-1,		-1,			-1,				NULL,		1,				1);

INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES		('BUILDING_VP_HUEY_TEOCALLI_DUMMY', 'BUILDINGCLASS_GRAND_TEMPLE', 'YIELD_FOOD', 3),
			('BUILDING_VP_HUEY_TEOCALLI_DUMMY', 'BUILDINGCLASS_GRAND_TEMPLE', 'YIELD_FAITH', 3);

INSERT INTO Building_DomainFreeExperiences
			(BuildingType, DomainType, Experience)
VALUES		('BUILDING_VP_HUEY_TEOCALLI_DUMMY', 'DOMAIN_LAND', 3),
			('BUILDING_VP_HUEY_TEOCALLI_DUMMY', 'DOMAIN_AIR', 3),
			('BUILDING_VP_HUEY_TEOCALLI_DUMMY', 'DOMAIN_SEA', 3);


INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('BW_ATLAS_TEMPLO', 						256, 		'TEMPLO_icon256.dds',				1, 				1),
		('BW_ATLAS_TEMPLO', 						128, 		'TEMPLO_icon128.dds',				1, 				1),
		('BW_ATLAS_TEMPLO', 						80, 		'TEMPLO_icon80.dds',				1, 				1),
		('BW_ATLAS_TEMPLO', 						45, 		'TEMPLO_icon45.dds',				1, 				1),
		('BW_ATLAS_TEMPLO', 						64, 		'TEMPLO_icon64.dds',				1, 				1),
		('BW_ATLAS_TEMPLO', 						32, 		'TEMPLO_icon32.dds',				1, 				1);
		