--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_MONGOL',	'BUILDINGCLASS_COURTHOUSE',	'BUILDING_MONGOLIA_YASSA_COURT');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_MONGOLIA_ATLAS', 			256, 		'YassaCourtPicture_256.dds',			1, 				1),
			('BUILDING_MONGOLIA_ATLAS', 			128, 		'YassaCourtPicture_128.dds',			1, 				1),
			('BUILDING_MONGOLIA_ATLAS', 			64, 		'YassaCourtPicture_064.dds',			1, 				1),
			('BUILDING_MONGOLIA_ATLAS', 			45, 		'YassaCourtPicture_045.dds',			1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,								BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	BuildAnywhere,	NumCityCostMod,		NoOccupiedUnhappiness,	IlliteracyHappinessChangeGlobal,		UnculturedHappinessChangeGlobal, EmpireNeedsModifierGlobal, DefenseHappinessChangeGlobal, MinorityHappinessChangeGlobal, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	Help,											Description,							Civilopedia,									Strategy,											IconAtlas,					PortraitIndex)
SELECT		'BUILDING_MONGOLIA_YASSA_COURT',	BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	1,				NumCityCostMod-5,	1,						-1,										-1,								 -1, 						DefenseHappinessChangeGlobal, MinorityHappinessChangeGlobal, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_MONGOLIA_YASSA_COURT_HELP',	'TXT_KEY_BUILDING_MONGOLIA_YASSA_COURT', 'TXT_KEY_BUILDING_MONGOLIA_YASSA_COURT_TEXT',	'TXT_KEY_BUILDING_MONGOLIA_YASSA_COURT_STRATEGY',	'BUILDING_MONGOLIA_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_COURTHOUSE';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType,					Flavor)
VALUES		('BUILDING_MONGOLIA_YASSA_COURT',	'FLAVOR_HAPPINESS',			200),
			('BUILDING_MONGOLIA_YASSA_COURT',	'FLAVOR_MILITARY_TRAINING',	50);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_MONGOLIA_YASSA_COURT',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_COURTHOUSE';
------------------------------	
-- Building_UnitCombatProductionModifiers
------------------------------		
INSERT INTO Building_UnitCombatProductionModifiers 	
			(BuildingType, 						UnitCombatType,			Modifier)
VALUES		('BUILDING_MONGOLIA_YASSA_COURT',	'UNITCOMBAT_MOUNTED',	20),
			('BUILDING_MONGOLIA_YASSA_COURT',	'UNITCOMBAT_ARCHER',	20),
			('BUILDING_MONGOLIA_YASSA_COURT',	'UNITCOMBAT_SIEGE',		20),
			('BUILDING_MONGOLIA_YASSA_COURT',	'UNITCOMBAT_ARMOR',		20);
--==========================================================================================================================
--==========================================================================================================================

