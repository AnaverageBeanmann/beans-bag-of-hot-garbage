AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/items/item_item_crate.mdl"}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.RemoveOnHit = false
ENT.PaintDecalOnCollide = false
ENT.CollideCodeWithoutRemoving = true
ENT.DoesDirectDamage = true
ENT.DirectDamage = math.random(25,30)
ENT.DirectDamageType = DMG_CLUB
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.SoundTbl_Startup = {"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Idle = {"npc/therock/cinderblock_flying.mp3"}
ENT.SoundTbl_OnCollide = {"physics/wood/wood_box_impact_hard1.wav",
	"physics/wood/wood_box_impact_hard2.wav",
	"physics/wood/wood_box_impact_hard3.wav",
	"physics/wood/wood_box_impact_hard4.wav",
	"physics/wood/wood_box_impact_hard5.wav",
	"physics/wood/wood_box_impact_hard6.wav"}
ENT.SoundTbl_OnRemove = {"physics/wood/wood_crate_break1.wav",
	"physics/wood/wood_crate_break2.wav",
	"physics/wood/wood_crate_break3.wav",
	"physics/wood/wood_crate_break4.wav",
	"physics/wood/wood_crate_break5.wav"}
	
ENT.NextSoundTime_Idle = VJ_Set(0.001,0.001)


ENT.StartupSoundLevel = 90
ENT.IdleSoundLevel = 70
ENT.OnRemoveSoundLevel = 75

ENT.StartupSoundPitch = VJ_Set(85, 90)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:SetBuoyancyRatio(0)
	phys:EnableDrag(false)
	phys:AddAngleVelocity(Vector(0,math.random(300,400),0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCollideWithoutRemove(data, phys) 
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
	self.DoesDirectDamage = false
	timer.Simple(0.5,function() if IsValid(self) then
	self:Remove() end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoDamage_Direct(data, phys, hitEnt)
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
	self.DoesDirectDamage = false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/