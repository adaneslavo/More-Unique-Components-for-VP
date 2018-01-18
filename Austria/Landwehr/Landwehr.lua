include("FLuaVector.lua")
include("InstanceManager")

local iPromotion1 = GameInfoTypes.PROMOTION_UNIT_AUSTRIA_IMPERIAL_VIGILANCE
local iPromotion2 = GameInfoTypes.PROMOTION_UNIT_AUSTRIA_YORKSCHER_MARCHE
local iBonus = GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS

function CheckLandwehr(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in Players[iPlayer]:Units() do
		if pUnit:IsHasPromotion(iPromotion1) then
			local pPlot = pUnit:GetPlot()
			
			if pPlot then
				local iOwner = pPlot:GetOwner()
				
				if iOwner >= GameDefines.MAX_MAJOR_CIVS and iOwner < GameDefines.MAX_CIV_PLAYERS then
					local pOwner = Players[iOwner]
					
					if pOwner:GetMinorCivFriendshipLevelWithMajor(iPlayer) >= 2 then
						pUnit:SetHasPromotion(iBonus, true)
					else
						pUnit:SetHasPromotion(iBonus, false)
					end
				else
					pUnit:SetHasPromotion(iBonus, false)
				end
			end
		end
		
		if pUnit:IsHasPromotion(iPromotion2) then
			local pPlot = pUnit:GetPlot()
			
			if pPlot ~= nil then
				local iOwner = pPlot:GetOwner()
				local pOwner = Players[iOwner]
				
				if pOwner == pPlayer then
					local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
					local iEraModifier = (pPlayer:GetCurrentEra() + 1) / 5
					local iGain = math.floor(2 * iEraModifier * iGameSpeedModifier)

					pPlayer:ChangeJONSCulture(iGain)

					if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
						local vUnitPosition = PositionCalculator(pUnit:GetX(), pUnit:GetY())
			
						Events.AddPopupTextEvent(vUnitPosition, "[COLOR_MAGENTA]+"..iGain.." [ICON_CULTURE] Landwehr[ENDCOLOR]", 1)
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.PlayerDoTurn.Add(CheckLandwehr)