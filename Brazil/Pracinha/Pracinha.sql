-- Insert SQL Rules Here 

--------------------------------	
-- UnitClasses
--------------------------------
DELETE FROM UnitClasses WHERE Type = 'UNITCLASS_BRAZILIAN_PRACINHA';

--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
			(CivilizationType, UnitClassType, UnitType)
VALUES		('CIVILIZATION_BRAZIL', 'UNITCLASS_INFANTRY', 'UNIT_BRAZILIAN_PRACINHA');

--------------------------------
-- Units
--------------------------------	
UPDATE	Units
SET		Combat = 50, Cost = 800, FaithCost = 700, Moves = 3, Class = 'UNITCLASS_GREAT_WAR_INFANTRY', PrereqTech = 'TECH_REPLACEABLE_PARTS', MinorCivGift = 0
WHERE	Type = 'UNIT_BRAZILIAN_PRACINHA';

--------------------------------
-- Unit_FreePromotions
--------------------------------	
DELETE FROM	Unit_FreePromotions
WHERE		UnitType = 'UNIT_BRAZILIAN_PRACINHA';

INSERT INTO Unit_FreePromotions
			(UnitType, PromotionType)
VALUES		('UNIT_BRAZILIAN_PRACINHA', 'PROMOTION_EXPEDITIONARY_FORCE');

INSERT INTO Unit_FreePromotions
			(UnitType, PromotionType)
VALUES		('UNIT_BRAZILIAN_PRACINHA', 'PROMOTION_TOURISM');


--------------------------------
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry,
			CapitalDefenseModifier, CapitalDefenseFalloff)
VALUES		('PROMOTION_EXPEDITIONARY_FORCE',				'TXT_KEY_PROMOTION_EXPEDITIONARY_FORCE',		'TXT_KEY_PROMOTION_EXPEDITIONARY_FORCE_HELP',
			1,				'AS2D_IF_LEVELUP',	3, 'EXPANSION_PROMOTION_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_EXPEDITIONARY_FORCE',
			1,						1);

INSERT INTO UnitPromotions
			(Type,										Description,								Help,						
			CannotBeChosen,		Sound,			PortraitIndex,	IconAtlas,			PediaType,		PediaEntry)
VALUES		('PROMOTION_TOURISM',				'TXT_KEY_PROMOTION_TOURISM',		'TXT_KEY_PROMOTION_TOURISM_HELP',
			1,				'AS2D_IF_LEVELUP',	2, 'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_MELEE',			'TXT_KEY_PROMOTION_TOURISM');

--------------------------------
-- Language_en_US
--------------------------------	
UPDATE	Language_en_US
SET		Text = 'This melee unit is stronger in faraway lands and earns Tourism when it defeats an enemy. Use them to fight wars in foreign lands to push your Civilization towards a Culture victory.'
WHERE	Tag = 'TXT_KEY_UNIT_BRAZILIAN_PRACINHA_STRATEGY';

UPDATE	Language_en_US
SET		Text = 'The Brazilian replacement for the Rifleman. Modern Era infantry unit that is stronger in foreign lands and earns [ICON_TOURISM] Tourism when it defeats an enemy.'
WHERE	Tag = 'TXT_KEY_UNIT_HELP_BRAZILIAN_PRACINHA';

--------------------------------
-- EventChoices
--------------------------------	
INSERT INTO EventChoices
			(Type, EventDuration, Expires)
VALUES		('PLAYER_EVENT_CHOICE_PRACINHA_TOURISM', 1, 1);

--------------------------------
-- EventChoices
--------------------------------	
INSERT INTO EventChoice_InstantYield
			(EventChoiceType, YieldType, Yield)
VALUES		('PLAYER_EVENT_CHOICE_PRACINHA_TOURISM', 'YIELD_TOURISM', 200);