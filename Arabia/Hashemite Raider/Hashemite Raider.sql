-- Hashemite Raider
-- Code by Blue Ghost

--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType, UnitClassType, UnitType)
VALUES		('CIVILIZATION_ARABIA', 'UNITCLASS_ANTI_TANK_GUN', 'UNIT_ARABIAN_HASHEMITE');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units
			(Type, Description, Civilopedia, Strategy, Help, 
			Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,
			DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, Conscription, XPValueAttack, XPValueDefense, UnitArtInfo, 
			UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT		'UNIT_ARABIAN_HASHEMITE', 'TXT_KEY_UNIT_ARABIAN_HASHEMITE', 'TXT_KEY_UNIT_ARABIAN_HASHEMITE_TEXT', 'TXT_KEY_UNIT_ARABIAN_HASHEMITE_STRATEGY', 'TXT_KEY_UNIT_ARABIAN_HASHEMITE_HELP', 
			Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,
			DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, Conscription, XPValueAttack, XPValueDefense, 'ART_DEF_UNIT_HASHEMITE', 
			2, 0, 'HASHEMITE_ATLAS', 'EXPANSION2_UNIT_FLAG_ATLAS', MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM		Units
WHERE		Type = 'UNIT_ANTI_TANK_GUN';

UPDATE		Units
SET			Combat = 55, RangedCombat = 72, Mechanized = 0, PrereqTech = 'TECH_COMBUSTION', ObsoleteTech = NULL, MoveRate = 'QUADRUPED'
WHERE		Type = 'UNIT_ARABIAN_HASHEMITE';


--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 			UnitAIType)
SELECT		'UNIT_ARABIAN_HASHEMITE', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_ANTI_TANK_GUN';

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, 			BuildingClassType)
SELECT		'UNIT_ARABIAN_HASHEMITE', 	BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_ANTI_TANK_GUN';


--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		'UNIT_ARABIAN_HASHEMITE', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_ANTI_TANK_GUN';


--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO		Unit_Flavors
VALUES			('UNIT_ARABIAN_HASHEMITE', 'FLAVOR_OFFENSE', 13),
				('UNIT_ARABIAN_HASHEMITE', 'FLAVOR_DEFENSE', 10),
				('UNIT_ARABIAN_HASHEMITE', 'FLAVOR_MOBILE', 10);


--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
				(UnitType, 			PromotionType)
SELECT			'UNIT_ARABIAN_HASHEMITE', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ANTI_TANK_GUN';

INSERT INTO		Unit_FreePromotions
				(UnitType,			PromotionType)
VALUES			('UNIT_ARABIAN_HASHEMITE', 'PROMOTION_GARLAND_MINE');

INSERT INTO		Unit_FreePromotions
				(UnitType,			PromotionType)
VALUES			('UNIT_ARABIAN_HASHEMITE', 'PROMOTION_DESERT_RAIDER');


--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------	
-- No requirements for the Hashemite Raider

--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,
			FreePillageMoves)
VALUES		('PROMOTION_GARLAND_MINE',				'TXT_KEY_PROMOTION_GARLAND_MINE',		'TXT_KEY_PROMOTION_GARLAND_MINE_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_RANGED',			'TXT_KEY_PROMOTION_GARLAND_MINE',
			1);

INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry)
VALUES		('PROMOTION_DESERT_RAIDER',				'TXT_KEY_PROMOTION_DESERT_RAIDER',		'TXT_KEY_PROMOTION_DESERT_RAIDER_HELP',
			1,				'AS2D_IF_LEVELUP',	1,				'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_RANGED',			'TXT_KEY_PROMOTION_DESERT_RAIDER');

INSERT INTO UnitPromotions_Terrains
			(PromotionType, TerrainType, Attack, Defense, DoubleMove)
VALUES		('PROMOTION_DESERT_RAIDER', 'TERRAIN_DESERT', 25, 25, 1);



INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_HASHEMITE'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_MORROCAN_BERBER_CAVALRY');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_HASHEMITE'), ('ART_DEF_UNIT_MEMBER_HASHEMITE'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_MORROCAN_BERBER_CAVALRY');

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_HASHEMITE'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_HASHEMITE'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_HASHEMITE'), Scale, ZOffset, Domain, ('Hashemite.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY');

INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('HASHEMITE_ATLAS', 					256, 		'Hashemite256.dds',			1,				1),
			('HASHEMITE_ATLAS', 					128, 		'Hashemite128.dds',			1, 				1),
			('HASHEMITE_ATLAS', 					80, 		'Hashemite80.dds',				1, 				1),
			('HASHEMITE_ATLAS', 					64, 		'Hashemite64.dds',				1, 				1),
			('HASHEMITE_ATLAS', 					45, 		'Hashemite45.dds',				1, 				1),
			('HASHEMITE_ATLAS', 					32, 		'Hashemite32.dds',				1, 				1);
