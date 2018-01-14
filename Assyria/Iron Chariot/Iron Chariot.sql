-- Iron Chariot
-- Design by Hinin
-- Code by Blue Ghost
-- Art by Janboruta
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType, UnitClassType, UnitType)
VALUES		('CIVILIZATION_ASSYRIA', 'UNITCLASS_HORSEMAN', 'UNIT_ASSYRIAN_IRON_CHARIOT');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units
			(Type, Description, Civilopedia, Strategy, Help, 
			Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,
			DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, Conscription, XPValueAttack, XPValueDefense, UnitArtInfo, 
			UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT		'UNIT_ASSYRIAN_IRON_CHARIOT', 'TXT_KEY_UNIT_ASSYRIAN_IRON_CHARIOT', 'TXT_KEY_UNIT_ASSYRIAN_IRON_CHARIOT_TEXT', 'TXT_KEY_UNIT_ASSYRIAN_IRON_CHARIOT_STRATEGY', 'TXT_KEY_UNIT_ASSYRIAN_IRON_CHARIOT_HELP', 
			Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,
			DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, Conscription, XPValueAttack, XPValueDefense, 'ART_DEF_UNIT_TCM_HEQA_KHASUT', 
			0, 2, 'TCM_HYKSOS_ATLAS', 'TCM_UNIT_FLAG_HEQA_KHASUT_ATLAS', MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM		Units
WHERE		Type = 'UNIT_HORSEMAN';

UPDATE		Units
SET			Combat = 13, ObsoleteTech = 'TECH_METALLURGY'
WHERE		Type = 'UNIT_ASSYRIAN_IRON_CHARIOT';


--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 			UnitAIType)
SELECT		'UNIT_ASSYRIAN_IRON_CHARIOT', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, 			BuildingClassType)
SELECT		'UNIT_ASSYRIAN_IRON_CHARIOT', 	BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_HORSEMAN';


--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		'UNIT_ASSYRIAN_IRON_CHARIOT', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';


--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO		Unit_Flavors
VALUES			('UNIT_ASSYRIAN_IRON_CHARIOT', 'FLAVOR_OFFENSE', 10),
				('UNIT_ASSYRIAN_IRON_CHARIOT', 'FLAVOR_DEFENSE', 4),
				('UNIT_ASSYRIAN_IRON_CHARIOT', 'FLAVOR_MOBILE', 5);


--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
				(UnitType, 			PromotionType)
SELECT			'UNIT_ASSYRIAN_IRON_CHARIOT', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO		Unit_FreePromotions
				(UnitType,			PromotionType)
VALUES			('UNIT_ASSYRIAN_IRON_CHARIOT', 'PROMOTION_FURY_OF_NERGAL'),
				('UNIT_ASSYRIAN_IRON_CHARIOT', 'PROMOTION_SHOCK_1');

--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry)
VALUES		('PROMOTION_FURY_OF_NERGAL',				'TXT_KEY_PROMOTION_FURY_OF_NERGAL',		'TXT_KEY_PROMOTION_FURY_OF_NERGAL_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_FURY_OF_NERGAL');

INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,
			CombatPercent)
VALUES		('PROMOTION_FURY_OF_NERGAL_1',				'TXT_KEY_PROMOTION_FURY_OF_NERGAL_1',		'TXT_KEY_PROMOTION_FURY_OF_NERGAL_1_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_FURY_OF_NERGAL_1',
			10);

INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,
			CombatPercent)
VALUES		('PROMOTION_FURY_OF_NERGAL_2',				'TXT_KEY_PROMOTION_FURY_OF_NERGAL_2',		'TXT_KEY_PROMOTION_FURY_OF_NERGAL_2_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_FURY_OF_NERGAL_2',
			20);

INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,
			CombatPercent)
VALUES		('PROMOTION_FURY_OF_NERGAL_3',				'TXT_KEY_PROMOTION_FURY_OF_NERGAL_3',		'TXT_KEY_PROMOTION_FURY_OF_NERGAL_3_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_FURY_OF_NERGAL_3',
			30);

INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,
			CombatPercent)
VALUES		('PROMOTION_FURY_OF_NERGAL_4',				'TXT_KEY_PROMOTION_FURY_OF_NERGAL_4',		'TXT_KEY_PROMOTION_FURY_OF_NERGAL_4_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_FURY_OF_NERGAL_4',
			40);

INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,
			CombatPercent)
VALUES		('PROMOTION_FURY_OF_NERGAL_5',				'TXT_KEY_PROMOTION_FURY_OF_NERGAL_5',		'TXT_KEY_PROMOTION_FURY_OF_NERGAL_5_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_FURY_OF_NERGAL_5',
			50);

INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,
			CombatPercent)
VALUES		('PROMOTION_FURY_OF_NERGAL_6',				'TXT_KEY_PROMOTION_FURY_OF_NERGAL_6',		'TXT_KEY_PROMOTION_FURY_OF_NERGAL_6_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_FURY_OF_NERGAL_6',
			60);


INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_TCM_HEQA_KHASUT', 1, 'ChariotElephant');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TCM_HEQA_KHASUT', 'ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 2);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 0.129999995231628, 'tcmHeqaKhasut.fxsxml', 'CLOTH', 'WOODSM');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 0, 0, 'ARROW', 'ARROW', 10.0);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TCM_HEQA_KHASUT', 'Unit', 'tcmHeqaKhasutSV.dds');
  
  --=========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('TCM_HYKSOS_ATLAS', 					256, 		'tcmHyksosIcons256.dds',			2,				2),
			('TCM_HYKSOS_ATLAS', 					128, 		'tcmHyksosIcons128.dds',			2, 				2),
			('TCM_HYKSOS_ATLAS', 					80, 		'tcmHyksosIcons80.dds',				2, 				2),
			('TCM_HYKSOS_ATLAS', 					64, 		'tcmHyksosIcons64.dds',				2, 				2),
			('TCM_HYKSOS_ATLAS', 					45, 		'tcmHyksosIcons45.dds',				2, 				2),
			('TCM_HYKSOS_ATLAS', 					32, 		'tcmHyksosIcons32.dds',				2, 				2),
			('TCM_UNIT_FLAG_HEQA_KHASUT_ATLAS',		32, 		'tcmHeqaKhasutAlpha32.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================
