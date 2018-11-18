/*
VPEE compatibility patch!
0 = Disabled disregarding if its detects VPEE by Infixo.
1 = Enabled if it detects the VPEE by Infixo.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('MUCfVP-EE', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MUCfVP-EE' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_BASTION') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 0);

-- Main Compatibility Code
	-- Armada
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_EE_SHIP_OF_THE_LINE' WHERE UnitType = 'UNIT_SPAIN_ARMADA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_ROCKETRY' WHERE Type = 'UNIT_SPAIN_ARMADA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET PrereqTech = 'TECH_EE_EXPLORATION' WHERE Type = 'UNIT_SPAIN_ARMADA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Cost = '350' WHERE Type = 'UNIT_SPAIN_ARMADA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Black Tug
	UPDATE Units SET ObsoleteTech = 'TECH_RIFLING' WHERE Type = 'UNIT_MONGOLIA_BLACK_TUG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Cacadores
	UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_EE_SKIRMISHER' WHERE UnitType = 'UNIT_PORTUGUESE_CACADORES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_GATLINGGUN' WHERE UnitType = 'UNIT_PORTUGUESE_CACADORES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Class = 'UNITCLASS_EE_SKIRMISHER' WHERE Type = 'UNIT_PORTUGUESE_CACADORES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_BALLISTICS' WHERE Type = 'UNIT_PORTUGUESE_CACADORES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET PrereqTech = 'TECH_EE_FORTIFICATION' WHERE Type = 'UNIT_PORTUGUESE_CACADORES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Combat = '25' WHERE Type = 'UNIT_PORTUGUESE_CACADORES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET RangedCombat = '38' WHERE Type = 'UNIT_PORTUGUESE_CACADORES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Cost = '375' WHERE Type = 'UNIT_PORTUGUESE_CACADORES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	INSERT INTO	Unit_FreePromotions SELECT 'UNIT_PORTUGUESE_CACADORES', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EE_SKIRMISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'Ranged unit of the Enlightenment Era. Only Portugal may build it. Whenever it levels up, it gains a random promotion from the Trailblazer or Survivalism lines.'
		WHERE Tag = 'TXT_KEY_UNIT_PORTUGUESE_CACADORES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'The Cacador is the unique Portuguese replacement for the Light Infantry. It gains recon promotions by leveling up, allowing it to excel in hostile terrain.'
		WHERE Tag = 'TXT_KEY_UNIT_PORTUGUESE_CACADORES_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Carolean
	DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_SWEDEN' AND UnitClassType = 'UNITCLASS_RIFLEMAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Cost = '400', FaithCost = '500' WHERE Type = 'UNIT_SWEDISH_CAROLEAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Class = 'UNITCLASS_EE_LINE_INFANTRY' WHERE Type = 'UNIT_SWEDISH_CAROLEAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET PrereqTech = 'TECH_EE_FLINTLOCK' WHERE Type = 'UNIT_SWEDISH_CAROLEAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Combat = '34' WHERE Type = 'UNIT_SWEDISH_CAROLEAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_REPLACEABLE_PARTS' WHERE Type = 'UNIT_SWEDISH_CAROLEAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1); 
	UPDATE Units SET GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN' WHERE Type = 'UNIT_SWEDISH_CAROLEAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_RIFLEMAN' WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Unit_Flavors SET Flavor = '20' WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN' AND FlavorType = 'FLAVOR_OFFENSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Unit_Flavors SET Flavor = '20' WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN' AND FlavorType = 'FLAVOR_DEFENSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Corsair
	UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_EE_SHIP_OF_THE_LINE' WHERE UnitType = 'UNIT_MOROCCO_CORSAIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Class = 'UNITCLASS_EE_SHIP_OF_THE_LINE' WHERE Type = 'UNIT_MOROCCO_CORSAIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Combat = '35' WHERE Type = 'UNIT_MOROCCO_CORSAIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Cost = '400' WHERE Type = 'UNIT_MOROCCO_CORSAIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	INSERT INTO	Unit_FreePromotions SELECT 'UNIT_MOROCCO_CORSAIR', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EE_SHIP_OF_THE_LINE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'The Corsair is the unique Moroccan replacement for the Ship of the Line. It specializes in raiding and pillaging maritime trade routes, earning Food and Production for each enemy unit killed and trade route plundered. The unit can enter other Civilization''s borders, even without an open borders agreement, which can be exploited to disrupt better protected trade routes.'
		WHERE Tag = 'TXT_KEY_UNIT_MOROCCO_CORSAIR_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'Naval unit that specializes in piracy and disrupting maritime trade. Available earlier than the Ship of the Line. Only Morocco can build it. It gains [ICON_FOOD] Food and [ICON_PRODUCTION] Production from killing units, pillaging resources, and plundering trade routes.[NEWLINE][NEWLINE]Can enter rival territory.'
		WHERE Tag = 'TXT_KEY_UNIT_MOROCCO_CORSAIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Dromon
	UPDATE Units SET ObsoleteTech = 'TECH_EE_WARSHIPS' WHERE Type = 'UNIT_BYZANTIUM_DROMON' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Fusta
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_EE_GALLEON' WHERE UnitType = 'UNIT_VENICE_FUSTA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_EE_WARSHIPS' WHERE Type = 'UNIT_VENICE_FUSTA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Great Bombard
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_EE_FIELD_GUN' WHERE UnitType = 'UNIT_OTTOMANS_GREAT_TURKISH_BOMBARD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_RIFLING' WHERE Type = 'UNIT_OTTOMANS_GREAT_TURKISH_BOMBARD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Great Galleas
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_EE_GALLEON' WHERE UnitType = 'UNIT_VENETIAN_GALLEASS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_EE_WARSHIPS' WHERE Type = 'UNIT_VENETIAN_GALLEASS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Hakkapeliitta
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_EE_UHLAN' WHERE UnitType = 'UNIT_SWEDISH_HAKKAPELIITTA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_COMBUSTION' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_UHLAN' WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Klepht
	UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_EE_SKIRMISHER' WHERE UnitType = 'UNIT_GREECE_KLEPHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_GATLINGGUN' WHERE UnitType = 'UNIT_GREECE_KLEPHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Class = 'UNITCLASS_EE_SKIRMISHER' WHERE Type = 'UNIT_GREECE_KLEPHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_BALLISTICS' WHERE Type = 'UNIT_GREECE_KLEPHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET PrereqTech = 'TECH_EE_FORTIFICATION' WHERE Type = 'UNIT_GREECE_KLEPHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Combat = '23' WHERE Type = 'UNIT_GREECE_KLEPHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET RangedCombat = '38' WHERE Type = 'UNIT_GREECE_KLEPHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Cost = '325' WHERE Type = 'UNIT_GREECE_KLEPHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	INSERT INTO	Unit_FreePromotions SELECT 'UNIT_GREECE_KLEPHT', PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EE_SKIRMISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'A quick and elusive guerilla fighter. The Klepht is not as powerful as the Light Infantry it replaces, but can move quickly through hills, even after attacking. This unit also gains gold and production for every city-state ally every time it attacks a unit.'
		WHERE Tag = 'TXT_KEY_UNIT_GREECE_KLEPHT_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'Unique Enlightenment Era Unit.  Only the Greeks may build it. This unit is slightly weaker than the Light Infantry, but can move quickly through hills and can move after attacking. Receives the [COLOR_POSITIVE_TEXT]Philhellenism[ENDCOLOR] Promotion for free.'
		WHERE Tag = 'TXT_KEY_UNIT_GREECE_KLEPHT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Langskib
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_EE_CARRACK' WHERE UnitType = 'UNIT_DENMARK_LANGSKIB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_NAVIGATION' WHERE Type = 'UNIT_DENMARK_LANGSKIB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Licorne
	UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_EE_FIELD_GUN' WHERE UnitType = 'UNIT_RUSSIA_LICORNE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_FIELD_GUN' WHERE UnitType = 'UNIT_RUSSIA_LICORNE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Class = 'UNITCLASS_EE_FIELD_GUN' WHERE Type = 'UNIT_RUSSIA_LICORNE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_BALLISTICS' WHERE Type = 'UNIT_RUSSIA_LICORNE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET PrereqTech = 'TECH_EE_FLINTLOCK' WHERE Type = 'UNIT_RUSSIA_LICORNE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Combat = '20' WHERE Type = 'UNIT_RUSSIA_LICORNE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET RangedCombat = '35' WHERE Type = 'UNIT_RUSSIA_LICORNE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Cost = '375' WHERE Type = 'UNIT_RUSSIA_LICORNE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'Unique Enlightenment Era Siege Unit. Only the Russians may build it. This Unit has better mobility in enemy territory, can move after attacking, and is more effective against Unmounted Melee units.'
		WHERE Tag = 'TXT_KEY_UNIT_RUSSIA_LICORNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Mandekalu Cavalry
	UPDATE Units SET ObsoleteTech = 'TECH_RIFLING' WHERE Type = 'UNIT_SONGHAI_MUSLIMCAVALRY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Prau
	UPDATE Units SET ObsoleteTech = 'TECH_EE_EXPLORATION' WHERE Type = 'UNIT_INDONESIA_PRAU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Prowler
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_EE_SKIRMISHER' WHERE UnitType = 'UNIT_IROQUOIS_PROWLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_DYNAMITE' WHERE Type = 'UNIT_IROQUOIS_PROWLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Qizilbash
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_EE_UHLAN' WHERE UnitType = 'UNIT_PERSIA_QIZILBASH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_COMBUSTION' WHERE Type = 'UNIT_PERSIA_QIZILBASH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Shotel Swordsman
	UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_2HANDER' WHERE UnitType = 'UNIT_ETHIOPIA_SHOTELAI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_EE_FLINTLOCK' WHERE Type = 'UNIT_ETHIOPIA_SHOTELAI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Seir Morb
	UPDATE Units SET Range = '3' WHERE Type = 'UNIT_SIAM_SEIR_MORB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'Unique Industrial Era Unit.  Only the Siamese may build it. More powerful than the Howitzer it replaces and has a bonus against naval units instead of a penalty, but does not have the [COLOR_RED]Bonus vs Cities[ENDCOLOR] promotion. Deals more damage in a turn the less the unit has moved and receives [COLOR_POSITIVE_TEXT]Cover I[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Cover II[ENDCOLOR] promotions for free.'
		WHERE Tag = 'TXT_KEY_UNIT_SIAM_SEIR_MORB_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'A powerful coastal defense cannon, the Seir Morb is more powerful than the Howitzer it replaces, especially against naval targets, but deals less damage to cities. The Seir Morb receives a combat boost for every remaining movement point when attacking, so pick a good spot and keep it steady.  Location, Location, Location.'
		WHERE Tag = 'TXT_KEY_UNIT_SIAM_SEIR_MORB_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Turtle Ship
	UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_EE_CARRACK' WHERE UnitType = 'UNIT_KOREAN_TURTLE_SHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_INDUSTRIALIZATION' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Class = 'UNITCLASS_EE_CARRACK' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET PrereqTech = 'TECH_ASTRONOMY' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Combat = '38' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Moves = '3' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Units SET Cost = '250' WHERE Type = 'UNIT_KOREAN_TURTLE_SHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'The Turtle Ship is an early incarnation of the Ironclad for tactical purposes, and is best used to defend coastlines. Thanks to its high Combat Strength, it can easily fight off enemy Caravels and even Frigates. Its main drawback is that, unlike the Carrack that it replaces, it cannot move easily through deep oceans.'
		WHERE Tag = 'TXT_KEY_CIV5_KOREA_TURTLESHIP_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'Korean replacement for the Carrack. High [ICON_STRENGTH] Combat Strength, and more effective against other melee naval units. Moves slowly in Deep Ocean'
		WHERE Tag = 'TXT_KEY_CIV5_KOREA_TURTLESHIP_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Xiafan Guanjun
	UPDATE Units SET PrereqTech = 'TECH_NAVIGATION' WHERE Type = 'UNIT_CHINA_XIAFAN_GUANJUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Yellow Brow
	UPDATE Units SET ObsoleteTech = 'TECH_RIFLING' WHERE Type = 'UNIT_SHOSHONE_YELLOW_BROW' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- BUILDINGS
	-- Grande Ecole
	UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = 'BUILDINGCLASS_EE_ACADEMY' WHERE BuildingType = 'BUILDING_FRANCE_GRANDE_ECOLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET BuildingClass = 'BUILDINGCLASS_EE_ACADEMY' WHERE Type = 'BUILDING_FRANCE_GRANDE_ECOLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET PrereqTech = 'TECH_EE_HUMANISM' WHERE Type = 'BUILDING_FRANCE_GRANDE_ECOLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET GoldMaintenance = '6' WHERE Type = 'BUILDING_FRANCE_GRANDE_ECOLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET Cost = '750' WHERE Type = 'BUILDING_FRANCE_GRANDE_ECOLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET IlliteracyHappinessChange = '-25' WHERE Type = 'BUILDING_FRANCE_GRANDE_ECOLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET MutuallyExclusiveGroup = '-1' WHERE Type = 'BUILDING_FRANCE_GRANDE_ECOLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET FaithCost = '0' WHERE Type = 'BUILDING_FRANCE_GRANDE_ECOLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Building_YieldChanges SET Yield = '2' WHERE BuildingType = 'BUILDING_FRANCE_GRANDE_ECOLE' AND YieldType = 'YIELD_PRODUCTION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Building_YieldChanges SET Yield = '3' WHERE BuildingType = 'BUILDING_FRANCE_GRANDE_ECOLE' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Building_YieldChangesPerPop SET Yield = '20' WHERE BuildingType = 'BUILDING_FRANCE_GRANDE_ECOLE' AND YieldType = 'YIELD_PRODUCTION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Building_YieldChangesPerPop SET Yield = '40' WHERE BuildingType = 'BUILDING_FRANCE_GRANDE_ECOLE' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'The Grande Ecole is the French unique building, replacing the Academy. In addition to the normal bonuses of an Academy, The Grande Ecole increases production for every citizen in the City, and has a Scientist Specialist slot. Grande Ecoles can be built in cities with a Salon, so they do not block your cultural growth like a normal Academy. In addition, all Scientists generate more Production, and all Engineers generate more Science, making any city with a Grande Ecole a powerhouse of scientific and technical achievement.'
		WHERE Tag = 'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'Unique French replacement for the Public School.[NEWLINE][NEWLINE]+2 [ICON_RESEARCH] Science and +1 [ICON_PRODUCTION] Production for every 5 [ICON_CITIZEN] Citizens in the City. +2 [ICON_PRODUCTION] Production for Scientists and +2 [ICON_RESEARCH] Science for Engineers in this City. Reduces [ICON_HAPPINESS_4] Unhappiness generated by Illiteracy. Allows Archaeologists to be built in this city. +2 [ICON_RESEARCH] Science and +2 [ICON_PRODUCTION] Production at Computers.[NEWLINE][NEWLINE]Can be built in a city with a Salon.'
		WHERE Tag = 'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Sambadrome
	UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = 'BUILDINGCLASS_EE_SALON' WHERE BuildingType = 'BUILDING_BRAZIL_SAMBADROME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET BuildingClass = 'BUILDINGCLASS_EE_SALON' WHERE Type = 'BUILDING_BRAZIL_SAMBADROME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET PrereqTech = 'TECH_EE_HUMANISM' WHERE Type = 'BUILDING_BRAZIL_SAMBADROME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET GoldMaintenance = '4' WHERE Type = 'BUILDING_BRAZIL_SAMBADROME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET Cost = '750' WHERE Type = 'BUILDING_BRAZIL_SAMBADROME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET IlliteracyHappinessChange = '-20' WHERE Type = 'BUILDING_BRAZIL_SAMBADROME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET MutuallyExclusiveGroup = '-1' WHERE Type = 'BUILDING_BRAZIL_SAMBADROME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET CultureRateModifier = '0' WHERE Type = 'BUILDING_BRAZIL_SAMBADROME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	DELETE FROM Building_SpecificGreatPersonRateModifier WHERE BuildingType = 'BUILDING_BRAZIL_SAMBADROME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET TechEnhancedTourism = '0' WHERE Type = 'BUILDING_BRAZIL_SAMBADROME' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Building_YieldChangesPerPop SET Yield = '17' WHERE BuildingType = 'BUILDING_BRAZIL_SAMBADROME' AND YieldType = 'YIELD_CULTURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'The Sambadrome is the unique Brazilian replacement for the Salon. In addition to the bonuses of a Salon, the Sambadrome also generates Golden Age Points and Tourism. The Sambadrome can be built in cities with an Academy, so they do not block your scientific growth like a normal Salon. Comes with a Musician specialist slot, and all Musicians in the city generate extra Gold and Golden Age Points.'
		WHERE Tag = 'TXT_KEY_BUILDING_BRAZIL_SAMBADROME_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'Unique Brazilian replacement for the Salon. +1 [ICON_CULTURE] Culture for every 6 [ICON_CITIZEN] Population in City.[NEWLINE][NEWLINE]Musicians in City produce +1 [ICON_GOLD] Gold and +2 [ICON_GOLDEN_AGE] Golden Age Points. +25% [ICON_GOLDEN_AGE] Golden Age Points during Golden Ages. +2 [ICON_TOURISM] Tourism at Radio.[NEWLINE][NEWLINE]Can be built in a city with an Academy'
		WHERE Tag = 'TXT_KEY_BUILDING_BRAZIL_SAMBADROME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Schutzenstand
	UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = 'BUILDINGCLASS_EE_GUNSMITH' WHERE BuildingType = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET BuildingClass = 'BUILDINGCLASS_EE_GUNSMITH' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET PrereqTech = 'TECH_EE_FLINTLOCK' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET GoldMaintenance = '4' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET Defense = '0' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET ExtraCityHitPoints = '0' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET CitySupplyModifier = '0' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET CitySupplyFlat = '2' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET AllowsRangeStrike = '0' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET HealRateChange = '0' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET CityRangedStrikeRange = '0' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET CityIndirectFire = '0' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET BlockScienceTheft = '0' WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Building_UnitCombatFreeExperiences SET Experience = '25' WHERE BuildingType = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_AUSTRIA_STANDSCHUTZEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = '+1 [ICON_PRODUCTION] Production and +1 [ICON_CULTURE] Culture per city-state ally. +30% [ICON_PRODUCTION] Production and 15XP toward Gunpowder Units, and +15% [ICON_PRODUCTION] Production to all other Land Military Units. +2 Unit Supply Cap.'
		WHERE Tag = 'TXT_KEY_BUILDING_AUSTRIA_STANDSCHUTZEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'The Schützenstand is an Austrian unique building, replacing the Gunsmith. It is cheaper than the Gunsmith, and allows for faster construction of land military units in the city. It also provides +1 [ICON_PRODUCTION] Production and +1 [ICON_CULTURE] Culture per city-state ally.'
		WHERE Tag = 'TXT_KEY_BUILDING_AUSTRIA_STANDSCHUTZEN_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Waag
	UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = 'BUILDINGCLASS_EE_WEIGH_HOUSE' WHERE BuildingType = 'BUILDING_NETHERLANDS_WAAG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET BuildingClass = 'BUILDINGCLASS_EE_WEIGH_HOUSE' WHERE Type = 'BUILDING_NETHERLANDS_WAAG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET PrereqTech = 'TECH_ECONOMICS' WHERE Type = 'BUILDING_NETHERLANDS_WAAG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET GoldMaintenance = '5' WHERE Type = 'BUILDING_NETHERLANDS_WAAG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET Cost = '750' WHERE Type = 'BUILDING_NETHERLANDS_WAAG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET SpecialistCount = '1' WHERE Type = 'BUILDING_NETHERLANDS_WAAG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET TradeRouteSeaGoldBonus = '100' WHERE Type = 'BUILDING_NETHERLANDS_WAAG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET PovertyHappinessChange = '-25' WHERE Type = 'BUILDING_NETHERLANDS_WAAG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Building_YieldChanges SET Yield = '5' WHERE BuildingType = 'BUILDING_NETHERLANDS_WAAG' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1); 
	UPDATE Building_YieldChangesPerPop SET Yield = '50' WHERE BuildingType = 'BUILDING_NETHERLANDS_WAAG' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_NETHERLANDS_WAAG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	DELETE FROM Building_YieldFromPurchase WHERE BuildingType = 'BUILDING_NETHERLANDS_WAAG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	DELETE FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = 'BUILDING_NETHERLANDS_WAAG' AND BuildingClassType = 'BUILDINGCLASS_MINT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	DELETE FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = 'BUILDING_NETHERLANDS_WAAG' AND BuildingClassType = 'BUILDINGCLASS_CARAVANSARY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'The Waag is the Netherlands'' unique replacement for the Weigh House. In addition to the normal bonuses of a Weigh House, the Waag comes earlier, and provides bonuses to Great Person Generation and defense for every luxury imported or exported in the Empire. Be sure to keep peaceful and lucrative relationships with your neighbors; a surprise war with a trading partner could suddenly weaken your city''s defenses!'
		WHERE Tag = 'TXT_KEY_BUILDING_NETHERLANDS_WAAG_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'Unique Dutch replacement for the Weigh House. Cheaper, and Available earlier.[NEWLINE][NEWLINE]+1 [ICON_GOLD] Gold  for every [ICON_CITIZEN] Citizen in the city. 1 Merchant specialist in this city. +3 [ICON_GOLD] Gold to Market in this City.[NEWLINE][NEWLINE]+2% [ICON_GREAT_PEOPLE] Great Person Generation and +1 [ICON_STRENGTH] Combat Strength in City for every Luxury Resource traded on Empire, up to a maximum of 10 traded resources.[NEWLINE]Reduces Poverty slightly.'
		WHERE Tag = 'TXT_KEY_BUILDING_NETHERLANDS_WAAG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- White Tower
	UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = 'BUILDINGCLASS_EE_SUMMER_PALACE' WHERE BuildingType = 'BUILDING_ENGLAND_WHITE_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET BuildingClass = 'BUILDINGCLASS_EE_SUMMER_PALACE' WHERE Type = 'BUILDING_ENGLAND_WHITE_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET PrereqTech = 'TECH_EE_SOVEREIGNTY' WHERE Type = 'BUILDING_ENGLAND_WHITE_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET MinorityHappinessChangeGlobal = '-50' WHERE Type = 'BUILDING_ENGLAND_WHITE_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET FreeGreatPeople = '1' WHERE Type = 'BUILDING_ENGLAND_WHITE_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET NationalPopRequired = '35' WHERE Type = 'BUILDING_ENGLAND_WHITE_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Buildings SET GreatWorkCount = '2' WHERE Type = 'BUILDING_ENGLAND_WHITE_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Building_ThemingYieldBonus SET Yield = '3' WHERE BuildingType = 'BUILDING_ENGLAND_WHITE_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Building_YieldChanges SET Yield = '3' WHERE BuildingType = 'BUILDING_ENGLAND_WHITE_TOWER' AND YieldType = 'YIELD_CULTURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1); 
	DELETE FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_ENGLAND_WHITE_TOWER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US
		SET Text = 'Unique replacement for the Tower of Buddhist Incense. Only England may build it. Receive your choice of a free [ICON_GREAT_PEOPLE] Great Person.[NEWLINE][NEWLINE]+3 [ICON_GOLD] Gold to Constabulary and +3 [ICON_FOOD] Food to Arsenal in City. +2 [ICON_CULTURE] Culture for all Castles on Empire, and -25% Spy stealing rate on Empire.[NEWLINE][NEWLINE]+1 [ICON_HAPPINESS_1] Happiness on Empire for every enemy spy killed on Empire.[NEWLINE][NEWLINE]Contains 2 slots for Great Works of Art/Artifact, and comes with a free Great Work of Art. +3 [ICON_GOLD] Gold and +3 [ICON_CULTURE] Culture when themed.[NEWLINE][NEWLINE]Requires Castle in City.[NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
		WHERE Tag = 'TXT_KEY_BUILDING_ENGLAND_WHITE_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_en_US 
		SET Text = 'Unique English replacement for the Tower of Buddhist Incense. Receive your choice of a free great person, and 2 culture for every castle in the empire. The White Tower reduces the stealing rate of enemy spies on empire, and gives Happiness for every enemy spy killed. Your citizens will love you if you can keep a tight lid on English secrets, so station spies in your cities to take advantage of this wonder.'
		WHERE Tag = 'TXT_KEY_BUILDING_ENGLAND_WHITE_TOWER_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
