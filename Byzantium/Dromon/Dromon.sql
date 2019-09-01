--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 					UnitType)
VALUES		('CIVILIZATION_BYZANTIUM',	'UNITCLASS_BYZANTINE_DROMON', 	'UNIT_BYZANTIUM_DROMON');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_BYZANTIUM_DROMON',	'Unit',		'SV_Dromon.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type,								DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_BYZANTIUM_DROMON',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_BYZANTIUM_DROMON';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		'ART_DEF_UNIT_BYZANTIUM_DROMON',	'ART_DEF_UNIT_MEMBER_BYZANTIUM_DROMON', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_BYZANTIUM_DROMON';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_BYZANTIUM_DROMON',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_BYZANTIUM_DROMON',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BYZANTIUM_DROMON',	0.16,	ZOffset, Domain, 'U_Byzantium_Dromon.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON';
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 										Description, 										Help, 													Sound, 				BarbarianCombatBonus,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 				PediaType, 		PediaEntry)
VALUES		('PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_0', 	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_0',	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_0_HELP', 	'AS2D_IF_LEVELUP',	0,						0,				0,			0,			0,					0,			1,					1, 				28, 				'promoMUC_atlas_00', 	'PEDIA_NAVAL',	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_0'),
			('PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_1', 	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_1',	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_1_HELP', 	'AS2D_IF_LEVELUP',	0,						0,				0,			0,			0,					0,			1,					1, 				29, 			'promoMUC_atlas_00', 	'PEDIA_NAVAL',	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_1'),
			('PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2',	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2',	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2_HELP', 	'AS2D_IF_LEVELUP',	0,						0,				0,			0,			0,					0,			1,					1, 				30, 			'promoMUC_atlas_00', 	'PEDIA_NAVAL',	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_2'),
			('PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3',	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3',	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3_HELP', 	'AS2D_IF_LEVELUP',	0,						0,				0,			0,			0,					0,			1,					1, 				31, 			'promoMUC_atlas_00', 	'PEDIA_NAVAL',	'TXT_KEY_PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_3');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Type,						Class, 	PrereqTech,	Range,	BaseSightRange, Combat,		RangedCombat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, Immobile, CombatClass, Domain, DefaultUnitAI,	ObsoleteTech,		GoodyHutUpgradeUnitClass,	XPValueAttack,	Description, 						Civilopedia, 							Strategy, 									Help, 									Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate,	PurchaseCooldown)
SELECT		'UNIT_BYZANTIUM_DROMON',	Class,	PrereqTech,	Range,	BaseSightRange, Combat+2,	RangedCombat+2,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, Immobile, CombatClass, Domain, DefaultUnitAI,	'TECH_NAVIGATION',	GoodyHutUpgradeUnitClass,	XPValueAttack,	'TXT_KEY_UNIT_BYZANTIUM_DROMON',	'TXT_KEY_UNIT_BYZANTIUM_DROMON_TEXT',	'TXT_KEY_UNIT_BYZANTIUM_DROMON_STRATEGY',	'TXT_KEY_UNIT_BYZANTIUM_DROMON_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_BYZANTIUM_DROMON', 	5,					'EXPANSION_UNIT_FLAG_ATLAS',	5, 				'EXPANSION_UNIT_ATLAS_1',	MoveRate,	PurchaseCooldown
FROM Units WHERE Type = 'UNIT_BYZANTINE_DROMON';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		'UNIT_BYZANTIUM_DROMON',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_BYZANTINE_DROMON';	
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		'UNIT_BYZANTIUM_DROMON',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_BYZANTINE_DROMON';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 					ResourceType)
SELECT		'UNIT_BYZANTIUM_DROMON',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_BYZANTINE_DROMON';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		'UNIT_BYZANTIUM_DROMON',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_BYZANTINE_DROMON';
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType,				Flavor)
VALUES		('UNIT_BYZANTIUM_DROMON',	'FLAVOR_NAVAL',			20),
			('UNIT_BYZANTIUM_DROMON',	'FLAVOR_NAVAL_RECON',	8);
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
SELECT		'UNIT_BYZANTIUM_DROMON',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_BYZANTINE_DROMON';

INSERT INTO Unit_FreePromotions
			(UnitType, 				PromotionType)
VALUES		('UNIT_BYZANTIUM_DROMON',	'PROMOTION_UNIT_BYZANTIUM_GREEK_FIRE_0'),
			('UNIT_BYZANTIUM_DROMON',	'PROMOTION_SPLASH');
--==========================================================================================================================
--==========================================================================================================================
