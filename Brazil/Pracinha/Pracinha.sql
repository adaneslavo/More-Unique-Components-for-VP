--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType, UnitClassType, UnitType)
VALUES		('CIVILIZATION_BRAZIL', 'UNITCLASS_INFANTRY', 'UNIT_BRAZILIAN_PRACINHA');
--==========================================================================================================================	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
--------------------------------	
-- UnitClasses
--------------------------------
DELETE FROM UnitClasses WHERE Type = 'UNITCLASS_BRAZILIAN_PRACINHA';
--------------------------------
-- Units
--------------------------------	
UPDATE	Units
SET		Combat = 64, Cost = 1300, FaithCost = 700, Moves = 3, Class = 'UNITCLASS_INFANTRY', PrereqTech = 'TECH_RADIO', MinorCivGift = 0, BaseLandAirDefense = 8
WHERE	Type = 'UNIT_BRAZILIAN_PRACINHA';
--------------------------------
-- Unit_FreePromotions
--------------------------------	
DELETE FROM	Unit_FreePromotions
WHERE		UnitType = 'UNIT_BRAZILIAN_PRACINHA';

INSERT INTO Unit_FreePromotions
			(UnitType,					PromotionType)
VALUES		('UNIT_BRAZILIAN_PRACINHA', 'PROMOTION_UNIT_BRAZIL_EXPEDITIONARY_FORCE'),
			('UNIT_BRAZILIAN_PRACINHA', 'PROMOTION_UNIT_BRAZIL_TOURISM'),
			('UNIT_BRAZILIAN_PRACINHA', 'PROMOTION_AMPHIBIOUS'),
			('UNIT_BRAZILIAN_PRACINHA', 'PROMOTION_FIELD_WORKS_3');
--==========================================================================================================================	

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
--------------------------------
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,											Description,											Help,														CannotBeChosen,		Sound,				PortraitIndex,	IconAtlas,				PediaType,		PediaEntry,												CapitalDefenseModifier, CapitalDefenseFalloff)
VALUES		('PROMOTION_UNIT_BRAZIL_EXPEDITIONARY_FORCE',	'TXT_KEY_PROMOTION_UNIT_BRAZIL_EXPEDITIONARY_FORCE',	'TXT_KEY_PROMOTION_UNIT_BRAZIL_EXPEDITIONARY_FORCE_HELP',	1,					'AS2D_IF_LEVELUP',	26,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_BRAZIL_EXPEDITIONARY_FORCE',	1,						1);

INSERT INTO UnitPromotions
			(Type,								Description,								Help,											CannotBeChosen,	Sound,				PortraitIndex,	IconAtlas,				PediaType,		PediaEntry)
VALUES		('PROMOTION_UNIT_BRAZIL_TOURISM',	'TXT_KEY_PROMOTION_UNIT_BRAZIL_TOURISM',	'TXT_KEY_PROMOTION_UNIT_BRAZIL_TOURISM_HELP',	1,				'AS2D_IF_LEVELUP',	27,				'promoMUC_atlas_00',	'PEDIA_MELEE',	'TXT_KEY_PROMOTION_UNIT_BRAZIL_TOURISM');
--==========================================================================================================================	

--==========================================================================================================================	
-- EVENTS
--==========================================================================================================================	
--------------------------------
-- EventChoices
--------------------------------	
INSERT INTO EventChoices
			(Type,										EventDuration,	Expires)
VALUES		('PLAYER_EVENT_CHOICE_PRACINHA_TOURISM',	1,				1);
--------------------------------
-- EventChoices
--------------------------------	
INSERT INTO EventChoice_InstantYield
			(EventChoiceType,							YieldType,			Yield)
VALUES		('PLAYER_EVENT_CHOICE_PRACINHA_TOURISM',	'YIELD_TOURISM',	200);
--==========================================================================================================================
--==========================================================================================================================
