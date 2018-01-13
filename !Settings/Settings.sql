--Pillaging check for Tug Banner Warrior
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';

--Celtic UA change
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_FOUND_RELIGION';

--CityConstructed/Trained/Prepared
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_CITY';

--Iroquoian Great Diplomat CS missions
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_GREAT_PEOPLE';

--Koa's bleeding and others
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_RESULT';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_ENDED';

--Great Diplomat's promotions from Sachem's Council
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';

--Kibitum promotion check
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_UPGRADES';

--Pairidaeza and Huey Teocalli Golden Age check
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_GOLDEN_AGE';

--Dummy Policies
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'BUGFIX_DUMMY_POLICIES';

-- Melting Great Turkish Bombard
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_BATTLES';

-- Holkan's Goody Huts Bonus
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_GOODY_CHOICE';

-- Roman Worker
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLOT';

-- English espionage
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_ESPIONAGE';

-- Hippodrome resistance
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_NEW_ERA';

-- Corsair and Hashemite Raider pillage trigger
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_ACTIONS';

-- University of Coimbra feitoria trigger
UPDATE CustomModOptions SET	Value = 1 WHERE	Name = 'EVENTS_TILE_IMPROVEMENTS';

-- Corsair plundering trigger
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_TRADE_ROUTE_PLUNDERED';