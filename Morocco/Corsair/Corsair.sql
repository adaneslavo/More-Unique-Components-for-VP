-- Corsair
-- Code by Blue Ghost
-- Art by TarcisioCM

--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType, UnitClassType, UnitType)
VALUES		('CIVILIZATION_MOROCCO', 'UNITCLASS_PRIVATEER', 'UNIT_MOROCCAN_CORSAIR');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units
			(Type, Description, Civilopedia, Strategy, Help, Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,
			DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 
			UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT		'UNIT_MOROCCAN_CORSAIR', 'TXT_KEY_UNIT_MOROCCAN_CORSAIR', 'TXT_KEY_UNIT_MOROCCAN_CORSAIR_TEXT', 'TXT_KEY_UNIT_MOROCCAN_CORSAIR_STRATEGY', 'TXT_KEY_UNIT_MOROCCAN_CORSAIR_HELP', 
			Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,
			DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_CORSAIR', 
			0, 0, 'TCM_SICILY_ATLAS', 'TCM_UNIT_FLAG_AMMIRATUS_ATLAS', MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM		Units
WHERE		Type = 'UNIT_PRIVATEER';

UPDATE		Units
SET			Combat = 38, Cost = 350, ObsoleteTech = 'TECH_ROCKETRY'
WHERE		Type = 'UNIT_MOROCCAN_CORSAIR';


--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 			UnitAIType)
SELECT		'UNIT_MOROCCAN_CORSAIR', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PRIVATEER';

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, 			BuildingClassType)
SELECT		'UNIT_MOROCCAN_CORSAIR', 	BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_PRIVATEER';

--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		'UNIT_MOROCCAN_CORSAIR', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PRIVATEER';

--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO		Unit_Flavors
VALUES			('UNIT_MOROCCAN_CORSAIR', 'FLAVOR_NAVAL', 25),
				('UNIT_MOROCCAN_CORSAIR', 'FLAVOR_NAVAL_RECON', 35);

--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
				(UnitType, 			PromotionType)
SELECT			'UNIT_MOROCCAN_CORSAIR', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PRIVATEER';

INSERT INTO		Unit_FreePromotions
				(UnitType,			PromotionType)
VALUES			('UNIT_MOROCCAN_CORSAIR', 'PROMOTION_TARGETING_4'),
				('UNIT_MOROCCAN_CORSAIR', 'PROMOTION_RAZZIA');

--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry, RivalTerritory)
VALUES		('PROMOTION_RAZZIA',				'TXT_KEY_PROMOTION_RAZZIA',		'TXT_KEY_PROMOTION_RAZZIA_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_RAZZIA', 1);


INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_CORSAIR'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_PRIVATEER');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_CORSAIR'), ('ART_DEF_UNIT_MEMBER_CORSAIR'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_PRIVATEER');

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_CORSAIR'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PRIVATEER');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_CORSAIR'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PRIVATEER');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_CORSAIR'), Scale, ZOffset, Domain, ('tcmAmmiratus.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PRIVATEER');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
	VALUES	('ART_DEF_UNIT_CORSAIR', 'Unit', 'CorsairFlag_128.dds');

INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('TCM_SICILY_ATLAS', 					256, 		'CorsairPicture_256.dds',			1,				1),
			('TCM_SICILY_ATLAS', 					128, 		'CorsairPicture_128.dds',			1, 				1),
			('TCM_SICILY_ATLAS', 					80, 		'CorsairPicture_080.dds',			1, 				1),
			('TCM_SICILY_ATLAS', 					64, 		'CorsairPicture_064.dds',			1, 				1),
			('TCM_SICILY_ATLAS', 					45, 		'CorsairPicture_045.dds',			1, 				1),
			('TCM_UNIT_FLAG_AMMIRATUS_ATLAS',		32, 		'CorsairFlag_032.dds',				1, 				1);
