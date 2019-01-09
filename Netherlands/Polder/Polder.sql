--==========================================================================================================================
-- BUILDS
--==========================================================================================================================	
--------------------------
-- Builds
--------------------------
INSERT INTO Builds 
			(Type,				PrereqTech, Time, ImprovementType, Description, Recommendation, Help, HotKey, EntityEvent, OrderPriority, AltDown, IconIndex, IconAtlas, ShowInPedia, ShowInTechTree)
SELECT		('BUILD_REMOVE_FEATURE_D_FOR_POLDER'), PrereqTech, Time, ImprovementType, Description, Recommendation, Help, HotKey, EntityEvent, 0, 		AltDown, IconIndex, IconAtlas, 0, 0,  
FROM Builds WHERE (Type = 'BUILD_REMOVE_MARSH');

INSERT INTO Builds 
			(Type,				PrereqTech, Time, ImprovementType,			Description, Recommendation, Help,							HotKey, EntityEvent, OrderPriority, IconIndex, IconAtlas)
SELECT		('BUILD_POLDER_2'), PrereqTech, Time, ('IMPROVEMENT_POLDER_2'), Description, Recommendation, 'TXT_KEY_BUILD_POLDER_HELP',	HotKey, EntityEvent, OrderPriority, IconIndex, IconAtlas 
FROM Builds WHERE (Type = 'BUILD_POLDER');

UPDATE Builds SET Help = 'TXT_KEY_BUILD_POLDER_HELP' WHERE Type = 'BUILD_POLDER';
--------------------------
-- BuildFeatures
--------------------------
INSERT INTO BuildFeatures 
			(BuildType,		FeatureType, PrereqTech, Time, Production, Cost, Remove, RemoveOnly)
SELECT		('BUILD_REMOVE_FEATURE_D_FOR_POLDER'), FeatureType, PrereqTech, Time, Production, Cost, Remove, RemoveOnly
FROM BuildFeatures WHERE (BuildType = 'BUILD_REMOVE_MARSH');
--------------------------
-- Unit_Builds
--------------------------
INSERT INTO Unit_Builds 
			(UnitType,		BuildType)
VALUES		('UNIT_WORKER',	'BUILD_POLDER_2'),
		('UNIT_WORKER',	'BUILD_REMOVE_FEATURE_D_FOR_POLDER');
--------------------------
-- Build_TechTimeChanges
--------------------------
INSERT INTO Build_TechTimeChanges
	(BuildType, TechType, TimeChange)
VALUES
	('BUILD_REMOVE_FEATURE_D_FOR_POLDER', 'TECH_MACHINERY', -200),
	('BUILD_REMOVE_FEATURE_D_FOR_POLDER', 'TECH_BIOLOGY', -200);
--==========================================================================================================================
--==========================================================================================================================
-- FEATURES
--==========================================================================================================================	
--------------------------
-- Feature
--------------------------
INSERT INTO Features 
			(Type,						Description, Civilopedia, Help, ArtDefineTag, StartingLocationWeight,	SeeThrough, Defense, WorldSoundscapeAudioScript, EffectTypeTag, Movement, PortraitIndex, IconAtlas)
SELECT		('FEATURE_D_FOR_POLDER'),	'TXT_KEY_FEATURE_D_FOR_POLDER', Civilopedia, Help, ArtDefineTag, 0,				SeeThrough, Defense, WorldSoundscapeAudioScript, EffectTypeTag, Movement, PortraitIndex, IconAtlas
FROM Features WHERE (Type = 'FEATURE_MARSH');
--------------------------
-- Feature_YieldChanges
--------------------------
INSERT INTO Feature_YieldChanges 
		(FeatureType, 			YieldType, Yield)
SELECT		('FEATURE_D_FOR_POLDER'),	YieldType, Yield
FROM Feature_YieldChanges WHERE (Type = 'FEATURE_MARSH');
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
DELETE FROM Improvement_AdjacentImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_POLDER';
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
