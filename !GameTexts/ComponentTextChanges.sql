--==========================================================================================================================
-- LANGUAGE_EN_US
--==========================================================================================================================	
-- Ballista
UPDATE Language_en_US 
SET Text = 'Tough and accurate early Siege weapon. Only Rome may build it. This Unit is stronger than the Catapult, has no vision penalties, and has no penalty against Land Units. When near a [ICON_GREAT_GENERAL] Great General, has +1 [ICON_ARROW_RIGHT] Movement.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BALLISTA';

UPDATE Language_en_US 
SET Text = 'The Ballista is a potent replacement for the Catapult, with few of the drawbacks of a normal Siege Unit. When near a Great General the Ballista can move freely, able to move and fire even in Enemy Territory. Use these war machines in conjunction with your Legions to expand quickly and consolidate your early Empire. The power and flexibility of the Ballista may allow your army to ignore producing Composite Bowmen entirely.'
WHERE Tag = 'TXT_KEY_UNIT_ROMAN_BALLISTA_STRATEGY';

-- Legion
UPDATE Language_en_US
SET Text = 'The Legion is more powerful than the Swordsman, making it the one of the most powerful Melee Units of the Classical Era. The Legion can also construct Roads and Forts. When near a Great General, the Legion constructs Improvements faster.'
WHERE Tag = 'TXT_KEY_UNIT_ROMAN_LEGION_STRATEGY';

-- Longbowman
UPDATE Language_en_US 
SET Text = 'Formidable long-range Archery Unit. Only England may build it. Begins with the [COLOR_POSITIVE_TEXT]Range[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Agincourt[ENDCOLOR] Promotions, giving increased Attack Range and a bonus against Mounted Units.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_LONGBOWMAN';

UPDATE Language_en_US 
SET Text = ' The Longbowman has a greater Range than the Crossbowman, allowing it to attack Enemies three hexes away, often destroying them before they can strike back. Longbows also are more effective against Mounted opponents, thanks to their Agincourt Promotion. Like other Ranged Units, Longbowmen are vulnerable to Melee attack.'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_LONGBOWMAN_STRATEGY';

-- Hakkapeliitta
UPDATE Language_en_US 
SET Text = 'Mid-game cavalry, stronger and more effective against Wounded Units. Only Sweden may build it. [ICON_GREAT_GENERAL] Great Generals are generated more quickly by this Unit, and it transfers its [ICON_ARROW_RIGHT] Movement Points to stacked [ICON_GREAT_GENERAL] Great Generals at the beginning of the turn.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SWEDISH_HAKKAPELIITTA';

UPDATE Language_en_US 
SET Text = 'Strong against Wounded Units. Stack a Great General with them if possible. The Great General receives the Movement allowance of the Hakkapeliitta if they start the turn stacked.'
WHERE Tag = 'TXT_KEY_UNIT_SWEDISH_HAKKAPELIITTA_STRATEGY';

-- Monitor
UPDATE Language_en_US 
SET Text = 'Durable coastal defense craft. Only America may build it. Increases the [ICON_STRENGTH] Combat Strength of your Cities when adjacent to or inside the City. Takes reduced damage from enemy attacks.'
WHERE Tag = 'TXT_KEY_CIVIL_WAR_SCENARIO_UNIT_MONITOR_HELP';

UPDATE Language_en_US 
SET Text = 'A powerful Industrial Era Naval Unit. Only America may build it. Takes slightly reduced damage from all sources, and gives a Defensive Bonus to nearby Friendly Cities. Their rock hard defensive abilities make them a dangerous adversary in coastal engagements.'
WHERE Tag = 'TXT_KEY_CIVIL_WAR_SCENARIO_UNIT_MONITOR_STRATEGY';

-- Pracinha
UPDATE	Language_en_US
SET	Text = 'This melee unit is stronger in faraway lands and earns Tourism when it defeats an enemy. Use them to fight wars in foreign lands to push your Civilization towards a Culture victory.'
WHERE	Tag = 'TXT_KEY_UNIT_BRAZILIAN_PRACINHA_STRATEGY';

UPDATE	Language_en_US
SET	Text = 'Devastating late-game Infantry. Only Brazil may build it. Pracinha are much faster and start with [COLOR_POSITIVE_TEXT]Amphibious[ENDCOLOR] and [COLOR_POSITIVE_TEXT]DFPs[ENDCOLOR] Promotions. It is also stronger in Foreign Lands and earns [ICON_TOURISM] Tourism when it defeats an Enemy Unit.'
WHERE	Tag = 'TXT_KEY_UNIT_HELP_BRAZILIAN_PRACINHA';

-- Turtle Ship
UPDATE Language_en_US 
SET Text = 'The Turtle Ship is an early incarnation of the Ironclad for tactical purposes, and is best used to defend coastlines. Thanks to its high combat strength, it can easily fight off enemy Caravels and even Frigates. Its main drawback is that, unlike the Caravel that it replaces, it cannot move easily through deep Oceans.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_TURTLESHIP_STRATEGY';

UPDATE Language_en_US 
SET Text = 'Overpowering defensive ship. Only Korea may build it. Has higher [ICON_STRENGTH] Combat Strength, and is more effective against other Naval Melee Units. Moves slowly in deep Ocean.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_TURTLESHIP_HELP';

-- Great Galleas
UPDATE Language_en_US 
SET Text = 'Tough Medieval ranged naval unit. Only Venice may build it. This Unit is stronger than the Galleass it replaces.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_VENETIAN_GALLEASS';

