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
		(Type, 			Description, 			Civilopedia, 			Strategy, 				Help, 					GoldMaintenance, 	Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, 	IconAtlas, 	GreatWorkYieldType, UnlockedByBelief, CultureRateModifier, 	GreatWorkSlotType, GreatWorkCount)
SELECT		'BUILDING_VP_KABUKI', 'TXT_KEY_BUILDING_VP_KABUKI', 	'TXT_KEY_BUILDING_VP_KABUKI',  'TXT_KEY_BUILDING_VP_KABUKI_STRATEGY',  'TXT_KEY_BUILDING_VP_KABUKI_HELP', 	GoldMaintenance-2, 	Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 0, 		'KABUKI_ATLAS', GreatWorkYieldType, UnlockedByBelief, 10, 			GreatWorkSlotType, GreatWorkCount
FROM		Buildings
WHERE		Type = 'BUILDING_OPERA_HOUSE';

INSERT INTO	Buildings
		(Type, 					Description, 					Civilopedia, 					Strategy, 								Help, 									GreatPeopleRateChange,   SpecialistCount, SpecialistType, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_MONOGATARI', 'TXT_KEY_BUILDING_MONOGATARI', 	'TXT_KEY_BUILDING_MONOGATARI',  'TXT_KEY_BUILDING_MONOGATARI_STRATEGY', 'TXT_KEY_BUILDING_MONOGATARI_HELP', 	GreatPeopleRateChange+2, SpecialistCount, SpecialistType, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 0, 				'JAPGUILDS_ATLAS'
FROM	Buildings
WHERE	Type = 'BUILDING_WRITERS_GUILD';

INSERT INTO	Buildings
		(Type, 				Description, 				Civilopedia, 				Strategy, 							Help, 								GreatPeopleRateChange,   SpecialistCount, SpecialistType, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_UKIYOE', 'TXT_KEY_BUILDING_UKIYOE', 	'TXT_KEY_BUILDING_UKIYOE',  'TXT_KEY_BUILDING_UKIYOE_STRATEGY', 'TXT_KEY_BUILDING_UKIYOE_HELP', 	GreatPeopleRateChange+2, SpecialistCount, SpecialistType, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 1, 				'JAPGUILDS_ATLAS'
FROM	Buildings
WHERE	Type = 'BUILDING_ARTISTS_GUILD';

INSERT INTO	Buildings
		(Type, 				Description, 				Civilopedia, 				Strategy, 							Help, 								GreatPeopleRateChange,   SpecialistCount, SpecialistType, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_GAGAKU', 'TXT_KEY_BUILDING_GAGAKU', 	'TXT_KEY_BUILDING_GAGAKU',  'TXT_KEY_BUILDING_GAGAKU_STRATEGY', 'TXT_KEY_BUILDING_GAGAKU_HELP', 	GreatPeopleRateChange+2, SpecialistCount, SpecialistType, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 2, 				'JAPGUILDS_ATLAS'
FROM	Buildings
WHERE	Type = 'BUILDING_MUSICIANS_GUILD';

--------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------
INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 		BuildingClassType, 		YieldType, 	YieldChange)
VALUES		('BUILDING_VP_KABUKI', 'BUILDINGCLASS_MUSICIANS_GUILD', 'YIELD_GOLD', 	1);

INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 		BuildingClassType, 		YieldType, 		YieldChange)
VALUES		('BUILDING_MONOGATARI', 'BUILDINGCLASS_OPERA_HOUSE', 	'YIELD_PRODUCTION', 	1),
		('BUILDING_UKIYOE', 	'BUILDINGCLASS_OPERA_HOUSE', 	'YIELD_TOURISM', 	1),
		('BUILDING_GAGAKU', 	'BUILDINGCLASS_OPERA_HOUSE', 	'YIELD_CULTURE', 	1);

--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType, BuildingClassType)
SELECT		'BUILDING_VP_KABUKI', BuildingClassType
FROM		Building_ClassesNeededInCity
WHERE		BuildingType = 'BUILDING_OPERA_HOUSE';

--------------------------------
-- Building_Flavors
--------------------------------
INSERT INTO	Building_Flavors
		(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_VP_KABUKI', 'FLAVOR_CULTURE', 70),
		('BUILDING_VP_KABUKI', 'FLAVOR_GREAT_PEOPLE', 50),
		('BUILDING_VP_KABUKI', 'FLAVOR_GOLD', 10),
		('BUILDING_MONOGATARI', 'FLAVOR_GREAT_PEOPLE', 50),
		('BUILDING_UKIYOE', 'FLAVOR_GREAT_PEOPLE', 50),
		('BUILDING_GAGAKU', 'FLAVOR_GREAT_PEOPLE', 50);

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
		(BuildingType, 		SpecialistType, 		YieldType, 	Yield)
VALUES
		('BUILDING_MONOGATARI', 'SPECIALIST_WRITER', 		'YIELD_GOLD', 	2),
		('BUILDING_UKIYOE', 	'SPECIALIST_ARTIST', 		'YIELD_SCIENCE', 2),
		('BUILDING_GAGAKU', 	'SPECIALIST_MUSICIAN', 		'YIELD_FAITH', 	2),
		('BUILDING_GAGAKU', 	'SPECIALIST_CIVIL_SERVANT', 	'YIELD_FAITH', 	2);

--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VP_KABUKI', YieldType, Yield
FROM		Building_YieldChanges
WHERE		BuildingType = 'BUILDING_OPERA_HOUSE';

--------------------------------
-- IconTextureAtlases
--------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 		IconSize, 	Filename, 		IconsPerRow, 	IconsPerColumn)
VALUES	
		('KABUKI_ATLAS', 	256, 		'Kabuki256.dds',	1, 		1),
		('KABUKI_ATLAS', 	128, 		'Kabuki128.dds',	1, 		1),
		('KABUKI_ATLAS', 	80, 		'Kabuki80.dds',		1, 		1),
		('KABUKI_ATLAS', 	45, 		'Kabuki45.dds',		1, 		1),
		('KABUKI_ATLAS', 	64, 		'Kabuki64.dds',		1, 		1),
		('KABUKI_ATLAS', 	32, 		'Kabuki32.dds',		1, 		1),
		('JAPGUILDS_ATLAS', 	256, 		'JapGuilds256.dds',	3, 		1),
		('JAPGUILDS_ATLAS', 	128, 		'JapGuilds128.dds',	3, 		1),
		('JAPGUILDS_ATLAS', 	64, 		'JapGuilds64.dds',	3, 		1),
		('JAPGUILDS_ATLAS', 	45, 		'JapGuilds45.dds',	3, 		1);
