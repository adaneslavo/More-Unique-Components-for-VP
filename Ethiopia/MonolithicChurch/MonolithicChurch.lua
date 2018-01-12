-- Monolithic Church
-- Author: adan_eslavo
-- DateCreated: 22/11/2017
--------------------------------------------------------------
function OnChoosenPolicy(iPlayer, iPolicy)
	local pPlayer = Players[iPlayer]
	
	if (pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_FREEDOM) == true or pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_ORDER) == true or pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_AUTOCRACY) == true) then
		local pTeam = Teams[pPlayer:GetTeam()]
		
		if pTeam:GetImprovementYieldChange(GameInfoTypes.IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH, 2) == 0 then
			pTeam:ChangeImprovementYieldChange(GameInfoTypes.IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH, 2, 2)
		end
	end
end

GameEvents.PlayerAdoptPolicy.Add(OnChoosenPolicy)