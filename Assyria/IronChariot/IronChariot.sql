--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType,			UnitClassType,			UnitType)
VALUES		('CIVILIZATION_ASSYRIA',	'UNITCLASS_HORSEMAN',	'UNIT_ASSYRIA_IRON_CHARIOT');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--------------------------------
-- Units
--------------------------------	
INSERT INTO Units
			(Type,							Description,							Civilopedia,								Strategy,										Help, 										Combat,		RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,	DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized, PrereqTech, ObsoleteTech,		GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, Conscription, XPValueAttack, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset, PortraitIndex,	IconAtlas,				UnitFlagAtlas,				MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT		'UNIT_ASSYRIA_IRON_CHARIOT',	'TXT_KEY_UNIT_ASSYRIA_IRON_CHARIOT',	'TXT_KEY_UNIT_ASSYRIA_IRON_CHARIOT_TEXT',	'TXT_KEY_UNIT_ASSYRIA_IRON_CHARIOT_STRATEGY',	'TXT_KEY_UNIT_ASSYRIA_IRON_CHARIOT_HELP', 	Combat-2,	RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,	DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized, PrereqTech, 'TECH_METALLURGY', GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, Conscription, XPValueAttack, XPValueDefense, 'ART_DEF_UNIT_TCM_HEQA_KHASUT', 	0,					0,				'UNIT_ASSYRIA_ATLAS',	'UNIT_ASSYRIA_FLAG_ATLAS',	MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM Units WHERE Type = 'UNIT_HORSEMAN';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		'UNIT_ASSYRIA_IRON_CHARIOT', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, 						BuildingClassType)
SELECT		'UNIT_ASSYRIA_IRON_CHARIOT', 	BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		'UNIT_ASSYRIA_IRON_CHARIOT', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO		Unit_Flavors
				(UnitType, 						FlavorType,			Flavor)
VALUES			('UNIT_ASSYRIA_IRON_CHARIOT',	'FLAVOR_OFFENSE',	10),
				('UNIT_ASSYRIA_IRON_CHARIOT',	'FLAVOR_DEFENSE',	4),
				('UNIT_ASSYRIA_IRON_CHARIOT',	'FLAVOR_MOBILE',	5);
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
				(UnitType, 						PromotionType)
SELECT			'UNIT_ASSYRIA_IRON_CHARIOT', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO		Unit_FreePromotions
				(UnitType,						PromotionType)
VALUES			('UNIT_ASSYRIA_IRON_CHARIOT', 'PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL'),
				('UNIT_ASSYRIA_IRON_CHARIOT', 'PROMOTION_UNIT_ASSYRIA_IRON_AND_HORSE');
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,										Description,										Help,													LostWithUpgrade,	CannotBeChosen,		Sound,				PortraitIndex,	IconAtlas,							PediaType,		PediaEntry,											CombatPercent)
VALUES		('PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_HELP',	0,					1,					'AS2D_IF_LEVELUP',	0,				'UNIT_BABYLON_PROMOTION_5_ATLAS',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL',	0),
			('PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_1',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_1',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_1_HELP',	0,					1,					'AS2D_IF_LEVELUP',	0,				'UNIT_BABYLON_PROMOTION_1_ATLAS',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_1',	7),
			('PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_2',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_2',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_2_HELP',	0,					1,					'AS2D_IF_LEVELUP',	0,				'UNIT_BABYLON_PROMOTION_2_ATLAS',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_2',	14),
			('PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_3',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_3',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_3_HELP',	0,					1,					'AS2D_IF_LEVELUP',	0,				'UNIT_BABYLON_PROMOTION_3_ATLAS',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_3',	21),
			('PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_4',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_4',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_4_HELP',	0,					1,					'AS2D_IF_LEVELUP',	0,				'UNIT_BABYLON_PROMOTION_3_ATLAS',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_4',	28),
			('PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_5',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_5',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_5_HELP',	0,					1,					'AS2D_IF_LEVELUP',	0,				'UNIT_BABYLON_PROMOTION_4_ATLAS',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_5',	35),
			('PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_6',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_6',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_6_HELP',	0,					1,					'AS2D_IF_LEVELUP',	0,				'UNIT_BABYLON_PROMOTION_4_ATLAS',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_FURY_OF_NERGAL_6',	42),
			('PROMOTION_UNIT_ASSYRIA_IRON_AND_HORSE',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_IRON_AND_HORSE',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_IRON_AND_HORSE_HELP',	1,					1,					'AS2D_IF_LEVELUP',	23,				'ABILITY_ATLAS',					'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_ASSYRIA_IRON_AND_HORSE',	0);
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_TCM_HEQA_KHASUT', 1, 'ChariotElephant');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TCM_HEQA_KHASUT', 'ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 1);
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 0.129999995231628, 'Hititte_War_Chariot.fxsxml', 'CLOTH', 'WOODSM');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 1, 1, 1, 1);
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 0, 0, 'ARROW', 'ARROW', 10.0);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TCM_HEQA_KHASUT', 'Unit', 'IronChariotFlag_128.dds');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('UNIT_ASSYRIA_ATLAS', 					256, 		'IronChariotPicture_256.dds',		1,				1),
			('UNIT_ASSYRIA_ATLAS', 					128, 		'IronChariotPicture_128.dds',		1, 				1),
			('UNIT_ASSYRIA_ATLAS', 					80, 		'IronChariotPicture_080.dds',		1, 				1),
			('UNIT_ASSYRIA_ATLAS', 					64, 		'IronChariotPicture_064.dds',		1, 				1),
			('UNIT_ASSYRIA_ATLAS', 					45, 		'IronChariotPicture_045.dds',		1, 				1),
			('UNIT_ASSYRIA_FLAG_ATLAS',				32, 		'IronChariotFlag_032.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================
