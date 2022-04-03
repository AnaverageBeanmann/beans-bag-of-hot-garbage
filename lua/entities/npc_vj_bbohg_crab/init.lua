AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/headcrabclassic.mdl"} 
ENT.StartHealth = 25
ENT.HullType = HULL_TINY
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(10, 20, -5), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Yellow"
ENT.BloodPoolSize = "Small"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 0
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = {ACT_RANGE_ATTACK1}
ENT.LeapDistance = 300
ENT.LeapToMeleeDistance = 0
ENT.TimeUntilLeapAttackDamage = 0.1
ENT.NextLeapAttackTime = 1.4
ENT.NextAnyAttackTime_Leap = 0.85
ENT.TimeUntilLeapAttackVelocity = 0.1
ENT.LeapAttackVelocityForward = 70
ENT.LeapAttackVelocityUp = 200
ENT.LeapAttackDamage = 8
ENT.LeapAttackExtraTimers = {0.2,0.3,0.4,0.4,0.6,0.7,0.8,0.9,1}
ENT.StopLeapAttackAfterFirstHit = true
ENT.LeapAttackDamageDistance = 40
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {}
ENT.SoundTbl_Idle = {"npc/zombknees/crab/crab.mp3"}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_Alert = {"npc/zombknees/crab/flee.mp3",
	"npc/zombknees/crab/frighten.mp3",
	"npc/zombknees/crab/scared.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie/zo_attack1.wav",
	"npc/zombie/zo_attack2.wav"}
ENT.SoundTbl_MeleeAttack = {}
ENT.SoundTbl_MeleeAttackMiss = {}
ENT.SoundTbl_BeforeRangeAttack = {}
ENT.SoundTbl_LeapAttackJump = {"npc/zombknees/crab/jump.mp3",
	"npc/zombknees/crab/leap.mp3"}
ENT.SoundTbl_LeapAttackDamage = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {"npc/zombknees/crab/agony.mp3",
	"npc/zombknees/crab/pain.mp3",
	"npc/zombknees/crab/suffering.mp3"}
ENT.SoundTbl_Death = {"npc/zombknees/crab/death.mp3",
	"npc/zombknees/crab/dies.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_Gibs") == 0 then
		self.AllowedToGib = false
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_JUMP))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
		if self.HasGibDeathParticles == true then
			local effectBlood = EffectData()
			effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
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
	
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
	
	
	
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