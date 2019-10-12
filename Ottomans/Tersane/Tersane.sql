--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_OTTOMAN',	'BUILDINGCLASS_HARBOR',	'BUILDING_OTTOMANS_TERSANE');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_OTTOMANS_ATLAS', 			256, 		'TersanePicture_256.dds',			1, 				1),
			('BUILDING_OTTOMANS_ATLAS', 			128, 		'TersanePicture_128.dds',			1, 				1),
			('BUILDING_OTTOMANS_ATLAS', 			64, 		'TersanePicture_064.dds',			1, 				1),
			('BUILDING_OTTOMANS_ATLAS', 			45, 		'TersanePicture_045.dds',			1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,							BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints,	TrainedFreePromotion,		CitySupplyFlat,	CitySupplyModifier,	DefenseHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, Water, FreeStartEra, Happiness, NeverCapture,	PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	TradeRouteSeaDistanceModifier,	TradeRouteSeaGoldBonus,		FinishSeaTRTourism,	Help,										Description,						Civilopedia,								Strategy,										IconAtlas,					PortraitIndex)
SELECT		'BUILDING_OTTOMANS_TERSANE',	BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints,	'PROMOTION_PRIZE_SHIPS',	CitySupplyFlat,	CitySupplyModifier,	DefenseHappinessChange,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, Water, FreeStartEra, Happiness, 1,				PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	TradeRouteSeaDistanceModifier,	TradeRouteSeaGoldBonus,		FinishSeaTRTourism, 'TXT_KEY_BUILDING_OTTOMANS_TERSANE_HELP',	'TXT_KEY_BUILDING_OTTOMANS_TERSANE', 'TXT_KEY_BUILDING_OTTOMANS_TERSANE_TEXT',	'TXT_KEY_BUILDING_OTTOMANS_TERSANE_STRATEGY',	'BUILDING_OTTOMANS_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_HARBOR';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,							Flavor)
VALUES		('BUILDING_OTTOMANS_TERSANE',	'FLAVOR_CULTURE',					30),
			('BUILDING_OTTOMANS_TERSANE',	'FLAVOR_GOLD',						70),
			('BUILDING_OTTOMANS_TERSANE',	'FLAVOR_I_SEA_TRADE_ROUTE',			100),
			('BUILDING_OTTOMANS_TERSANE',	'FLAVOR_I_TRADE_ORIGIN',			30),
			('BUILDING_OTTOMANS_TERSANE',	'FLAVOR_WATER_CONNECTION',			60),
			('BUILDING_OTTOMANS_TERSANE',	'FLAVOR_NAVAL',						100),
			('BUILDING_OTTOMANS_TERSANE',	'FLAVOR_MILITARY_TRAINING',			40),
			('BUILDING_OTTOMANS_TERSANE',	'FLAVOR_CITY_DEFENSE',				40),
			('BUILDING_OTTOMANS_TERSANE',	'FLAVOR_PRODUCTION',				100),
			('BUILDING_OTTOMANS_TERSANE',	'FLAVOR_NAVAL_GROWTH',				30);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_OTTOMANS_TERSANE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_HARBOR';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_OTTOMANS_TERSANE',	'YIELD_PRODUCTION',	2),
			('BUILDING_OTTOMANS_TERSANE',	'YIELD_GOLD',		2);
------------------------------	
-- Building_ResourceYieldChanges 
------------------------------		
INSERT INTO Building_ResourceYieldChanges 	
			(BuildingType, 					ResourceType,		YieldType,		Yield)
VALUES		('BUILDING_OTTOMANS_TERSANE',	'RESOURCE_FISH',	'YIELD_GOLD',	1),
			('BUILDING_OTTOMANS_TERSANE',	'RESOURCE_PEARLS',	'YIELD_GOLD',	1),
			('BUILDING_OTTOMANS_TERSANE',	'RESOURCE_CRAB',	'YIELD_GOLD',	1),
			('BUILDING_OTTOMANS_TERSANE',	'RESOURCE_WHALE',	'YIELD_GOLD',	1),
			('BUILDING_OTTOMANS_TERSANE',	'RESOURCE_CORAL',	'YIELD_GOLD',	1);
------------------------------	
-- Building_TerrainYieldChanges 
------------------------------		
INSERT INTO Building_TerrainYieldChanges 	
			(BuildingType, 					TerrainType,		YieldType,			Yield)
VALUES		('BUILDING_OTTOMANS_TERSANE',	'TERRAIN_OCEAN',	'YIELD_PRODUCTION',	1),
			('BUILDING_OTTOMANS_TERSANE',	'TERRAIN_OCEAN',	'YIELD_FOOD',		1),
			('BUILDING_OTTOMANS_TERSANE',	'TERRAIN_COAST',	'YIELD_PRODUCTION',	1),
			('BUILDING_OTTOMANS_TERSANE',	'TERRAIN_COAST',	'YIELD_FOOD',		1);
------------------------------	
-- Building_UnitCombatProductionModifiers 
------------------------------		
INSERT INTO Building_UnitCombatProductionModifiers  	
			(BuildingType, 					UnitCombatType,				Modifier)
VALUES		('BUILDING_OTTOMANS_TERSANE',	'UNITCOMBAT_CARGO',			50),
			('BUILDING_OTTOMANS_TERSANE',	'UNITCOMBAT_NAVALMELEE',	30),
			('BUILDING_OTTOMANS_TERSANE',	'UNITCOMBAT_NAVALRANGED',	30);
------------------------------	
-- UnitPromotions_UnitCombats
------------------------------		
INSERT INTO UnitPromotions_UnitCombats  	
			(PromotionType, 			UnitCombatType)
VALUES		('PROMOTION_PRIZE_SHIPS',	'UNITCOMBAT_NAVALMELEE');
------------------------------	
-- UnitPromotions
------------------------------		
UPDATE UnitPromotions SET CannotBeChosen = '1' WHERE Type = 'PROMOTION_PRIZE_SHIPS';
--==========================================================================================================================
--==========================================================================================================================

