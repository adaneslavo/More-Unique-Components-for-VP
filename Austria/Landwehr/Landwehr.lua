include("FLuaVector.lua")
include("InstanceManager")

function CheckLandwehrMove(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_IMPERIAL_VIGILANCE) then
		local pPlot = pUnit:GetPlot()
	
		if pPlot ~= nil then
			local iOwner = pPlot:GetOwner()

			if iOwner >= GameDefines.MAX_MAJOR_CIVS and iOwner <= GameDefines.MAX_CIV_PLAYERS then
				local pOwner = Players[iOwner]

				if pOwner:GetMinorCivFriendshipLevelWithMajor(iPlayer) >= 1 then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS, true)

				else
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS, false)
				end
			else
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS, false)
			end
		end
	end
end

function CheckLandwehrCreate(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_IMPERIAL_VIGILANCE) then
		local pPlot = pUnit:GetPlot()
	
		if pPlot ~= nil then
			local iOwner = pPlot:GetOwner()

			if iOwner >= GameDefines.MAX_MAJOR_CIVS and iOwner <= GameDefines.MAX_CIV_PLAYERS then
				local pOwner = Players[iOwner]

				if pOwner:GetMinorCivFriendshipLevelWithMajor(iPlayer) >= 1 then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS, true)

				else
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS, false)
				end
			else
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS, false)
			end
		end
	end
end

function CheckLandwehrBuild(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_IMPERIAL_VIGILANCE) then
		local pPlot = pUnit:GetPlot()
	
		if pPlot ~= nil then
			local iOwner = pPlot:GetOwner()

			if iOwner >= GameDefines.MAX_MAJOR_CIVS and iOwner <= GameDefines.MAX_CIV_PLAYERS then
				local pOwner = Players[iOwner]

				if pOwner:GetMinorCivFriendshipLevelWithMajor(iPlayer) >= 1 then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS, true)

				else
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS, false)
				end
			else
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_LANDWEHR_CS_BONUS, false)
			end
		end
	end
end

function CheckLandwehr(iPlayer)
	local pPlayer = Players[iPlayer]

	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNIT_AUSTRIA_YORKSCHER_MARCHE) then
			local pPlot = pUnit:GetPlot()
			
			if pPlot ~= nil then
				local iImprovementOnTile = pPlot:GetImprovementType()
				
				if pUnit:IsGarrisoned() or iImprovementOnTile == GameInfoTypes.IMPROVEMENT_CITADEL or iImprovementOnTile == GameInfoTypes.IMPROVEMENT_FORT or iImprovementOnTile == GameInfoTypes.IMPROVEMENT_FORT then
					local iOwner = pPlot:GetOwner()
					local pOwner = Players[iOwner]

					if pOwner == pPlayer then
						local iGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].CulturePercent / 100
						local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
						local iGain = math.floor(0.75 * iEraModifier * iGameSpeedModifier)

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
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.UnitSetXY.Add(CheckLandwehrMove)
GameEvents.UnitCreated.Add(CheckLandwehrCreate)
GameEvents.CityTrained.Add(CheckLandwehrBuild)
GameEvents.PlayerDoTurn.Add(CheckLandwehr)