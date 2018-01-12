--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_POLAND',	'BUILDINGCLASS_ARMORY',	'BUILDING_POLAND_BARBICAN');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('BUILDING_POLAND_ATLAS', 			256, 		'BarbicanPicture_256.dds',			1, 				1),
		('BUILDING_POLAND_ATLAS', 			128, 		'BarbicanPicture_128.dds',			1, 				1),
		('BUILDING_POLAND_ATLAS', 			64, 		'BarbicanPicture_064.dds',			1, 				1),
		('BUILDING_POLAND_ATLAS', 			45, 		'BarbicanPicture_045.dds',			1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,						BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,			ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,		DefenseHappinessChange,		GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	Help,										Description,						Civilopedia,								Strategy,										IconAtlas,					PortraitIndex)
SELECT		'BUILDING_POLAND_BARBICAN', BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense+1000,	ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat+1,	DefenseHappinessChange-30,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_POLAND_BARBICAN_HELP',	'TXT_KEY_BUILDING_POLAND_BARBICAN', 'TXT_KEY_BUILDING_POLAND_BARBICAN_TEXT',	'TXT_KEY_BUILDING_POLAND_BARBICAN_STRATEGY',	'BUILDING_POLAND_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_ARMORY';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,					Flavor)
VALUES		('BUILDING_POLAND_BARBICAN',	'FLAVOR_MILITARY_TRAINING', 60),
			('BUILDING_POLAND_BARBICAN',	'FLAVOR_CITY_DEFENSE',		15),
			('BUILDING_POLAND_BARBICAN',	'FLAVOR_CULTURE',			10),
			('BUILDING_POLAND_BARBICAN',	'FLAVOR_RELIGION',			10),
			('BUILDING_POLAND_BARBICAN',	'FLAVOR_SCIENCE',			10),
			('BUILDING_POLAND_BARBICAN',	'FLAVOR_RANGED',			10);			
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_POLAND_BARBICAN',	'BUILDINGCLASS_WALLS');
------------------------------	
-- Building_Free_XP
------------------------------		
INSERT INTO Building_DomainFreeExperiences 	
			(BuildingType, 					DomainType, 	Experience)
VALUES		('BUILDING_POLAND_BARBICAN',	'DOMAIN_LAND',	25),
			('BUILDING_POLAND_BARBICAN',	'DOMAIN_SEA',	25),
			('BUILDING_POLAND_BARBICAN',	'DOMAIN_AIR',	25);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_POLAND_BARBICAN',	'YIELD_CULTURE',	2),
			('BUILDING_POLAND_BARBICAN',	'YIELD_FAITH',		2),
			('BUILDING_POLAND_BARBICAN',	'YIELD_SCIENCE',	2);
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 								Description, 								Help, 											Sound, 				RangedAttackModifier,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 		PediaEntry)
VALUES		('PROMOTION_UNIT_POLAND_BARBICAN',	'TXT_KEY_PROMOTION_UNIT_POLAND_BARBICAN',	'TXT_KEY_PROMOTION_UNIT_POLAND_BARBICAN_HELP',	'AS2D_IF_LEVELUP',	33,						0,				0,			0,			0,					0,			0,					1, 				55, 			'PROMOTION_ATLAS', 	'PEDIA_RANGED', 'TXT_KEY_PROMOTION_UNIT_POLAND_BARBICAN');
--==========================================================================================================================
--==========================================================================================================================

