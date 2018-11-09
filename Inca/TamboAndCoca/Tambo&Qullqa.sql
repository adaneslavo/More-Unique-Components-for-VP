--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_INCA', 	'BUILDINGCLASS_CARAVANSARY', 	'BUILDING_INCA_TAMBO');

--==========================================================================================================================	
-- BUILDING CLASSES
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding)
VALUES		('BUILDINGCLASS_INCA_QULLQA',	'BUILDINGCLASS_INCA_QULLQA');

--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================

INSERT INTO Buildings 	
		(Type, 					BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteLandDistanceModifier, AlwaysHeal, 	Defense, 	TradeRouteLandGoldBonus, CityConnectionGoldModifier, 	FinishLandTRTourism, FreeBuildingThisCity, 			Description, 					Civilopedia, 							Help, 									Strategy,									PlotBuyCostModifier, ArtDefineTag, 	ArtInfoEraVariation, FreeStartEra, DisplayPosition, MinAreaSize, ConquestProb, 	GreatPeopleRateModifier, FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_INCA_TAMBO',	BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteLandDistanceModifier, 5,				500, 		TradeRouteLandGoldBonus, CityConnectionGoldModifier,	FinishLandTRTourism, 'BUILDINGCLASS_INCA_QULLQA', 	'TXT_KEY_BUILDING_INCA_TAMBO', 	'TXT_KEY_BUILDING_INCA_TAMBO_TEXT', 	'TXT_KEY_BUILDING_INCA_TAMBO_HELP', 	'TXT_KEY_BUILDING_INCA_TAMBO_STRATEGY',		PlotBuyCostModifier, ArtDefineTag,	ArtInfoEraVariation, FreeStartEra, DisplayPosition, MinAreaSize, ConquestProb, 	GreatPeopleRateModifier, FreshWater, HurryCostModifier, 0, 				'BUILDING_APIG4UC_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	

INSERT INTO Buildings 	
			(Type,						BuildingClass,					Description,					Civilopedia, 							Help, 									Strategy,									GoldMaintenance,	Cost,	FaithCost, 	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex)
VALUES		('BUILDING_INCA_QULLQA',	'BUILDINGCLASS_INCA_QULLQA',	'TXT_KEY_BUILDING_INCA_QULLQA',	'TXT_KEY_BUILDING_INCA_QULLQA_TEXT', 	'TXT_KEY_BUILDING_INCA_QULLQA_HELP', 	'TXT_KEY_BUILDING_INCA_QULLQA_STRATEGY',	0,					-1,		-1,			0,			100,			-1,					'4UC_QULLQA_ATLAS',	0);

--==========================================================================================================================
-- Resources
--==========================================================================================================================
--new Coca luxury

INSERT INTO Resources 
			(Type,				TechReveal,		TechCityTrade, 		Description,				Civilopedia, 					Help,	ResourceClassType, 		IsMonopoly, 	ArtDefineTag, 	CivilizationType,		OnlyMinorCivs,  Happiness,  IconString, 		PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_COCA',	null,			'TECH_CURRENCY',	'TXT_KEY_RESOURCE_COCA',	'TXT_KEY_RESOURCE_COCA_TEXT',	null,	'RESOURCECLASS_LUXURY',	1,				'ART_DEF_COCA',	'CIVILIZATION_INCA',	0,				4,			'[ICON_RES_COCA]',	1, 				'4UC_COCA_ATLAS');

--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
--promotions granted by Coca monopoly

INSERT INTO UnitPromotions 
		(Type, 				WorkRateMod,	CanCrossMountains, 	Description, 				Help, 							Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			LostWithUpgrade, 	PediaType,		PediaEntry)
VALUES	('PROMOTION_COCA',	15,				1,					'TXT_KEY_PROMOTION_COCA',	'TXT_KEY_PROMOTION_COCA_HELP', 'AS2D_IF_LEVELUP',	1, 				35, 			'PROMOTION_ATLAS', 	0, 					'PEDIA_SHARED',	'TXT_KEY_PROMOTION_COCA');

------------------------------	
-- Building_Yields
------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType, 			YieldType, 			Yield)
VALUES	('BUILDING_INCA_TAMBO', 'YIELD_PRODUCTION', 2),
		('BUILDING_INCA_TAMBO', 'YIELD_GOLD', 		2);
	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType,			Yield)
