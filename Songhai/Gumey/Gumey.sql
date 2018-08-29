--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_SONGHAI',	'BUILDINGCLASS_CARAVANSARY',	'BUILDING_SONGHAI_GUMEY');
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
			(Type,						BuildingClass, FinishLandTRTourism, GoldMaintenance, Cost, FaithCost, TradeRouteLandGoldBonus, TradeRouteLandDistanceModifier, 		EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, ExtraCityHitPoints, TrainedFreePromotion, CitySupplyFlat,	NumCityCostMod,	DefenseHappinessChange,	IlliteracyHappinessChange,	UnculturedHappinessChange,	MinorityHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	Help,									Description,						Civilopedia,							Strategy,									IconAtlas,				PortraitIndex)
SELECT		'BUILDING_SONGHAI_GUMEY',	BuildingClass, FinishLandTRTourism, GoldMaintenance, Cost, FaithCost, TradeRouteLandGoldBonus, TradeRouteLandDistanceModifier+25, 	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, ExtraCityHitPoints, TrainedFreePromotion, CitySupplyFlat,	NumCityCostMod,	DefenseHappinessChange,	IlliteracyHappinessChange,	UnculturedHappinessChange,	MinorityHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_SONGHAI_GUMEY_HELP',	'TXT_KEY_BUILDING_SONGHAI_GUMEY', 	'TXT_KEY_BUILDING_SONGHAI_GUMEY_TEXT',	'TXT_KEY_BUILDING_SONGHAI_GUMEY_STRATEGY',	'BUILDING_QADI_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 				FlavorType,					Flavor)
VALUES		('BUILDING_SONGHAI_GUMEY',	'FLAVOR_GOLD',				50),
			('BUILDING_SONGHAI_GUMEY',	'FLAVOR_PRODUCTION',		20),
			('BUILDING_SONGHAI_GUMEY',	'FLAVOR_CULTURE',			30),
			('BUILDING_SONGHAI_GUMEY',	'FLAVOR_I_TRADE_ORIGIN',	20);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
SELECT		'BUILDING_SONGHAI_GUMEY',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CARAVANSARY';
--------------------------------	
-- Building_ResourceYieldChanges
--------------------------------	
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				ResourceType, 			YieldType, 			Yield)
SELECT		('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_TRUFFLES',	'YIELD_GOLD', 		3),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_COTTON',		'YIELD_GOLD', 		1),	
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_COTTON',		'YIELD_PRODUCTION', 1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_COTTON',		'YIELD_CULTURE', 	1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_FUR',			'YIELD_GOLD', 		2),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_FUR',			'YIELD_PRODUCTION', 1),	
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_AMBER',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_CITRUS',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_CLOVES',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_COFFEE',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_COPPER',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_CORAL',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_CRAB',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_DYE',			'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_GEMS',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_GLASS',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_GOLD',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_INCENSE',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_IVORY',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_JADE',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_JEWELRY',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_LAPIS',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_MARBLE',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_NUTMEG',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_OLIVE',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_PEARLS',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_PEPPER',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_PERFUME',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_PORCELAIN',	'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_SALT',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_SILK',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_SILVER',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_SPICES',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_SUGAR',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_TEA',			'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_TOBACCO',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_WHALE',		'YIELD_GOLD', 		1),
			('BUILDING_SONGHAI_GUMEY', 	'RESOURCE_WINE',		'YIELD_GOLD', 		1);
--------------------------------	
-- Building_SpecialistYieldChangesLocal
--------------------------------	
INSERT INTO Building_SpecialistYieldChangesLocal
			(BuildingType, 				SpecialistType, YieldType, Yield)
SELECT		'BUILDING_SONGHAI_GUMEY',	SpecialistType, YieldType, Yield
FROM Building_SpecialistYieldChangesLocal WHERE BuildingType = 'BUILDING_CARAVANSARY';
--------------------------------	
-- Building_YieldPerXTerrainTimes100
--------------------------------	
INSERT INTO Building_YieldPerXTerrainTimes100
			(BuildingType, 				TerrainType, YieldType, Yield)
SELECT		'BUILDING_SONGHAI_GUMEY',	TerrainType, YieldType, Yield
FROM Building_YieldPerXTerrainTimes100 WHERE BuildingType = 'BUILDING_CARAVANSARY';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 				YieldType,			Yield)
VALUES		('BUILDING_SONGHAI_GUMEY',	'YIELD_CULTURE',		1),
			('BUILDING_SONGHAI_GUMEY',	'YIELD_GOLD',			2),
			('BUILDING_SONGHAI_GUMEY',	'YIELD_PRODUCTION',		1);
--==========================================================================================================================
--==========================================================================================================================
