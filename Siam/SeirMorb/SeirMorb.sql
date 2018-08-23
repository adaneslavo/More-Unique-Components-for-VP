--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 		UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_SIAM',	'UNITCLASS_FIELD_GUN', 	'UNIT_SIAM_SEIR_MORB');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_SIAM_SEIR_MORB',	'Unit',		'SeirMorbFlag_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type,							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_SIAM_SEIR_MORB', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_FIELD_GUN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		'ART_DEF_UNIT_SIAM_SEIR_MORB', 	'ART_DEF_UNIT_MEMBER_SIAM_SEIR_MORB',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_FIELD_GUN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_SIAM_SEIR_MORB',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIELD_GUN';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_SIAM_SEIR_MORB',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIELD_GUN';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SIAM_SEIR_MORB',	Scale, ZOffset, Domain, '155mmDeBang.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_FIELD_GUN';
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES		('UNIT_SIAM_ATLAS', 			256, 		'SeirMorbPicture_256.dds',		1, 				1),
			('UNIT_SIAM_ATLAS', 			128, 		'SeirMorbPicture_128.dds',		1, 				1),
			('UNIT_SIAM_ATLAS', 			80, 		'SeirMorbPicture_080.dds',		1, 				1),
			('UNIT_SIAM_ATLAS', 			64, 		'SeirMorbPicture_064.dds',		1, 				1),
			('UNIT_SIAM_ATLAS', 			45, 		'SeirMorbPicture_045.dds',		1, 				1),
			('UNIT_SIAM_FLAG_ATLAS', 		32, 		'SeirMorbFlag_032.dds',			1, 				1),
			('UNIT_SIAM_PROMOTION_1_ATLAS',	16, 		'CroachingTiger1Icon_016.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_1_ATLAS',	32, 		'CroachingTiger1Icon_032.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_1_ATLAS',	45, 		'CroachingTiger1Icon_045.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_1_ATLAS',	64, 		'CroachingTiger1Icon_064.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_1_ATLAS',	256, 		'CroachingTiger1Icon_256.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_2_ATLAS',	16, 		'CroachingTiger2Icon_016.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_2_ATLAS',	32, 		'CroachingTiger2Icon_032.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_2_ATLAS',	45, 		'CroachingTiger2Icon_045.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_2_ATLAS',	64, 		'CroachingTiger2Icon_064.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_2_ATLAS',	256, 		'CroachingTiger2Icon_256.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_3_ATLAS',	16, 		'CroachingTiger3Icon_016.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_3_ATLAS',	32, 		'CroachingTiger3Icon_032.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_3_ATLAS',	45, 		'CroachingTiger3Icon_045.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_3_ATLAS',	64, 		'CroachingTiger3Icon_064.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_3_ATLAS',	256, 		'CroachingTiger3Icon_256.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_4_ATLAS',	16, 		'CoastalCannonIcon_016.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_4_ATLAS',	32, 		'CoastalCannonIcon_032.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_4_ATLAS',	45, 		'CoastalCannonIcon_045.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_4_ATLAS',	64, 		'CoastalCannonIcon_064.dds',	1, 				1),
			('UNIT_SIAM_PROMOTION_4_ATLAS',	256, 		'CoastalCannonIcon_256.dds',	1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 										Description, 										Help, 													Sound, 				RangeChange,	RangedAttackModifier,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 						PediaType, 		PediaEntry)
VALUES		('PROMOTION_UNIT_SIAM_COASTAL_CANNON', 		'TXT_KEY_PROMOTION_UNIT_SIAM_COASTAL_CANNON',		'TXT_KEY_PROMOTION_UNIT_SIAM_COASTAL_CANNON_HELP', 		'AS2D_IF_LEVELUP',	0,				0,						0,				0,			0,			0,					0,			0,					1, 				0, 				'UNIT_SIAM_PROMOTION_4_ATLAS', 	'PEDIA_RANGED', 'TXT_KEY_PROMOTION_UNIT_SIAM_COASTAL_CANNON'),
			('PROMOTION_UNIT_SIAM_CROACHING_TIGER', 	'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER',		'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_HELP',		'AS2D_IF_LEVELUP',	0,				0,						0,				0,			0,			0,					0,			1,					1, 				0, 				'UNIT_SIAM_PROMOTION_1_ATLAS', 	'PEDIA_RANGED', 'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER'),
			('PROMOTION_UNIT_SIAM_CROACHING_TIGER_1', 	'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_1',	'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_1_HELP',	'AS2D_IF_LEVELUP',	0,				15,						0,				0,			0,			0,					0,			1,					1, 				0, 				'UNIT_SIAM_PROMOTION_1_ATLAS', 	'PEDIA_RANGED', 'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_1'),
			('PROMOTION_UNIT_SIAM_CROACHING_TIGER_2', 	'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_2',	'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_2_HELP',	'AS2D_IF_LEVELUP',	0,				30,						0,				0,			0,			0,					0,			1,					1, 				0, 				'UNIT_SIAM_PROMOTION_2_ATLAS', 	'PEDIA_RANGED', 'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_2'),
			('PROMOTION_UNIT_SIAM_CROACHING_TIGER_3', 	'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_3',	'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_3_HELP',	'AS2D_IF_LEVELUP',	0,				45,						0,				0,			0,			0,					0,			1,					1, 				0, 				'UNIT_SIAM_PROMOTION_3_ATLAS', 	'PEDIA_RANGED', 'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_3'),
			('PROMOTION_UNIT_SIAM_CROACHING_TIGER_4', 	'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_4',	'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_4_HELP',	'AS2D_IF_LEVELUP',	0,				60,						0,				0,			0,			0,					0,			1,					1, 				0, 				'UNIT_SIAM_PROMOTION_3_ATLAS', 	'PEDIA_RANGED', 'TXT_KEY_PROMOTION_UNIT_SIAM_CROACHING_TIGER_4');
