--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_INDONESIA',	'UNITCLASS_TRIREME', 	'UNIT_INDONESIA_PRAU');
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 			TileType, 		Asset)
VALUES 		('ART_DEF_UNIT_INDONESIA_PRAU', 'Unit', 		'PrauFlag_128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type,							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_INDONESIA_PRAU',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_TRIREME';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		'ART_DEF_UNIT_INDONESIA_PRAU',	'ART_DEF_UNIT_MEMBER_INDONESIA_PRAU', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_TRIREME';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_INDONESIA_PRAU',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_INDONESIA_PRAU',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_INDONESIA_PRAU',	0.16,	ZOffset, Domain, 'andes_cargo_ship.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_TRIREME';
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize, 	Filename, 				IconsPerRow, 	IconsPerColumn)
VALUES		('UNIT_INDONESIA_ATLAS', 		256, 		'PrauPicture_256.dds',	1, 				1),
			('UNIT_INDONESIA_ATLAS', 		128, 		'PrauPicture_128.dds',	1, 				1),
			('UNIT_INDONESIA_ATLAS', 		80, 		'PrauPicture_080.dds',	1, 				1),
			('UNIT_INDONESIA_ATLAS', 		64, 		'PrauPicture_064.dds',	1, 				1),
			('UNIT_INDONESIA_ATLAS', 		45, 		'PrauPicture_045.dds',	1, 				1),
			('UNIT_INDONESIA_FLAG_ATLAS', 	32, 		'PrauFlag_032.dds',		1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 										Description, 										Help, 													Sound, 					MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 				PediaType, 		PediaEntry)
VALUES		('PROMOTION_UNIT_INDONESIA_FLYING_THE_AMA', 'TXT_KEY_PROMOTION_UNIT_INDONESIA_FLYING_THE_AMA',	'TXT_KEY_PROMOTION_UNIT_INDONESIA_FLYING_THE_AMA_HELP', 'AS2D_IF_LEVELUP',		2,				0,			0,			0,					0,			1,					1, 				54, 			'promoMUC_atlas_00', 	'PEDIA_NAVAL', 'TXT_KEY_PROMOTION_UNIT_INDONESIA_FLYING_THE_AMA');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--------------------------------
-- Units
--------------------------------	
INSERT INTO Units 	
			(Type,					Class, 	PrereqTech,		Range,	BaseSightRange, Combat,	Cost,		FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	Immobile, CombatClass, Domain, DefaultUnitAI,	ObsoleteTech,		GoodyHutUpgradeUnitClass,	XPValueAttack,	Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,					PortraitIndex, 	IconAtlas,				MoveRate,	PurchaseCooldown)
SELECT		'UNIT_INDONESIA_PRAU',	Class,	'TECH_SAILING',	Range,	BaseSightRange, Combat,	Cost-20,	100,	RequiresFaithPurchaseEnabled,	Moves,	Immobile, CombatClass, Domain, DefaultUnitAI,	'TECH_NAVIGATION',	GoodyHutUpgradeUnitClass,	XPValueAttack,	'TXT_KEY_UNIT_INDONESIA_PRAU',	'TXT_KEY_UNIT_INDONESIA_PRAU_TEXT',	'TXT_KEY_UNIT_INDONESIA_PRAU_STRATEGY',	'TXT_KEY_UNIT_INDONESIA_PRAU_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_INDONESIA_PRAU', 	0,					'UNIT_INDONESIA_FLAG_ATLAS',	0, 				'UNIT_INDONESIA_ATLAS',	MoveRate,	PurchaseCooldown
FROM Units WHERE Type = 'UNIT_TRIREME';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_INDONESIA_PRAU',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_TRIREME';	
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_INDONESIA_PRAU',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_TRIREME';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 				ResourceType)
SELECT		'UNIT_INDONESIA_PRAU',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_TRIREME';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		'UNIT_INDONESIA_PRAU',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_TRIREME';
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,				Flavor)
VALUES		('UNIT_INDONESIA_PRAU',	'FLAVOR_NAVAL',			15),
			('UNIT_INDONESIA_PRAU',	'FLAVOR_NAVAL_RECON',	7);
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_INDONESIA_PRAU',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_TRIREME';

INSERT INTO Unit_FreePromotions
			(UnitType, 				PromotionType)
VALUES		('UNIT_INDONESIA_PRAU',	'PROMOTION_UNIT_INDONESIA_FLYING_THE_AMA'),
			('UNIT_INDONESIA_PRAU',	'PROMOTION_BOARDING_PARTY_4');
--==========================================================================================================================
--==========================================================================================================================

