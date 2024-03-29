--------------------------------------------------------------------------
--	Crytek Source File.
-- 	Copyright (C), Crytek Studios, 2001-2007.
--------------------------------------------------------------------------
--	$Id$
--	$DateTime$
--	Description: Spectator Point
--  
--------------------------------------------------------------------------
--  History:
--  - 6:2:2007   12:00 : Created by M�rcio Martins
--
--------------------------------------------------------------------------
SpectatorPoint =
{
	Client = {},
	Server = {},

	Editor={
		Model="Editor/Objects/spawnpointhelper.cgf",
	},
	
	Properties=
	{
		bEnabled=1,
	},
}

--------------------------------------------------------------------------
function SpectatorPoint.Server:OnInit()
	self:Enable(tonumber(self.Properties.bEnabled)~=0);
--	SetupTacGarbage(); -- Remod
end

----------------------------------------------------------------------------------------------------
function SpectatorPoint:Enable(enable)
	if (enable) then
		g_gameRules.game:AddSpectatorLocation(self.id);
	else
		g_gameRules.game:RemoveSpectatorLocation(self.id);
	end
	self.enabled=enable;
end

--------------------------------------------------------------------------
function SpectatorPoint.Server:OnShutDown()
	if (g_gameRules) then
		g_gameRules.game:RemoveSpectatorLocation(self.id);
	end
end

--------------------------------------------------------------------------
function SpectatorPoint:IsEnabled()
	return self.enabled;
end