VALUES	('BUILDING_INCA_QULLQA',	'YIELD_FOOD',		2),
		('BUILDING_INCA_QULLQA',	'YIELD_PRODUCTION',	2);
------------------------------	
-- Building_ResourceQuantity
------------------------------
INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
VALUES
	('BUILDING_INCA_QULLQA', 'RESOURCE_COCA', 1);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges
	(BuildingType, 				ResourceType, YieldType, Yield)
SELECT 'BUILDING_INCA_TAMBO', 	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_CARAVANSARY';		

INSERT INTO Building_SpecialistYieldChangesLocal
		(BuildingType, 			SpecialistType, YieldType, Yield)
SELECT 	'BUILDING_INCA_TAMBO', 	SpecialistType, YieldType, Yield
FROM Building_SpecialistYieldChangesLocal WHERE BuildingType = 'BUILDING_CARAVANSARY';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors
		(BuildingType,			FlavorType,				Flavor)
VALUES	('BUILDING_INCA_TAMBO',		'FLAVOR_HAPPINESS',		40),
		('BUILDING_INCA_TAMBO',		'FLAVOR_PRODUCTION',	20),
		('BUILDING_INCA_TAMBO',		'FLAVOR_CULTURE',		20),
		('BUILDING_INCA_TAMBO',		'FLAVOR_GOLD',			40);
		
------------------------------	
-- IconTextureAtlases
------------------------------		
INSERT INTO IconTextureAtlases 
		(Atlas, 				IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES	('4UC_COCA_ATLAS', 		256, 		'NewAymaraIcons256.dds',	2, 				1),
		('4UC_COCA_ATLAS', 		128, 		'NewAymaraIcons128.dds',	2, 				1),
		('4UC_COCA_ATLAS', 		80, 		'NewAymaraIcons80.dds',		2, 				1),
		('4UC_COCA_ATLAS', 		64, 		'NewAymaraIcons64.dds',		2, 				1),
		('4UC_COCA_ATLAS', 		45, 		'NewAymaraIcons45.dds',		2, 				1),
		('4UC_COCA_ATLAS', 		32, 		'NewAymaraIcons32.dds',		2,				1),
		('4UC_QULLQA_ATLAS', 	256, 		'Qullqa.256.dds',			1, 				1),
		('4UC_QULLQA_ATLAS', 	128, 		'Qullqa.128.dds',			1, 				1),
		('4UC_QULLQA_ATLAS', 	80, 		'Qullqa.80.dds',			1, 				1),
		('4UC_QULLQA_ATLAS', 	64, 		'Qullqa.64.dds',			1, 				1),
		('4UC_QULLQA_ATLAS', 	45, 		'Qullqa.45.dds',			1, 				1),
		('4UC_QULLQA_ATLAS', 	32, 		'Qullqa.32.dds',			1,				1);	
------------------------------	
-- ArtDefine_StrategicView
------------------------------		
INSERT INTO ArtDefine_StrategicView
		(StrategicViewType, TileType, 		Asset)
VALUES 		('ART_DEF_COCA', 	'Resource', 	'sv_coca.dds');
------------------------------	
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
		(Type, 			LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_COCA', 	'Resource', 	'RES_COCA');
------------------------------	
-- IconFontTextures
------------------------------
INSERT INTO IconFontTextures 
			(IconFontTexture, 						IconFontTextureFile)
VALUES		('RESOURCE_COCA_TEXTURE_ATLAS', 		'Coca_fonticon');
------------------------------	
-- IconFontMapping
------------------------------
INSERT INTO IconFontMapping 
		(IconName, 				IconFontTexture,				IconMapping)
VALUES		('ICON_RES_COCA', 		'RESOURCE_COCA_TEXTURE_ATLAS',				1);
