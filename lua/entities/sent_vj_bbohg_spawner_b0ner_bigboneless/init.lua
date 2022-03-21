AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.SingleSpawner = false
ENT.Model = {}
ENT.EntitiesToSpawn = {}
		ENT.EntitiesToSpawn = {
			{SpawnPosition = {vForward=0, vRight=0, vUp=10}, Entities = {"npc_vj_bbohg_boner:1"}},
			{SpawnPosition = {vForward=-50, vRight=50, vUp=10}, Entities = {"npc_vj_bbohg_boner:1"}},
			{SpawnPosition = {vForward=-50, vRight=-50, vUp=10}, Entities = {"npc_vj_bbohg_boner:1"}},
			{SpawnPosition = {vForward=50, vRight=50, vUp=10}, Entities = {"npc_vj_bbohg_boner:1"}},
			{SpawnPosition = {vForward=50, vRight=-50, vUp=10}, Entities = {"npc_vj_bbohg_boner:1"}},
		}
		Entities = {"npc_vj_bbohg_boner:1"}
		SpawnPosition = {vForward=0, vRight=0, vUp=10}
		SpawnAngle = Angle(0, 0, 0)
ENT.TimedSpawn_Time = 5
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
	self:SetKeyValue("rendercolor","0 0 0 0")
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/