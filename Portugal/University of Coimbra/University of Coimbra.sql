-- University of Coimbra
-- Code by Blue Ghost

--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_PORTUGAL', 'BUILDINGCLASS_OXFORD_UNIVERSITY', 'BUILDING_VP_UNIVERSITY_OF_COIMBRA');


--------------------------------	
-- Buildings
--------------------------------	
INSERT INTO	Buildings
			(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType,
			ThemingBonusHelp, NeverCapture, NukeImmune, NumCityCostMod, GreatWorkSlotType, GreatWorkCount,
			NationalPopRequired, IlliteracyHappinessChange)
SELECT		'BUILDING_VP_UNIVERSITY_OF_COIMBRA', 'TXT_KEY_BUILDING_VP_UNIVERSITY_OF_COIMBRA', 'TXT_KEY_BUILDING_VP_UNIVERSITY_OF_COIMBRA_TEXT', 'TXT_KEY_BUILDING_VP_UNIVERSITY_OF_COIMBRA_STRATEGY', 'TXT_KEY_BUILDING_VP_UNIVERSITY_OF_COIMBRA_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, 2, 'BUILDING_APIG4UC_ATLAS', GreatWorkYieldType,
			ThemingBonusHelp, NeverCapture, NukeImmune, NumCityCostMod, GreatWorkSlotType, GreatWorkCount,
			NationalPopRequired, IlliteracyHappinessChange
FROM		Buildings
WHERE		Type = 'BUILDING_OXFORD_UNIVERSITY';

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_UNIVERSITY'
WHERE Type = 'BUILDING_VP_UNIVERSITY_OF_COIMBRA';

--------------------------------	
-- Building_ClassYieldChanges
--------------------------------	

INSERT INTO	Building_BuildingClassYieldChanges
			(BuildingType,  BuildingClassType, YieldType, YieldChange)
VALUES		('BUILDING_VP_UNIVERSITY_OF_COIMBRA', 'BUILDINGCLASS_UNIVERSITY', 'YIELD_GOLD', 2);

--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_VP_UNIVERSITY_OF_COIMBRA', 'FLAVOR_SCIENCE', 60),
			('BUILDING_VP_UNIVERSITY_OF_COIMBRA', 'FLAVOR_WONDER', 30),
			('BUILDING_VP_UNIVERSITY_OF_COIMBRA', 'FLAVOR_GOLD', 10),
			('BUILDING_VP_UNIVERSITY_OF_COIMBRA', 'FLAVOR_NAVAL', 10);

--------------------------------	
-- Building_FreeUnits
--------------------------------	
INSERT INTO	Building_FreeUnits
			(BuildingType,  UnitType, NumUnits)
SELECT		'BUILDING_VP_UNIVERSITY_OF_COIMBRA', UnitType, NumUnits
FROM		Building_FreeUnits
WHERE		BuildingType = 'BUILDING_OXFORD_UNIVERSITY';

--------------------------------	
-- Building_ThemingBonuses
--------------------------------	
INSERT INTO Building_ThemingBonuses
			(BuildingType, Description, Bonus, UniqueEras, RequiresAnyButOwner, AIPriority)
SELECT		'BUILDING_VP_UNIVERSITY_OF_COIMBRA', Description, Bonus, UniqueEras, RequiresAnyButOwner, AIPriority
FROM		Building_ThemingBonuses
WHERE		BuildingType = 'BUILDING_OXFORD_UNIVERSITY';

--------------------------------	
-- Building_ThemingYieldBonus
--------------------------------	
INSERT INTO Building_ThemingYieldBonus
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VP_UNIVERSITY_OF_COIMBRA', YieldType, Yield
FROM		Building_ThemingYieldBonus
WHERE		BuildingType = 'BUILDING_OXFORD_UNIVERSITY';

--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_VP_UNIVERSITY_OF_COIMBRA', 'YIELD_SCIENCE', 5),
			('BUILDING_VP_UNIVERSITY_OF_COIMBRA', 'YIELD_CULTURE', 5);

--------------------------------	
-- Building_YieldFromTech
--------------------------------	
INSERT INTO Building_YieldFromTech
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VP_UNIVERSITY_OF_COIMBRA', YieldType, Yield
FROM		Building_YieldFromTech
WHERE		BuildingType = 'BUILDING_OXFORD_UNIVERSITY';



--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry)
VALUES		('PROMOTION_AGE_OF_DISCOVERY',				'TXT_KEY_PROMOTION_AGE_OF_DISCOVERY',		'TXT_KEY_PROMOTION_AGE_OF_DISCOVERY_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_NAVAL',			'TXT_KEY_PROMOTION_AGE_OF_DISCOVERY');

--------------------------------	
-- UnitPromotions_YieldFromScouting
--------------------------------	
INSERT INTO UnitPromotions_YieldFromScouting
			(PromotionType, YieldType, Yield)
VALUES		('PROMOTION_AGE_OF_DISCOVERY', 'YIELD_SCIENCE', 1);


--------------------------------	
-- Dummy building
--------------------------------	

INSERT INTO BuildingClasses
			(Type,										DefaultBuilding,					NoLimit)
VALUES		('BUILDINGCLASS_VP_UNIVERSITY_OF_COIMBRA_DUMMY',	'BUILDING_VP_UNIVERSITY_OF_COIMBRA_DUMMY',  1);

INSERT INTO Buildings
			(Type,										BuildingClass,	
			Cost,	FaithCost,	GreatWorkCount, PrereqTech, NeverCapture,	NukeImmune)
VALUES		('BUILDING_VP_UNIVERSITY_OF_COIMBRA_DUMMY',		'BUILDINGCLASS_VP_UNIVERSITY_OF_COIMBRA_DUMMY',
			-1,		-1,			-1,				NULL,		1,				1);

INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES		('BUILDING_VP_UNIVERSITY_OF_COIMBRA_DUMMY', 'BUILDINGCLASS_OXFORD_UNIVERSITY', 'YIELD_GOLD', 2),
VALUES		('BUILDING_VP_UNIVERSITY_OF_COIMBRA_DUMMY', 'BUILDINGCLASS_OXFORD_UNIVERSITY', 'YIELD_PRODUCTION', 2);
