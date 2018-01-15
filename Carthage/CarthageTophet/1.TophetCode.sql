--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_CARTHAGE', 	'BUILDINGCLASS_SHRINE', 	'BUILDING_TOPHET');
--==========================================================================================================================
--==========================================================================================================================

INSERT INTO Buildings 	
		(Type, 					BuildingClass, Cost, GoldMaintenance, PrereqTech,	 Water, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, Description, 					Civilopedia, 						Help, 									Strategy,									PlotBuyCostModifier, ArtDefineTag, 	ArtInfoEraVariation, FreeStartEra, DisplayPosition, AllowsWaterRoutes, MinAreaSize, ConquestProb, GreatPeopleRateModifier, FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_TOPHET',	BuildingClass, Cost, GoldMaintenance, 'TECH_AGRICULTURE', Water, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, 'TXT_KEY_BUILDING_TOPHET', 	'TXT_KEY_BUILDING_TOPHET_TEXT', 	'TXT_KEY_BUILDING_TOPHET_HELP', 	'TXT_KEY_BUILDING_TOPHET_STRATEGY',		PlotBuyCostModifier,				 'TEMPLE',	ArtInfoEraVariation, 'ERA_MEDIEVAL', DisplayPosition, AllowsWaterRoutes, -1, 66, GreatPeopleRateModifier, FreshWater, 15, 0, 	'BUILDING_TOPHET_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_SHRINE';	

------------------------------	
-- Building_Yields
------------------------------
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_TOPHET', 'YIELD_FAITH', 3),
	('BUILDING_TOPHET', 'YIELD_CULTURE', 1);


------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,				Flavor)
VALUES	('BUILDING_TOPHET',		'FLAVOR_RELIGION',		35),
('BUILDING_TOPHET',		'FLAVOR_CULTURE',		40),
('BUILDING_ORDER', 'FLAVOR_MILITARY_TRAINING', 60);
