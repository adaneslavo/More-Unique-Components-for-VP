-- Teutonic Order
-- Code by Blue Ghost

--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_GERMANY', 'BUILDINGCLASS_HEROIC_EPIC', 'BUILDING_GERMAN_TEUTONIC_ORDER');

--------------------------------	
-- Buildings
--------------------------------	
INSERT INTO	Buildings
			(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType,
			NeverCapture, NukeImmune, NumCityCostMod, TrainedFreePromotion, GreatWorkSlotType, GreatWorkCount, NationalPopRequired, CitySupplyModifier)
SELECT		'BUILDING_GERMAN_TEUTONIC_ORDER', 'TXT_KEY_BUILDING_GERMAN_TEUTONIC_ORDER', 'TXT_KEY_BUILDING_GERMAN_TEUTONIC_ORDER_TEXT', 'TXT_KEY_BUILDING_GERMAN_TEUTONIC_ORDER_STRATEGY', 'TXT_KEY_BUILDING_GERMAN_TEUTONIC_ORDER_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, 3, 'BUILDING_APIG4UC_ATLAS', GreatWorkYieldType,
			NeverCapture, NukeImmune, NumCityCostMod, TrainedFreePromotion, GreatWorkSlotType, GreatWorkCount, NationalPopRequired, CitySupplyModifier
FROM		Buildings
WHERE		Type = 'BUILDING_HEROIC_EPIC';

UPDATE		Buildings
SET			PrereqTech = 'TECH_CHIVALRY', ExtraCityHitPoints = 100, FreeBuildingThisCity = 'BUILDINGCLASS_ARMORY'
WHERE		Type = 'BUILDING_GERMAN_TEUTONIC_ORDER';



--------------------------------	
-- Building_BuildingClassYieldChanges
--------------------------------	
INSERT INTO		Building_BuildingClassYieldChanges
				(BuildingType,  BuildingClassType, YieldType, YieldChange)
VALUES			('BUILDING_GERMAN_TEUTONIC_ORDER', 'BUILDINGCLASS_BARRACKS', 'YIELD_FAITH', 2);


--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType, FlavorType, Flavor)
VALUES		('BUILDING_GERMAN_TEUTONIC_ORDER', 'FLAVOR_RELIGION', 10),
			('BUILDING_GERMAN_TEUTONIC_ORDER', 'FLAVOR_OFFENSE', 15),
			('BUILDING_GERMAN_TEUTONIC_ORDER', 'FLAVOR_DEFENSE', 10),
			('BUILDING_GERMAN_TEUTONIC_ORDER', 'FLAVOR_MILITARY_TRAINING', 50),
			('BUILDING_GERMAN_TEUTONIC_ORDER', 'FLAVOR_PRODUCTION', 5),
			('BUILDING_GERMAN_TEUTONIC_ORDER', 'FLAVOR_CULTURE', 10),
			('BUILDING_GERMAN_TEUTONIC_ORDER', 'FLAVOR_WONDER', 20);


--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_GERMAN_TEUTONIC_ORDER', 'YIELD_CULTURE', 3),
			('BUILDING_GERMAN_TEUTONIC_ORDER', 'YIELD_SCIENCE', 3);


INSERT INTO BuildingClasses
			(Type,										DefaultBuilding)
VALUES		('BUILDINGCLASS_TEUTONIC_ORDER_DUMMY',	'BUILDING_TEUTONIC_ORDER_DUMMY');

INSERT INTO Buildings
			(Type,										BuildingClass,	
			Cost,	FaithCost,	GreatWorkCount, PrereqTech, NeverCapture,	NukeImmune,
			Defense, ExtraCityHitPoints, TrainedFreePromotion)
VALUES		('BUILDING_TEUTONIC_ORDER_DUMMY',		'BUILDINGCLASS_TEUTONIC_ORDER_DUMMY',
			-1,		-1,			-1,				NULL,		1,				1,
			500,		50,			'PROMOTION_MORALE');

