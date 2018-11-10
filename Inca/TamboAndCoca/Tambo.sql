--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_INCA', 	'BUILDINGCLASS_CARAVANSARY', 	'BUILDING_INCA_TAMBO');
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================

INSERT INTO Buildings 	
		(Type, 					BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteLandDistanceModifier, AlwaysHeal, 	Defense, 	TradeRouteLandGoldBonus, CityConnectionGoldModifier, 	FinishLandTRTourism, Description, 					Civilopedia, 						Help, 								Strategy,								PlotBuyCostModifier, ArtDefineTag, 	ArtInfoEraVariation, FreeStartEra, DisplayPosition, MinAreaSize, ConquestProb, 	GreatPeopleRateModifier, FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_INCA_TAMBO',	BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteLandDistanceModifier, 5,				500, 		TradeRouteLandGoldBonus, CityConnectionGoldModifier,	FinishLandTRTourism, 'TXT_KEY_BUILDING_INCA_TAMBO', 'TXT_KEY_BUILDING_INCA_TAMBO_TEXT', 'TXT_KEY_BUILDING_INCA_TAMBO_HELP', 'TXT_KEY_BUILDING_INCA_TAMBO_STRATEGY',	PlotBuyCostModifier, ArtDefineTag,	ArtInfoEraVariation, FreeStartEra, DisplayPosition, MinAreaSize, ConquestProb, 	GreatPeopleRateModifier, FreshWater, HurryCostModifier, 0, 				'BUILDING_APIG4UC_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
INSERT INTO Resources 
			(Type,				TechReveal,		TechCityTrade, 		Description,				Civilopedia, 					Help,	ResourceClassType, 		IsMonopoly, 	ArtDefineTag, 				CivilizationType,		OnlyMinorCivs,  Happiness,  IconString, 		PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_COCA',	null,			null,				'TXT_KEY_RESOURCE_COCA',	'TXT_KEY_RESOURCE_COCA_TEXT',	null,	'RESOURCECLASS_LUXURY',	1,				'ART_DEF_RESOURCE_COCA',	'CIVILIZATION_INCA',	0,				4,			'[ICON_RES_COCA]',	1, 				'4UC_COCA_ATLAS');
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
VALUES	('BUILDING_INCA_TAMBO', 'YIELD_GOLD', 		1);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges
	(BuildingType, 				ResourceType, YieldType, Yield)
SELECT 'BUILDING_INCA_TAMBO', 	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_CARAVANSARY';		
------------------------------	
-- Building_SpecialistYieldChangesLocal
------------------------------
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
		('4UC_COCA_ATLAS', 		32, 		'NewAymaraIcons32.dds',		2,				1);	
------------------------------	
-- ArtDefine_StrategicView
------------------------------		
INSERT INTO ArtDefine_StrategicView
		(StrategicViewType, TileType, 		Asset)
VALUES 		('ART_DEF_RESOURCE_COCA', 	'Resource', 	'sv_coca.dds');
------------------------------	
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
		(Type, 			LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_RESOURCE_COCA', 	'Resource', 	'RES_COCA');
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

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks
			(Era, 			State, 					Scale, 	ImprovementType, 					LayoutHandler, 	ResourceType, 						Model, 										TerrainContour,	Tech)
VALUES 		('Any', 		'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',			'SNAPSHOT',		'ART_DEF_RESOURCE_COCA',		'resource_flax.fxsxml',						1,				null),
			('Ancient', 	'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_COCA',		'hb_plantation_mid_flax.fxsxml',			1,				null),
			('Ancient', 	'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_COCA',		'plantation_mid_flax.fxsxml',				1,				null),
			('Ancient', 	'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_COCA',		'pl_plantation_mid_flax.fxsxml',			1,				null),
			('Industrial', 	'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_COCA',		'hb_plantation_ind_flax.fxsxml',			1,				null),
			('Industrial', 	'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_COCA',		'plantation_ind_flax.fxsxml',				1,				null),
			('Industrial', 	'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_COCA',		'pl_plantation_ind_flax.fxsxml',			1,				null);
--==========================================================================================================================

------------------------------
-- Resource_YieldChanges
------------------------------
INSERT INTO Resource_YieldChanges 	
			(ResourceType, 				YieldType, 			Yield)
VALUES			('RESOURCE_COCA',		'YIELD_PRODUCTION',	2),
				('RESOURCE_COCA',		'YIELD_FOOD',		2);
------------------------------
-- Resource_Flavors
------------------------------
INSERT INTO Resource_Flavors 	
			(ResourceType, 			FlavorType, 				Flavor)
VALUES		('RESOURCE_COCA',	'FLAVOR_PRODUCTION',			10);
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvement_ResourceTypes
			(ResourceType, 		ImprovementType)
VALUES		('RESOURCE_COCA',	'IMPROVEMENT_PLANTATION');
------------------------------
-- Improvement_ResourceType_Yields
------------------------------
INSERT INTO Improvement_ResourceType_Yields
			(ResourceType, 			ImprovementType,			YieldType,			Yield)
VALUES		('RESOURCE_COCA',	'IMPROVEMENT_PLANTATION',	'YIELD_FOOD',		2);
