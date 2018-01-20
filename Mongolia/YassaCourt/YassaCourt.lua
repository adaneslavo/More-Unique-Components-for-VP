-- Yassa Court
-- Author: adan_eslavo
-- DateCreated: 29/10/2017
--------------------------------------------------------------
function ConquereMorePlease(iPlayer, iCapital, iResourceX, iResourceY, iNewPlayer, iConquest, iConquest2)
	local pNewPlayer = Players[iNewPlayer]
	
	if pNewPlayer:GetName() == "Genghis Khan" then
		for pCity in pNewPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MONGOLIA_YASSA_COURT) then
				local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldenAgePercent / 100
				local iWLTKDLength = math.floor(10 * iGameSpeedModifier)
				
				pCity:ChangeWeLoveTheKingDayCounter(iWLTKDLength)
									
				if pNewPlayer:IsHuman() and pNewPlayer:IsTurnActive() then
					pNewPlayer:AddNotification(0, 'You conquered enemy city. '..iWLTKDLength..'-turn [ICON_HAPPINESS_1] WLTKD started in '..pCity:GetName()..'.', 'Enemy city conquered!', pCity:GetX(), pCity:GetY())
				end
			end
		end
	end
end

GameEvents.CityCaptureComplete.Add(ConquereMorePlease)