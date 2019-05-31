-- Kabuki
-- Code by Hokath

--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------
INSERT INTO	Civilization_BuildingClassOverrides
(CivilizationType, BuildingClassType, BuildingType)
VALUES		('CIVILIZATION_JAPAN', 'BUILDINGCLASS_OPERA_HOUSE', 'BUILDING_JAPAN_KABUKI');


--------------------------------
-- Buildings
--------------------------------
INSERT INTO	Buildings
		(Type, 			Description, 			Civilopedia, 			Strategy, 				Help, 					GoldMaintenance, 	Cost, FaithCost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, 	IconAtlas, 	GreatWorkYieldType, UnlockedByBelief, CultureRateModifier, 	GreatWorkSlotType, GreatWorkCount)
SELECT		'BUILDING_JAPAN_KABUKI', 'TXT_KEY_BUILDING_JAPAN_KABUKI', 	'TXT_KEY_BUILDING_JAPAN_KABUKI_TEXT',  'TXT_KEY_BUILDING_JAPAN_KABUKI_STRATEGY',  'TXT_KEY_BUILDING_JAPAN_KABUKI_HELP', 	GoldMaintenance-2, 	Cost, FaithCost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 0, 		'KABUKI_ATLAS', GreatWorkYieldType, UnlockedByBelief, CultureRateModifier, 	GreatWorkSlotType, GreatWorkCount
FROM		Buildings
WHERE		Type = 'BUILDING_OPERA_HOUSE';

INSERT INTO	Buildings
		(Type, 							Description, 							Civilopedia, 								Strategy, 										Help, 										GreatPeopleRateChange,   SpecialistCount, SpecialistType, NoUnhappfromXSpecialists, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, 	IconAtlas, NeverCapture)
SELECT	'BUILDING_JAPAN_MONOGATARI', 	'TXT_KEY_BUILDING_JAPAN_MONOGATARI', 	'TXT_KEY_BUILDING_JAPAN_MONOGATARI_TEXT',  	'TXT_KEY_BUILDING_JAPAN_MONOGATARI_STRATEGY', 	'TXT_KEY_BUILDING_JAPAN_MONOGATARI_HELP', 	GreatPeopleRateChange+2, SpecialistCount, SpecialistType, NoUnhappfromXSpecialists, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 0, 				'JAPGUILDS_ATLAS', NeverCapture
FROM	Buildings
WHERE	Type = 'BUILDING_WRITERS_GUILD';

INSERT INTO	Buildings
		(Type, 						Description, 						Civilopedia, 							Strategy, 									Help, 									GreatPeopleRateChange,   SpecialistCount, SpecialistType, NoUnhappfromXSpecialists, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, 	IconAtlas, NeverCapture)
SELECT	'BUILDING_JAPAN_UKIYOE', 	'TXT_KEY_BUILDING_JAPAN_UKIYOE', 	'TXT_KEY_BUILDING_JAPAN_UKIYOE_TEXT',  	'TXT_KEY_BUILDING_JAPAN_UKIYOE_STRATEGY', 	'TXT_KEY_BUILDING_JAPAN_UKIYOE_HELP', 	GreatPeopleRateChange+2, SpecialistCount, SpecialistType, NoUnhappfromXSpecialists, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 1, 				'JAPGUILDS_ATLAS', NeverCapture
FROM	Buildings
WHERE	Type = 'BUILDING_ARTISTS_GUILD';

INSERT INTO	Buildings
		(Type, 						Description, 						Civilopedia, 							Strategy, 									Help, 									GreatPeopleRateChange,   SpecialistCount, SpecialistType, NoUnhappfromXSpecialists, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, 	IconAtlas, NeverCapture)
SELECT	'BUILDING_JAPAN_GAGAKU', 	'TXT_KEY_BUILDING_JAPAN_GAGAKU', 	'TXT_KEY_BUILDING_JAPAN_GAGAKU_TEXT',  	'TXT_KEY_BUILDING_JAPAN_GAGAKU_STRATEGY', 	'TXT_KEY_BUILDING_JAPAN_GAGAKU_HELP', 	GreatPeopleRateChange+2, SpecialistCount, SpecialistType, NoUnhappfromXSpecialists, GoldMaintenance, Cost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 2, 				'JAPGUILDS_ATLAS', NeverCapture
FROM	Buildings
WHERE	Type = 'BUILDING_MUSICIANS_GUILD';

--------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------
INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 		BuildingClassType, 		YieldType, 	YieldChange)
VALUES		('BUILDING_JAPAN_KABUKI', 'BUILDINGCLASS_MUSICIANS_GUILD', 'YIELD_GOLD', 	1);

