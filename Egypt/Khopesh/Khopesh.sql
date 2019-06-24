--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType,		UnitClassType,			UnitType)
VALUES		('CIVILIZATION_EGYPT',	'UNITCLASS_SPEARMAN',	'UNIT_EGYPT_KHOPESH');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--------------------------------
-- Units
--------------------------------	
INSERT INTO Units
			(Type,					Description,					Civilopedia,						Strategy,								Help,								Combat,		RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,	DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, PrereqTech, ObsoleteTech,		GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo,						UnitFlagIconOffset, PortraitIndex,	IconAtlas,			UnitFlagAtlas,				MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT		'UNIT_EGYPT_KHOPESH',	'TXT_KEY_UNIT_EGYPT_KHOPESH',	'TXT_KEY_UNIT_EGYPT_KHOPESH_TEXT',	'TXT_KEY_UNIT_EGYPT_KHOPESH_STRATEGY',	'TXT_KEY_UNIT_EGYPT_KHOPESH_HELP',	Combat+3,	RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,	DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, PrereqTech, 'TECH_GUNPOWDER', GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_KHOPESH_SWORDSMAN', 	0,					0,				'UNIT_EGYPT_ATLAS',	'UNIT_EGYPT_FLAG_ATLAS',	MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM Units WHERE Type = 'UNIT_SPEARMAN';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_EGYPT_KHOPESH', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, 				BuildingClassType)
SELECT		'UNIT_EGYPT_KHOPESH', 	BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		'UNIT_EGYPT_KHOPESH', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO	Unit_Flavors
			(UnitType, 				FlavorType,			Flavor)
VALUES		('UNIT_EGYPT_KHOPESH',	'FLAVOR_OFFENSE',	6),
			('UNIT_EGYPT_KHOPESH',	'FLAVOR_DEFENSE',	6);
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
				(UnitType,				PromotionType)
VALUES			
--				('UNIT_EGYPT_KHOPESH',	'PROMOTION_UNIT_EGYPT_FATIGUE'),
				('UNIT_EGYPT_KHOPESH',	'PROMOTION_UNIT_EGYPT_MERCY');
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,								Description,								Help,											CannotBeChosen,		Sound,				PortraitIndex,	IconAtlas,				PediaType,		PediaEntry,									CombatPercent,	AttackBelowEqual50HealthMod)
VALUES		
--			('PROMOTION_UNIT_EGYPT_FATIGUE',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE',		'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE_HELP',	1,					'AS2D_IF_LEVELUP',	23,				'PROMOTION_ATLAS',		'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE',		0,				0),
--			('PROMOTION_UNIT_EGYPT_FATIGUE_1',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE_1',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE_1_HELP',	1,					'AS2D_IF_LEVELUP',	57,				'PROMOTION_ATLAS',		'PEDIA_SHARED',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE_1',	-30,			0),
			('PROMOTION_UNIT_EGYPT_MERCY',		'TXT_KEY_PROMOTION_UNIT_EGYPT_MERCY',		'TXT_KEY_PROMOTION_UNIT_EGYPT_MERCY_HELP',		1,					'AS2D_IF_LEVELUP',	39,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_EGYPT_MERCY',		0,				30);
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_KHOPESH_SWORDSMAN'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SWORDSMAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_KHOPESH_SWORDSMAN'), ('ART_DEF_UNIT_MEMBER_KHOPESH_SWORDSMAN'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_KHOPESH_SWORDSMAN'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_KHOPESH_SWORDSMAN'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_KHOPESH_SWORDSMAN'), Scale, ZOffset, Domain, ('EgyptSwordsman.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
	VALUES	('ART_DEF_UNIT_KHOPESH_SWORDSMAN', 'Unit', 'KhopeshFlag_128.dds');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('UNIT_EGYPT_ATLAS', 						256, 		'KhopeshPicture_256.dds',				1, 				1),
			('UNIT_EGYPT_ATLAS', 						128, 		'KhopeshPicture_128.dds',				1, 				1),
			('UNIT_EGYPT_ATLAS', 						80, 		'KhopeshPicture_080.dds',				1, 				1),
			('UNIT_EGYPT_ATLAS', 						45, 		'KhopeshPicture_045.dds',				1, 				1),
			('UNIT_EGYPT_ATLAS', 						64, 		'KhopeshPicture_064.dds',				1, 				1),
			('UNIT_EGYPT_FLAG_ATLAS', 					32, 		'KhopeshFlag_032.dds',					1, 				1);
--==========================================================================================================================
--==========================================================================================================================
