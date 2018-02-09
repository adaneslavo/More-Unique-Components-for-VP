-- Kabuki
-- Code by Hokath

--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------
INSERT INTO	Civilization_BuildingClassOverrides
(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_JAPAN', 'BUILDINGCLASS_OPERA_HOUSE', 'BUILDING_VP_KABUKI');


--------------------------------
-- Buildings
--------------------------------
INSERT INTO	Buildings
			(Type, Description, Civilopedia, Strategy, Help, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas, GreatWorkYieldType,
			UnlockedByBelief, CultureRateModifier, GreatWorkSlotType, GreatWorkCount)
SELECT		'BUILDING_VP_KABUKI', 'TXT_KEY_BUILDING_VP_KABUKI', 'TXT_KEY_BUILDING_VP_KABUKI', 'TXT_KEY_BUILDING_VP_KABUKI_STRATEGY', 'TXT_KEY_BUILDING_VP_KABUKI_HELP', GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb,
			BuildingClass, ArtDefineTag, PrereqTech, 0, 'KABUKI_ATLAS', GreatWorkYieldType,
			UnlockedByBelief, 10, GreatWorkSlotType, GreatWorkCount
FROM		Buildings
WHERE		Type = 'BUILDING_OPERA_HOUSE';


--------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------
INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT		'BUILDING_VP_KABUKI', BuildingClassType, YieldType, YieldChange
FROM		Building_BuildingClassYieldChanges
WHERE		BuildingType = 'BUILDING_OPERA_HOUSE';

--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
--INSERT INTO Building_ClassesNeededInCity
--			(BuildingType, BuildingClassType)
--SELECT		'BUILDING_VP_KABUKI', BuildingClassType
--FROM		Building_ClassesNeededInCity
--WHERE		BuildingType = 'BUILDING_OPERA_HOUSE';


--------------------------------
-- Building_Flavors
--------------------------------
INSERT INTO	Building_Flavors
		(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_VP_KABUKI', 'FLAVOR_CULTURE', 70),
		('BUILDING_VP_KABUKI', 'FLAVOR_GREAT_PEOPLE', 20);

--------------------------------
-- Building_SpecificGreatPersonRateModifier
--------------------------------
INSERT INTO Building_SpecificGreatPersonRateModifier
			(BuildingType, SpecialistType, Modifier)
VALUES
		('BUILDING_VP_KABUKI', 'SPECIALIST_MUSICIAN', 66),
		('BUILDING_VP_KABUKI', 'SPECIALIST_ARTIST', 33),
		('BUILDING_VP_KABUKI', 'SPECIALIST_WRITER', 33);

INSERT INTO Building_SpecialistYieldChangesLocal
			(BuildingType, SpecialistType, YieldType, Yield)
VALUES
		('BUILDING_VP_KABUKI', 'SPECIALIST_ARTIST', 'YIELD_TOURISM', 2),
		('BUILDING_VP_KABUKI', 'SPECIALIST_WRITER', 'YIELD_TOURISM', 2),
		('BUILDING_VP_KABUKI', 'SPECIALIST_MUSICIAN', 'YIELD_TOURISM', 2);
--------------------------------
-- Building_ThemingBonus
--------------------------------
--INSERT INTO Building_ThemingYieldBonus
--		(BuildingType, YieldType, Yield)
--VALUES		('BUILDING_VP_KABUKI', 'YIELD_CULTURE', 	2),
--		('BUILDING_VP_KABUKI', 'YIELD_FAITH',		2);
------------------------------	
-- Building_ThemingBonuses
------------------------------	
--INSERT INTO Building_ThemingBonuses	
--		(BuildingType,		Description,			Bonus,	SameEra, RequiresSamePlayer,	AIPriority)
--VALUES		('BUILDING_VP_KABUKI',	'TXT_KEY_THEMING_BONUS_KABUKI',	2,	1,	 1,		        4);

--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VP_KABUKI', YieldType, Yield
FROM		Building_YieldChanges
WHERE		BuildingType = 'BUILDING_OPERA_HOUSE';

UPDATE	Building_YieldChanges
SET		Yield = 5
WHERE	BuildingType = 'BUILDING_VP_KABUKI'
AND		YieldType = 'YIELD_CULTURE';

--------------------------------
-- IconTextureAtlases
--------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	
		('KABUKI_ATLAS', 						256, 		'Kabuki256.dds',				1, 				1),
		('KABUKI_ATLAS', 						128, 		'Kabuki128.dds',				1, 				1),
		('KABUKI_ATLAS', 						80, 		'Kabuki80.dds',				1, 				1),
		('KABUKI_ATLAS', 						45, 		'Kabuki45.dds',				1, 				1),
		('KABUKI_ATLAS', 						64, 		'Kabuki64.dds',				1, 				1),
		('KABUKI_ATLAS', 						32, 		'Kabuki32.dds',				1, 				1);
