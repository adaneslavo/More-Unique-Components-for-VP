

INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 			IconsPerRow, 	IconsPerColumn)
VALUES	
		('BUILDING_QADI_ATLAS', 		256, 		'Qadi256.dds',		1, 				1),
		('BUILDING_QADI_ATLAS', 		128, 		'Qadi128.dds',		1, 				1),
		('BUILDING_QADI_ATLAS', 		64, 		'Qadi64.dds',		1, 				1),
		('BUILDING_QADI_ATLAS', 		45, 		'Qadi45.dds',		1, 				1);


INSERT INTO Buildings 	
			(Type,								BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	BuildAnywhere,	NumCityCostMod,		NoOccupiedUnhappiness,	DefenseHappinessChange,		IlliteracyHappinessChange,		UnculturedHappinessChange,		MinorityHappinessChange,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	Help,											Description,							Civilopedia,									Strategy,											IconAtlas,					PortraitIndex)
SELECT		'BUILDING_QADI_COURT',	BuildingClass,	GoldMaintenance, Cost, FaithCost,	EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, ExtraCityHitPoints, TrainedFreePromotion,	CitySupplyFlat,	1,				NumCityCostMod,	1,						DefenseHappinessChange,	IlliteracyHappinessChange,	UnculturedHappinessChange,	MinorityHappinessChange-25,	GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_QADI_COURT_HELP',	'TXT_KEY_BUILDING_QADI_COURT', 'TXT_KEY_BUILDING_QADI_COURT_TEXT',	'TXT_KEY_BUILDING_QADI_COURT_STRATEGY',	'BUILDING_QADI_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_COURTHOUSE';	