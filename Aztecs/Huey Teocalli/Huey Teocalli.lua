function HueyTeocalliGoldenAge(iPlayer, bStart, iTurns)
	if bStart then
		local pPlayer = Players[iPlayer]
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_VP_HUEY_TEOCALLI) then
				local iDummies = pCity:GetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYEXPANDCLASSYIELD)
				if (iDummies < 10) then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMYEXPANDCLASSYIELD, iDummies + 1)
				end
			end
		end
	end
end



GameEvents.PlayerGoldenAge.Add(HueyTeocalliGoldenAge)