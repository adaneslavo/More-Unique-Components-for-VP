include("FLuaVector.lua")
include("PlotIterators.lua")

function JFD_IsInCityStateBorders(unit)
	local plot = unit:GetPlot()
	if plot:GetOwner() > -1 then
		return Players[plot:GetOwner()]:IsMinorCiv()
	end
	return false
end

function Kowtow(iPlayer)
	local player = Players[iPlayer]
	for unit in player:Units() do
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_KOWTOW"]) then
			local minorPlayerID = unit:GetPlot():GetOwner()
			if minorPlayerID < 0 then
				break
			end

			local minorPlayer = Players[minorPlayerID]
			if minorPlayer:IsMinorCiv() then
				minorPlayer:ChangeMinorCivFriendshipWithMajor(iPlayer, 2)
				if player:IsHuman() then
					local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[ICON_WHITE]+{1_Num}[ENDCOLOR] [ICON_INFLUENCE]", 2), true)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(Kowtow)