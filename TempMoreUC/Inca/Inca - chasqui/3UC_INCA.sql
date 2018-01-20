INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_CHASQUI'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SCOUT');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_CHASQUI'), ('ART_DEF_UNIT_MEMBER_CHASQUI'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SCOUT');

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_CHASQUI'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_CHASQUI'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_CHASQUI'), Scale, ZOffset, Domain, ('IncaScout.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_SCOUT');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
	VALUES	('ART_DEF_UNIT_CHASQUI', 'Unit', 'Chasqui_SV.dds');


INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	
		('CHASQUI_FLAG', 		32, 		'Chasqui_Flag.dds',		1, 				1),
		('CHASQUI_ICON_ATLAS', 		256, 		'Chasqui256.dds',		1, 				1),
		('CHASQUI_ICON_ATLAS', 		128, 		'Chasqui128.dds',		1, 				1),
		('CHASQUI_ICON_ATLAS', 		80, 		'Chasqui80.dds',			1, 				1),
		('CHASQUI_ICON_ATLAS', 		64, 		'Chasqui64.dds',			1, 				1),
		('CHASQUI_ICON_ATLAS', 		45, 		'Chasqui45.dds',			1, 				1),
		('CHASQUI_ICON_ATLAS', 		32, 		'Chasqui32.dds',			1,				1);	
--------------------------------	
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 				Class,	NoBadGoodies, PrereqTech, RangedCombat, Range, Special, Combat, Cost, ObsoleteTech, 		GoodyHutUpgradeUnitClass, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					 Civilopedia, 						Strategy, 		 						Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 			UnitFlagIconOffset,	UnitFlagAtlas,	 PortraitIndex, IconAtlas,				MoveRate)
SELECT	'UNIT_3UC_CHASQUI',	Class,	NoBadGoodies, PrereqTech, RangedCombat, Range, Special, Combat, Cost, 'TECH_STEAM_POWER', 	GoodyHutUpgradeUnitClass, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_3UC_CHASQUI', 	'TXT_KEY_UNIT_3UC_CHASQUI_TEXT',	'TXT_KEY_UNIT_3UC_CHASQUI_STRATEGY',  	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_CHASQUI',	0,					'CHASQUI_FLAG',	 0,				'CHASQUI_ICON_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_SCOUT';
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================

INSERT INTO UnitPromotions 
		(Type, 						 Description, 						Help, 								Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			LostWithUpgrade, 	PediaType,	PediaEntry)
VALUES	('PROMOTION_CHASQUI_GOLD',	'TXT_KEY_PROMOTION_CHASQUI_GOLD',	'TXT_KEY_PROMOTION_CHASQUI_GOLD', 	'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS', 	0,					null,		null),
		('PROMOTION_CHASQUI_HEAL',	'TXT_KEY_PROMOTION_CHASQUI_HEAL',	'TXT_KEY_PROMOTION_CHASQUI_HEAL', 	'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS', 	0, 					null, 		null);

INSERT INTO UnitPromotions_YieldFromScouting
	(PromotionType, YieldType, Yield)
VALUES
	('PROMOTION_CHASQUI_GOLD', 'YIELD_GOLD', 1);		

--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_3UC_CHASQUI', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SCOUT';
--------------------------------		
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_3UC_CHASQUI', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SCOUT';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_3UC_CHASQUI',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SCOUT';	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_3UC_CHASQUI',	FlavorType, Flavor
FROM Unit_Flavors  WHERE UnitType = 'UNIT_SCOUT';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_3UC_CHASQUI', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_SCOUT';
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_3UC_CHASQUI', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCOUT';	

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_3UC_CHASQUI',		'PROMOTION_ALTITUDE_TRAINING'),
		('UNIT_3UC_CHASQUI',		'PROMOTION_CHASQUI_GOLD'),
		('UNIT_3UC_CHASQUI',		'PROMOTION_CHASQUI_HEAL');

--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_INCA',	'UNITCLASS_SCOUT',	'UNIT_3UC_CHASQUI');