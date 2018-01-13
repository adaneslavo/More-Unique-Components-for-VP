-- Examination Hall
-- Code by Blue Ghost

--------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_CHINA', 'BUILDINGCLASS_CHANCERY', 'BUILDING_VP_EXAMINATION_HALL');


--------------------------------	
-- Buildings
--------------------------------	
INSERT INTO	Buildings
			(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType,
			TrainedFreePromotion, SpecialistType, SpecialistCount)
SELECT		'BUILDING_VP_EXAMINATION_HALL', 'TXT_KEY_BUILDING_VP_EXAMINATION_HALL', 'TXT_KEY_BUILDING_VP_EXAMINATION_HALL_TEXT', 'TXT_KEY_BUILDING_VP_EXAMINATION_HALL_STRATEGY', 'TXT_KEY_BUILDING_VP_EXAMINATION_HALL_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, 0, 'EXAM_HALL_ATLAS', GreatWorkYieldType,
			TrainedFreePromotion, SpecialistType, SpecialistCount
FROM		Buildings
WHERE		Type = 'BUILDING_CHANCERY';

UPDATE		Buildings
SET			SpecialistCount = 2, GreatPeopleRateModifier = 5
WHERE		Type = 'BUILDING_VP_EXAMINATION_HALL';

--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType, BuildingClassType)
SELECT		'BUILDING_VP_EXAMINATION_HALL', BuildingClassType
FROM		Building_ClassesNeededInCity
WHERE		BuildingType = 'BUILDING_CHANCERY';

--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_VP_EXAMINATION_HALL', 'FLAVOR_GREAT_PEOPLE', 20),
			('BUILDING_VP_EXAMINATION_HALL', 'FLAVOR_DIPLOMACY', 40),
			('BUILDING_VP_EXAMINATION_HALL', 'FLAVOR_GOLD', 8),
			('BUILDING_VP_EXAMINATION_HALL', 'FLAVOR_CULTURE', 8),
			('BUILDING_VP_EXAMINATION_HALL', 'FLAVOR_SCIENCE', 8);

--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VP_EXAMINATION_HALL', YieldType, Yield
FROM		Building_YieldChanges
WHERE		BuildingType = 'BUILDING_CHANCERY';

--------------------------------	
-- Building_YieldPerAlly
--------------------------------	
INSERT INTO Building_YieldPerAlly
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VP_EXAMINATION_HALL', YieldType, Yield
FROM		Building_YieldPerAlly
WHERE		BuildingType = 'BUILDING_CHANCERY';

--------------------------------	
-- Building_YieldPerFriend
--------------------------------	
INSERT INTO Building_YieldPerFriend
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VP_EXAMINATION_HALL', YieldType, Yield
FROM		Building_YieldPerFriend
WHERE		BuildingType = 'BUILDING_CHANCERY';


--------------------------------	
-- Building_ResourceQuantity
--------------------------------	
INSERT INTO	Building_ResourceQuantity
			(BuildingType, ResourceType, Quantity)
SELECT		'BUILDING_VP_EXAMINATION_HALL', ResourceType, Quantity
FROM		Building_ResourceQuantity
WHERE		BuildingType = 'BUILDING_CHANCERY';
--------------------------------	
-- Building_UnitCombatProductionModifiers
--------------------------------	
INSERT INTO	Building_UnitCombatProductionModifiers
			(BuildingType, UnitCombatType, Modifier)
SELECT		'BUILDING_VP_EXAMINATION_HALL', UnitCombatType, Modifier
FROM		Building_UnitCombatProductionModifiers
WHERE		BuildingType = 'BUILDING_CHANCERY';

--------------------------------	
-- Dummy building
--------------------------------	

INSERT INTO BuildingClasses
			(Type,										DefaultBuilding)
VALUES		('BUILDINGCLASS_VP_EXAMINATION_HALL_DUMMY',	'BUILDING_VP_EXAMINATION_HALL_DUMMY');

INSERT INTO Buildings
			(Type,										BuildingClass,	
			Cost,	FaithCost,	GreatWorkCount, PrereqTech, NeverCapture,	NukeImmune,
			GreatPeopleRateModifier)
VALUES		('BUILDING_VP_EXAMINATION_HALL_DUMMY',		'BUILDINGCLASS_VP_EXAMINATION_HALL_DUMMY',
			-1,		-1,			-1,				NULL,		1,				1,
			5);

INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('EXAM_HALL_ATLAS', 						256, 		'ExamHall.256.dds',				1, 				1),
		('EXAM_HALL_ATLAS', 						128, 		'ExamHall.128.dds',				1, 				1),
		('EXAM_HALL_ATLAS', 						45, 		'ExamHall.45.dds',				1, 				1),
		('EXAM_HALL_ATLAS', 						64, 		'ExamHall.64.dds',				1, 				1);
		