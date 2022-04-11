AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
-- ENT.Model = {"models/Zombie/Classic_torso.mdl"} 
ENT.Model = {"models/zombie_new/classic_new_torso.mdl"} 
-- not using these cause they t-pose sometimes when moving and i don't know why
ENT.StartHealth = 25
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(45, 15, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_Walk = {ACT_WALK} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_WALK}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red"
ENT.BloodPoolSize = "Small" -- What's the size of the blood pool? | Sizes: "Normal" || "Small" || "Tiny"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 0
ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
-- ENT.DeathCorpseModel = {"models/zombie_new/classic_new_torso.mdl"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(10,15)
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.AnimTbl_MeleeAttack = {"attack"}
ENT.MeleeAttackAnimationDecreaseLengthAmount = 0.1
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 45
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.47
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.6
ENT.FootStepTimeWalk = 0.6

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95

ENT.IdleDialogueDistance = 175

ENT.ZombType = 0
-- 0 = Refugee / Civvie
-- 1 = Rebel
-- 2 = Medic
-- 3 = Civil Protection
ENT.HasCrab = false
ENT.WhatDoCrab = 0
-- 0 = Nothing
-- 1 = Crab Ragdoll
-- 2 = Live Crab
ENT.CivvieSkin = 0
-- 0 = Refugee
-- 1 = Civvie
ENT.RebelSkinn = 0
-- 0 = Green
-- 1 = Blue
ENT.MedicSkinn = 0
-- 0 = White
-- 1 = Blue
ENT.ExtraCrispy = false
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav","npc/zombie/foot2.wav","npc/zombie/foot3.wav"}
ENT.SoundTbl_Idle = {"npc/zombie/zombie_voice_idle1.wav",
	"npc/zombie/zombie_voice_idle2.wav",
	"npc/zombie/zombie_voice_idle3.wav",
	"npc/zombie/zombie_voice_idle4.wav",
	"npc/zombie/zombie_voice_idle5.wav",
	"npc/zombie/zombie_voice_idle6.wav",
	"npc/zombie/zombie_voice_idle7.wav",
	"npc/zombie/zombie_voice_idle8.wav",
	"npc/zombie/zombie_voice_idle9.wav",
	"npc/zombie/zombie_voice_idle10.wav",
	"npc/zombie/zombie_voice_idle11.wav",
	"npc/zombie/zombie_voice_idle12.wav",
	"npc/zombie/zombie_voice_idle13.wav",
	"npc/zombie/zombie_voice_idle14.wav"}
ENT.SoundTbl_CombatIdle = {"npc/zombie/zombie_voice_idle1.wav",
	"npc/zombie/zombie_voice_idle2.wav",
	"npc/zombie/zombie_voice_idle3.wav",
	"npc/zombie/zombie_voice_idle4.wav",
	"npc/zombie/zombie_voice_idle5.wav",
	"npc/zombie/zombie_voice_idle6.wav",
	"npc/zombie/zombie_voice_idle7.wav",
	"npc/zombie/zombie_voice_idle8.wav",
	"npc/zombie/zombie_voice_idle9.wav",
	"npc/zombie/zombie_voice_idle10.wav",
	"npc/zombie/zombie_voice_idle11.wav",
	"npc/zombie/zombie_voice_idle12.wav",
	"npc/zombie/zombie_voice_idle13.wav",
	"npc/zombie/zombie_voice_idle14.wav"}
ENT.SoundTbl_Alert = {"npc/zombie/zombie_alert1.wav",
	"npc/zombie/zombie_alert2.wav",
	"npc/zombie/zombie_alert3.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie/zo_attack1.wav",
	"npc/zombie/zo_attack2.wav"}
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav",
	"npc/zombie/claw_strike2.wav",
	"npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_BeforeRangeAttack = {}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {"npc/zombie/zombie_pain1.wav",
	"npc/zombie/zombie_pain2.wav",
	"npc/zombie/zombie_pain3.wav",
	"npc/zombie/zombie_pain4.wav",
	"npc/zombie/zombie_pain5.wav",
	"npc/zombie/zombie_pain6.wav"}
