--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType, UnitClassType, UnitType)
VALUES		('CIVILIZATION_EGYPT', 'UNITCLASS_SPEARMAN', 'UNIT_EGYPTIAN_KHOPESH');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--------------------------------
-- Units
--------------------------------	
INSERT INTO Units
			(Type,						Description,						Civilopedia,							Strategy,									Help,									Combat,		RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,	DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, PrereqTech, ObsoleteTech,		GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo,						UnitFlagIconOffset, PortraitIndex,	IconAtlas,			UnitFlagAtlas,	MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT		'UNIT_EGYPTIAN_KHOPESH',	'TXT_KEY_UNIT_EGYPTIAN_KHOPESH',	'TXT_KEY_UNIT_EGYPTIAN_KHOPESH_TEXT',	'TXT_KEY_UNIT_EGYPTIAN_KHOPESH_STRATEGY',	'TXT_KEY_UNIT_EGYPTIAN_KHOPESH_HELP',	Combat+3,	RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,	DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, PrereqTech, 'TECH_GUNPOWDER', GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_KHOPESH_SWORDSMAN', 	0,					0,				'KHOPESH_ATLAS',	'KHOPESH_FLAG', MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM Units WHERE Type = 'UNIT_SPEARMAN';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		'UNIT_EGYPTIAN_KHOPESH', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, 					BuildingClassType)
SELECT		'UNIT_EGYPTIAN_KHOPESH', 	BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		'UNIT_EGYPTIAN_KHOPESH', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO	Unit_Flavors
			(UnitType, 					FlavorType,			Flavor)
VALUES		('UNIT_EGYPTIAN_KHOPESH',	'FLAVOR_OFFENSE',	6),
			('UNIT_EGYPTIAN_KHOPESH',	'FLAVOR_DEFENSE',	6);
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
				(UnitType,					PromotionType)
VALUES			('UNIT_EGYPTIAN_KHOPESH',	'PROMOTION_UNIT_EGYPT_FATIGUE'),
				('UNIT_EGYPTIAN_KHOPESH',	'PROMOTION_UNIT_EGYPT_MERCY');
--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,								Description,							Help,											CannotBeChosen,		Sound,				PortraitIndex,	IconAtlas,			PediaType,		PediaEntry)
VALUES		('PROMOTION_UNIT_EGYPT_FATIGUE',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE_HELP',	1,					'AS2D_IF_LEVELUP',	23,				'PROMOTION_ATLAS',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE');

INSERT INTO UnitPromotions
			(Type,								Description,								Help,											CannotBeChosen,		Sound,				PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,									CombatPercent)
VALUES		('PROMOTION_UNIT_EGYPT_FATIGUE_1',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE_1',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE_1_HELP',	1,					'AS2D_IF_LEVELUP',	57,				'PROMOTION_ATLAS',	'PEDIA_SHARED',	'TXT_KEY_PROMOTION_UNIT_EGYPT_FATIGUE_1',	-20);

INSERT INTO UnitPromotions
			(Type,							Description,							Help,										CannotBeChosen,		Sound,				PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,								AttackBelowEqual50HealthMod)
VALUES		('PROMOTION_UNIT_EGYPT_MERCY',	'TXT_KEY_PROMOTION_UNIT_EGYPT_MERCY',	'TXT_KEY_PROMOTION_UNIT_EGYPT_MERCY_HELP',	1,					'AS2D_IF_LEVELUP',	9,				'PROMOTION_ATLAS',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_EGYPT_MERCY',	30);
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
	VALUES	('ART_DEF_UNIT_KHOPESH_SWORDSMAN', 'Unit', 'Khopesh_SV.dds');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('KHOPESH_ATLAS', 						256, 		'3UC_khopesh256.dds',				1, 				1),
			('KHOPESH_ATLAS', 						128, 		'3UC_khopesh128.dds',				1, 				1),
			('KHOPESH_ATLAS', 						80, 		'3UC_khopesh80.dds',				1, 				1),
			('KHOPESH_ATLAS', 						45, 		'3UC_khopesh45.dds',				1, 				1),
			('KHOPESH_ATLAS', 						64, 		'3UC_khopesh64.dds',				1, 				1),
			('KHOPESH_ATLAS', 						32, 		'3UC_khopesh32.dds',				1, 				1),
			('KHOPESH_FLAG', 						32, 		'Khopesh_Flag.dds',					1, 				1);
--==========================================================================================================================
--==========================================================================================================================