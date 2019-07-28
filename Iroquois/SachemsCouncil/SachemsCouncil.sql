--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_IROQUOIS',	'BUILDINGCLASS_COURT_SCRIBE',	'BUILDING_IROQUOIS_SACHEMS_COUNCIL');
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_IROQUOIS_ATLAS', 			256, 		'SachemsCouncilPicture_256.dds',			1, 				1),
			('BUILDING_IROQUOIS_ATLAS', 			128, 		'SachemsCouncilPicture_128.dds',			1, 				1),
			('BUILDING_IROQUOIS_ATLAS', 			64, 		'SachemsCouncilPicture_064.dds',			1, 				1),
			('BUILDING_IROQUOIS_ATLAS', 			45, 		'SachemsCouncilPicture_045.dds',			1, 				1);
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,									BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, FreePromotion,					TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, GreatPeopleRateChange,		SpecialistType, SpecialistCount,	MinAreaSize, ConquestProb, HurryCostModifier,	NationalPopRequired,	Help,												Description,								Civilopedia,										Strategy,												IconAtlas,					PortraitIndex)
SELECT		'BUILDING_IROQUOIS_SACHEMS_COUNCIL',	BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, Defense,	ExtraCityHitPoints, 'PROMOTION_UNIT_IROQUOIS_DIPLOMATIC_RECIPROCITY',	TrainedFreePromotion,	CitySupplyFlat,	DefenseHappinessChange,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, GreatPeopleRateChange+1,	SpecialistType, SpecialistCount+1,	MinAreaSize, ConquestProb, HurryCostModifier,	NationalPopRequired-5,	'TXT_KEY_BUILDING_IROQUOIS_SACHEMS_COUNCIL_HELP',	'TXT_KEY_BUILDING_IROQUOIS_SACHEMS_COUNCIL', 'TXT_KEY_BUILDING_IROQUOIS_SACHEMS_COUNCIL_TEXT',	'TXT_KEY_BUILDING_IROQUOIS_SACHEMS_COUNCIL_STRATEGY',	'BUILDING_IROQUOIS_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_COURT_SCRIBE';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 							FlavorType,			Flavor)
VALUES		('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'FLAVOR_CULTURE',	15),
			('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'FLAVOR_DIPLOMACY',	80),
			('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'FLAVOR_HAPPINESS',	5),
			('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'FLAVOR_SCIENCE',	5),
			('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'FLAVOR_GOLD',		5);
------------------------------	
-- Building_UnitCombatProductionModifiers
------------------------------		
INSERT INTO Building_UnitCombatProductionModifiers 	
			(BuildingType, 							UnitCombatType,			Modifier)
VALUES		('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'UNITCOMBAT_DIPLOMACY',	10);
------------------------------	
-- Building_ResourceQuantity
------------------------------		
INSERT INTO Building_ResourceQuantity 	
			(BuildingType, 							ResourceType,		Quantity)
VALUES		('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'RESOURCE_PAPER',	3);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 							BuildingClassType)
SELECT	'BUILDING_IROQUOIS_SACHEMS_COUNCIL',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_COURT_SCRIBE';
------------------------------	
-- Building_YieldChangesPerPop
------------------------------
INSERT INTO Building_YieldChangesPerPop 	
			(BuildingType,							YieldType,			Yield)
VALUES		('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'YIELD_CULTURE',	20);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------
INSERT INTO Building_BuildingClassYieldChanges 	
			(BuildingType,							BuildingClassType,			YieldType,			YieldChange)
VALUES		('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'BUILDINGCLASS_GROVE',		'YIELD_CULTURE',	1),
			('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'BUILDINGCLASS_CHANCERY',	'YIELD_GOLD',		2);
------------------------------	
-- Building_YieldPerAlly
------------------------------
INSERT INTO Building_YieldPerAlly 	
			(BuildingType,							YieldType, Yield)
SELECT		'BUILDING_IROQUOIS_SACHEMS_COUNCIL',	YieldType, Yield
FROM Building_YieldPerAlly WHERE BuildingType = 'BUILDING_COURT_SCRIBE';
------------------------------	
-- Building_YieldPerFriend
------------------------------
INSERT INTO Building_YieldPerFriend 	
			(BuildingType,							YieldType, Yield)
SELECT		'BUILDING_IROQUOIS_SACHEMS_COUNCIL',	YieldType, Yield
FROM Building_YieldPerFriend WHERE BuildingType = 'BUILDING_COURT_SCRIBE';
------------------------------	
-- Building_FreeUnits
------------------------------
INSERT INTO Building_FreeUnits 	
			(BuildingType,							UnitType,			NumUnits)
VALUES		('BUILDING_IROQUOIS_SACHEMS_COUNCIL',	'UNIT_EMISSARY',	1);
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 												Description, 												Help, 															Sound, 				LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 				PediaType, 		PediaEntry)
VALUES		('PROMOTION_UNIT_IROQUOIS_DIPLOMATIC_RECIPROCITY',	'TXT_KEY_PROMOTION_UNIT_IROQUOIS_DIPLOMATIC_RECIPROCITY',	'TXT_KEY_PROMOTION_UNIT_IROQUOIS_DIPLOMATIC_RECIPROCITY_HELP',	'AS2D_IF_LEVELUP',	1,					1, 				55, 			'promoMUC_atlas_00', 	'PEDIA_DIPLO',	'TXT_KEY_PROMOTION_UNIT_IROQUOIS_DIPLOMATIC_RECIPROCITY');
--==========================================================================================================================
--==========================================================================================================================
INSERT INTO UnitCombatInfos     
            (Type,                    Description)
VALUES        ('UNITCOMBAT_GREAT_DIPLOMAT',    'Great Diplomat Units');

UPDATE Units SET CombatClass = 'UNITCOMBAT_GREAT_DIPLOMAT' WHERE Type = 'UNIT_GREAT_DIPLOMAT';
--------------------------------	
-- UnitPromotions_UnitCombats
--------------------------------
INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES	('PROMOTION_UNIT_IROQUOIS_DIPLOMATIC_RECIPROCITY', 'UNITCOMBAT_GREAT_DIPLOMAT');
