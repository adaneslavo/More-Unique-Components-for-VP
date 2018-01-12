--==========================================================================================================================
-- LANGUAGE_EN_US
--==========================================================================================================================	
UPDATE Language_en_US SET Text = 'A Polder can be built on tiles with access to fresh water or on marshes. It generates [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_PRODUCTION] Production. Provides additional yields once later techs are researched.' WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_POLDER_HELP';
UPDATE Language_en_US SET Text = 'A polder is a low-lying tract enclosed by dikes with the water drained. In general, polder is land reclaimed from a lake or seabed, from flood plains, or from marshes. In time, the drained land subsides so that all polder is eventually below the surrounding water level. Because of this, water seeps into the drained area and must be pumped out or otherwise drained. The dikes are usually made of readily available materials, earth or sand; in modern times these barriers might be covered or completely composed of concrete. The drained land is extremely fertile and makes excellent pasturage or cropland.[NEWLINE][NEWLINE]The first polders of reclaimed land were constructed in the 11th Century AD, although building embankments as barriers to water date back to the Romans. The Dutch have a long history of reclaiming marshes and fenland, and even the seabed, and possess half of the polder acreage in Europe. Although there are polders in other countries of Europe, and examples can be found in Asia and North America, Holland has some 3000 polders accounting for about 27 percent of the country''s land. Amsterdam itself is built largely upon polder. As the Dutch homily states, "God made the world, but the Dutch made Holland."' WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_POLDER_TEXT';

INSERT INTO Language_en_US
			(Tag,							Text)
VALUES		('TXT_KEY_BUILD_POLDER_HELP',	'TODO TODO TODO');
--==========================================================================================================================

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
