AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vinrax/npc/doll_mpc.mdl"} 
ENT.StartHealth = 2500
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(35, 30, -70), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = false
ENT.DeathAnimationChance = 1
ENT.AnimTbl_Death = {"deathpose_back",
	"deathpose_front",
	"deathpose_left",
	"deathpose_right"}
ENT.HasDeathRagdoll = false
ENT.AllowedToGib = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 70
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_lebebe"
ENT.AnimTbl_RangeAttack = {"cheer2"}
ENT.RangeAttackAnimationStopMovement = false
ENT.RangeToMeleeDistance = 100
ENT.TimeUntilRangeAttackProjectileRelease = 0.5
ENT.NextRangeAttackTime = 1
ENT.NextRangeAttackTime_DoRand = 5
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "mouth"
ENT.DisableRangeAttackAnimation = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.MeleeAttackSoundPitch = VJ_Set(100, 100)

ENT.IdleDialogueDistance = 175
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav","npc/zombie/foot2.wav","npc/zombie/foot3.wav"}
ENT.SoundTbl_Idle = {}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_Alert = {}
ENT.SoundTbl_BeforeMeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"npc/barnacle/barnacle_pull1.wav",
	"npc/barnacle/barnacle_pull2.wav",
	"npc/barnacle/barnacle_pull3.wav",
	"npc/barnacle/barnacle_pull4.wav"}
ENT.SoundTbl_RangeAttack = {"npc/antlion_grub/squashed.wav"}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {"ambient/voices/citizen_beaten1.wav","ambient/voices/citizen_beaten2.wav","ambient/voices/citizen_beaten3.wav"	}
ENT.SoundTbl_Death = {"ambient/creatures/town_child_scream1.wav"}
ENT.HasSoundTrack = false
-- ENT.SoundTbl_SoundTrack = {"music/Dance_of_the_Dreadnought.mp3"}
ENT.SoundTbl_SoundTrack = {"music/tank.mp3","music/taank.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_BossNotifications") == 1 then
		PrintMessage(HUD_PRINTCENTER, "A Giga Gore Child has spawned!")
	end
	if GetConVarNumber("vj_BBOHG_BossMusic") == 1 then
		self.HasSoundTrack = true
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	-- if math.random(1,4) == 1 then
		-- self.AnimTbl_Run = {ACT_RUN_CROUCH}
	-- end
	if GetConVarNumber("vj_BBOHG_MusicVolume") == 0 then
		self.SoundTrackVolume = 0.1
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 1 then
		self.SoundTrackVolume = 0.2
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 2 then
		self.SoundTrackVolume = 0.3
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 3 then
		self.SoundTrackVolume = 0.4
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 4 then
		self.SoundTrackVolume = 0.5
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 5 then
		self.SoundTrackVolume = 0.6
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 6 then
		self.SoundTrackVolume = 0.7
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 7 then
		self.SoundTrackVolume = 0.8
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 8 then
		self.SoundTrackVolume = 0.9
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 9 then
		self.SoundTrackVolume = 1
	end
	self:SetModelScale(1.6)
	self:SetCollisionBounds(Vector(11, 11, 80), Vector(-11, -11, 0))
	
	
-- ENT.SoundTrackVolume = 1
	
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if self.ZombType == 3 then return end
	local randattack_stand = math.random(1,8)

	if randattack_stand == 1 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 5 then
		self.AnimTbl_MeleeAttack = {"throw1"}
		self.TimeUntilMeleeAttackDamage = 0.95
		self.MeleeAttackDamage = math.Rand(25,30)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"ThrowItem"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 100
		self.MeleeAttackKnockBack_Up2 = 100
		
	elseif randattack_stand == 7 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45

	elseif randattack_stand == 8 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45
		
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer(seed)
	timer.Simple(0.5,function() if IsValid(self) then
		ParticleEffectAttach("vomit_barnacle",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		ParticleEffectAttach("blood_zombie_split",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
	end end)
	timer.Simple(1,function() if IsValid(self) then
		self:StopParticles()
	end end)
	-- fire_medium_02
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	if GetConVarNumber("vj_BBOHG_BossNotifications") == 1 then
		PrintMessage(HUD_PRINTCENTER, "A Giga Gore Child has been killed!")
	end
	if IsValid(self) then
    self:AddFlags(FL_NOTARGET)
	self:SetRenderFX( kRenderFxPulseSlowWide )
	if GetConVarNumber("vj_npc_noidleparticle") == 0 then
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_head"))
	end
	timer.Simple(0.1,function()
	if IsValid(self) then
		local STabb = math.random(1,2)
		if STabb == 1 then
			VJ_EmitSound(self,"fx/boss_death_initial_1.mp3",100,100)
		else
			VJ_EmitSound(self,"fx/boss_death_initial_2.mp3",100,100)
		end
		VJ_EmitSound(self,"fx/boss_death.mp3",100,100)
		VJ_EmitSound(self,"fx/boss_death.mp3",100,100)
		timer.Simple(0.5,function()
			if IsValid(self) then
				self:SetKeyValue("rendercolor","209 209 209 215")
			end
		end)
		timer.Simple(1,function()
			if IsValid(self) then
				self:SetKeyValue("rendercolor","177 177 177 175")
			end
		end)
		timer.Simple(1.5,function()
			if IsValid(self) then
				self:SetKeyValue("rendercolor","145 145 145 135")
			end
		end)
		timer.Simple(2,function()
		if IsValid(self) then
			self:SetKeyValue("rendercolor","96 96 96 95")
			if GetConVarNumber("vj_npc_noidleparticle") == 0 then
				ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
				ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
				ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_head"))
			end	
		end	
		end)
		timer.Simple(2.5,function()
			if IsValid(self) then
			self:SetKeyValue("rendercolor","55 55 55 45")
			end
		end)
		timer.Simple(3,function()
			if IsValid(self) then
			self:SetKeyValue("rendercolor","0 0 0 1")
			end
		end)
		timer.Simple(3.5,function()
			if IsValid(self) && GetConVarNumber("vj_BBOHG_BossCleanup") == 1 then
				local dissolver = ents.Create("env_entity_dissolver")
				dissolver:SetKeyValue("dissolvetype", 0)
				dissolver:SetKeyValue("magnitude", 0)
				dissolver:SetPos(Vector(0, 0, 0))
				dissolver:Spawn()
				dissolver:Fire("Dissolve", "npc_vj_bbohg_lebebe")
				dissolver:Fire("Kill", "", 0)
			end
		end)
		end
	end)
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/