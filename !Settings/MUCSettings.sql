--Pillaging check for Tug Banner Warrior
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';

--Celtic UA change
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_FOUND_RELIGION';

--CityConstructed/Trained/Prepared
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_CITY';

--Iroquoian Great Diplomat CS missions, Zulu Great General
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

-- Hippodrome resistance
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_NEW_ERA';

-- Corsair and Hashemite Raider pillage trigger
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_ACTIONS';

-- University of Coimbra feitoria trigger
UPDATE CustomModOptions SET	Value = 1 WHERE	Name = 'EVENTS_TILE_IMPROVEMENTS';

-- Corsair plundering trigger
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_TRADE_ROUTE_PLUNDERED';

-- Baan Chang gifted from CS
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_MINORS_GIFTS';

-- Alti Cur demanding tribute trigger
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_MINORS_INTERACTION';

-- Instead of OnMove/OnBuild/OnCreate functions
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_TURN';

-- Proxenos promotion trigger
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_PREKILL';

--Assigns UnitCombatInfos to civilian units -- Can now grant production bonuses and free promotions via buildings, traits and policies
INSERT INTO UnitCombatInfos     
            (Type,                    Description)
VALUES        ('UNITCOMBAT_SETTLER',    'Settler Units'),
    ('UNITCOMBAT_WORKER',    'Worker Units'),
    ('UNITCOMBAT_WORKBOAT',    'Workboat Units'),
    ('UNITCOMBAT_CARGO',    'Cargo Ship Units'),
    ('UNITCOMBAT_CARAVAN',    'Caravan Units'),
    ('UNITCOMBAT_INQUISITOR',    'Inquisitor Units'),
    ('UNITCOMBAT_MISSIONARY',    'Missionary Units');
   
UPDATE Units SET CombatClass = 'UNITCOMBAT_SETTLER' WHERE Type = 'UNIT_SETTLER';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SETTLER' WHERE Type = 'UNIT_PIONEER';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SETTLER' WHERE Type = 'UNIT_COLONIST';
UPDATE Units SET CombatClass = 'UNITCOMBAT_WORKER' WHERE Type = 'UNIT_WORKER';
UPDATE Units SET CombatClass = 'UNITCOMBAT_WORKBOAT' WHERE Type = 'UNIT_WORKBOAT';
UPDATE Units SET CombatClass = 'UNITCOMBAT_CARGO' WHERE Type = 'UNIT_CARGO_SHIP';
UPDATE Units SET CombatClass = 'UNITCOMBAT_CARAVAN' WHERE Type = 'UNIT_CARAVAN';
UPDATE Units SET CombatClass = 'UNITCOMBAT_INQUISITOR' WHERE Type = 'UNIT_INQUISITOR';
UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSIONARY' WHERE Type = 'UNIT_MISSIONARY';
