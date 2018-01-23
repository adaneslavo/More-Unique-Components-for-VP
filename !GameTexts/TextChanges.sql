--==========================================================================================================================
-- LANGUAGE_EN_US
--==========================================================================================================================	
------------------------------
-- Unit Names
------------------------------
UPDATE Language_en_US SET Text = 'Indian War Elephant' WHERE Tag = 'TXT_KEY_UNIT_INDIAN_WARELEPHANT';
UPDATE Language_en_US SET Text = 'Carrack' WHERE Tag = 'TXT_KEY_UNIT_PORTUGUESE_NAU';
------------------------------
-- Building Names
------------------------------
UPDATE Language_en_US SET Text = 'Yurt' WHERE Tag = 'TXT_KEY_BUILDING_YURT';
UPDATE Language_en_US SET Text = 'Imperial Cannon Foundry' WHERE Tag = 'TXT_KEY_BUILDING_SIEGE_WORKSHOP';
------------------------------
-- Unit Texts
------------------------------
-- Ballista
UPDATE Language_en_US 
SET Text = 'Unique Roman replacement for the Catapult. This Unit is stronger than the Catapult, has no vision penalties, and has no penalty against land Units. When near a Great General, has double movement in open terrain while in enemy territory.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BALLISTA';

UPDATE Language_en_US 
SET Text = 'The Ballista is a potent replacement for the Catapult, with few of the drawbacks of a normal Siege unit. When near a Great General the Ballista can move freely in unhindering terrain, even in enemy territory. Use these war machines in conjunction with your Legions to expand quickly and consolidate your early empire. The power and flexibility of the Ballista may allow your army to ignore producing Composite Bowmen entirely.'
WHERE Tag = 'TXT_KEY_UNIT_ROMAN_BALLISTA_STRATEGY';

-- Legion
UPDATE Language_en_US
SET Text = 'The Legion is the Roman unique unit, replacing the Swordsman. The Legion is more powerful than the Swordsman, making it the one of the most powerful melee units of the Classical Era. The Legion can also construct roads and forts. When near a Great General, the Legion constructs improvements faster.'
WHERE Tag = 'TXT_KEY_UNIT_ROMAN_LEGION_STRATEGY';

-- Longbowman
UPDATE Language_en_US 
SET Text = 'Unique ranged unit of the English civilization. Replaces the Crossbowman. Begins with the [COLOR_POSITIVE_TEXT]Range[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Agincourt[ENDCOLOR] Promotions, giving increased attack range and a bonus against Mounted units.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_LONGBOWMAN';

UPDATE Language_en_US 
SET Text = ' The Longbowman has a greater range than the Crossbowman, allowing it to attack enemies three hexes away, often destroying them before they can strike back. Longbows also are more effective against Mounted opponents, thanks to their Agincourt Promotion. Like other ranged units, Longbowmen are vulnerable to melee attack.'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_LONGBOWMAN_STRATEGY';

-- Dromon
UPDATE Language_en_US 
SET Text = 'Unique naval unit of the Byzantines. Replaces the Penteconter. Deals an additional 10 damage to units it has attacked at the beginning of the enemy''s turn, stacking up to 3 times.'
WHERE Tag = 'TXT_KEY_UNIT_BYZANTIUM_DROMON_STRATEGY';

UPDATE Language_en_US 
SET Text = 'The Dromon is a powerful ranged naval unit, capable of pouring fire onto enemy ships and burning them to ash. Each attack by a Dromon inflicts an additional 10 damage at the beginning of the enemy unit''s turn, up to 3 attacks. Rush to logistics and reign fire down on your enemies.'
WHERE Tag = 'TXT_KEY_UNIT_BYZANTIUM_DROMON_HELP';

-- Carolean
UPDATE Language_en_US 
SET Text = 'Caroleans are the backbone of the Industrial era Swedish army. They start with the March promotion that allows it to Heal every turn, even if it performs an action. The Carolean also receives a 15% combat bonus when stacked with a Great General, and deals damage to all adjacent units after advancing from killing a unit.'
WHERE Tag = 'TXT_KEY_UNIT_SWEDISH_CAROLEAN_STRATEGY';

-- Hakkapeliitta
UPDATE Language_en_US 
SET Text = 'Unique Swedish Lancer. This Unit is stronger and more effective against wounded units than the Lancer. [ICON_GREAT_GENERAL] Great Generals are generated more quickly by this Unit, and they transfer their movement to [ICON_GREAT_GENERAL] Great Generals when beginning a turn stacked. Is available earlier than the Lancer.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SWEDISH_HAKKAPELIITTA';

UPDATE Language_en_US 
SET Text = 'Strong against wounded units. Stack a Great General with them if possible. The Great General receives the movement allowance of the Hakkapeliitta if they start the turn stacked.'
WHERE Tag = 'TXT_KEY_UNIT_SWEDISH_HAKKAPELIITTA_STRATEGY';

-- Monitor
UPDATE Language_en_US 
SET Text = 'Unique replacement for the Ironclad. Increases the [ICON_STRENGTH] Combat Strength of your cities when adjacent to or inside the city. Has the [COLOR_POSITIVE_TEXT]Cover I[ENDCOLOR] promotion for free.'
WHERE Tag = 'TXT_KEY_CIVIL_WAR_SCENARIO_UNIT_MONITOR_HELP';