UPDATE Language_en_US 
SET Text = 'The Great Galleass is slightly more powerful than the normal Galleass. The Venetian fleet''s terrible bombarding was famous in the Medieval Era and is well represented with this unit.'
WHERE Tag = 'TXT_KEY_UNIT_VENETIAN_GALLEASS_STRATEGY';

UPDATE Language_en_US 
SET Text = 'Fairly weak early-game military Unit. Only the Aztecs may build it. This Unit has higher [ICON_STRENGTH] Combat Strength than the Warrior, fights more effectively in Forests and Jungles, and heals damage when it kills an enemy Unit.[NEWLINE][NEWLINE]Automatically upgrades to an [COLOR_POSITIVE_TEXT]Eagle[ENDCOLOR] after 10 kills.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_JAGUAR';

------------------------------
-- Building Texts
------------------------------
-- Wat
UPDATE Language_en_US
SET Text = 'Reduces Enemy [ICON_SPY] Spy Stealing Rate by 50%. +2 [ICON_RESEARCH] Science from Temples and Shrines in this City. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress. Available earlier.[NEWLINE][NEWLINE]Contains 2 slots for Great Works of Writing[NEWLINE]+3 [ICON_RESEARCH] Science and [ICON_PEACE] Faith when themed.'
WHERE Tag = 'TXT_KEY_BUILDING_WAT_HELP';

--Caravansary
UPDATE Language_en_US
SET Text = 'When a [ICON_INTERNATIONAL_TRADE] Land Trade Route originating here and targeting another Civ is completed, receive a [ICON_TOURISM] Tourism boost with the Civ based on recent [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism output.[NEWLINE][NEWLINE]+1 [ICON_FOOD] Food and [ICON_GOLD] Gold for every 3 Desert or 3 Tundra tiles worked by the City. Land Trade Routes gain +50% Range and +3 [ICON_GOLD] Gold, Merchant Specialists in this City gain +1 [ICON_GOLD] Gold. [NEWLINE]Nearby [ICON_RES_TRUFFLES] Truffles: +2 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COTTON] Cotton: +1 [ICON_PRODUCTION] Production, +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_FUR] Furs: +1 [ICON_GOLD] Gold, +1 [ICON_PRODUCTION] Production.[NEWLINE]Nearby [ICON_RES_FLAX] Flax: +1 [ICON_GOLD] Gold, +1 [ICON_PEACE] Faith.'
WHERE Tag = 'TXT_KEY_BUILDING_CARAVANSARY_HELP';

--Burial Tomb
UPDATE Language_en_US
SET Text = 'Receive a free unique Egyptian [ICON_GREAT_WORK] Artifact when constructed.[NEWLINE][NEWLINE]When a [ICON_INTERNATIONAL_TRADE] Land Trade Route originating here and targeting another Civ is completed, receive a [ICON_TOURISM] Tourism boost with the Civ based on your recent [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism output.[NEWLINE][NEWLINE]+1 [ICON_GOLD] Gold and [ICON_FOOD] Food for every 2 Desert or Tundra tiles worked by the City. Land Trade Routes gain +50% Range and +2 [ICON_GOLD] Gold, Merchant Specialists in this City gain +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_TRUFFLES] Truffles: +2 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COTTON] Cotton: +1 [ICON_PRODUCTION] Production, +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_FUR] Furs: +1 [ICON_GOLD] Gold, +1 [ICON_PRODUCTION] Production.[NEWLINE]Nearby [ICON_RES_FLAX] Flax: +1 [ICON_GOLD] Gold, +1 [ICON_PEACE] Faith.'
WHERE Tag = 'TXT_KEY_BUILDING_BURIAL_TOMB_HELP';

--Coffee House
UPDATE Language_en_US
SET Text = '+33% [ICON_GREAT_PEOPLE] Great People generation in this City. 10% of the City''s [ICON_CULTURE] Culture converted to [ICON_RESEARCH] Science every turn.[NEWLINE][NEWLINE]Carries over 15% of [ICON_FOOD] Food after City growth (effect stacks with Aqueduct), and reduces [ICON_HAPPINESS_3] Poverty.[NEWLINE]Nearby [ICON_RES_FIGS] Figs: +1 [ICON_GOLD] Gold, +1 [ICON_PRODUCTION] Production, +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]Requires an Aqueduct in the City.'
WHERE Tag = 'TXT_KEY_BUILDING_COFFEE_HOUSE_HELP';

--Grocer
UPDATE Language_en_US
SET Text = '+1 [ICON_FOOD] Food for every 5 [ICON_CITIZEN] Citizens in the City. Carries over 15% of [ICON_FOOD] Food after City growth (effect stacks with Aqueduct).[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty.[NEWLINE]Nearby [ICON_RES_FIGS] Figs: +1 [ICON_GOLD] Gold, +1 [ICON_PRODUCTION] Production, +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]Requires an Aqueduct in the City.'
WHERE Tag = 'TXT_KEY_BUILDING_GROCER_HELP';
------------------------------
-- UA Texts
------------------------------
-- Sacrificial Captives
UPDATE Language_en_US
SET Text = 'Flower War'
WHERE Tag = 'TXT_KEY_TRAIT_CULTURE_FROM_KILLS_SHORT';
--------------------------------	
-- Promotion Text
--------------------------------
--==========================================================================================================================
--==========================================================================================================================

