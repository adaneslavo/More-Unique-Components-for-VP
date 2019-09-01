--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 		UnitType)
VALUES		('CIVILIZATION_POLYNESIA',	'UNITCLASS_SCOUT', 	'UNIT_POLYNESIA_KOA');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_POLYNESIA_KOA',	'Unit',		'KoaFlag_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type,							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_POLYNESIA_KOA',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SCOUT';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		'ART_DEF_UNIT_POLYNESIA_KOA',	'ART_DEF_UNIT_MEMBER_POLYNESIA_KOA', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SCOUT';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_POLYNESIA_KOA',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_POLYNESIA_KOA',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_POLYNESIA_KOA',	Scale, ZOffset, Domain, 'hawaii_ikaika.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SCOUT';
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 				IconsPerRow, 	IconsPerColumn)
VALUES		('UNIT_POLYNESIA_ATLAS', 			256, 		'KoaPicture_256.dds',	1, 				1),
			('UNIT_POLYNESIA_ATLAS', 			128, 		'KoaPicture_128.dds',	1, 				1),
			('UNIT_POLYNESIA_ATLAS', 			80, 		'KoaPicture_080.dds',	1, 				1),
			('UNIT_POLYNESIA_ATLAS', 			64, 		'KoaPicture_064.dds',	1, 				1),
			('UNIT_POLYNESIA_ATLAS', 			45, 		'KoaPicture_045.dds',	1, 				1),
			('UNIT_POLYNESIA_FLAG_ATLAS', 		32, 		'KoaFlag_032.dds',		1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 										Description, 										Help, 														Sound, 				PlagueChance, 	PlaguePromotion, 							BarbarianCombatBonus,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 				PediaType, 			PediaEntry)
VALUES		('PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_0', 'TXT_KEY_PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_0',	'TXT_KEY_PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_0_HELP', 	'AS2D_IF_LEVELUP',	100, 			'PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_1', 	0,						0,				0,			0,			0,					0,			0,					1, 				12, 			'promoMUC_atlas_01', 	'PEDIA_SCOUTING',	'TXT_KEY_PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_0');

INSERT INTO UnitPromotions 
			(Type, 										Description, 										Help, 													Sound, 				MaxHitPointsChange, EnemyHealChange, 	NeutralHealChange, 	FriendlyHealChange, PromotionDuration, 	PlagueID, 	PlaguePriority, BarbarianCombatBonus,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 				PediaType, 			PediaEntry)
VALUES		('PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_1', 'TXT_KEY_PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_1',	'TXT_KEY_PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_1_HELP', 'AS2D_IF_LEVELUP',	-20, 				-10, 				-10, 				-10, 				2, 					1, 			0, 				0,						0,				0,			0,			0,					0,			0,					1, 				13, 			'promoMUC_atlas_01', 	'PEDIA_SCOUTING',	'TXT_KEY_PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_1');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Type,					Class, 	PrereqTech,	Range,	BaseSightRange, Combat,		Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, Immobile, CombatClass, Domain, DefaultUnitAI,	ObsoleteTech,		GoodyHutUpgradeUnitClass,	XPValueAttack,	Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,					PortraitIndex, 	IconAtlas,				MoveRate,	PurchaseCooldown)
SELECT		'UNIT_POLYNESIA_KOA',	Class,	PrereqTech,	Range,	BaseSightRange, Combat+3,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, Immobile, CombatClass, Domain, DefaultUnitAI,	'TECH_STEAM_POWER',	GoodyHutUpgradeUnitClass,	XPValueAttack,	'TXT_KEY_UNIT_POLYNESIA_KOA',	'TXT_KEY_UNIT_POLYNESIA_KOA_TEXT',	'TXT_KEY_UNIT_POLYNESIA_KOA_STRATEGY',	'TXT_KEY_UNIT_POLYNESIA_KOA_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_POLYNESIA_KOA', 	0,					'UNIT_POLYNESIA_FLAG_ATLAS',	0, 				'UNIT_POLYNESIA_ATLAS',	MoveRate,	PurchaseCooldown
FROM Units WHERE Type = 'UNIT_SCOUT';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_POLYNESIA_KOA',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SCOUT';	
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_POLYNESIA_KOA',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SCOUT';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 				ResourceType)
SELECT		'UNIT_POLYNESIA_KOA',	null
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_SCOUT';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		'UNIT_POLYNESIA_KOA',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SCOUT';
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,			Flavor)
VALUES		('UNIT_POLYNESIA_KOA',	'FLAVOR_OFFENSE',	1),
			('UNIT_POLYNESIA_KOA',	'FLAVOR_RECON',		9);
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_POLYNESIA_KOA',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCOUT';

INSERT INTO Unit_FreePromotions
			(UnitType, 				PromotionType)
VALUES		('UNIT_POLYNESIA_KOA',	'PROMOTION_UNIT_POLYNESIA_KAPU_KUIALUA_0'),
			('UNIT_POLYNESIA_KOA',	'PROMOTION_AMPHIBIOUS');
--------------------------------
-- Unit_FreePromotions Deletion
--------------------------------
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_POLYNESIA_KOA' AND PromotionType = 'PROMOTION_BARBARIAN_PENALTY_II';
--==========================================================================================================================
--==========================================================================================================================
