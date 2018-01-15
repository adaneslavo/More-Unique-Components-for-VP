------------------------------
-- Buildings
------------------------------
UPDATE Buildings SET BlockUnrestSpies = '1' WHERE Type = 'BUILDING_WAT';
UPDATE Buildings SET BlockWWDestructionSpies = '1' WHERE Type = 'BUILDING_WAT';
------------------------------
-- Building_FeatureYieldChanges
------------------------------
DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_WAT';
------------------------------
-- UPDATE Language_en_US
------------------------------
UPDATE Language_en_US
SET Text = 'Reduces enemy spy stealing rate by 50%, and prevents the disruption of Building and Wonder construction by Spy Advanced Actions, and enemy Spies cannot cause Unrest in the City. +2 [ICON_RESEARCH] Science from Temples and Shrines in this City, and reduces [ICON_HAPPINESS_3] Crime.'
WHERE Tag = 'TXT_KEY_BUILDING_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

