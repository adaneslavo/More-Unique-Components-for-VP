-- Landwehr
-- Design by Hinin
-- Code by Blue Ghost
-- Art by Janboruta
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType, UnitClassType, UnitType)
VALUES		('CIVILIZATION_AUSTRIA', 'UNITCLASS_RIFLEMAN', 'UNIT_AUSTRIAN_LANDWEHR');

--------------------------------
-- Units
--------------------------------	
INSERT INTO Units
			(Type, Description, Civilopedia, Strategy, Help, 
			Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,
			DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, Conscription, XPValueAttack, XPValueDefense, UnitArtInfo, 
			UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT		'UNIT_AUSTRIAN_LANDWEHR', 'TXT_KEY_UNIT_AUSTRIAN_LANDWEHR', 'TXT_KEY_UNIT_AUSTRIAN_LANDWEHR_TEXT', 'TXT_KEY_UNIT_AUSTRIAN_LANDWEHR_STRATEGY', 'TXT_KEY_UNIT_AUSTRIAN_LANDWEHR_HELP', 
			Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, BaseSightRange, Class, CombatClass, Domain,
			DefaultUnitAI,  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, HurryCostModifier, AdvancedStartCost, MinAreaSize, Conscription, XPValueAttack, XPValueDefense, 'ART_DEF_UNIT_LANDWEHR', 
			0, 0, 'ICON_ATLAS_LANDWEHR', 'LANDWEHR_FLAG', MoveRate, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM		Units
WHERE		Type = 'UNIT_RIFLEMAN';

UPDATE		Units
SET			Combat = 38, ObsoleteTech = 'TECH_COMBINED_ARMS'
WHERE		Type = 'UNIT_AUSTRIAN_LANDWEHR';


--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 			UnitAIType)
SELECT		'UNIT_AUSTRIAN_LANDWEHR', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------		
INSERT INTO Unit_BuildingClassPurchaseRequireds 	
			(UnitType, 			BuildingClassType)
SELECT		'UNIT_AUSTRIAN_LANDWEHR', 	BuildingClassType
FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_RIFLEMAN';


--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		'UNIT_AUSTRIAN_LANDWEHR', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';


--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO		Unit_Flavors
VALUES			('UNIT_AUSTRIAN_LANDWEHR', 'FLAVOR_OFFENSE', 15),
				('UNIT_AUSTRIAN_LANDWEHR', 'FLAVOR_DEFENSE', 20);


--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
				(UnitType, 			PromotionType)
SELECT			'UNIT_AUSTRIAN_LANDWEHR', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO		Unit_FreePromotions
				(UnitType,			PromotionType)
VALUES			('UNIT_AUSTRIAN_LANDWEHR', 'PROMOTION_YORKSCHER_MARCHE'),
				('UNIT_AUSTRIAN_LANDWEHR', 'PROMOTION_IMPERIAL_VIGILANCE');


--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO		Unit_ResourceQuantityRequirements
				(UnitType, 			ResourceType,	Cost)
SELECT			'UNIT_AUSTRIAN_LANDWEHR', 	ResourceType,	Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_RIFLEMAN';


--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,
			FriendlyLandsModifier)
VALUES		('PROMOTION_IMPERIAL_VIGILANCE',				'TXT_KEY_PROMOTION_IMPERIAL_VIGILANCE',		'TXT_KEY_PROMOTION_IMPERIAL_VIGILANCE_HELP',
			1,				'AS2D_IF_LEVELUP',	23,				'ABILITY_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_IMPERIAL_VIGILANCE',
			25);

INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_LANDWEHR'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_RIFLEMAN');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_LANDWEHR'), ('ART_DEF_UNIT_MEMBER_LANDWEHR'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN');

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_LANDWEHR'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_LANDWEHR'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_LANDWEHR'), Scale, ZOffset, Domain, ('civ5_ausrm1.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	VALUES	('ART_DEF_UNIT_LANDWEHR', 'Unit', 'Landwehr_SV.dds');
	



INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,
			CombatPercent)
VALUES		('PROMOTION_LANDWEHR_CS_BONUS',				'TXT_KEY_PROMOTION_LANDWEHR_CS_BONUS',		'TXT_KEY_PROMOTION_LANDWEHR_CS_BONUS_HELP',
			1,				'AS2D_IF_LEVELUP',	59,				'ABILITY_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_LANDWEHR_CS_BONUS',
			25);

INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry)
VALUES		('PROMOTION_YORKSCHER_MARCHE',				'TXT_KEY_PROMOTION_YORKSCHER_MARCHE',		'TXT_KEY_PROMOTION_YORKSCHER_MARCHE_HELP',
			1,				'AS2D_IF_LEVELUP',	3,				'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_YORKSCHER_MARCHE');



INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('ICON_ATLAS_LANDWEHR', 						256, 		'Landwehr_Icon_256.dds',				1, 				1),
		('ICON_ATLAS_LANDWEHR', 						128, 		'Landwehr_Icon_128.dds',				1, 				1),
		('ICON_ATLAS_LANDWEHR', 						80, 		'Landwehr_Icon_080.dds',				1, 				1),
		('ICON_ATLAS_LANDWEHR', 						45, 		'Landwehr_Icon_045.dds',				1, 				1),
		('ICON_ATLAS_LANDWEHR', 						64, 		'Landwehr_Icon_064.dds',				1, 				1),
		('ICON_ATLAS_LANDWEHR', 						32, 		'Landwehr_Icon_032.dds',				1, 				1),
		('LANDWEHR_FLAG', 						32, 		'Landwehr_Flag.dds',				1, 				1);
		