UPDATE Language_en_US 
SET Text = 'A powerful Industrial-era naval unit. Only America may build it. It has the Cover I promotion, and gives a defensive bonus to nearby friendly cities. Monitors are effective combatants when at war, and can be used to reduce crime in peacetime.'
WHERE Tag = 'TXT_KEY_CIVIL_WAR_SCENARIO_UNIT_MONITOR_STRATEGY';

--Mandekalu Cavalry
UPDATE Language_en_US
SET Text = 'This is a Songhai unique unit, replacing the Knight. This unit is stronger than the Horseman, and it gains a significant bonus when attacking cities. The Mandekalu Cavalry can move after attacking. Its speed makes it difficult for an enemy to build a defensive line before the Mandekalu Cavalry reaches the target.'
WHERE Tag = 'TXT_KEY_UNIT_SONGHAI_MUSLIMCAVALRY_STRATEGY';

UPDATE Language_en_US
SET Text = 'Powerful Medieval Mounted Unit, weak to Pikemen. Only the Songhai may build it. This Unit is not penalized when attacking Cities, unlike the Knight which it replaces, and starts with the Raider promotion.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MUSLIM_CAVALRY';


--Pracinha
UPDATE	Language_en_US
SET	Text = 'This melee unit is stronger in faraway lands and earns Tourism when it defeats an enemy. Use them to fight wars in foreign lands to push your Civilization towards a Culture victory.'
WHERE	Tag = 'TXT_KEY_UNIT_BRAZILIAN_PRACINHA_STRATEGY';

UPDATE	Language_en_US
SET	Text = 'The Brazilian replacement for the Infantry. Modern Era infantry unit that is stronger in foreign lands and earns [ICON_TOURISM] Tourism when it defeats an enemy.'
WHERE	Tag = 'TXT_KEY_UNIT_HELP_BRAZILIAN_PRACINHA';

UPDATE Language_en_US 
SET Text = 'Unique Korean Caravel. This Unit is much stronger than the Caravel it replaces, but moves slowly in Deep Ocean.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_VENETIAN_GALLEASS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

--Turtle Ship
UPDATE Language_en_US 
SET Text = 'The Turtle Ship is an early incarnation of the Ironclad for tactical purposes, and is best used to defend coastlines. Thanks to its high Combat Strength, it can easily fight off enemy Caravels and even Frigates. Its main drawback is that, unlike the Caravel that it replaces, it cannot move easily through deep oceans.'
WHERE Tag = 'TXT_KEY_UNIT_KOREAN_TURTLE_SHIP_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_UNITS' AND Value= 1 );

------------------------------
-- Building Texts
------------------------------
-- Wat
UPDATE Language_en_US
SET Text = 'Reduces enemy spy stealing rate by 50%, and prevents the disruption of Building and Wonder construction by Spy Advanced Actions, and enemy Spies cannot cause Unrest in the City. +2 [ICON_RESEARCH] Science from Temples and Shrines in this City, and reduces [ICON_HAPPINESS_3] Crime.'
WHERE Tag = 'TXT_KEY_BUILDING_WAT_HELP';

------------------------------
-- UI Texts
------------------------------
-- Polder
UPDATE Language_en_US 
SET Text = 'A Polder can be built on tiles with access to fresh water or on marshes. It generates [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_PRODUCTION] Production. Enemy units entering a tile with a Polder lose all remaining movement. Provides additional yields once later techs are researched.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_POLDER_HELP';

UPDATE Language_en_US 
SET Text = 'A polder is a low-lying tract enclosed by dikes with the water drained. In general, polder is land reclaimed from a lake or seabed, from flood plains, or from marshes. In time, the drained land subsides so that all polder is eventually below the surrounding water level. Because of this, water seeps into the drained area and must be pumped out or otherwise drained. The dikes are usually made of readily available materials, earth or sand; in modern times these barriers might be covered or completely composed of concrete. The drained land is extremely fertile and makes excellent pasturage or cropland.[NEWLINE][NEWLINE]The first polders of reclaimed land were constructed in the 11th Century AD, although building embankments as barriers to water date back to the Romans. The Dutch have a long history of reclaiming marshes and fenland, and even the seabed, and possess half of the polder acreage in Europe. Although there are polders in other countries of Europe, and examples can be found in Asia and North America, Holland has some 3000 polders accounting for about 27 percent of the country''s land. Amsterdam itself is built largely upon polder. As the Dutch homily states, "God made the world, but the Dutch made Holland."' 
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_POLDER_TEXT';

INSERT INTO Language_en_US
			(Tag,							Text)
VALUES		('TXT_KEY_BUILD_POLDER_HELP',	'Constructs a Polder, which increases [ICON_FOOD] Food,  [ICON_GOLD] Gold, and [ICON_PRODUCTION] Production. Enemy units entering a tile with a Polder lose all remaining movement.');
------------------------------
-- UA Texts
------------------------------
-- Druidic Lore
UPDATE Language_en_US
SET Text = 'Has a unique set of Pantheon Beliefs. Owned Cities with your Religion neither generate nor receive foreign Religious Pressure. +3 [ICON_PEACE] Faith if city adopted your Pantheon. +2 [ICON_GREAT_MERCHANT] GMP in your [ICON_CAPITAL] Capital after you found a Pantheon, and in Holy City for every religious milestone.'
WHERE Tag = 'TXT_KEY_TRAIT_FAITH_FROM_NATURE';
--==========================================================================================================================
--==========================================================================================================================

