--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_BYZANTIUM',	'BUILDINGCLASS_CIRCUS_MAXIMUS',	'BUILDING_BYZANTIUM_HIPPODROME');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('BUILDING_BYZANTIUM_ATLAS', 			256, 		'HippodromePicture_256.dds',			1, 				1),
		('BUILDING_BYZANTIUM_ATLAS', 			128, 		'HippodromePicture_128.dds',			1, 				1),
		('BUILDING_BYZANTIUM_ATLAS', 			64, 		'HippodromePicture_064.dds',			1, 				1),
		('BUILDING_BYZANTIUM_ATLAS', 			45, 		'HippodromePicture_045.dds',			1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,								FreeBuilding, 						FreeBuildingThisCity, 		BuildingClass, NukeImmune,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion, CitySupplyFlat, DefenseHappinessChange, NumCityCostMod, UnmoddedHappiness,	UnculturedHappinessChange,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, GreatPeopleRateChange,	SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	NationalPopRequired,	Help,											Description,								Civilopedia,									Strategy,											IconAtlas,					PortraitIndex)
SELECT		'BUILDING_BYZANTIUM_HIPPODROME',	'BUILDINGCLASS_D_FOR_HIPPODROME', 	'BUILDINGCLASS_COLOSSEUM', 	BuildingClass, NukeImmune,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, TrainedFreePromotion, CitySupplyFlat, DefenseHappinessChange, NumCityCostMod, UnmoddedHappiness+1,	UnculturedHappinessChange,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, GreatPeopleRateChange,	SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	NationalPopRequired,	'TXT_KEY_BUILDING_BYZANTIUM_HIPPODROME_HELP',	'TXT_KEY_BUILDING_BYZANTIUM_HIPPODROME',	'TXT_KEY_BUILDING_BYZANTIUM_HIPPODROME_TEXT',	'TXT_KEY_BUILDING_BYZANTIUM_HIPPODROME_STRATEGY',	'BUILDING_BYZANTIUM_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_CIRCUS_MAXIMUS';	
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						YieldType,			Yield)
VALUES		('BUILDING_BYZANTIUM_HIPPODROME',	'YIELD_CULTURE',	4),
			('BUILDING_BYZANTIUM_HIPPODROME',	'YIELD_GOLD',		3);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 					BuildingClassType)
VALUES		('BUILDING_BYZANTIUM_HIPPODROME',	'BUILDINGCLASS_PALACE');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,			Flavor)
VALUES		('BUILDING_BYZANTIUM_HIPPODROME',	'FLAVOR_CULTURE',	150),
			('BUILDING_BYZANTIUM_HIPPODROME',	'FLAVOR_GOLD',		150);
------------------------------	
-- Building_ResourceYieldChangesGlobal
------------------------------	
INSERT INTO Building_ResourceYieldChangesGlobal
			(BuildingType,						ResourceType,     YieldType,			Yield)
VALUES		('BUILDING_BYZANTIUM_HIPPODROME',	'RESOURCE_HORSE', 'YIELD_CULTURE',		1),
			('BUILDING_BYZANTIUM_HIPPODROME',	'RESOURCE_HORSE', 'YIELD_GOLD',			1);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges 	
			(BuildingType,						BuildingClassType,			YieldType,			YieldChange)
VALUES		('BUILDING_BYZANTIUM_HIPPODROME',	'BUILDINGCLASS_CIRCUS',		'YIELD_CULTURE',	3),
			('BUILDING_BYZANTIUM_HIPPODROME',	'BUILDINGCLASS_COLOSSEUM',	'YIELD_GOLD',		3);
------------------------------	
-- Building_UnhappinessNeedsFlatReduction
------------------------------
INSERT INTO Building_UnhappinessNeedsFlatReduction 	
			(BuildingType,						YieldType, Yield)
SELECT		'BUILDING_BYZANTIUM_HIPPODROME', 	YieldType, Yield
FROM Building_UnhappinessNeedsFlatReduction WHERE (BuildingType = 'BUILDING_CIRCUS_MAXIMUS');
--==========================================================================================================================
--==========================================================================================================================