ENT.SoundTbl_Death = {"npc/zombie/zombie_die1.wav",
	"npc/zombie/zombie_die2.wav",
	"npc/zombie/zombie_die3.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	if math.random(1,3) == 1 then
		self.HasCrab = true
	end
	local SpawnZombType = math.random(1,30)
	if SpawnZombType == 1 || SpawnZombType == 2 || SpawnZombType == 3 || SpawnZombType == 4 || SpawnZombType == 5 || SpawnZombType == 6 || SpawnZombType == 7 || SpawnZombType == 8 || SpawnZombType == 9 || SpawnZombType == 10 then
		self.ZombType = 1
		self.StartHealth = 35
	elseif SpawnZombType == 11 || SpawnZombType == 12 || SpawnZombType == 13 || SpawnZombType == 14 || SpawnZombType == 15 then
		self.ZombType = 2
		self.StartHealth = 35
	elseif SpawnZombType == 16 || SpawnZombType == 17 || SpawnZombType == 18 || SpawnZombType == 19 || SpawnZombType == 20 then
		self.ZombType = 3
		self.StartHealth = 50
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()

	-- self:SetMaterial("hud/killicons/default")
	-- self:DrawShadow(false)
	self:SetCollisionBounds(Vector(11, 11, 20), Vector(-11, -11, 0))
	
	-- self.TheModel = ents.Create("prop_dynamic")
	-- self.TheModel:SetModel("models/zombie_new/classic_new_torso.mdl")
	-- self.TheModel:SetLocalPos(self:GetPos())
	-- //self.TheModel:SetPos(self:GetPos())
	-- self.TheModel:SetOwner(self)
	-- self.TheModel:SetParent(self)
	-- self.TheModel:SetLocalAngles(Angle(-120,45,90))
	-- self.TheModel:Fire("SetParentAttachmentMaintainOffset","Blood_Left")
	-- self.TheModel:Fire("SetParentAttachment","Blood_Left")
	-- self.TheModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	-- self.TheModel:Spawn()
	-- self.TheModel:Activate()
	-- self.TheModel:SetSolid(SOLID_NONE)
	-- self.TheModel:AddEffects(EF_BONEMERGE)
	-- this method does work but it impacts performance (stinky)
	-- why am i not using the actual model since it has animations? because it randomly decides to t-pose out on me
	
	if GetConVarNumber("vj_BBOHG_Gibs") == 0 then
		self.AllowedToGib = false
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	-- if math.random(1,4) == 1 then
		-- self.AnimTbl_Run = {ACT_RUN_CROUCH}
	-- end
	if math.random(1,2) == 1 then
		self:SetSkin(1)
		self.Civvie = 1
	end
	if self.HasCrab == true then
		self:SetBodygroup(1,1)
		self.SoundTbl_Idle = {"npc/zombknees/xom/idle.mp3",
			"npc/zombknees/xom/idle2.mp3"}
		self.SoundTbl_Investigate = {"npc/zombknees/xom/inves.mp3"}
		self.SoundTbl_LostEnemy = {"npc/zombknees/xom/lost1.mp3",
			"npc/zombknees/xom/lost2.mp3"}
		self.SoundTbl_Alert = {"npc/zombknees/xom/alert1.mp3",
			"npc/zombknees/xom/alert2.mp3",
			"npc/zombknees/xom/alert3.mp3",
			"npc/zombknees/xom/alert4.mp3"}
		self.SoundTbl_BeforeMeleeAttack = {"npc/zombknees/xom/melee1.mp3",
			"npc/zombknees/xom/melee2.mp3"}
		self.SoundTbl_OnKilledEnemy = {"npc/zombknees/xom/kill.mp3",
			"npc/zombknees/xom/kill2.mp3"}
		self.SoundTbl_Pain = {"npc/zombknees/xom/pain1.mp3",
			"npc/zombknees/xom/pain2.mp3",
			"npc/zombknees/xom/pain3.mp3",
			"npc/zombknees/xom/pain4.mp3"}
		self.SoundTbl_Death = {"npc/zombknees/xom/death1.mp3",
			"npc/zombknees/xom/death2.mp3",
			"npc/zombknees/xom/death3.mp3"}
	end
	if self.ZombType == 1 then
		local RebelSkin = math.random(1,2)
		if RebelSkin == 1 then
			self:SetSkin(2)
			self.RebelSkinn = 0
		else
			self:SetSkin(3)
			self.RebelSkinn = 1
		end
	elseif self.ZombType == 2 then
		local MedicSkin = math.random(1,2)
		if MedicSkin == 1 then
			self:SetSkin(4)
			self.MedicSkinn = 0
		else
			self:SetSkin(5)
			self.MedicSkinn = 1
		end
	elseif self.ZombType == 3 then
		self:SetSkin(6)
		self.ZombWeapon = 3
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo, hitgroup)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo, hitgroup)
	if dmginfo:IsDamageType(DMG_BURN) or dmginfo:IsDamageType(DMG_SLOWBURN) then
	self.ExtraCrispy = true
	end
	local DeathCrabThing = math.random(1,3)
	if DeathCrabThing == 2 then
		self.WhatDoCrab = 1
	elseif DeathCrabThing == 3 then
		self.WhatDoCrab = 2
		self.SoundTbl_Death = {"npc/zombie/zombie_die1.wav",
			"npc/zombie/zombie_die2.wav",
			"npc/zombie/zombie_die3.wav"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo, hitgroup)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	if self.HasCrab == true then
		if self.WhatDoCrab == 1 && self.ExtraCrispy == false then
			GetCorpse:SetBodygroup(1,0)
			self:CreateGibEntity("prop_ragdoll","models/headcrabclassic.mdl",{Pos=self:GetAttachment(self:LookupAttachment("headcrab")).Pos})
		elseif self.WhatDoCrab == 2 then
			GetCorpse:SetBodygroup(1,0)
			self.crab = ents.Create("npc_vj_bbohg_crab")
			self.crab:SetPos(self:GetAttachment(self:LookupAttachment("headcrab")).Pos or self:EyePos())
			self.crab:SetAngles(self:GetAngles())
			self.crab:Spawn()
			self.crab:SetGroundEntity(NULL)
			self.crab:Activate()
			if self.ExtraCrispy == true then
				self.crab:Ignite(10)
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		effectBlood:SetColor(VJ_Color2Byte(Color(130,19,10)))
		effectBlood:SetScale(75)
		util.Effect("VJ_Blood1",effectBlood)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
	
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/sgib_03.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/sgib_03.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/sgib_01.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/sgib_01.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_07.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,25))})
	-- self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_02.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	-- self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_03.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	-- self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_04.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	
	if self.HasCrab == true then
		if self.HasGibDeathParticles == true then
			local effectBlood = EffectData()
			effectBlood:SetOrigin(self:GetPos() + self:OBBCenter() +self:GetUp()*30)
			effectBlood:SetColor(VJ_Color2Byte(Color(230,164,20)))
			effectBlood:SetScale(35)
			util.Effect("VJ_Blood1",effectBlood)
		
			local bloodspray = EffectData()
			bloodspray:SetOrigin(self:GetPos())
			bloodspray:SetScale(8)
			bloodspray:SetFlags(3)
			bloodspray:SetColor(0)
			util.Effect("bloodspray",bloodspray)
			util.Effect("bloodspray",bloodspray)
		end
	
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
	end
	
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup)
	VJ_EmitSound(self, "vj_gib/default_gib_splat.wav", 100, 100)
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/