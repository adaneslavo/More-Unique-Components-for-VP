------------------------------
-- Buildings
------------------------------	
INSERT INTO	Buildings
			(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType,
			GoldenAge, NeverCapture, NukeImmune, NumCityCostMod, GreatWorkSlotType, GreatWorkCount,
			NationalPopRequired, MinorityHappinessChange)
SELECT      'BUILDING_3UC_YURT', 'TXT_KEY_BUILDING_3UC_YURT', 'TXT_KEY_BUILDING_3UC_YURT_TEXT', 'TXT_KEY_BUILDING_3UC_YURT_STRATEGY', 'TXT_KEY_BUILDING_3UC_YURT_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, 'TECH_PHYSICS', 0, 'YURT_ICON_ATLAS', GreatWorkYieldType,
			GoldenAge, NeverCapture, NukeImmune, NumCityCostMod, GreatWorkSlotType, GreatWorkCount,
			NationalPopRequired, MinorityHappinessChange
FROM		Buildings
WHERE		Type = 'BUILDING_IRONWORKS';

------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
VALUES	
		('BUILDING_3UC_YURT',	'FLAVOR_PRODUCTION', 100),
		('BUILDING_3UC_YURT',	'FLAVOR_CULTURE', 30),
		('BUILDING_3UC_YURT',	'FLAVOR_SCIENCE', 30),
		('BUILDING_3UC_YURT',	'FLAVOR_GOLD', 20);
------------------------------	
-- Building_Yields
------------------------------		
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_3UC_YURT', 'YIELD_PRODUCTION', 10),
	('BUILDING_3UC_YURT', 'YIELD_SCIENCE', 3),
	('BUILDING_3UC_YURT', 'YIELD_CULTURE', 3);
	
INSERT INTO Building_YieldFromConstruction
	(BuildingType, YieldType, Yield)
SELECT	'BUILDING_3UC_YURT',	YieldType, Yield
FROM		Building_YieldFromConstruction
WHERE		BuildingType = 'BUILDING_IRONWORKS';	

------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO	Building_BuildingClassYieldChanges
			(BuildingType,  BuildingClassType, YieldType, YieldChange)
VALUES		
			('BUILDING_3UC_YURT', 'BUILDINGCLASS_STABLE', 'YIELD_PRODUCTION', 2),
			('BUILDING_3UC_YURT', 'BUILDINGCLASS_STABLE', 'YIELD_CULTURE', 2);

--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_HUNS',	'BUILDINGCLASS_IRONWORKS',	'BUILDING_3UC_YURT');


--==========================================================================================================================	
-- EVENTS
--==========================================================================================================================	
--------------------------------
-- EventChoices
--------------------------------	
INSERT INTO EventChoices
			(Type,										Description,										Help,													EventDuration,	Expires,	PlayerHappiness)
VALUES		('PLAYER_EVENT_CHOICE_ALTI_CUR_HAPPINESS',	'TXT_KEY_PLAYER_EVENT_CHOICE_ALTI_CUR_HAPPINESS',	'TXT_KEY_PLAYER_EVENT_CHOICE_ALTI_CUR_HAPPINESS_HELP',	20,				1,			6);
