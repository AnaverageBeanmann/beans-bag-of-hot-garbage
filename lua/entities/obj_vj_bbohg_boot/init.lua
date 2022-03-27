AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/props_junk/Shoe001a.mdl"}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.RemoveOnHit = false
ENT.PaintDecalOnCollide = true
ENT.DecalTbl_OnCollideDecals = {"BeerSplash"}
ENT.CollideCodeWithoutRemoving = true
ENT.DoesDirectDamage = true
ENT.DirectDamage = math.random(45,50)
ENT.DirectDamageType = DMG_CLUB
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.SoundTbl_Startup = {"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Idle = {"npc/therock/cinderblock_flying.mp3"}
ENT.SoundTbl_OnCollide = {"fx/splat.mp3"}
ENT.SoundTbl_OnRemove = {"npc/hobo/voice1/death_2.mp3",
			"npc/hobo/voice1/pain_1.mp3",
			"npc/hobo/voice1/pain_2.mp3",
			"npc/hobo/voice1/pain_3.mp3",
			"npc/hobo/voice1/pain_4.mp3",
			"npc/hobo/voice2/pain_10.mp3",
			"npc/hobo/voice2/pain_7.mp3",
			"npc/hobo/voice2/pain_8.mp3",
			"npc/hobo/voice2/pain_9.mp3",
			"npc/hobo/voice3/btch (1).mp3",
			"npc/hobo/voice3/btch (2).mp3",
			"npc/hobo/voice3/f (1).mp3",
			"npc/hobo/voice3/f (10).mp3",
			"npc/hobo/voice3/no (2).mp3"}
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
	self:SetKeyValue("rendercolor","147 216 162 255")
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