------------------------------
-- UnitPromotions_UnitCombatMods
------------------------------
INSERT INTO UnitPromotions_UnitCombatMods
			(PromotionType, 						UnitCombatType,				Modifier)
VALUES		('PROMOTION_UNIT_SIAM_COASTAL_CANNON',	'UNITCOMBAT_NAVALMELEE',	25),
			('PROMOTION_UNIT_SIAM_COASTAL_CANNON',	'UNITCOMBAT_NAVALRANGED',	25);
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Type,					Class,	PrereqTech,	Range,	BaseSightRange, Combat,		RangedCombat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, Immobile, CombatClass, Domain, DefaultUnitAI,	ObsoleteTech,				GoodyHutUpgradeUnitClass,	XPValueAttack,	Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas,			MoveRate,	PurchaseCooldown)
SELECT		'UNIT_SIAM_SEIR_MORB',	Class,	PrereqTech,	Range,	BaseSightRange, Combat+2,	RangedCombat+5,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, Immobile, CombatClass, Domain, DefaultUnitAI,	'TECH_ADVANCED_BALLISTICS',	GoodyHutUpgradeUnitClass,	XPValueAttack,	'TXT_KEY_UNIT_SIAM_SEIR_MORB',	'TXT_KEY_UNIT_SIAM_SEIR_MORB_TEXT',	'TXT_KEY_UNIT_SIAM_SEIR_MORB_STRATEGY',	'TXT_KEY_UNIT_SIAM_SEIR_MORB_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_SIAM_SEIR_MORB', 	0,					'UNIT_SIAM_FLAG_ATLAS',	0, 				'UNIT_SIAM_ATLAS',	MoveRate,	PurchaseCooldown
FROM Units WHERE Type = 'UNIT_FIELD_GUN';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_SIAM_SEIR_MORB', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_FIELD_GUN';	
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_SIAM_SEIR_MORB', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_FIELD_GUN';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 				ResourceType)
SELECT		'UNIT_SIAM_SEIR_MORB', 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_FIELD_GUN';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		'UNIT_SIAM_SEIR_MORB', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_FIELD_GUN';
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,			Flavor)
VALUES		('UNIT_SIAM_SEIR_MORB',	'FLAVOR_OFFENSE',	5),
			('UNIT_SIAM_SEIR_MORB',	'FLAVOR_DEFENSE',	4),
			('UNIT_SIAM_SEIR_MORB',	'FLAVOR_RANGED',	15);
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_SIAM_SEIR_MORB', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FIELD_GUN';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
VALUES		('UNIT_SIAM_SEIR_MORB', 'PROMOTION_UNIT_SIAM_COASTAL_CANNON'),
			('UNIT_SIAM_SEIR_MORB', 'PROMOTION_UNIT_SIAM_CROACHING_TIGER'),
			('UNIT_SIAM_SEIR_MORB', 'PROMOTION_COVER_2');
--------------------------------
-- Unit_FreePromotions Deletion
--------------------------------
DELETE FROM Unit_FreePromotions	WHERE UnitType = 'UNIT_SIAM_SEIR_MORB' AND PromotionType = 'PROMOTION_CITY_SIEGE';
DELETE FROM Unit_FreePromotions	WHERE UnitType = 'UNIT_SIAM_SEIR_MORB' AND PromotionType = 'PROMOTION_NAVAL_MISFIRE';
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================	
--Siamese Naresuan's Elephant, give General Stacking bonus promotion.  Increase Cost by 10%
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_SIAMESE_WARELEPHANT',  'PROMOTION_GENERAL_STACKING');

UPDATE Units SET Cost = '220' WHERE Type = 'UNIT_SIAMESE_WARELEPHANT';
