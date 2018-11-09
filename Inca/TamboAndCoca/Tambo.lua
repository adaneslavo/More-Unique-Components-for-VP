--------------------------------------------------------------
-- Inca - Tambo
-- Coca Monopoly gives promotion to eligible military and civilian units
-- Author: Infixo
-- DateCreated: 2018-02-03
--------------------------------------------------------------

function CocaMonopoly(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for unit in pPlayer:Units() do
		if unit:GetDomainType() = GameInfoTypes.DOMAIN_LAND then unit:SetHasPromotion(GameInfoTypes.PROMOTION_COCA, pPlayer.HasGlobalMonopoly(GameInfoTypes.RESOURCE_COCA)) end
	end
end

if Game.IsCivEverActive(GameInfoTypes.CIVILIZATION_INCA) then
	GameEvents.PlayerDoTurn.Add(CocaMonopoly)
end