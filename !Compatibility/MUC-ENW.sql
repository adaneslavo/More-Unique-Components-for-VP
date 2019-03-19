/*
VP ENW compatibility patch!
0 = Disabled disregarding if its detects VPEE by Infixo.
1 = Enabled if it detects the VPEE by Infixo.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('MUCfVP-ENW', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MUCfVP-ENW' AND EXISTS (SELECT * FROM Units WHERE Type='UNIT_DREADNOUGHT') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-ENW' AND Value= 0);

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
	UPDATE Units SET ObsoleteTech = 'TECH_COMBUSTION' WHERE Type = 'UNIT_SPAIN_ARMADA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-ENW' AND Value= 1);
	UPDATE Units SET ObsoleteTech = 'TECH_DYNAMITE' WHERE Type = 'UNIT_SPAIN_ARMADA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-ENW' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- Corsair
	UPDATE Units SET ObsoleteTech = 'TECH_COMBUSTION' WHERE Type = 'UNIT_MOROCCO_CORSAIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-ENW' AND Value= 1);
	
	-- Monitor
	UPDATE Units SET ObsoleteTech = 'TECH_ROCKETRY' WHERE Type = 'UNIT_AMERICA_MONITOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-ENW' AND Value= 1);

	-- XiaFan
	UPDATE Units SET ObsoleteTech = 'TECH_RADIO' WHERE Type = 'UNIT_CHINA_XIAFAN_GUANJUN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-ENW' AND Value= 1);