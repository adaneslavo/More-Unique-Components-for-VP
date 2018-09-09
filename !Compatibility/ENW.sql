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
WHERE Type = 'MUCfVP-ENW' AND EXISTS (SELECT * FROM Buildings WHERE Type='UNIT_DREADNOUGHT') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-ENW' AND Value= 0);

-- Main Compatibility Code
	-- Yamato
	UPDATE Units SET Combat = '50' WHERE Type = 'UNIT_JAPAN_YAMATO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-ENW' AND Value= 1);
	