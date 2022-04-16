AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/hostage_04.mdl"} 
ENT.StartHealth = 1000
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"}
ENT.FriendsWithAllPlayerAllies = true
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 3
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red"
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
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasItemDropsOnDeath = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(10,15)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"vjseq_MeleeAttack01"}
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 50
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.4
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasGrenadeAttack = true
ENT.AnimTbl_GrenadeAttack = {"ThrowItem"}
ENT.TimeUntilGrenadeIsReleased = 1.05
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

-- ENT.IdleSoundChance = 15
-- ENT.CombatIdleSoundChance = 15

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95
-- ENT.DeathSoundPitch = VJ_Set(135, 150)

ENT.IdleDialogueDistance = 175
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
	"npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_Idle = {""}
ENT.SoundTbl_IdleDialogue = {""}
ENT.SoundTbl_IdleDialogueAnswer = {""}
ENT.SoundTbl_CombatIdle = {""}
ENT.SoundTbl_OnReceiveOrder = {}
ENT.SoundTbl_FollowPlayer = {}
ENT.SoundTbl_UnFollowPlayer = {}
ENT.SoundTbl_MoveOutOfPlayersWay = {}
ENT.SoundTbl_OnPlayerSight = {}
ENT.SoundTbl_Investigate = {"npc/grampa/grandpainvisible.mp3"}
ENT.SoundTbl_LostEnemy = {}
ENT.SoundTbl_Alert = {"npc/grampa/grampaplaceholder.mp3",
	"npc/grampa/grampahit2.mp3"}
ENT.SoundTbl_CallForHelp = {}
ENT.SoundTbl_BecomeEnemyToPlayer = {}
ENT.SoundTbl_Suppressing = {}
ENT.SoundTbl_WeaponReload = {}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/grampa/grampaplaceholder.mp3",
	"npc/grampa/grampamiss.mp3",
	"npc/grampa/grampameat.mp3"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
ENT.SoundTbl_GrenadeAttack = {}
ENT.SoundTbl_OnGrenadeSight = {"npc/grampa/grampdies.mp3"}
ENT.SoundTbl_OnKilledEnemy = {"npc/grampa/grampaplaceholder.mp3",
	"npc/grampa/grampahit2.mp3",
	"npc/grampa/grampahit1.mp3"}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {"npc/grampa/grampaplaceholder.mp3",
	"npc/grampa/grandpainvisible.mp3",
	"npc/grampa/grampamiss.mp3"}
ENT.SoundTbl_DamageByPlayer = {}
ENT.SoundTbl_Death = {"npc/grampa/grampdies.mp3"}
ENT.HasSoundTrack = false
ENT.SoundTbl_SoundTrack = {"music/Fortunate_Son.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_BossNotifications") == 1 then
		PrintMessage(HUD_PRINTCENTER, "Grampa is here!")
	end
	if GetConVarNumber("vj_BBOHG_BossMusic") == 1 then
		self.HasSoundTrack = true
	end
	if GetConVarNumber("vj_BBOHG_Gibs") == 0 then
		self.AllowedToGib = false
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
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
-- ENT.SoundTrackVolume = 1
	self:Give("weapon_vj_bbohg_gramps_m16")
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	if GetConVarNumber("vj_BBOHG_BossNotifications") == 1 then
		PrintMessage(HUD_PRINTCENTER, "Grampa has been killed!")
	end
	self.CanSummonHelp = false
	if IsValid(self) then
	self.SoundTrackVolume = 0
	-- self:StartSoundTrack()
	-- self.SoundTbl_SoundTrack = {}
	-- self:StartSoundTrack()
    self:AddFlags(FL_NOTARGET)
	self:SetRenderFX( kRenderFxPulseSlowWide )
	if GetConVarNumber("vj_npc_noidleparticle") == 0 then
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
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
	
	
	-- self:SetKeyValue("rendercolor","255 255 255 250")
		timer.Simple(0.5,function()
		self:SetKeyValue("rendercolor","209 209 209 215") end)
		timer.Simple(1,function()
		self:SetKeyValue("rendercolor","177 177 177 175") end)
		timer.Simple(1.5,function()
		self:SetKeyValue("rendercolor","145 145 145 135") end)
		timer.Simple(2,function()
		self:SetKeyValue("rendercolor","96 96 96 95")
		if GetConVarNumber("vj_npc_noidleparticle") == 0 then
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
		end	end)
		timer.Simple(2.5,function()
		self:SetKeyValue("rendercolor","55 55 55 45") end)
		timer.Simple(3,function()
		self:SetKeyValue("rendercolor","0 0 0 1") end)
		timer.Simple(5.9,function()
		-- PrintMessage( HUD_PRINTTALK, "Hobo King has been banned permanently." )
		-- PrintMessage( HUD_PRINTTALK, "Reason: RDM." )
		end)
		end
	end)
		-- self:SetKeyValue("ColorAlpha","255 255 255 88")
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/