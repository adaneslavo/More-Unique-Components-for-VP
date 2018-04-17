--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_SONGHAI',	'BUILDINGCLASS_COURTHOUSE',	'BUILDING_QADI_COURT');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_QADI_ATLAS', 		256, 		'QadiPicture_256.dds',		1, 				1),
			('BUILDING_QADI_ATLAS', 		128, 		'QadiPicture_128.dds',		1, 				1),
			('BUILDING_QADI_ATLAS', 		64, 		'QadiPicture_064.dds',		1, 				1),
			('BUILDING_QADI_ATLAS', 		45, 		'QadiPicture_045.dds',		1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,					BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	BuildAnywhere,	NumCityCostMod,	NoOccupiedUnhappiness,	DefenseHappinessChange,	IlliteracyHappinessChange,	UnculturedHappinessChange,	MinorityHappinessChange,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	Help,											Description,							Civilopedia,									Strategy,											IconAtlas,					PortraitIndex)
SELECT		'BUILDING_QADI_COURT',	BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	1,				NumCityCostMod,	1,						DefenseHappinessChange,	IlliteracyHappinessChange,	UnculturedHappinessChange,	MinorityHappinessChange-25,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_QADI_COURT_HELP',	'TXT_KEY_BUILDING_QADI_COURT', 'TXT_KEY_BUILDING_QADI_COURT_TEXT',	'TXT_KEY_BUILDING_QADI_COURT_STRATEGY',	'BUILDING_QADI_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_COURTHOUSE';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType,				Flavor)
VALUES		('BUILDING_QADI_COURT',	'FLAVOR_GOLD',			10),
			('BUILDING_QADI_COURT',	'FLAVOR_HAPPINESS',		60),
			('BUILDING_QADI_COURT',	'FLAVOR_CULTURE',		30),
			('BUILDING_QADI_COURT',	'FLAVOR_RELIGION',		20);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 			BuildingClassType)
SELECT		'BUILDING_QADI_COURT',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_COURTHOUSE';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_QADI_COURT',	'YIELD_FAITH',		2);
--==========================================================================================================================
--==========================================================================================================================
