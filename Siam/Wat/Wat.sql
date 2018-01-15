------------------------------
-- Buildings
------------------------------
UPDATE Buildings SET BlockUnrestSpies = '1' WHERE Type = 'BUILDING_WAT';
UPDATE Buildings SET BlockWWDestructionSpies = '1' WHERE Type = 'BUILDING_WAT';
------------------------------
-- Building_FeatureYieldChanges
------------------------------
DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_WAT';