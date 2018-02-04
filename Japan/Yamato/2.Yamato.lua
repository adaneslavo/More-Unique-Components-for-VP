-- Yamato
-- Author: pineappledan
-- DateCreated: 02/02/2018
--------------------------------------------------------------

--GAP on construction of Yamato

--[[function YamatoOnBuild(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetUnitType() == GameInfoTypes.UNIT_YAMATO then
		pPlayer:ChangeGoldenAgeProgressMeter(600)

	end
end

--GAP and Culture on killing Yamato

function YamatoOnDeath(iPlayerKiller, iPlayerKillee, KillerUnitType, KilledUnitType)
	local pPlayerKiller = Players[iPlayerKiller]

	if KilledUnitType:GetUnitType() == GameInfoTypes.UNIT_YAMATO then
		pPlayerKiller:ChangeJONSCulture(400)
		pPlayerKiller:ChangeGoldenAgeProgressMeter(400)
	
	end		
end
			
GameEvents.CityTrained.Add(YamatoOnBuild)
GameEvents.UnitKilledInCombat.Add(YamatoOnDeath)--]]
