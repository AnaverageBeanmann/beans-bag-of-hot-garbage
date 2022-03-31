AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/props_junk/CinderBlock01a.mdl"}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.RemoveOnHit = false
ENT.PaintDecalOnCollide = false
ENT.CollideCodeWithoutRemoving = true
ENT.DoesDirectDamage = true
ENT.DirectDamage = math.random(45,55)
ENT.DirectDamageType = DMG_CLUB
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.SoundTbl_Startup = {"vo/npc/male01/watchout.wav",
	"vo/npc/male01/uhoh.wav",
	"vo/npc/male01/squad_approach04.wav",
	"vo/npc/male01/likethat.wav",
	"vo/npc/male01/finally.wav",
	"vo/npc/male01/goodgod.wav",
	"vo/npc/male01/gethellout.wav",
	"vo/npc/male01/gordead_ans19.wav",
	"vo/npc/male01/incoming02.wav",
	"vo/npc/male01/overhere01.wav",
	"vo/npc/male01/freeman.wav",
	"vo/npc/male01/headsup01.wav",
	"vo/npc/male01/headsup02.wav",
	"vo/npc/male01/ohno.wav",
	"vo/trainyard/cit_drunk.wav",
	"vo/npc/male01/question06.wav",
	"vo/npc/male01/pardonme01.wav",
	"vo/npc/male01/pardonme02.wav",
	"vo/npc/male01/whoops01.wav",
	"vo/npc/male01/hellodrfm01.wav",
	"vo/npc/male01/hellodrfm02.wav",
	"vo/npc/male01/cit_dropper04.wav",
	"vo/npc/male01/behindyou01.wav",
	"vo/npc/male01/behindyou02.wav",
	"vo/npc/male01/docfreeman01.wav",
	"vo/npc/male01/docfreeman02.wav",	
	"vo/npc/male01/excuseme01.wav",
	"vo/npc/male01/excuseme02.wav",
	"vo/npc/male01/evenodds.wav",
	"npc/pissed.mp3",
	"vo/ravenholm/engage02.wav",
	"vo/ravenholm/engage03.wav",
	"vo/ravenholm/engage06.wav",
	"vo/ravenholm/exit_nag01.wav",
	"vo/ravenholm/madlaugh04.wav",
	"vo/ravenholm/monk_blocked02.wav",
	"vo/ravenholm/monk_blocked03.wav",
	"vo/ravenholm/monk_kill05.wav",
	"vo/ravenholm/monk_kill10.wav",
	"vo/ravenholm/monk_pain01.wav",
	"vo/ravenholm/shotgun_closer.wav",
	"vo/ravenholm/shotgun_overhere.wav",
	"vo/npc/barney/ba_ohyeah.wav",
	"vo/npc/barney/ba_yell.wav",
	"vo/k_lab/kl_islamarr.wav",
	"vo/k_lab/kl_ohdear.wav"}
ENT.SoundTbl_Idle = {"npc/therock/cinderblock_flying.mp3"}
ENT.SoundTbl_OnCollide = {"physics/concrete/concrete_block_impact_hard1.wav",
	"physics/concrete/concrete_block_impact_hard2.wav",
	"physics/concrete/concrete_block_impact_hard3.wav"}
ENT.SoundTbl_OnRemove = {"vo/npc/male01/pain01.wav",
	"vo/npc/male01/pain02.wav",
	"vo/npc/male01/pain03.wav",
	"vo/npc/male01/pain04.wav",
	"vo/npc/male01/pain05.wav",
	"vo/npc/male01/pain06.wav",
	"vo/npc/male01/pain07.wav",
	"vo/npc/male01/pain08.wav",
	"vo/npc/male01/pain09.wav",
	"vo/ravenholm/monk_pain01.wav",
	"vo/ravenholm/monk_pain02.wav",
	"vo/ravenholm/monk_pain03.wav",
	"vo/ravenholm/monk_pain04.wav",
	"vo/ravenholm/monk_pain05.wav",
	"vo/ravenholm/monk_pain06.wav",
	"vo/ravenholm/monk_pain07.wav",
	"vo/ravenholm/monk_pain08.wav",
	"vo/ravenholm/monk_pain09.wav",
	"vo/ravenholm/monk_pain10.wav",
	"vo/ravenholm/monk_pain11.wav",
	"vo/ravenholm/monk_pain12.wav",
	"vo/npc/barney/ba_damnit.wav",
	"vo/npc/barney/ba_ohshit03.wav",
	"vo/npc/barney/ba_wounded01.wav",
	"vo/k_lab/ba_guh.wav",
	"vo/k_lab/ba_thingaway02.wav",
	"vo/k_lab/kl_ahhhh.wav",
	"vo/k_lab/kl_fiddlesticks.wav"}
	
ENT.NextSoundTime_Idle = VJ_Set(0.001,0.001)

ENT.StartupSoundLevel = 80
ENT.IdleSoundLevel = 70
ENT.OnRemoveSoundLevel = 80

ENT.StartupSoundPitch = VJ_Set(125, 150)
ENT.OnRemoveSoundPitch = VJ_Set(125, 150)
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove() 
	VJ_EmitSound(self,{"physics/concrete/concrete_break2.wav",
	"physics/concrete/concrete_break3.wav"},75,math.random(100,100))
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/