--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType,			UnitClassType,			UnitType)
VALUES		('CIVILIZATION_GERMANY',	'UNITCLASS_WARRIOR',	'UNIT_GERMANY_SLAGANZ');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--------------------------------
-- Units
--------------------------------	
INSERT INTO Units
			(Type,					Description,					Civilopedia,							Strategy,									Help,									Combat,		RangedCombat, Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,	DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagIconOffset, PortraitIndex,	IconAtlas,				UnitFlagAtlas,				MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT		'UNIT_GERMANY_SLAGANZ',	'TXT_KEY_UNIT_GERMANY_SLAGANZ',	'TXT_KEY_UNIT_GERMANY_SLAGANZ_TEXT',	'TXT_KEY_UNIT_GERMANY_SLAGANZ_STRATEGY',	'TXT_KEY_UNIT_GERMANY_SLAGANZ_HELP',	Combat+1,	RangedCombat, Cost-8,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,	DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, PrereqTech, 'TECH_STEEL', GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_JFD_SLAGANZ', 	0,					0,				'UNIT_GERMANY_ATLAS',	'UNIT_GERMANY_FLAG_ATLAS',	MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM Units WHERE Type = 'UNIT_WARRIOR';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		'UNIT_GERMANY_SLAGANZ', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WARRIOR';
--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, 					BuildingClassType)
SELECT		'UNIT_GERMANY_SLAGANZ', 	BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_WARRIOR';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		'UNIT_GERMANY_SLAGANZ', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_WARRIOR';
--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO	Unit_Flavors
			(UnitType, 					FlavorType,			Flavor)
VALUES		('UNIT_GERMANY_SLAGANZ',	'FLAVOR_OFFENSE',	4),
			('UNIT_GERMANY_SLAGANZ',	'FLAVOR_DEFENSE',	4),
			('UNIT_GERMANY_SLAGANZ',	'FLAVOR_RECON',	2);
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO	Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_GERMANY_SLAGANZ',	'PROMOTION_UNIT_GERMANY_FUROR_TEUTONICUS'),
			('UNIT_GERMANY_SLAGANZ',	'PROMOTION_UNIT_GERMANY_BARBARIAN_ALLIANCE');
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
		(Type,											Description,											Help,														CannotBeChosen,	Sound,				PortraitIndex,		IconAtlas,				PediaType,		PediaEntry,												LostWithUpgrade, 	BarbarianCombatBonus)
VALUES	('PROMOTION_UNIT_GERMANY_BARBARIAN_ALLIANCE',	'TXT_KEY_PROMOTION_UNIT_GERMANY_BARBARIAN_ALLIANCE',	'TXT_KEY_PROMOTION_UNIT_GERMANY_BARBARIAN_ALLIANCE_HELP',	1,				'AS2D_IF_LEVELUP',	43,					'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_GERMANY_BARBARIAN_ALLIANCE',	0, 					0),
		('PROMOTION_UNIT_GERMANY_FUROR_TEUTONICUS',		'TXT_KEY_PROMOTION_UNIT_GERMANY_FUROR_TEUTONICUS',		'TXT_KEY_PROMOTION_UNIT_GERMANY_FUROR_TEUTONICUS_HELP',		1,				'AS2D_IF_LEVELUP',	44,					'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_GERMANY_FUROR_TEUTONICUS',		0, 					50);
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type,						DamageStates, Formation)
SELECT		'ART_DEF_UNIT_JFD_SLAGANZ', DamageStates, Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT__WARRIOR';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 
			(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT		'ART_DEF_UNIT_JFD_SLAGANZ',	'ART_DEF_UNIT_MEMBER_JFD_SLAGANZ',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__WARRIOR';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType, 					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_JFD_SLAGANZ',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_JFD_SLAGANZ',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 							Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SLAGANZ',	Scale, ZOffset, Domain, 'BearWarrior.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_WARRIOR';
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType,				TileType,	Asset )
VALUES		('ART_DEF_UNIT_JFD_SLAGANZ', 	'Unit',		'UlfhedinnFlag_128.dds');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 					IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES		('UNIT_GERMANY_ATLAS', 		256, 		'UlfhedinnPicture_256.dds',	1, 				1),
			('UNIT_GERMANY_ATLAS', 		128, 		'UlfhedinnPicture_128.dds',	1, 				1),
			('UNIT_GERMANY_ATLAS', 		80, 		'UlfhedinnPicture_080.dds',	1, 				1),
			('UNIT_GERMANY_ATLAS', 		45, 		'UlfhedinnPicture_045.dds',	1, 				1),
			('UNIT_GERMANY_ATLAS', 		64, 		'UlfhedinnPicture_064.dds',	1, 				1),
			('UNIT_GERMANY_FLAG_ATLAS', 32, 		'UlfhedinnFlag_032.dds',	1, 				1);
--==========================================================================================================================
--==========================================================================================================================
