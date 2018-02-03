-- Tambo
-- Author: Pineappledan
-- DateCreated: 02/02/2018
--------------------------------------------------------------

--Coca Monopoly gives promotion to land military units and workers

function CocaMonopoly(iPlayer, iResource)
	local pPlayer = Players[iPlayer]

	if pPlayer:HasGlobalMonopoly(RESOURCE_COCA) == 1 then
		for UNITCOMBAT_MELEE:SetHasPromotion(GameInfoTypes.PROMOTION_COCA_MILITARY, false)
		for UNITCOMBAT_ARCHER:SetHasPromotion(GameInfoTypes.PROMOTION_COCA_MILITARY, false)
		for UNITCOMBAT_GUN:SetHasPromotion(GameInfoTypes.PROMOTION_COCA_MILITARY, false)
		for UNITCOMBAT_MOUNTED:SetHasPromotion(GameInfoTypes.PROMOTION_COCA_MILITARY, false)
		for UNITCOMBAT_ARMOR:SetHasPromotion(GameInfoTypes.PROMOTION_COCA_MILITARY, false)
		for UNITCOMBAT_RECON:SetHasPromotion(GameInfoTypes.PROMOTION_COCA_MILITARY, false)
		for UNITCOMBAT_SIEGE:SetHasPromotion(GameInfoTypes.PROMOTION_COCA_MILITARY, false)
		for UNITCOMBAT_HELICOPTER:SetHasPromotion(GameInfoTypes.PROMOTION_COCA_MILITARY, false)
		for UNITCLASS_WORKER:SetHasPromotion(GameInfoTypes.PROMOTION_COCA_WORKER, false)

	end
end

GameEvents.HasGlobalMonopoly.Add(CocaMonopoly)
