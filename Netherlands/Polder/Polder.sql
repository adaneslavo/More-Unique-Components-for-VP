--==========================================================================================================================
-- BUILDS
--==========================================================================================================================	
--------------------------
-- Builds
--------------------------
INSERT INTO Builds 
			(Type,				PrereqTech, Time, ImprovementType,			Description, Recommendation, Help,							HotKey, EntityEvent, OrderPriority, IconIndex, IconAtlas)
SELECT		('BUILD_POLDER_2'), PrereqTech, Time, ('IMPROVEMENT_POLDER_2'), Description, Recommendation, 'TXT_KEY_BUILD_POLDER_HELP',	HotKey, EntityEvent, OrderPriority, IconIndex, IconAtlas 
FROM Builds WHERE (Type = 'BUILD_POLDER');

UPDATE Builds SET Help = 'TXT_KEY_BUILD_POLDER_HELP' WHERE Type = 'BUILD_POLDER';
--------------------------
-- Unit_Builds
--------------------------
INSERT INTO Unit_Builds 
			(UnitType,		BuildType)
VALUES		('UNIT_WORKER',	'BUILD_POLDER_2');
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================	
--------------------------
-- Improvements
--------------------------
INSERT INTO Improvements 
			(Type,						Description, Civilopedia, Help, ArtDefineTag, RequiresFeature,	PillageGold, PortraitIndex, IconAtlas)
SELECT		('IMPROVEMENT_POLDER_2'),	Description, Civilopedia, Help, ArtDefineTag, (1),				PillageGold, PortraitIndex, IconAtlas 
FROM Improvements WHERE (Type = 'IMPROVEMENT_POLDER');
--------------------------
-- Improvement_ValidFeatures
--------------------------
INSERT INTO Improvement_ValidFeatures 
			(ImprovementType,		FeatureType)
SELECT		'IMPROVEMENT_POLDER_2', 'FEATURE_MARSH';
--------------------------
-- Improvement_TechYieldChanges
--------------------------
INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,			TechType,			YieldType,			Yield)
VALUES		('IMPROVEMENT_POLDER_2',	'TECH_CHEMISTRY',	'YIELD_CULTURE',	1),
			('IMPROVEMENT_POLDER_2',	'TECH_ECONOMICS',	'YIELD_PRODUCTION', 1),
			('IMPROVEMENT_POLDER_2',	'TECH_ECONOMICS',	'YIELD_GOLD',		2);
--------------------------
-- Improvement_Yields
--------------------------	
INSERT INTO Improvement_Yields
			(ImprovementType,			YieldType,			Yield)
VALUES		('IMPROVEMENT_POLDER_2',	'YIELD_FOOD',		3),
			('IMPROVEMENT_POLDER_2',	'YIELD_GOLD',		2),
			('IMPROVEMENT_POLDER_2',	'YIELD_PRODUCTION', 1);
--------------------------
-- Improvement_AdjacentImprovementYieldChanges Deletion
--------------------------
--DELETE FROM Improvement_AdjacentImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_POLDER';
--==========================================================================================================================

--==========================================================================================================================
-- POLICIES
--==========================================================================================================================	
--------------------------
-- Policy_ImprovementYieldChanges
--------------------------
INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType,				ImprovementType,		YieldType,				Yield)
VALUES		('POLICY_URBANIZATION',		'IMPROVEMENT_POLDER_2', 'YIELD_FOOD',			2),
			('POLICY_FIVE_YEAR_PLAN',	'IMPROVEMENT_POLDER_2', 'YIELD_PRODUCTION',		1),
			('POLICY_MOBILIZATION',		'IMPROVEMENT_POLDER_2', 'YIELD_SCIENCE',		3);
--==========================================================================================================================
--==========================================================================================================================
