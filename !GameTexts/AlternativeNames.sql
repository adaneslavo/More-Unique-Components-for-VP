/*
Alternative Names!
0 = Mixed (original version).
1 = Endonyms (english names).
2 = Xenonyms (native names; set as default).
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('MUCfVP-AN',	2);

-- Endonyms
UPDATE Language_en_US SET Text = 'Shotel Swordsman' WHERE Tag = 'TXT_KEY_UNIT_ETHIOPIA_SHOTELAI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 1);
UPDATE Language_en_US SET Text = 'Fighting Elephant' WHERE Tag = 'TXT_KEY_UNIT_INDIAN_WARELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 1);
UPDATE Language_en_US SET Text = 'Yurt' WHERE Tag = 'TXT_KEY_BUILDING_YURT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 1);
UPDATE Language_en_US SET Text = 'Armstrong Gun' WHERE Tag = 'TXT_KEY_UNIT_SIAM_SEIR_MORB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 1);
UPDATE Language_en_US SET Text = 'Sauna' WHERE Tag = 'TXT_KEY_BUILDING_SWEDEN_BASTU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 1);
UPDATE Language_en_US SET Text = 'Lagoon' WHERE Tag = 'TXT_KEY_BUILDING_VENICE_LAGUNA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 1);
UPDATE Language_en_US SET Text = 'Galiot' WHERE Tag = 'TXT_KEY_UNIT_VENICE_FUSTA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 1);
UPDATE Language_en_US SET Text = 'Pike and Shot' WHERE Tag = 'TXT_KEY_UNIT_SPANISH_TERCIO' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 1);
UPDATE Language_en_US SET Text = 'Mughal Fort' WHERE Tag = 'TXT_KEY_BUILDING_INDIA_QILA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 1);
UPDATE Language_en_US SET Text = 'Paradise Garden' WHERE Tag = 'TXT_KEY_BUILDING_PERSIA_PAIRIDAEZA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 1);

-- Xenonyms
UPDATE Language_en_US SET Text = 'Ghazi' WHERE Tag = 'TXT_KEY_UNIT_ARABIAN_CAMELARCHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Al-Hashimiyun' WHERE Tag = 'TXT_KEY_UNIT_ARABIA_HASHEMITE_RAIDER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Kaffeehaus' WHERE Tag = 'TXT_KEY_BUILDING_COFFEE_HOUSE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Ocelotl' WHERE Tag = 'TXT_KEY_UNIT_AZTEC_JAGUAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Cuauhtli' WHERE Tag = 'TXT_KEY_UNIT_AZTEC_EAGLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Chinampa' WHERE Tag = 'TXT_KEY_BUILDING_FLOATING_GARDENS_DESC' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Qashtum' WHERE Tag = 'TXT_KEY_UNIT_BABYLON_BOWMAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Pernambuco Camp' WHERE Tag = 'TXT_KEY_IMPROVEMENT_BRAZILWOOD_CAMP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Covinni' WHERE Tag = 'TXT_KEY_UNIT_CELTS_SCYTHED_CHARIOT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Dunon' WHERE Tag = 'TXT_KEY_IMPROVEMENT_CELTS_OPPIDUM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Curadh' WHERE Tag = 'TXT_KEY_UNIT_CELT_PICTISH_WARRIOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Lian Nu' WHERE Tag = 'TXT_KEY_UNIT_CHINESE_CHUKONU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Kao-Chang' WHERE Tag = 'TXT_KEY_BUILDING_CHINA_EXAMINATION_HALL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Langskib' WHERE Tag = 'TXT_KEY_UNIT_DENMARK_LANGSKIB' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Watergeuzen' WHERE Tag = 'TXT_KEY_UNIT_SEA_BEGGAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Hawelti' WHERE Tag = 'TXT_KEY_BUILDING_STELE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Deutscher Orden' WHERE Tag = 'TXT_KEY_BUILDING_GERMANY_TEUTONIC_ORDER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Alti Cur' WHERE Tag = 'TXT_KEY_BUILDING_HUNS_ALTI_CUR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Huaraca' WHERE Tag = 'TXT_KEY_UNIT_INCAN_SLINGER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Anden' WHERE Tag = 'TXT_KEY_IMPROVEMENT_TERRACE_FARM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Vaav' WHERE Tag = 'TXT_KEY_BUILDING_INDUS_CANAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Catabhata' WHERE Tag = 'TXT_KEY_UNIT_INDONESIAN_KRIS_SWORDSMAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Ne Hatoraz' WHERE Tag = 'TXT_KEY_UNIT_IROQUOIS_PROWLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Haudenosesne' WHERE Tag = 'TXT_KEY_BUILDING_LONGHOUSE_DESC' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Rotisken''rakehte' WHERE Tag = 'TXT_KEY_UNIT_IROQUOIAN_MOHAWKWARRIOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Kobukseon' WHERE Tag = 'TXT_KEY_CIV5_KOREA_TURTLESHIP_HEADING' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Pitz Court' WHERE Tag = 'TXT_KEY_BUILDING_MAYA_PITZ' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Haan' WHERE Tag = 'TXT_KEY_UNIT_MONGOL_KHAN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Goumiers' WHERE Tag = 'TXT_KEY_UNIT_BERBER_CAVALRY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Alqirsan' WHERE Tag = 'TXT_KEY_UNIT_MOROCCO_CORSAIR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Sahi Topu' WHERE Tag = 'TXT_KEY_UNIT_OTTOMANS_GREAT_TURKISH_BOMBARD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Tophane-i Amire' WHERE Tag = 'TXT_KEY_BUILDING_SIEGE_WORKSHOP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Stajnia Ksiazeca' WHERE Tag = 'TXT_KEY_BUILDING_DUCAL_STABLE_DESC' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Husaria' WHERE Tag = 'TXT_KEY_UNIT_POLISH_WINGED_HUSSAR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Ika a Whiro' WHERE Tag = 'TXT_KEY_UNIT_POLYNESIAN_MAORI_WARRIOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Yedinorog' WHERE Tag = 'TXT_KEY_UNIT_RUSSIA_LICORNE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Ohamupe' WHERE Tag = 'TXT_KEY_UNIT_SHOSHONE_YELLOW_BROW' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Pis''kun' WHERE Tag = 'TXT_KEY_BUILDING_SHOSHONE_BUFFALO_POUND' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Pungkuto''ett�' WHERE Tag = 'TXT_KEY_UNIT_SHOSHONE_COMANCHE_RIDERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Katukkatun' WHERE Tag = 'TXT_KEY_IMPROVEMENT_ENCAMPMENT_SHOSHONE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Baan Chang' WHERE Tag = 'TXT_KEY_BUILDING_SIAM_BAAN_CHANG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Chang Suek' WHERE Tag = 'TXT_KEY_UNIT_SIAMESE_WARELEPHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Farari' WHERE Tag = 'TXT_KEY_UNIT_SONGHAI_MUSLIMCAVALRY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);
UPDATE Language_en_US SET Text = 'Magni Mercante' WHERE Tag = 'TXT_KEY_UNIT_VENETIAN_MERCHANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-AN' AND Value= 2);