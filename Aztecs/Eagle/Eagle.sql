--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType, UnitClassType, UnitType)
VALUES		('CIVILIZATION_AZTEC', 'UNITCLASS_SWORDSMAN', 'UNIT_AZTEC_EAGLE');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--------------------------------
-- Units
--------------------------------	
INSERT INTO Units
			(Type,				Description,				Civilopedia,						Strategy,								Help,								Combat,		RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,	DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, PrereqTech, ObsoleteTech,		GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 			UnitFlagIconOffset, PortraitIndex,	IconAtlas,			UnitFlagAtlas,				MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT		'UNIT_AZTEC_EAGLE', 'TXT_KEY_UNIT_AZTEC_EAGLE', 'TXT_KEY_UNIT_AZTEC_EAGLE_TEXT',	'TXT_KEY_UNIT_AZTEC_EAGLE_STRATEGY',	'TXT_KEY_UNIT_AZTEC_EAGLE_HELP',	Combat+1,	RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,	DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, PrereqTech, 'TECH_GUNPOWDER', GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_EAGLE', 	0,					0,				'UNIT_AZTEC_ATLAS', 'UNIT_AZTEC_FLAG_ATLAS',	MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM Units WHERE Type = 'UNIT_SWORDSMAN';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 			UnitAIType)
SELECT		'UNIT_AZTEC_EAGLE', UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, 			BuildingClassType)
SELECT		'UNIT_AZTEC_EAGLE', BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		'UNIT_AZTEC_EAGLE', UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO	Unit_Flavors
			(UnitType, 				FlavorType,			Flavor)
VALUES		('UNIT_AZTEC_EAGLE',	'FLAVOR_OFFENSE',	8),
			('UNIT_AZTEC_EAGLE',	'FLAVOR_DEFENSE',	8);
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
				(UnitType, 			PromotionType)
SELECT			'UNIT_AZTEC_EAGLE', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO	Unit_FreePromotions
			(UnitType,			PromotionType)
VALUES		('UNIT_AZTEC_EAGLE', 'PROMOTION_UNIT_AZTEC_CAPTIVES_OF_WAR'),
			('UNIT_AZTEC_EAGLE', 'PROMOTION_SENTRY'),
			('UNIT_AZTEC_EAGLE', 'PROMOTION_PARTIAL_HEAL_IF_DESTROY_ENEMY'),
			('UNIT_AZTEC_JAGUAR', 'PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1');
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,										Description,									Help,													CannotBeChosen,		LostWithUpgrade,	Sound,				PortraitIndex,	IconAtlas,				PediaType,		PediaEntry)
VALUES		('PROMOTION_UNIT_AZTEC_CAPTIVES_OF_WAR',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CAPTIVES_OF_WAR',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CAPTIVES_OF_WAR_HELP',	1,					0, 					'AS2D_IF_LEVELUP',	7,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CAPTIVES_OF_WAR'),
			('PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1',		'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1_HELP',		1,					1, 					'AS2D_IF_LEVELUP',	8,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1'),
			('PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_2',		'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_2',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1_HELP',		1,					1, 					'AS2D_IF_LEVELUP',	9,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_2'),
			('PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_3',		'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_3',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1_HELP',		1,					1, 					'AS2D_IF_LEVELUP',	10,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_3'),
			('PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_4',		'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_4',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1_HELP',		1,					1, 					'AS2D_IF_LEVELUP',	11,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_4'),
			('PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_5',		'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_5',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1_HELP',		1,					1, 					'AS2D_IF_LEVELUP',	12,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_5'),
			('PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_6',		'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_6',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1_HELP',		1,					1, 					'AS2D_IF_LEVELUP',	13,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_6'),
			('PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_7',		'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_7',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1_HELP',		1,					1, 					'AS2D_IF_LEVELUP',	14,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_7'),
			('PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_8',		'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_8',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1_HELP',		1,					1, 					'AS2D_IF_LEVELUP',	15,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_8'),
			('PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_9',		'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_9',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1_HELP',		1,					1, 					'AS2D_IF_LEVELUP',	16,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_9'),
			('PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_10',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_10',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_1_HELP',		1,					1, 					'AS2D_IF_LEVELUP',	17,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_AZTEC_CUAUHOCELOTL_10');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_EAGLE'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_MAYAN_ATLALIST');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_EAGLE'), ('ART_DEF_UNIT_MEMBER_EAGLE'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_MAYAN_ATLALIST');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_EAGLE'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MAYAN_ATLALIST');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_EAGLE'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, 'ARROW', 'ARROW'
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MAYAN_ATLALIST');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_EAGLE'), Scale, ZOffset, Domain, ('Pikeman_Aztec.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_MAYAN_ATLALIST');
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
	VALUES	('ART_DEF_UNIT_EAGLE', 'Unit', 'EagleFlag_128.dds');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('UNIT_AZTEC_ATLAS', 						256, 		'EaglePicture_256.dds',				1, 				1),
		('UNIT_AZTEC_ATLAS', 						128, 		'EaglePicture_128.dds',				1, 				1),
		('UNIT_AZTEC_ATLAS', 						80, 		'EaglePicture_080.dds',				1, 				1),
		('UNIT_AZTEC_ATLAS', 						45, 		'EaglePicture_045.dds',				1, 				1),
		('UNIT_AZTEC_ATLAS', 						64, 		'EaglePicture_064.dds',				1, 				1),
		('UNIT_AZTEC_FLAG_ATLAS', 					32, 		'EagleFlag_032.dds',				1, 				1);
--==========================================================================================================================
--==========================================================================================================================