--INSERT INTO Building_BuildingClassYieldChanges
--		(BuildingType, 		BuildingClassType, 		YieldType, 		YieldChange)
--VALUES		('BUILDING_JAPAN_MONOGATARI', 'BUILDINGCLASS_OPERA_HOUSE', 	'YIELD_PRODUCTION', 	1),
--		('BUILDING_JAPAN_UKIYOE', 	'BUILDINGCLASS_OPERA_HOUSE', 	'YIELD_TOURISM', 	1),
--		('BUILDING_JAPAN_GAGAKU', 	'BUILDINGCLASS_OPERA_HOUSE', 	'YIELD_CULTURE', 	1);

--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
--INSERT INTO Building_ClassesNeededInCity
--			(BuildingType, BuildingClassType)
--SELECT		'BUILDING_JAPAN_KABUKI', BuildingClassType
--FROM		Building_ClassesNeededInCity
--WHERE		BuildingType = 'BUILDING_OPERA_HOUSE';

--------------------------------
-- Building_Flavors
--------------------------------
INSERT INTO	Building_Flavors
		(BuildingType,  FlavorType, Flavor)
VALUES		('BUILDING_JAPAN_KABUKI', 'FLAVOR_CULTURE', 70),
		('BUILDING_JAPAN_KABUKI', 'FLAVOR_GREAT_PEOPLE', 50),
		('BUILDING_JAPAN_KABUKI', 'FLAVOR_GOLD', 10),
		('BUILDING_JAPAN_MONOGATARI', 'FLAVOR_GREAT_PEOPLE', 50),
		('BUILDING_JAPAN_UKIYOE', 'FLAVOR_GREAT_PEOPLE', 50),
		('BUILDING_JAPAN_GAGAKU', 'FLAVOR_GREAT_PEOPLE', 50);

--------------------------------
-- Building_SpecificGreatPersonRateModifier
--------------------------------
INSERT INTO Building_SpecificGreatPersonRateModifier
			(BuildingType, SpecialistType, Modifier)
VALUES
		('BUILDING_JAPAN_KABUKI', 'SPECIALIST_MUSICIAN', 33);

INSERT INTO Building_SpecialistYieldChangesLocal
		(BuildingType, 		SpecialistType, 		YieldType, 	Yield)
VALUES
		('BUILDING_JAPAN_MONOGATARI', 	'SPECIALIST_WRITER', 		'YIELD_GOLD', 	2),
		('BUILDING_JAPAN_UKIYOE', 		'SPECIALIST_ARTIST', 		'YIELD_SCIENCE', 2),
		('BUILDING_JAPAN_GAGAKU', 		'SPECIALIST_MUSICIAN', 		'YIELD_FAITH', 	2);

--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType, 				YieldType, 			Yield)
VALUES		('BUILDING_JAPAN_KABUKI', 	'YIELD_CULTURE', 	5);
--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldFromInternalTREnd
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_JAPAN_KABUKI', 'YIELD_CULTURE', 50);
--==========================================================================================================================	
-- EVENTS
--==========================================================================================================================	
--------------------------------
-- EventChoices
--------------------------------	
INSERT INTO EventChoices
			(Type,										EventDuration,	Expires)
VALUES		('PLAYER_EVENT_CHOICE_GAGAKU_TOURISM',	1,				1);
--------------------------------
-- EventChoices
--------------------------------	
INSERT INTO EventChoice_InstantYield
			(EventChoiceType,							YieldType,			Yield)
VALUES		('PLAYER_EVENT_CHOICE_GAGAKU_TOURISM',	'YIELD_TOURISM',	200);
--------------------------------
-- IconTextureAtlases
--------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 				IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('KABUKI_ATLAS', 		256, 		'KabukiPicture_256.dds',			1, 				1),
			('KABUKI_ATLAS', 		128, 		'KabukiPicture_128.dds',			1, 				1),
			('KABUKI_ATLAS', 		45, 		'KabukiPicture_045.dds',			1, 				1),
			('KABUKI_ATLAS', 		64, 		'KabukiPicture_064.dds',			1, 				1),
			('JAPGUILDS_ATLAS', 	256, 		'JapaneseGuildsPictures_256.dds',	3, 				1),
			('JAPGUILDS_ATLAS', 	128, 		'JapaneseGuildsPictures_128.dds',	3, 				1),
			('JAPGUILDS_ATLAS', 	64, 		'JapaneseGuildsPictures_064.dds',	3, 				1),
			('JAPGUILDS_ATLAS', 	45, 		'JapaneseGuildsPictures_045.dds',	3, 				1);
