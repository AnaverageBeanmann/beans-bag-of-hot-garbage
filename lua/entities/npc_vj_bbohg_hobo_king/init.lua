AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/monster/subjec2.mdl"} 
ENT.StartHealth = 1000
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(45, 15, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_HOBO"} 
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
ENT.FlinchChance = 3
ENT.AnimTbl_Flinch = {} 
ENT.HasHitGroupFlinching = true 
ENT.HitGroupFlinching_DefaultWhenNotHit = false
ENT.HitGroupFlinching_Values = {
{HitGroup = {HITGROUP_HEAD}, Animation = {"physflinch1","flinch_head"}}, 
{HitGroup = {HITGROUP_CHEST}, Animation = {"physflinch1"}}, 
{HitGroup = {HITGROUP_LEFTARM}, Animation = {"physflinch3","flinch_leftarm"}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"physflinch2","flinch_rightarm"}},
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {"flinch_leftleg"}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {"flinch_rightleg"}}
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(5,10)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.TimeUntilMeleeAttackDamage = 0.4
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 50
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasGrenadeAttack = true
ENT.GrenadeAttackEntity = "obj_vj_bbohg_boot"
ENT.AnimTbl_GrenadeAttack = {"ThrowItem"}
ENT.ThrowGrenadeChance = 2
ENT.GrenadeAttackThrowDistanceClose = 1
ENT.TimeUntilGrenadeIsReleased = 1.05
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.IdleSoundChance = 5
ENT.CombatIdleSoundChance = 4

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 80

ENT.SoundTrackPlaybackRate = 1
-- ENT.FootStepSoundLevel = 70
-- ENT.MeleeAttackSoundLevel = 75
ENT.IdleDialogueDistance = 175

ENT.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}

ENT.NextZombieSpawnT = 0
ENT.AlreadySpawned = false
ENT.CanSummonHelp = true
ENT.CanAnnounceSpawnage = true
ENT.PlayerKillMinionCooldown = false
ENT.CanPlayTheSounds = true
ENT.TheWeapon = 0
-- 0 = Pistol
-- 1 = Revolver
ENT.VoicePackk = 0
-- 0 = That Guy Who Yells at Cats
-- 1 = Cocksuck Guy
-- 2 = Tourettes Guy
-- 3 = HowToBasic
-- 4 = Shadow Walker
ENT.CanSwapWeapon = true
ENT.CanChangeVoice = true
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"player/footsteps/concrete1.wav",
	"player/footsteps/concrete2.wav",
	"player/footsteps/concrete3.wav",
	"player/footsteps/concrete4.wav"}
ENT.SoundTbl_Idle = {"ambient/voices/cough1.wav",
	"ambient/voices/cough2.wav",
	"ambient/voices/cough3.wav",
	"ambient/voices/cough4.wav"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav",
	"npc/zombie/claw_miss1.wav"}
ENT.HasSoundTrack = false
ENT.SoundTbl_SoundTrack = {"music/Supermassive_Big_Dick.mp3"}
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_BossNotifications") == 1 then
		PrintMessage(HUD_PRINTCENTER, "The Hobo King has spawned!")
	end
	if GetConVarNumber("vj_BBOHG_BossMusic") == 1 then
		self.HasSoundTrack = true
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
	self.SoundTbl_CombatIdle = {"npc/hobo/voice1/cidle_1.mp3",
		"npc/hobo/voice1/cidle_2.mp3",
		"npc/hobo/voice1/cidle_3.mp3",
		"npc/hobo/voice1/cidle_4.mp3",
		"npc/hobo/voice1/cidle_5.mp3",
		"npc/hobo/voice1/cidle_6.mp3",
		"npc/hobo/voice1/alert_1.mp3",
		"npc/hobo/voice1/alert_2.mp3",
		"npc/hobo/voice1/cant_reach_10.mp3",
		"npc/hobo/voice1/cant_reach_11.mp3",
		"npc/hobo/voice1/cant_reach_13.mp3",
		"npc/hobo/voice1/cant_reach_7.mp3",
		"npc/hobo/voice1/cant_reach_8.mp3"}
	self.SoundTbl_Alert = {"npc/hobo/voice1/alert_1.mp3",	
		"npc/hobo/voice1/alert_2.mp3",
		"npc/hobo/voice1/cidle_1.mp3",
		"npc/hobo/voice1/cidle_2.mp3",
		"npc/hobo/voice1/cidle_5.mp3",
		"npc/hobo/voice1/cidle_6.mp3"}
	self.SoundTbl_OnKilledEnemy = {"npc/hobo/voice1/alert_2.mp3",
		"npc/hobo/voice1/cant_reach_11.mp3",
		"npc/hobo/voice1/cant_reach_13.mp3",
		"npc/hobo/voice1/cidle_4.mp3",
		"npc/hobo/voice1/cidle_5.mp3",
		"npc/hobo/voice1/death_3.mp3"}
	self.SoundTbl_LostEnemy = {"npc/hobo/voice1/lost_1.mp3",
		"npc/hobo/voice1/cant_reach_11.mp3",
		"npc/hobo/voice1/cidle_1.mp3",
		"npc/hobo/voice1/cidle_2.mp3",
		"npc/hobo/voice1/cidle_3.mp3",
		"npc/hobo/voice1/cidle_4.mp3",
		"npc/hobo/voice1/cidle_5.mp3",
		"npc/hobo/voice1/cidle_6.mp3",
		"npc/hobo/voice1/death_1.mp3",
		"npc/hobo/voice1/death_2.mp3",
		"npc/hobo/voice1/death_3.mp3"}
	self.SoundTbl_Pain = {"npc/hobo/voice1/pain_1.mp3",
		"npc/hobo/voice1/pain_2.mp3",
		"npc/hobo/voice1/pain_3.mp3",
		"npc/hobo/voice1/pain_4.mp3",
		"npc/hobo/voice1/death_2.mp3"}
	self.SoundTbl_Death = {"npc/hobo/voice1/death_1.mp3",
		"npc/hobo/voice1/death_2.mp3",
		"npc/hobo/voice1/death_3.mp3",
		"npc/hobo/voice1/pain_1.mp3",
		"npc/hobo/voice1/pain_2.mp3",
		"npc/hobo/voice1/pain_3.mp3",
		"npc/hobo/voice1/pain_4.mp3"}
	self.SoundTbl_IdleDialogue = {"npc/hobo/voice1/alert_1.mp3",
		"npc/hobo/voice1/cant_reach_13.mp3",
		"npc/hobo/voice1/cidle_2.mp3",
		"npc/hobo/voice1/cidle_4.mp3"}
	self.SoundTbl_IdleDialogueAnswer = {"npc/hobo/voice1/cant_reach_10.mp3",
		"npc/hobo/voice1/cant_reach_7.mp3",
		"npc/hobo/voice1/cant_reach_8.mp3",
		"npc/hobo/voice1/cidle_4.mp3",
		"npc/hobo/voice1/cidle_5.mp3"}
	self.SoundTbl_Investigate = {"npc/hobo/voice1/cidle_1.mp3",
		"npc/hobo/voice1/cidle_2.mp3",
		"npc/hobo/voice1/cidle_3.mp3",
		"npc/hobo/voice1/cidle_4.mp3",
		"npc/hobo/voice1/cidle_5.mp3",
		"npc/hobo/voice1/cidle_6.mp3",
		"npc/hobo/voice1/alert_1.mp3",
		"npc/hobo/voice1/alert_2.mp3",
		"npc/hobo/voice1/cant_reach_10.mp3",
		"npc/hobo/voice1/cant_reach_11.mp3",
		"npc/hobo/voice1/cant_reach_13.mp3",
		"npc/hobo/voice1/cant_reach_7.mp3",
		"npc/hobo/voice1/cant_reach_8.mp3"}
	self.SoundTbl_CallForHelp = {"npc/hobo/voice1/cant_reach_1.mp3",
		"npc/hobo/voice1/cant_reach_11.mp3",
		"npc/hobo/voice1/cant_reach_13.mp3",
		"npc/hobo/voice1/cant_reach_12.mp3",
		"npc/hobo/voice1/cant_reach_2.mp3",
		"npc/hobo/voice1/cant_reach_3.mp3",
		"npc/hobo/voice1/cant_reach_4.mp3",
		"npc/hobo/voice1/cant_reach_5.mp3",
		"npc/hobo/voice1/cant_reach_6.mp3",
		"npc/hobo/voice1/cant_reach_7.mp3"}
	self.SoundTbl_BeforeMeleeAttack = {"npc/hobo/voice1/pain_1.mp3",
		"npc/hobo/voice1/pain_2.mp3",
		"npc/hobo/voice1/pain_3.mp3",
		"npc/hobo/voice1/pain_4.mp3"}
	self.SoundTbl_GrenadeAttack = {"npc/hobo/voice1/cant_reach_1.mp3",
		"npc/hobo/voice1/cant_reach_11.mp3",
		"npc/hobo/voice1/cant_reach_4.mp3",
		"npc/hobo/voice1/cidle_1.mp3",
		"npc/hobo/voice1/cidle_5.mp3",
		"npc/hobo/voice1/pain_1.mp3",
		"npc/hobo/voice1/pain_4.mp3"}

	local VoicePack = math.random(1,6)
	if VoicePack == 1 then
		self.VoicePackk = 1
		self.SoundTbl_CombatIdle = {"npc/hobo/voice2/cidle_1.mp3",
			"npc/hobo/voice2/cidle_2.mp3",
			"npc/hobo/voice2/cidle_3.mp3",
			"npc/hobo/voice2/cidle_4.mp3",
			"npc/hobo/voice2/cidle_5.mp3",
			"npc/hobo/voice2/cidle_6.mp3",
			"npc/hobo/voice2/cidle_7.mp3"}
		self.SoundTbl_Idle = {"npc/hobo/voice2/idle_1.mp3",
			"npc/hobo/voice2/idle_2.mp3"}
		self.SoundTbl_Alert = {"npc/hobo/voice2/cidle_1.mp3",
			"npc/hobo/voice2/cidle_2.mp3",
			"npc/hobo/voice2/cidle_3.mp3",
			"npc/hobo/voice2/cidle_4.mp3",
			"npc/hobo/voice2/cidle_5.mp3",
			"npc/hobo/voice2/cidle_6.mp3",
			"npc/hobo/voice2/cidle_7.mp3"}
		self.SoundTbl_OnKilledEnemy = {"npc/hobo/voice2/kill_1.mp3",
			"npc/hobo/voice2/kill_2.mp3",
			"npc/hobo/voice2/kill_3.mp3",
			"npc/hobo/voice2/kill_4.mp3",
			"npc/hobo/voice2/kill_5.mp3"}
		self.SoundTbl_LostEnemy = {"npc/hobo/voice2/pain_1.mp3",
			"npc/hobo/voice2/pain_2.mp3",
			"npc/hobo/voice2/pain_3.mp3",
			"npc/hobo/voice2/pain_4.mp3",
			"npc/hobo/voice2/pain_5.mp3",
			"npc/hobo/voice2/pain_6.mp3",
			"npc/hobo/voice2/pain_7.mp3",
			"npc/hobo/voice2/pain_8.mp3",
			"npc/hobo/voice2/pain_9.mp3",
			"npc/hobo/voice2/pain_10.mp3"}
		self.SoundTbl_Pain = {"npc/hobo/voice2/pain_1.mp3",
			"npc/hobo/voice2/pain_2.mp3",
			"npc/hobo/voice2/pain_3.mp3",
			"npc/hobo/voice2/pain_4.mp3",
			"npc/hobo/voice2/pain_5.mp3",
			"npc/hobo/voice2/pain_6.mp3",
			"npc/hobo/voice2/pain_7.mp3",
			"npc/hobo/voice2/pain_8.mp3",
			"npc/hobo/voice2/pain_9.mp3",
			"npc/hobo/voice2/pain_10.mp3",
			"npc/hobo/voice2/pain_11.mp3"}
		self.SoundTbl_Death = {"npc/hobo/voice2/pain_1.mp3",
			"npc/hobo/voice2/pain_2.mp3",
			"npc/hobo/voice2/pain_3.mp3",
			"npc/hobo/voice2/pain_4.mp3",
			"npc/hobo/voice2/pain_5.mp3",
			"npc/hobo/voice2/pain_6.mp3",
			"npc/hobo/voice2/pain_7.mp3",
			"npc/hobo/voice2/pain_8.mp3",
			"npc/hobo/voice2/pain_9.mp3",
			"npc/hobo/voice2/pain_10.mp3"}
		self.SoundTbl_IdleDialogue = {"npc/hobo/voice2/cidle_1.mp3",
			"npc/hobo/voice2/cidle_2.mp3",
			"npc/hobo/voice2/cidle_3.mp3",
			"npc/hobo/voice2/cidle_4.mp3",
			"npc/hobo/voice2/cidle_5.mp3",
			"npc/hobo/voice2/cidle_6.mp3",
			"npc/hobo/voice2/cidle_7.mp3"}
		self.SoundTbl_IdleDialogueAnswer = {"npc/hobo/voice2/pain_1.mp3",
			"npc/hobo/voice2/pain_2.mp3",
			"npc/hobo/voice2/pain_3.mp3",
			"npc/hobo/voice2/pain_4.mp3",
			"npc/hobo/voice2/pain_5.mp3",
			"npc/hobo/voice2/pain_6.mp3",
			"npc/hobo/voice2/pain_7.mp3",
			"npc/hobo/voice2/pain_8.mp3",
			"npc/hobo/voice2/pain_9.mp3",
			"npc/hobo/voice2/pain_10.mp3",
			"npc/hobo/voice2/pain_11.mp3"}
		self.SoundTbl_Investigate = {"npc/hobo/voice2/cidle_1.mp3",
			"npc/hobo/voice2/cidle_2.mp3",
			"npc/hobo/voice2/cidle_3.mp3",
			"npc/hobo/voice2/cidle_4.mp3",
			"npc/hobo/voice2/cidle_5.mp3",
			"npc/hobo/voice2/cidle_6.mp3",
			"npc/hobo/voice2/cidle_7.mp3"}
		self.SoundTbl_CallForHelp = {"npc/hobo/voice2/cidle_1.mp3",
			"npc/hobo/voice2/cidle_2.mp3",
			"npc/hobo/voice2/cidle_3.mp3",
			"npc/hobo/voice2/cidle_4.mp3",
			"npc/hobo/voice2/cidle_5.mp3",
			"npc/hobo/voice2/cidle_6.mp3",
			"npc/hobo/voice2/cidle_7.mp3"}
		self.SoundTbl_BeforeMeleeAttack = {"npc/hobo/voice2/pain_1.mp3",
			"npc/hobo/voice2/pain_2.mp3",
			"npc/hobo/voice2/pain_3.mp3",
			"npc/hobo/voice2/pain_4.mp3",
			"npc/hobo/voice2/pain_5.mp3",
			"npc/hobo/voice2/pain_6.mp3",
			"npc/hobo/voice2/pain_7.mp3",
			"npc/hobo/voice2/pain_8.mp3",
			"npc/hobo/voice2/pain_9.mp3",
			"npc/hobo/voice2/pain_10.mp3",
			"npc/hobo/voice2/pain_11.mp3"}
		self.SoundTbl_GrenadeAttack = {"npc/hobo/voice2/pain_1.mp3",
			"npc/hobo/voice2/pain_2.mp3",
			"npc/hobo/voice2/pain_3.mp3",
			"npc/hobo/voice2/pain_4.mp3",
			"npc/hobo/voice2/pain_5.mp3",
			"npc/hobo/voice2/pain_6.mp3",
			"npc/hobo/voice2/pain_7.mp3",
			"npc/hobo/voice2/pain_8.mp3",
			"npc/hobo/voice2/pain_9.mp3",
			"npc/hobo/voice2/pain_10.mp3",
			"npc/hobo/voice2/pain_11.mp3"}
		if math.random(1,4) == 1 then
			self.SoundTbl_Pain = {"npc/hobo/voice2/kill_1.mp3",
			"npc/hobo/voice2/kill_2.mp3",
			"npc/hobo/voice2/kill_3.mp3"}
		end
	elseif VoicePack == 2 || VoicePack == 5 then
		self.VoicePackk = 2
		self.SoundTbl_CombatIdle = {"npc/hobo/voice3/200poundsofbirdsht.mp3",
			"npc/hobo/voice3/ass.mp3",
			"npc/hobo/voice3/banana.mp3",
			"npc/hobo/voice3/bosshark.mp3",
			"npc/hobo/voice3/btch (1).mp3",
			"npc/hobo/voice3/consumeshort.mp3",
			"npc/hobo/voice3/fyoukid.mp3",
			"npc/hobo/voice3/georgeforeman.mp3",
			"npc/hobo/voice3/kickass_ (1).mp3",
			"npc/hobo/voice3/kissmyass.mp3",
			"npc/hobo/voice3/laugh (1).mp3",
			"npc/hobo/voice3/laugh (2).mp3",
			"npc/hobo/voice3/laugh (3).mp3",
			"npc/hobo/voice3/machoman.mp3",
			"npc/hobo/voice3/mfs.mp3",
			"npc/hobo/voice3/myass.mp3",
			"npc/hobo/voice3/scotchtape.mp3",
			"npc/hobo/voice3/waste.mp3",
			}
		self.SoundTbl_Idle = {"npc/hobo/voice3/btch (2).mp3",
			"npc/hobo/voice3/f (5).mp3",
			"npc/hobo/voice3/f (8).mp3",
			"npc/hobo/voice3/f (9).mp3",
			"npc/hobo/voice3/georgeforeman.mp3",
			"npc/hobo/voice3/shut (2).mp3"
			}
		self.SoundTbl_Alert = {"npc/hobo/voice3/ass.mp3",
			"npc/hobo/voice3/bosshark.mp3",
			"npc/hobo/voice3/btch (1).mp3",
			"npc/hobo/voice3/foff.mp3",
			"npc/hobo/voice3/fyoukid.mp3",
			"npc/hobo/voice3/georgeforeman.mp3",
			"npc/hobo/voice3/hey.mp3",
			"npc/hobo/voice3/machoman.mp3",
			"npc/hobo/voice3/mfs.mp3",
			"npc/hobo/voice3/peeved.mp3",
			"npc/hobo/voice3/waste.mp3",
			}
		self.SoundTbl_OnKilledEnemy = {"npc/hobo/voice3/200poundsofbirdsht.mp3",
			"npc/hobo/voice3/alright.mp3",
			"npc/hobo/voice3/btch (1).mp3",
			"npc/hobo/voice3/consumeshort.mp3",
			"npc/hobo/voice3/fa.mp3",
			"npc/hobo/voice3/fyou (1).mp3",
			"npc/hobo/voice3/fyou (2).mp3",
			"npc/hobo/voice3/fyou (3).mp3",
			"npc/hobo/voice3/fyoukid.mp3",
			"npc/hobo/voice3/laugh (1).mp3",
			"npc/hobo/voice3/laugh (2).mp3",
			"npc/hobo/voice3/laugh (3).mp3",
			"npc/hobo/voice3/mallsanta.mp3",
			"npc/hobo/voice3/myass.mp3",
			"npc/hobo/voice3/pos.mp3",
			"npc/hobo/voice3/scotchtape.mp3",
			"npc/hobo/voice3/shut (1).mp3",
			"npc/hobo/voice3/waste.mp3",
			}
		self.SoundTbl_LostEnemy = {"npc/hobo/voice3/btch (1).mp3",
			"npc/hobo/voice3/f (1).mp3",
			"npc/hobo/voice3/foff.mp3",
			"npc/hobo/voice3/fyoukid.mp3",
			"npc/hobo/voice3/jollypark.mp3",
			"npc/hobo/voice3/myass.mp3",
			"npc/hobo/voice3/peeved.mp3",
			"npc/hobo/voice3/sht (9).mp3",
			"npc/hobo/voice3/sht (10).mp3",
			"npc/hobo/voice3/sht (11).mp3",
			"npc/hobo/voice3/sht (12).mp3",
			"npc/hobo/voice3/sht (13).mp3",
			"npc/hobo/voice3/sht (14).mp3",
			"npc/hobo/voice3/sht (15).mp3",
			"npc/hobo/voice3/sht (25).mp3",
			"npc/hobo/voice3/sht (26).mp3",
			"npc/hobo/voice3/sht (32).mp3",
			"npc/hobo/voice3/sht (33).mp3",
			"npc/hobo/voice3/sht (34).mp3",
			"npc/hobo/voice3/sht (35).mp3",
			}
		self.SoundTbl_Pain = {"npc/hobo/voice3/ahole.mp3",
			"npc/hobo/voice3/ass.mp3",
			"npc/hobo/voice3/breath.mp3",
			"npc/hobo/voice3/btch (2).mp3",
			"npc/hobo/voice3/chestpain.mp3",
			"npc/hobo/voice3/constipated.mp3",
			"npc/hobo/voice3/crotchpain.mp3",
			"npc/hobo/voice3/f (1).mp3",
			"npc/hobo/voice3/f (2).mp3",
			"npc/hobo/voice3/f (4).mp3",
			"npc/hobo/voice3/f (5).mp3",
			"npc/hobo/voice3/f (6).mp3",
			"npc/hobo/voice3/f (7).mp3",
			"npc/hobo/voice3/f (8).mp3",
			"npc/hobo/voice3/f (9).mp3",
			"npc/hobo/voice3/fyou (1).mp3",
			"npc/hobo/voice3/fyou (2).mp3",
			"npc/hobo/voice3/fyou (3).mp3",
			"npc/hobo/voice3/georgeforeman.mp3",
			"npc/hobo/voice3/goatcancer.mp3",
			"npc/hobo/voice3/hurts.mp3",
			"npc/hobo/voice3/iactuallydontknow.mp3",
			"npc/hobo/voice3/kickass_ (1).mp3",
			"npc/hobo/voice3/kickass_ (2).mp3",
			"npc/hobo/voice3/kickass_ (3).mp3",
			"npc/hobo/voice3/kissmyass.mp3",
			"npc/hobo/voice3/lungcancer (1).mp3",
			"npc/hobo/voice3/lungcancer (2).mp3",
			"npc/hobo/voice3/lungcancer (3).mp3",
			"npc/hobo/voice3/lungcancer (4).mp3",
			"npc/hobo/voice3/lungcancer (5).mp3",
			"npc/hobo/voice3/lungcancer (6).mp3",
			"npc/hobo/voice3/lungcancer (7).mp3",
			"npc/hobo/voice3/lungcancer (8).mp3",
			"npc/hobo/voice3/lungcancer (9).mp3",
			"npc/hobo/voice3/lungcancer (10).mp3",
			"npc/hobo/voice3/lungcancer (11).mp3",
			"npc/hobo/voice3/lungcancer (12).mp3",
			"npc/hobo/voice3/lungcancer (13).mp3",
			"npc/hobo/voice3/lungcancer (14).mp3",
			"npc/hobo/voice3/mfs.mp3",
			"npc/hobo/voice3/ouch.mp3",
			"npc/hobo/voice3/ow.mp3",
			"npc/hobo/voice3/sht (1).mp3",
			"npc/hobo/voice3/sht (3).mp3",
			"npc/hobo/voice3/sht (4).mp3",
			"npc/hobo/voice3/sht (5).mp3",
			"npc/hobo/voice3/sht (6).mp3",
			"npc/hobo/voice3/sht (7).mp3",
			"npc/hobo/voice3/sht (8).mp3",
			"npc/hobo/voice3/sht (12).mp3",
			"npc/hobo/voice3/sht (20).mp3",
			"npc/hobo/voice3/sht (21).mp3",
			"npc/hobo/voice3/sht (22).mp3",
			"npc/hobo/voice3/sht (23).mp3",
			"npc/hobo/voice3/sht (24).mp3",
			"npc/hobo/voice3/sht (27).mp3",
			"npc/hobo/voice3/sht (28).mp3",
			"npc/hobo/voice3/sht (29).mp3",
			"npc/hobo/voice3/suck.mp3",
			}
		self.SoundTbl_Death = {"npc/hobo/voice3/btch (1).mp3",
			"npc/hobo/voice3/earthquake.mp3",
			"npc/hobo/voice3/f (1).mp3",
			"npc/hobo/voice3/f (10).mp3",
			"npc/hobo/voice3/f (2).mp3",
			"npc/hobo/voice3/f (3).mp3",
			"npc/hobo/voice3/f (4).mp3",
			"npc/hobo/voice3/sht (2).mp3",
			"npc/hobo/voice3/sht (16).mp3",
			"npc/hobo/voice3/sht (17).mp3",
			"npc/hobo/voice3/sht (18).mp3",
			"npc/hobo/voice3/sht (19).mp3",
			"npc/hobo/voice3/sht (30).mp3",
			"npc/hobo/voice3/sht (31).mp3",
			"npc/hobo/voice3/wtf.mp3",
			}
		self.SoundTbl_IdleDialogue = {"npc/hobo/voice3/200poundsofbirdsht.mp3",
			"npc/hobo/voice3/ass.mp3",
			"npc/hobo/voice3/banana.mp3",
			"npc/hobo/voice3/bosshark.mp3",
			"npc/hobo/voice3/clocks.mp3",
			"npc/hobo/voice3/defecation.mp3",
			"npc/hobo/voice3/georgeforeman.mp3",
			"npc/hobo/voice3/giraffe.mp3",
			"npc/hobo/voice3/god.mp3",
			"npc/hobo/voice3/jollypark.mp3",
			"npc/hobo/voice3/lateshoes.mp3",
			"npc/hobo/voice3/machoman.mp3",
			"npc/hobo/voice3/tuba.mp3",
			"npc/hobo/voice3/waste.mp3",
			"npc/hobo/voice3/women.mp3",
			}
		self.SoundTbl_IdleDialogueAnswer = {"npc/hobo/voice3/200poundsofbirdsht.mp3",
			"npc/hobo/voice3/alright.mp3",
			"npc/hobo/voice3/ass.mp3",
			"npc/hobo/voice3/bosshark.mp3",
			"npc/hobo/voice3/fa.mp3",
			"npc/hobo/voice3/foff.mp3",
			"npc/hobo/voice3/fyou (1).mp3",
			"npc/hobo/voice3/kissmyass.mp3",
			"npc/hobo/voice3/mallsanta.mp3",
			"npc/hobo/voice3/myass.mp3",
			"npc/hobo/voice3/no (1).mp3",
			"npc/hobo/voice3/no (2).mp3",
			"npc/hobo/voice3/no (3).mp3",
			"npc/hobo/voice3/no (4).mp3",
			"npc/hobo/voice3/no (5).mp3",
			"npc/hobo/voice3/shut (2).mp3",
			"npc/hobo/voice3/sry.mp3",
			"npc/hobo/voice3/stupid.mp3",
			"npc/hobo/voice3/suck.mp3",
			"npc/hobo/voice3/yes_ (1).mp3",
			"npc/hobo/voice3/yes_ (2).mp3",
			"npc/hobo/voice3/yes_ (3).mp3",
			"npc/hobo/voice3/yes_ (4).mp3",
			"npc/hobo/voice3/yes_ (5).mp3",
			"npc/hobo/voice3/yes_ (6).mp3",
			}
		self.SoundTbl_Investigate = {"npc/hobo/voice3/banana.mp3",
			"npc/hobo/voice3/defecation.mp3",
			"npc/hobo/voice3/foff.mp3",
			"npc/hobo/voice3/kickass_ (1).mp3",
			"npc/hobo/voice3/kickass_ (2).mp3",
			"npc/hobo/voice3/kickass_ (3).mp3",
			"npc/hobo/voice3/whatisit.mp3",
			}
		self.SoundTbl_CallForHelp = {"npc/hobo/voice3/btch (1).mp3"}
		self.SoundTbl_BeforeMeleeAttack = {"npc/hobo/voice3/btch (1).mp3",
			"npc/hobo/voice3/btch (2).mp3",
			"npc/hobo/voice3/f (5).mp3",
			"npc/hobo/voice3/f (6).mp3",
			"npc/hobo/voice3/f (7).mp3",
			"npc/hobo/voice3/fyou (3).mp3",
			"npc/hobo/voice3/kissmyass.mp3",
			"npc/hobo/voice3/sht (1).mp3",
			"npc/hobo/voice3/sht (20).mp3",
			"npc/hobo/voice3/sht (21).mp3",
			"npc/hobo/voice3/sht (22).mp3",
			"npc/hobo/voice3/sht (23).mp3",
			"npc/hobo/voice3/sht (24).mp3",
			"npc/hobo/voice3/shut (1).mp3",
			}
		self.SoundTbl_GrenadeAttack = {"npc/hobo/voice3/ass.mp3",
			"npc/hobo/voice3/btch (1).mp3",
			"npc/hobo/voice3/consumeshort.mp3",
			"npc/hobo/voice3/f (7).mp3",
			"npc/hobo/voice3/foff.mp3",
			"npc/hobo/voice3/hey.mp3",
			"npc/hobo/voice3/mfs.mp3",
			"npc/hobo/voice3/shoes.mp3",
			"npc/hobo/voice3/shut (1).mp3"}
	elseif VoicePack == 3 then
		self.VoicePackk = 3
		self.SoundTbl_CombatIdle = {"npc/hobo/voice4/cidle (1).wav",
			"npc/hobo/voice4/cidle (2).wav",
			"npc/hobo/voice4/cidle (3).wav"}
		self.SoundTbl_Idle = {"npc/hobo/voice4/idle (1).wav",
			"npc/hobo/voice4/idle (2).wav",
			"npc/hobo/voice4/idle (3).wav",
			"npc/hobo/voice4/idle (4).wav",
			"npc/hobo/voice4/idle (5).wav",
			"npc/hobo/voice4/idle (6).wav",
			"npc/hobo/voice4/idle (7).wav",
			"npc/hobo/voice4/idle (8).wav",
			"npc/hobo/voice4/idle (9).wav",
			"npc/hobo/voice4/idle (10).wav"}
		self.SoundTbl_Alert = {"npc/hobo/voice4/alert (1).wav",
			"npc/hobo/voice4/alert (2).wav",
			"npc/hobo/voice4/alert (3).wav",
			"npc/hobo/voice4/alert (4).wav",
			"npc/hobo/voice4/alert (5).wav",
			"npc/hobo/voice4/alert (6).wav",
			"npc/hobo/voice4/alert (7).wav",
			"npc/hobo/voice4/alert (8).wav",
			"npc/hobo/voice4/alert (9).wav",
			"npc/hobo/voice4/alert (10).wav",
			"npc/hobo/voice4/alert (11).wav",
			"npc/hobo/voice4/alert (12).wav",
			"npc/hobo/voice4/alert (13).wav",
			"npc/hobo/voice4/alert (14).wav",
			"npc/hobo/voice4/alert (15).wav",
			"npc/hobo/voice4/alert (16).wav"}
		self.SoundTbl_OnKilledEnemy = {"npc/hobo/voice4/cidle (1).wav",
			"npc/hobo/voice4/cidle (2).wav",
			"npc/hobo/voice4/cidle (3).wav"}
		self.SoundTbl_LostEnemy = {"npc/hobo/voice4/pain (1).wav",
			"npc/hobo/voice4/pain (2).wav",
			"npc/hobo/voice4/pain (3).wav",
			"npc/hobo/voice4/pain (4).wav",
			"npc/hobo/voice4/pain (5).wav",
			"npc/hobo/voice4/pain (6).wav",
			"npc/hobo/voice4/pain (7).wav",
			"npc/hobo/voice4/pain (8).wav",
			"npc/hobo/voice4/pain (9).wav",
			"npc/hobo/voice4/pain (10).wav",
			"npc/hobo/voice4/pain (11).wav",
			"npc/hobo/voice4/pain (12).wav",
			"npc/hobo/voice4/pain (13).wav",
			"npc/hobo/voice4/pain (14).wav",
			"npc/hobo/voice4/pain (15).wav",
			"npc/hobo/voice4/pain (16).wav"}
		self.SoundTbl_Pain = {"npc/hobo/voice4/pain (1).wav",
			"npc/hobo/voice4/pain (2).wav",
			"npc/hobo/voice4/pain (3).wav",
			"npc/hobo/voice4/pain (4).wav",
			"npc/hobo/voice4/pain (5).wav",
			"npc/hobo/voice4/pain (6).wav",
			"npc/hobo/voice4/pain (7).wav",
			"npc/hobo/voice4/pain (8).wav",
			"npc/hobo/voice4/pain (9).wav",
			"npc/hobo/voice4/pain (10).wav",
			"npc/hobo/voice4/pain (11).wav",
			"npc/hobo/voice4/pain (12).wav",
			"npc/hobo/voice4/pain (13).wav",
			"npc/hobo/voice4/pain (14).wav",
			"npc/hobo/voice4/pain (15).wav",
			"npc/hobo/voice4/pain (16).wav"}
		self.SoundTbl_Death = {"npc/hobo/voice4/death (1).wav",
			"npc/hobo/voice4/death (2).wav",
			"npc/hobo/voice4/death (3).wav",
			"npc/hobo/voice4/death (4).wav",
			"npc/hobo/voice4/death (5).wav",
			"npc/hobo/voice4/death (6).wav",
			"npc/hobo/voice4/death (7).wav",
			"npc/hobo/voice4/death (8).wav"}
		self.SoundTbl_IdleDialogue = {"npc/hobo/voice4/cidle (1).wav",
			"npc/hobo/voice4/cidle (2).wav",
			"npc/hobo/voice4/cidle (3).wav"}
		self.SoundTbl_IdleDialogueAnswer = {"npc/hobo/voice4/cidle (1).wav",
			"npc/hobo/voice4/cidle (2).wav",
			"npc/hobo/voice4/cidle (3).wav"}
		self.SoundTbl_Investigate = {"npc/hobo/voice4/cidle (1).wav",
			"npc/hobo/voice4/cidle (2).wav",
			"npc/hobo/voice4/cidle (3).wav"}
		self.SoundTbl_CallForHelp = {"npc/hobo/voice4/cidle (1).wav",
			"npc/hobo/voice4/cidle (2).wav",
			"npc/hobo/voice4/cidle (3).wav"}
		self.SoundTbl_BeforeMeleeAttack = {"npc/hobo/voice4/attack (1).wav",
			"npc/hobo/voice4/attack (2).wav",
			"npc/hobo/voice4/attack (3).wav",
			"npc/hobo/voice4/attack (4).wav",
			"npc/hobo/voice4/attack (5).wav",
			"npc/hobo/voice4/attack (6).wav",
			"npc/hobo/voice4/attack (7).wav",
			"npc/hobo/voice4/attack (8).wav",
			"npc/hobo/voice4/attack (9).wav",
			"npc/hobo/voice4/attack (10).wav",
			"npc/hobo/voice4/attack (11).wav"}
		self.SoundTbl_GrenadeAttack = {"npc/hobo/voice4/attack (1).wav",
			"npc/hobo/voice4/attack (2).wav",
			"npc/hobo/voice4/attack (3).wav",
			"npc/hobo/voice4/attack (4).wav",
			"npc/hobo/voice4/attack (5).wav",
			"npc/hobo/voice4/attack (6).wav",
			"npc/hobo/voice4/attack (7).wav",
			"npc/hobo/voice4/attack (8).wav",
			"npc/hobo/voice4/attack (9).wav",
			"npc/hobo/voice4/attack (10).wav",
			"npc/hobo/voice4/attack (11).wav"}
	end
	
	if math.random(1,10) == 1 then
	self.VoicePackk = 4
	self.SoundTbl_CombatIdle = {"npc/shadowwalk/npc/stalker/stalker_scream1.wav",
		"npc/shadowwalk/npc/stalker/stalker_scream2.wav",
		"npc/shadowwalk/npc/stalker/stalker_scream3.wav",	
		"npc/shadowwalk/npc/stalker/stalker_scream4.wav"}
	self.SoundTbl_Alert = {"npc/shadowwalk/npc/stalker/stalker_alert1b.wav",	
		"npc/shadowwalk/npc/stalker/stalker_alert2b.wav",
		"npc/shadowwalk/npc/stalker/stalker_alert3b.wav"}
	self.SoundTbl_LostEnemy = {"npc/zombie_poison/pz_alert2.wav",
		"npc/shadowwalk/npc/stalker/stalker_die2.wav",
		"npc/shadowwalk/npc/stalker/stalker_scream4.wav"}
	self.SoundTbl_Pain = {"npc/shadowwalk/npc/stalker/stalker_pain1.wav",
		"npc/shadowwalk/npc/stalker/stalker_pain2.wav",
		"npc/shadowwalk/npc/stalker/stalker_pain3.wav"}
	self.SoundTbl_Death = {"ambient/creatures/town_child_scream1.wav"}
	self.SoundTbl_Idle = {}
	self.SoundTbl_OnKilledEnemy = {}
	self.SoundTbl_IdleDialogue = {}
	self.SoundTbl_IdleDialogueAnswer = {}
	self.SoundTbl_Investigate = {}
	self.SoundTbl_CallForHelp = {}
	self.SoundTbl_BeforeMeleeAttack = {}
	self.CombatIdleSoundPitch = VJ_Set(80, 90)
	self.PainSoundPitch = VJ_Set(65, 70)
	self.AlertSoundPitch = VJ_Set(80, 90)
	self.LostEnemySoundPitch = VJ_Set(80, 90)
	self.DeathSoundPitch = VJ_Set(60, 65)
	self.SoundTbl_GrenadeAttack = {}
		if math.random (1,20) == 1 then
			self.CombatIdleSoundPitch = VJ_Set(62, 62)
			self.AlertSoundPitch = VJ_Set(62, 62)
			self.LostEnemySoundPitch = VJ_Set(62, 62)
		self.SoundTbl_CombatIdle = {"npc/shadowwalk/vo/episode_1/citadel/al_stalk_pleasestopscreaming01.wav",
			"npc/shadowwalk/vo/episode_1/citadel/al_stalk_pleasestopscreaming02.wav",
			"npc/shadowwalk/vo/episode_1/citadel/al_stalk_pleasestopscreaming03.wav",
			"npc/shadowwalk/vo/episode_1/citadel/al_stalk_pleasestopscreaming04.wav",
			"npc/shadowwalk/vo/episode_1/citadel/al_stalk_pleasestopscreaming05.wav",
			"vo/k_lab2/al_optimism.wav",
			"npc/shadowwalk/vo/episode_1/c17/al_elev_whereselev.wav",
			"npc/shadowwalk/vo/episode_1/intro/al_wheredoeshethink.wav",
			"npc/shadowwalk/vo/outland_02/griggs_everywhere.wav",
			"npc/shadowwalk/vo/outland_11a/silo/kl_silo_wheredata01.wav",
			"npc/shadowwalk/vo/episode_1/intro/al_cantbelieveit.wav",
			"npc/shadowwalk/vo/episode_1/npc/alyx/al_deaf_canthearanything.wav",
			"npc/shadowwalk/vo/episode_1/npc/alyx/al_deaf_canthearyou.wav",
			"vo/k_lab/ba_cantlook.wav"}
		self.SoundTbl_Alert = {"vo/citadel/al_bitofit.wav",
			"npc/shadowwalk/vo/outlland_01/intro/al_rbed_notalone.wav"}
		self.SoundTbl_LostEnemy = {"vo/citadel/al_notagain02.wav",	
			"npc/shadowwalk/vo/episode_1/npc/alyx/al_light_lost05.wav",
			"npc/shadowwalk/vo/episode_1/npc/alyx/al_light_lost11.wav",
			"vo/citadel/al_wonderwhere.wav",	
			"npc/shadowwalk/vo/outland_12a/launch/al_launch_damnit.wav",	
			"vo/streetwar/alyx_gate/al_no.wav",	
			"vo/k_lab/kl_thenwhere.wav"}
		end
	end

	self.Hat = ents.Create("prop_physics")
	self.Hat:SetModel("models/player/items/humans/top_hat.mdl")
	self.Hat:SetLocalPos(self:GetPos())
	//self.Hat:SetPos(self:GetPos())
	self.Hat:SetOwner(self)
	self.Hat:SetParent(self)
	self.Hat:SetLocalAngles(Angle(-120,45,90))
	self.Hat:Fire("SetParentAttachmentMaintainOffset","anim_attachment_head")
	self.Hat:Fire("SetParentAttachment","anim_attachment_head")
	self.Hat:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self.Hat:Spawn()
	self.Hat:Activate()
	self.Hat:SetSolid(SOLID_NONE)
	self.Hat:AddEffects(EF_BONEMERGE)
	self.Hat:SetKeyValue("rendercolor","255 238 0 255")
				
				
	local SpawnWeapon = math.random(1,3)
	if SpawnWeapon == 1 then
		self:Give("weapon_vj_357")
		self.TheWeapon = 1
	else
		self:Give("weapon_vj_9mmpistol")
		self.TheWeapon = 0
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.VJ_IsBeingControlled == true && self.CanSwapWeapon == true && self.VJ_TheController:KeyDown(IN_ATTACK) && self.VJ_TheController:KeyDown(IN_RELOAD) then
		if self.TheWeapon == 0 then
			self:Give("weapon_vj_357")
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Equipped Weapon: Revolver.")
			VJ_EmitSound(self.VJ_TheController,{"items/ammo_pickup.wav"},50,100)
			self.TheWeapon = 1
			self.CanSwapWeapon = false
		elseif self.TheWeapon == 1 then
			self:Give("weapon_vj_9mmpistol")
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Equipped Weapon: Pistol.")
			VJ_EmitSound(self.VJ_TheController,{"items/ammo_pickup.wav"},50,100)
			self.TheWeapon = 0
			self.CanSwapWeapon = false
		end
		timer.Simple(1,function() if IsValid(self) then
			self.CanSwapWeapon = true
		end end)
	end
	if self.VJ_IsBeingControlled == true && self.CanChangeVoice == true && self.VJ_TheController:KeyDown(IN_ATTACK) && self.VJ_TheController:KeyDown(IN_SCORE) then
		if self.VoicePackk == 4 then
			self.VoicePackk = 0
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Current Voicepack: That Guy That Yells at Cats.")
			VJ_EmitSound(self.VJ_TheController,{"friends/friend_join.wav"},50,100)
			self.CanChangeVoice = false
			self.CombatIdleSoundPitch = VJ_Set(false, false)
			self.PainSoundPitch = VJ_Set(false, false)
			self.AlertSoundPitch = VJ_Set(false, false)
			self.LostEnemySoundPitch = VJ_Set(false, false)
			self.DeathSoundPitch = VJ_Set(false, false)
			self.SoundTbl_CombatIdle = {"npc/hobo/voice1/cidle_1.mp3",
				"npc/hobo/voice1/cidle_2.mp3",
				"npc/hobo/voice1/cidle_3.mp3",
				"npc/hobo/voice1/cidle_4.mp3",
				"npc/hobo/voice1/cidle_5.mp3",
				"npc/hobo/voice1/cidle_6.mp3",
				"npc/hobo/voice1/alert_1.mp3",
				"npc/hobo/voice1/alert_2.mp3",
				"npc/hobo/voice1/cant_reach_10.mp3",
				"npc/hobo/voice1/cant_reach_11.mp3",
				"npc/hobo/voice1/cant_reach_13.mp3",
				"npc/hobo/voice1/cant_reach_7.mp3",
				"npc/hobo/voice1/cant_reach_8.mp3"}
			self.SoundTbl_Alert = {"npc/hobo/voice1/alert_1.mp3",	
				"npc/hobo/voice1/alert_2.mp3",
				"npc/hobo/voice1/cidle_1.mp3",
				"npc/hobo/voice1/cidle_2.mp3",
				"npc/hobo/voice1/cidle_5.mp3",
				"npc/hobo/voice1/cidle_6.mp3"}
			self.SoundTbl_OnKilledEnemy = {"npc/hobo/voice1/alert_2.mp3",
				"npc/hobo/voice1/cant_reach_11.mp3",
				"npc/hobo/voice1/cant_reach_13.mp3",
				"npc/hobo/voice1/cidle_4.mp3",
				"npc/hobo/voice1/cidle_5.mp3",
				"npc/hobo/voice1/death_3.mp3"}
			self.SoundTbl_LostEnemy = {"npc/hobo/voice1/lost_1.mp3",
				"npc/hobo/voice1/cant_reach_11.mp3",
				"npc/hobo/voice1/cidle_1.mp3",
				"npc/hobo/voice1/cidle_2.mp3",
				"npc/hobo/voice1/cidle_3.mp3",
				"npc/hobo/voice1/cidle_4.mp3",
				"npc/hobo/voice1/cidle_5.mp3",
				"npc/hobo/voice1/cidle_6.mp3",
				"npc/hobo/voice1/death_1.mp3",
				"npc/hobo/voice1/death_2.mp3",
				"npc/hobo/voice1/death_3.mp3"}
			self.SoundTbl_Pain = {"npc/hobo/voice1/pain_1.mp3",
				"npc/hobo/voice1/pain_2.mp3",
				"npc/hobo/voice1/pain_3.mp3",
				"npc/hobo/voice1/pain_4.mp3",
				"npc/hobo/voice1/death_2.mp3"}
			self.SoundTbl_Death = {"npc/hobo/voice1/death_1.mp3",
				"npc/hobo/voice1/death_2.mp3",
				"npc/hobo/voice1/death_3.mp3",
				"npc/hobo/voice1/pain_1.mp3",
				"npc/hobo/voice1/pain_2.mp3",
				"npc/hobo/voice1/pain_3.mp3",
				"npc/hobo/voice1/pain_4.mp3"}
			self.SoundTbl_IdleDialogue = {"npc/hobo/voice1/alert_1.mp3",
				"npc/hobo/voice1/cant_reach_13.mp3",
				"npc/hobo/voice1/cidle_2.mp3",
				"npc/hobo/voice1/cidle_4.mp3"}
			self.SoundTbl_IdleDialogueAnswer = {"npc/hobo/voice1/cant_reach_10.mp3",
				"npc/hobo/voice1/cant_reach_7.mp3",
				"npc/hobo/voice1/cant_reach_8.mp3",
				"npc/hobo/voice1/cidle_4.mp3",
				"npc/hobo/voice1/cidle_5.mp3"}
			self.SoundTbl_Investigate = {"npc/hobo/voice1/cidle_1.mp3",
				"npc/hobo/voice1/cidle_2.mp3",
				"npc/hobo/voice1/cidle_3.mp3",
				"npc/hobo/voice1/cidle_4.mp3",
				"npc/hobo/voice1/cidle_5.mp3",
				"npc/hobo/voice1/cidle_6.mp3",
				"npc/hobo/voice1/alert_1.mp3",
				"npc/hobo/voice1/alert_2.mp3",
				"npc/hobo/voice1/cant_reach_10.mp3",
				"npc/hobo/voice1/cant_reach_11.mp3",
				"npc/hobo/voice1/cant_reach_13.mp3",
				"npc/hobo/voice1/cant_reach_7.mp3",
				"npc/hobo/voice1/cant_reach_8.mp3"}
			self.SoundTbl_CallForHelp = {"npc/hobo/voice1/cant_reach_1.mp3",
				"npc/hobo/voice1/cant_reach_11.mp3",
				"npc/hobo/voice1/cant_reach_13.mp3",
				"npc/hobo/voice1/cant_reach_12.mp3",
				"npc/hobo/voice1/cant_reach_2.mp3",
				"npc/hobo/voice1/cant_reach_3.mp3",
				"npc/hobo/voice1/cant_reach_4.mp3",
				"npc/hobo/voice1/cant_reach_5.mp3",
				"npc/hobo/voice1/cant_reach_6.mp3",
				"npc/hobo/voice1/cant_reach_7.mp3"}
			self.SoundTbl_BeforeMeleeAttack = {"npc/hobo/voice1/pain_1.mp3",
				"npc/hobo/voice1/pain_2.mp3",
				"npc/hobo/voice1/pain_3.mp3",
				"npc/hobo/voice1/pain_4.mp3"}
			self.SoundTbl_GrenadeAttack = {"npc/hobo/voice1/cant_reach_1.mp3",
				"npc/hobo/voice1/cant_reach_11.mp3",
				"npc/hobo/voice1/cant_reach_4.mp3",
				"npc/hobo/voice1/cidle_1.mp3",
				"npc/hobo/voice1/cidle_5.mp3",
				"npc/hobo/voice1/pain_1.mp3",
				"npc/hobo/voice1/pain_4.mp3"}
		elseif self.VoicePackk == 0 then
			self.VoicePackk = 1
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Current Voicepack: Cocksuck.")
			VJ_EmitSound(self.VJ_TheController,{"friends/friend_join.wav"},50,100)
			self.CanChangeVoice = false
			self.SoundTbl_CombatIdle = {"npc/hobo/voice2/cidle_1.mp3",
				"npc/hobo/voice2/cidle_2.mp3",
				"npc/hobo/voice2/cidle_3.mp3",
				"npc/hobo/voice2/cidle_4.mp3",
				"npc/hobo/voice2/cidle_5.mp3",
				"npc/hobo/voice2/cidle_6.mp3",
				"npc/hobo/voice2/cidle_7.mp3"}
			self.SoundTbl_Idle = {"npc/hobo/voice2/idle_1.mp3",
				"npc/hobo/voice2/idle_2.mp3"}
			self.SoundTbl_Alert = {"npc/hobo/voice2/cidle_1.mp3",
				"npc/hobo/voice2/cidle_2.mp3",
				"npc/hobo/voice2/cidle_3.mp3",
				"npc/hobo/voice2/cidle_4.mp3",
				"npc/hobo/voice2/cidle_5.mp3",
				"npc/hobo/voice2/cidle_6.mp3",
				"npc/hobo/voice2/cidle_7.mp3"}
			self.SoundTbl_OnKilledEnemy = {"npc/hobo/voice2/kill_1.mp3",
				"npc/hobo/voice2/kill_2.mp3",
				"npc/hobo/voice2/kill_3.mp3",
				"npc/hobo/voice2/kill_4.mp3",
				"npc/hobo/voice2/kill_5.mp3"}
			self.SoundTbl_LostEnemy = {"npc/hobo/voice2/pain_1.mp3",
				"npc/hobo/voice2/pain_2.mp3",
				"npc/hobo/voice2/pain_3.mp3",
				"npc/hobo/voice2/pain_4.mp3",
				"npc/hobo/voice2/pain_5.mp3",
				"npc/hobo/voice2/pain_6.mp3",
				"npc/hobo/voice2/pain_7.mp3",
				"npc/hobo/voice2/pain_8.mp3",
				"npc/hobo/voice2/pain_9.mp3",
				"npc/hobo/voice2/pain_10.mp3"}
			self.SoundTbl_Pain = {"npc/hobo/voice2/pain_1.mp3",
				"npc/hobo/voice2/pain_2.mp3",
				"npc/hobo/voice2/pain_3.mp3",
				"npc/hobo/voice2/pain_4.mp3",
				"npc/hobo/voice2/pain_5.mp3",
				"npc/hobo/voice2/pain_6.mp3",
				"npc/hobo/voice2/pain_7.mp3",
				"npc/hobo/voice2/pain_8.mp3",
				"npc/hobo/voice2/pain_9.mp3",
				"npc/hobo/voice2/pain_10.mp3",
				"npc/hobo/voice2/pain_11.mp3"}
			self.SoundTbl_Death = {"npc/hobo/voice2/pain_1.mp3",
				"npc/hobo/voice2/pain_2.mp3",
				"npc/hobo/voice2/pain_3.mp3",
				"npc/hobo/voice2/pain_4.mp3",
				"npc/hobo/voice2/pain_5.mp3",
				"npc/hobo/voice2/pain_6.mp3",
				"npc/hobo/voice2/pain_7.mp3",
				"npc/hobo/voice2/pain_8.mp3",
				"npc/hobo/voice2/pain_9.mp3",
				"npc/hobo/voice2/pain_10.mp3"}
			self.SoundTbl_IdleDialogue = {"npc/hobo/voice2/cidle_1.mp3",
				"npc/hobo/voice2/cidle_2.mp3",
				"npc/hobo/voice2/cidle_3.mp3",
				"npc/hobo/voice2/cidle_4.mp3",
				"npc/hobo/voice2/cidle_5.mp3",
				"npc/hobo/voice2/cidle_6.mp3",
				"npc/hobo/voice2/cidle_7.mp3"}
			self.SoundTbl_IdleDialogueAnswer = {"npc/hobo/voice2/pain_1.mp3",
				"npc/hobo/voice2/pain_2.mp3",
				"npc/hobo/voice2/pain_3.mp3",
				"npc/hobo/voice2/pain_4.mp3",
				"npc/hobo/voice2/pain_5.mp3",
				"npc/hobo/voice2/pain_6.mp3",
				"npc/hobo/voice2/pain_7.mp3",
				"npc/hobo/voice2/pain_8.mp3",
				"npc/hobo/voice2/pain_9.mp3",
				"npc/hobo/voice2/pain_10.mp3",
				"npc/hobo/voice2/pain_11.mp3"}
			self.SoundTbl_Investigate = {"npc/hobo/voice2/cidle_1.mp3",
				"npc/hobo/voice2/cidle_2.mp3",
				"npc/hobo/voice2/cidle_3.mp3",
				"npc/hobo/voice2/cidle_4.mp3",
				"npc/hobo/voice2/cidle_5.mp3",
				"npc/hobo/voice2/cidle_6.mp3",
				"npc/hobo/voice2/cidle_7.mp3"}
			self.SoundTbl_CallForHelp = {"npc/hobo/voice2/cidle_1.mp3",
				"npc/hobo/voice2/cidle_2.mp3",
				"npc/hobo/voice2/cidle_3.mp3",
				"npc/hobo/voice2/cidle_4.mp3",
				"npc/hobo/voice2/cidle_5.mp3",
				"npc/hobo/voice2/cidle_6.mp3",
				"npc/hobo/voice2/cidle_7.mp3"}
			self.SoundTbl_BeforeMeleeAttack = {"npc/hobo/voice2/pain_1.mp3",
				"npc/hobo/voice2/pain_2.mp3",
				"npc/hobo/voice2/pain_3.mp3",
				"npc/hobo/voice2/pain_4.mp3",
				"npc/hobo/voice2/pain_5.mp3",
				"npc/hobo/voice2/pain_6.mp3",
				"npc/hobo/voice2/pain_7.mp3",
				"npc/hobo/voice2/pain_8.mp3",
				"npc/hobo/voice2/pain_9.mp3",
				"npc/hobo/voice2/pain_10.mp3",
				"npc/hobo/voice2/pain_11.mp3"}
			self.SoundTbl_GrenadeAttack = {"npc/hobo/voice2/pain_1.mp3",
				"npc/hobo/voice2/pain_2.mp3",
				"npc/hobo/voice2/pain_3.mp3",
				"npc/hobo/voice2/pain_4.mp3",
				"npc/hobo/voice2/pain_5.mp3",
				"npc/hobo/voice2/pain_6.mp3",
				"npc/hobo/voice2/pain_7.mp3",
				"npc/hobo/voice2/pain_8.mp3",
				"npc/hobo/voice2/pain_9.mp3",
				"npc/hobo/voice2/pain_10.mp3",
				"npc/hobo/voice2/pain_11.mp3"}
		elseif self.VoicePackk == 1 then
			self.VoicePackk = 2
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Current Voicepack: Tourettes Guy.")
			VJ_EmitSound(self.VJ_TheController,{"friends/friend_join.wav"},50,100)
			self.CanChangeVoice = false
			self.SoundTbl_CombatIdle = {"npc/hobo/voice3/200poundsofbirdsht.mp3",
				"npc/hobo/voice3/ass.mp3",
				"npc/hobo/voice3/banana.mp3",
				"npc/hobo/voice3/bosshark.mp3",
				"npc/hobo/voice3/btch (1).mp3",
				"npc/hobo/voice3/consumeshort.mp3",
				"npc/hobo/voice3/fyoukid.mp3",
				"npc/hobo/voice3/georgeforeman.mp3",
				"npc/hobo/voice3/kickass_ (1).mp3",
				"npc/hobo/voice3/kissmyass.mp3",
				"npc/hobo/voice3/laugh (1).mp3",
				"npc/hobo/voice3/laugh (2).mp3",
				"npc/hobo/voice3/laugh (3).mp3",
				"npc/hobo/voice3/machoman.mp3",
				"npc/hobo/voice3/mfs.mp3",
				"npc/hobo/voice3/myass.mp3",
				"npc/hobo/voice3/scotchtape.mp3",
				"npc/hobo/voice3/waste.mp3"}
			self.SoundTbl_Idle = {"npc/hobo/voice3/btch (2).mp3",
				"npc/hobo/voice3/f (5).mp3",
				"npc/hobo/voice3/f (8).mp3",
				"npc/hobo/voice3/f (9).mp3",
				"npc/hobo/voice3/georgeforeman.mp3",
				"npc/hobo/voice3/shut (2).mp3"}
			self.SoundTbl_Alert = {"npc/hobo/voice3/ass.mp3",
				"npc/hobo/voice3/bosshark.mp3",
				"npc/hobo/voice3/btch (1).mp3",
				"npc/hobo/voice3/foff.mp3",
				"npc/hobo/voice3/fyoukid.mp3",
				"npc/hobo/voice3/georgeforeman.mp3",
				"npc/hobo/voice3/hey.mp3",
				"npc/hobo/voice3/machoman.mp3",
				"npc/hobo/voice3/mfs.mp3",
				"npc/hobo/voice3/peeved.mp3",
				"npc/hobo/voice3/waste.mp3"}
			self.SoundTbl_OnKilledEnemy = {"npc/hobo/voice3/200poundsofbirdsht.mp3",
				"npc/hobo/voice3/alright.mp3",
				"npc/hobo/voice3/btch (1).mp3",
				"npc/hobo/voice3/consumeshort.mp3",
				"npc/hobo/voice3/fa.mp3",
				"npc/hobo/voice3/fyou (1).mp3",
				"npc/hobo/voice3/fyou (2).mp3",
				"npc/hobo/voice3/fyou (3).mp3",
				"npc/hobo/voice3/fyoukid.mp3",
				"npc/hobo/voice3/laugh (1).mp3",
				"npc/hobo/voice3/laugh (2).mp3",
				"npc/hobo/voice3/laugh (3).mp3",
				"npc/hobo/voice3/mallsanta.mp3",
				"npc/hobo/voice3/myass.mp3",
				"npc/hobo/voice3/pos.mp3",
				"npc/hobo/voice3/scotchtape.mp3",
				"npc/hobo/voice3/shut (1).mp3",
				"npc/hobo/voice3/waste.mp3"}
			self.SoundTbl_LostEnemy = {"npc/hobo/voice3/btch (1).mp3",
				"npc/hobo/voice3/f (1).mp3",
				"npc/hobo/voice3/foff.mp3",
				"npc/hobo/voice3/fyoukid.mp3",
				"npc/hobo/voice3/jollypark.mp3",
				"npc/hobo/voice3/myass.mp3",
				"npc/hobo/voice3/peeved.mp3",
				"npc/hobo/voice3/sht (9).mp3",
				"npc/hobo/voice3/sht (10).mp3",
				"npc/hobo/voice3/sht (11).mp3",
				"npc/hobo/voice3/sht (12).mp3",
				"npc/hobo/voice3/sht (13).mp3",
				"npc/hobo/voice3/sht (14).mp3",
				"npc/hobo/voice3/sht (15).mp3",
				"npc/hobo/voice3/sht (25).mp3",
				"npc/hobo/voice3/sht (26).mp3",
				"npc/hobo/voice3/sht (32).mp3",
				"npc/hobo/voice3/sht (33).mp3",
				"npc/hobo/voice3/sht (34).mp3",
				"npc/hobo/voice3/sht (35).mp3"}
			self.SoundTbl_Pain = {"npc/hobo/voice3/ahole.mp3",
				"npc/hobo/voice3/ass.mp3",
				"npc/hobo/voice3/breath.mp3",
				"npc/hobo/voice3/btch (2).mp3",
				"npc/hobo/voice3/chestpain.mp3",
				"npc/hobo/voice3/constipated.mp3",
				"npc/hobo/voice3/crotchpain.mp3",
				"npc/hobo/voice3/f (1).mp3",
				"npc/hobo/voice3/f (2).mp3",
				"npc/hobo/voice3/f (4).mp3",
				"npc/hobo/voice3/f (5).mp3",
				"npc/hobo/voice3/f (6).mp3",
				"npc/hobo/voice3/f (7).mp3",
				"npc/hobo/voice3/f (8).mp3",
				"npc/hobo/voice3/f (9).mp3",
				"npc/hobo/voice3/fyou (1).mp3",
				"npc/hobo/voice3/fyou (2).mp3",
				"npc/hobo/voice3/fyou (3).mp3",
				"npc/hobo/voice3/georgeforeman.mp3",
				"npc/hobo/voice3/goatcancer.mp3",
				"npc/hobo/voice3/hurts.mp3",
				"npc/hobo/voice3/iactuallydontknow.mp3",
				"npc/hobo/voice3/kickass_ (1).mp3",
				"npc/hobo/voice3/kickass_ (2).mp3",
				"npc/hobo/voice3/kickass_ (3).mp3",
				"npc/hobo/voice3/kissmyass.mp3",
				"npc/hobo/voice3/lungcancer (1).mp3",
				"npc/hobo/voice3/lungcancer (2).mp3",
				"npc/hobo/voice3/lungcancer (3).mp3",
				"npc/hobo/voice3/lungcancer (4).mp3",
				"npc/hobo/voice3/lungcancer (5).mp3",
				"npc/hobo/voice3/lungcancer (6).mp3",
				"npc/hobo/voice3/lungcancer (7).mp3",
				"npc/hobo/voice3/lungcancer (8).mp3",
				"npc/hobo/voice3/lungcancer (9).mp3",
				"npc/hobo/voice3/lungcancer (10).mp3",
				"npc/hobo/voice3/lungcancer (11).mp3",
				"npc/hobo/voice3/lungcancer (12).mp3",
				"npc/hobo/voice3/lungcancer (13).mp3",
				"npc/hobo/voice3/lungcancer (14).mp3",
				"npc/hobo/voice3/mfs.mp3",
				"npc/hobo/voice3/ouch.mp3",
				"npc/hobo/voice3/ow.mp3",
				"npc/hobo/voice3/sht (1).mp3",
				"npc/hobo/voice3/sht (3).mp3",
				"npc/hobo/voice3/sht (4).mp3",
				"npc/hobo/voice3/sht (5).mp3",
				"npc/hobo/voice3/sht (6).mp3",
				"npc/hobo/voice3/sht (7).mp3",
				"npc/hobo/voice3/sht (8).mp3",
				"npc/hobo/voice3/sht (12).mp3",
				"npc/hobo/voice3/sht (20).mp3",
				"npc/hobo/voice3/sht (21).mp3",
				"npc/hobo/voice3/sht (22).mp3",
				"npc/hobo/voice3/sht (23).mp3",
				"npc/hobo/voice3/sht (24).mp3",
				"npc/hobo/voice3/sht (27).mp3",
				"npc/hobo/voice3/sht (28).mp3",
				"npc/hobo/voice3/sht (29).mp3",
				"npc/hobo/voice3/suck.mp3"}
			self.SoundTbl_Death = {"npc/hobo/voice3/btch (1).mp3",
				"npc/hobo/voice3/earthquake.mp3",
				"npc/hobo/voice3/f (1).mp3",
				"npc/hobo/voice3/f (10).mp3",
				"npc/hobo/voice3/f (2).mp3",
				"npc/hobo/voice3/f (3).mp3",
				"npc/hobo/voice3/f (4).mp3",
				"npc/hobo/voice3/sht (2).mp3",
				"npc/hobo/voice3/sht (16).mp3",
				"npc/hobo/voice3/sht (17).mp3",
				"npc/hobo/voice3/sht (18).mp3",
				"npc/hobo/voice3/sht (19).mp3",
				"npc/hobo/voice3/sht (30).mp3",
				"npc/hobo/voice3/sht (31).mp3",
				"npc/hobo/voice3/wtf.mp3"}
			self.SoundTbl_IdleDialogue = {"npc/hobo/voice3/200poundsofbirdsht.mp3",
				"npc/hobo/voice3/ass.mp3",
				"npc/hobo/voice3/banana.mp3",
				"npc/hobo/voice3/bosshark.mp3",
				"npc/hobo/voice3/clocks.mp3",
				"npc/hobo/voice3/defecation.mp3",
				"npc/hobo/voice3/georgeforeman.mp3",
				"npc/hobo/voice3/giraffe.mp3",
				"npc/hobo/voice3/god.mp3",
				"npc/hobo/voice3/jollypark.mp3",
				"npc/hobo/voice3/lateshoes.mp3",
				"npc/hobo/voice3/machoman.mp3",
				"npc/hobo/voice3/tuba.mp3",
				"npc/hobo/voice3/waste.mp3",
				"npc/hobo/voice3/women.mp3"}
			self.SoundTbl_IdleDialogueAnswer = {"npc/hobo/voice3/200poundsofbirdsht.mp3",
				"npc/hobo/voice3/alright.mp3",
				"npc/hobo/voice3/ass.mp3",
				"npc/hobo/voice3/bosshark.mp3",
				"npc/hobo/voice3/fa.mp3",
				"npc/hobo/voice3/foff.mp3",
				"npc/hobo/voice3/fyou (1).mp3",
				"npc/hobo/voice3/kissmyass.mp3",
				"npc/hobo/voice3/mallsanta.mp3",
				"npc/hobo/voice3/myass.mp3",
				"npc/hobo/voice3/no (1).mp3",
				"npc/hobo/voice3/no (2).mp3",
				"npc/hobo/voice3/no (3).mp3",
				"npc/hobo/voice3/no (4).mp3",
				"npc/hobo/voice3/no (5).mp3",
				"npc/hobo/voice3/shut (2).mp3",
				"npc/hobo/voice3/sry.mp3",
				"npc/hobo/voice3/stupid.mp3",
				"npc/hobo/voice3/suck.mp3",
				"npc/hobo/voice3/yes_ (1).mp3",
				"npc/hobo/voice3/yes_ (2).mp3",
				"npc/hobo/voice3/yes_ (3).mp3",
				"npc/hobo/voice3/yes_ (4).mp3",
				"npc/hobo/voice3/yes_ (5).mp3",
				"npc/hobo/voice3/yes_ (6).mp3"}
			self.SoundTbl_Investigate = {"npc/hobo/voice3/banana.mp3",
				"npc/hobo/voice3/defecation.mp3",
				"npc/hobo/voice3/foff.mp3",
				"npc/hobo/voice3/kickass_ (1).mp3",
				"npc/hobo/voice3/kickass_ (2).mp3",
				"npc/hobo/voice3/kickass_ (3).mp3",
				"npc/hobo/voice3/whatisit.mp3"}
			self.SoundTbl_CallForHelp = {"npc/hobo/voice3/btch (1).mp3"}
			self.SoundTbl_BeforeMeleeAttack = {"npc/hobo/voice3/btch (1).mp3",
				"npc/hobo/voice3/btch (2).mp3",
				"npc/hobo/voice3/f (5).mp3",
				"npc/hobo/voice3/f (6).mp3",
				"npc/hobo/voice3/f (7).mp3",
				"npc/hobo/voice3/fyou (3).mp3",
				"npc/hobo/voice3/kissmyass.mp3",
				"npc/hobo/voice3/sht (1).mp3",
				"npc/hobo/voice3/sht (20).mp3",
				"npc/hobo/voice3/sht (21).mp3",
				"npc/hobo/voice3/sht (22).mp3",
				"npc/hobo/voice3/sht (23).mp3",
				"npc/hobo/voice3/sht (24).mp3",
				"npc/hobo/voice3/shut (1).mp3"}
			self.SoundTbl_GrenadeAttack = {"npc/hobo/voice3/ass.mp3",
				"npc/hobo/voice3/btch (1).mp3",
				"npc/hobo/voice3/consumeshort.mp3",
				"npc/hobo/voice3/f (7).mp3",
				"npc/hobo/voice3/foff.mp3",
				"npc/hobo/voice3/hey.mp3",
				"npc/hobo/voice3/mfs.mp3",
				"npc/hobo/voice3/shoes.mp3",
				"npc/hobo/voice3/shut (1).mp3"}
		elseif self.VoicePackk == 2 then
			self.VoicePackk = 3
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Current Voicepack: HowToBasic.")
			VJ_EmitSound(self.VJ_TheController,{"friends/friend_join.wav"},50,100)
			self.CanChangeVoice = false
			self.SoundTbl_CombatIdle = {"npc/hobo/voice4/cidle (1).wav",
				"npc/hobo/voice4/cidle (2).wav",
				"npc/hobo/voice4/cidle (3).wav"}
			self.SoundTbl_Idle = {"npc/hobo/voice4/idle (1).wav",
				"npc/hobo/voice4/idle (2).wav",
				"npc/hobo/voice4/idle (3).wav",
				"npc/hobo/voice4/idle (4).wav",
				"npc/hobo/voice4/idle (5).wav",
				"npc/hobo/voice4/idle (6).wav",
				"npc/hobo/voice4/idle (7).wav",
				"npc/hobo/voice4/idle (8).wav",
				"npc/hobo/voice4/idle (9).wav",
				"npc/hobo/voice4/idle (10).wav"}
			self.SoundTbl_Alert = {"npc/hobo/voice4/alert (1).wav",
				"npc/hobo/voice4/alert (2).wav",
				"npc/hobo/voice4/alert (3).wav",
				"npc/hobo/voice4/alert (4).wav",
				"npc/hobo/voice4/alert (5).wav",
				"npc/hobo/voice4/alert (6).wav",
				"npc/hobo/voice4/alert (7).wav",
				"npc/hobo/voice4/alert (8).wav",
				"npc/hobo/voice4/alert (9).wav",
				"npc/hobo/voice4/alert (10).wav",
				"npc/hobo/voice4/alert (11).wav",
				"npc/hobo/voice4/alert (12).wav",
				"npc/hobo/voice4/alert (13).wav",
				"npc/hobo/voice4/alert (14).wav",
				"npc/hobo/voice4/alert (15).wav",
				"npc/hobo/voice4/alert (16).wav"}
			self.SoundTbl_OnKilledEnemy = {"npc/hobo/voice4/cidle (1).wav",
				"npc/hobo/voice4/cidle (2).wav",
				"npc/hobo/voice4/cidle (3).wav"}
			self.SoundTbl_LostEnemy = {"npc/hobo/voice4/pain (1).wav",
				"npc/hobo/voice4/pain (2).wav",
				"npc/hobo/voice4/pain (3).wav",
				"npc/hobo/voice4/pain (4).wav",
				"npc/hobo/voice4/pain (5).wav",
				"npc/hobo/voice4/pain (6).wav",
				"npc/hobo/voice4/pain (7).wav",
				"npc/hobo/voice4/pain (8).wav",
				"npc/hobo/voice4/pain (9).wav",
				"npc/hobo/voice4/pain (10).wav",
				"npc/hobo/voice4/pain (11).wav",
				"npc/hobo/voice4/pain (12).wav",
				"npc/hobo/voice4/pain (13).wav",
				"npc/hobo/voice4/pain (14).wav",
				"npc/hobo/voice4/pain (15).wav",
				"npc/hobo/voice4/pain (16).wav"}
			self.SoundTbl_Pain = {"npc/hobo/voice4/pain (1).wav",
				"npc/hobo/voice4/pain (2).wav",
				"npc/hobo/voice4/pain (3).wav",
				"npc/hobo/voice4/pain (4).wav",
				"npc/hobo/voice4/pain (5).wav",
				"npc/hobo/voice4/pain (6).wav",
				"npc/hobo/voice4/pain (7).wav",
				"npc/hobo/voice4/pain (8).wav",
				"npc/hobo/voice4/pain (9).wav",
				"npc/hobo/voice4/pain (10).wav",
				"npc/hobo/voice4/pain (11).wav",
				"npc/hobo/voice4/pain (12).wav",
				"npc/hobo/voice4/pain (13).wav",
				"npc/hobo/voice4/pain (14).wav",
				"npc/hobo/voice4/pain (15).wav",
				"npc/hobo/voice4/pain (16).wav"}
			self.SoundTbl_Death = {"npc/hobo/voice4/death (1).wav",
				"npc/hobo/voice4/death (2).wav",
				"npc/hobo/voice4/death (3).wav",
				"npc/hobo/voice4/death (4).wav",
				"npc/hobo/voice4/death (5).wav",
				"npc/hobo/voice4/death (6).wav",
				"npc/hobo/voice4/death (7).wav",
				"npc/hobo/voice4/death (8).wav"}
			self.SoundTbl_IdleDialogue = {"npc/hobo/voice4/cidle (1).wav",
				"npc/hobo/voice4/cidle (2).wav",
				"npc/hobo/voice4/cidle (3).wav"}
			self.SoundTbl_IdleDialogueAnswer = {"npc/hobo/voice4/cidle (1).wav",
				"npc/hobo/voice4/cidle (2).wav",
				"npc/hobo/voice4/cidle (3).wav"}
			self.SoundTbl_Investigate = {"npc/hobo/voice4/cidle (1).wav",
				"npc/hobo/voice4/cidle (2).wav",
				"npc/hobo/voice4/cidle (3).wav"}
			self.SoundTbl_CallForHelp = {"npc/hobo/voice4/cidle (1).wav",
				"npc/hobo/voice4/cidle (2).wav",
				"npc/hobo/voice4/cidle (3).wav"}
			self.SoundTbl_BeforeMeleeAttack = {"npc/hobo/voice4/attack (1).wav",
				"npc/hobo/voice4/attack (2).wav",
				"npc/hobo/voice4/attack (3).wav",
				"npc/hobo/voice4/attack (4).wav",
				"npc/hobo/voice4/attack (5).wav",
				"npc/hobo/voice4/attack (6).wav",
				"npc/hobo/voice4/attack (7).wav",
				"npc/hobo/voice4/attack (8).wav",
				"npc/hobo/voice4/attack (9).wav",
				"npc/hobo/voice4/attack (10).wav",
				"npc/hobo/voice4/attack (11).wav"}
			self.SoundTbl_GrenadeAttack = {"npc/hobo/voice4/attack (1).wav",
				"npc/hobo/voice4/attack (2).wav",
				"npc/hobo/voice4/attack (3).wav",
				"npc/hobo/voice4/attack (4).wav",
				"npc/hobo/voice4/attack (5).wav",
				"npc/hobo/voice4/attack (6).wav",
				"npc/hobo/voice4/attack (7).wav",
				"npc/hobo/voice4/attack (8).wav",
				"npc/hobo/voice4/attack (9).wav",
				"npc/hobo/voice4/attack (10).wav",
				"npc/hobo/voice4/attack (11).wav"}
		elseif self.VoicePackk == 3 then
			self.VoicePackk = 4
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Current Voicepack: Shadow Walker.")
			VJ_EmitSound(self.VJ_TheController,{"friends/friend_join.wav"},50,100)
			self.CanChangeVoice = false
			self.SoundTbl_CombatIdle = {"npc/shadowwalk/npc/stalker/stalker_scream1.wav",
				"npc/shadowwalk/npc/stalker/stalker_scream2.wav",
				"npc/shadowwalk/npc/stalker/stalker_scream3.wav",	
				"npc/shadowwalk/npc/stalker/stalker_scream4.wav"}
			self.SoundTbl_Alert = {"npc/shadowwalk/npc/stalker/stalker_alert1b.wav",	
				"npc/shadowwalk/npc/stalker/stalker_alert2b.wav",
				"npc/shadowwalk/npc/stalker/stalker_alert3b.wav"}
			self.SoundTbl_LostEnemy = {"npc/zombie_poison/pz_alert2.wav",
				"npc/shadowwalk/npc/stalker/stalker_die2.wav",
				"npc/shadowwalk/npc/stalker/stalker_scream4.wav"}
			self.SoundTbl_Pain = {"npc/shadowwalk/npc/stalker/stalker_pain1.wav",
				"npc/shadowwalk/npc/stalker/stalker_pain2.wav",
				"npc/shadowwalk/npc/stalker/stalker_pain3.wav"}
			self.SoundTbl_Death = {"ambient/creatures/town_child_scream1.wav"}
			self.SoundTbl_Idle = {}
			self.SoundTbl_OnKilledEnemy = {}
			self.SoundTbl_IdleDialogue = {}
			self.SoundTbl_IdleDialogueAnswer = {}
			self.SoundTbl_Investigate = {}
			self.SoundTbl_CallForHelp = {}
			self.SoundTbl_BeforeMeleeAttack = {}
			self.CombatIdleSoundPitch = VJ_Set(80, 90)
			self.PainSoundPitch = VJ_Set(65, 70)
			self.AlertSoundPitch = VJ_Set(80, 90)
			self.LostEnemySoundPitch = VJ_Set(80, 90)
			self.DeathSoundPitch = VJ_Set(60, 65)
			self.SoundTbl_GrenadeAttack = {}
		end
		timer.Simple(1,function() if IsValid(self) then
			self.CanChangeVoice = true
		end end)
	end
	if self.VJ_IsBeingControlled == true && self.CanAnnounceSpawnage == true && CurTime() > self.NextZombieSpawnT then
		self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Backup Hobos can be summoned!")
		VJ_EmitSound(self.VJ_TheController,{"buttons/blip1.wav"},50,100)
		self.CanAnnounceSpawnage = false
	end
	if self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_DUCK) && CurTime() < self.NextZombieSpawnT then
		self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Can't summon Hobos, summon cooldown not over!")
		if self.CanPlayTheSounds == true then
			VJ_EmitSound(self.VJ_TheController,{"buttons/button10.wav"},50,100)
			self.CanPlayTheSounds = false
			timer.Simple(1,function() if IsValid(self) then
				self.CanPlayTheSounds = true
			end end)
		end
	end
	if self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_DUCK) && GetConVarNumber("vj_BBOHG_BossReinforcements") == 0 then
		self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Can't summon Hobos, boss reinforcements is off!")
		if self.CanPlayTheSounds == true then
			VJ_EmitSound(VJ_TheController,{"buttons/button10.wav"},50,100)
			self.CanPlayTheSounds = false
			timer.Simple(1,function() if IsValid(self) then
				self.CanPlayTheSounds = true
			end end)
		end
	end
	if GetConVarNumber("vj_BBOHG_BossReinforcements") == 1 && self.CanSummonHelp == true then
		if IsValid(self:GetEnemy()) && CurTime() > self.NextZombieSpawnT then
		if self.AlreadySpawned == false && self.VJ_IsBeingControlled == false or self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_DUCK) then
			if self.VJ_IsBeingControlled == true && IsValid(self.Zombie1) && IsValid(self.Zombie2) && IsValid(self.Zombie3) && IsValid(self.Zombie4) then
				self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Can't summon Hobos, all minions alive!")
				if self.CanPlayTheSounds == true then
					VJ_EmitSound(self.VJ_TheController,{"buttons/button10.wav"},50,100)
					self.CanPlayTheSounds = false
					timer.Simple(1,function() if IsValid(self) then
						self.CanPlayTheSounds = true
					end end)
				end
			end
			if !IsValid(self.Zombie1) or !IsValid(self.Zombie2) or !IsValid(self.Zombie3) or !IsValid(self.Zombie4) then
			if self.VJ_IsBeingControlled == true then
				self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Summoning Hobos...")
				VJ_EmitSound(self.VJ_TheController,{"buttons/button19.wav"},50,100)
			end
				self.CanSummonHelp = false
				self.AlreadySpawned = true
				self.MovementType = VJ_MOVETYPE_STATIONARY
				self:VJ_ACT_PLAYACTIVITY("vjges_GestureButton", true, false, false)
			timer.Simple(1,function() if IsValid(self) then
				VJ_EmitSound(self,{"ambient/energy/weld1.wav","ambient/energy/weld2.wav"},100,math.random(100,95))
				effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(127, 0, 0, 255), {material="sprites/orangelight1", framerate=20})
				effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(127, 0, 0, 255), {material="sprites/orangelight1", framerate=20})
			
			if !IsValid(self.Zombie1) then
				self.Zombie1 = ents.Create("npc_vj_bbohg_hobo")
				self.Zombie1:SetPos(self:GetPos() +self:GetRight()*45 +self:GetUp()*5)
				self.Zombie1:SetAngles(self:GetAngles())
				self.Zombie1:Spawn()
				-- timer.Simple(0.3,function() if IsValid(self.Zombie1) then self.Zombie1:SetNoDraw(false) end end)
				local SpawnAnimation = math.random(1,3)
				if SpawnAnimation == 1 then
					self.Zombie1:VJ_ACT_PLAYACTIVITY("slumprise_a", true, false, false)
				elseif SpawnAnimation == 2 then
					self.Zombie1:VJ_ACT_PLAYACTIVITY("slumprise_a2", true, false, false)
				elseif SpawnAnimation == 3 then
					self.Zombie1:VJ_ACT_PLAYACTIVITY("slumprise_b", true, false, false)
				end
			end

			if !IsValid(self.Zombie2) then
				self.Zombie2 = ents.Create("npc_vj_bbohg_hobo")
				self.Zombie2:SetPos(self:GetPos() +self:GetRight()*-45 +self:GetUp()*5)
				self.Zombie2:SetAngles(self:GetAngles())
				self.Zombie2:Spawn()
				-- timer.Simple(0.3,function() if IsValid(self.Zombie2) then self.Zombie2:SetNoDraw(false) end end)
				local SpawnAnimation = math.random(1,3)
				if SpawnAnimation == 1 then
					self.Zombie2:VJ_ACT_PLAYACTIVITY("slumprise_a", true, false, false)
				elseif SpawnAnimation == 2 then
					self.Zombie2:VJ_ACT_PLAYACTIVITY("slumprise_a2", true, false, false)
				elseif SpawnAnimation == 3 then
					self.Zombie2:VJ_ACT_PLAYACTIVITY("slumprise_b", true, false, false)
				end
			end

			if !IsValid(self.Zombie3) then
				self.Zombie3 = ents.Create("npc_vj_bbohg_hobo")
				self.Zombie3:SetPos(self:GetPos() +self:GetForward()*45 +self:GetUp()*5)
				self.Zombie3:SetAngles(self:GetAngles())
				self.Zombie3:Spawn()
				-- timer.Simple(0.3,function() if IsValid(self.Zombie3) then self.Zombie3:SetNoDraw(false) end end)
				local SpawnAnimation = math.random(1,3)
				if SpawnAnimation == 1 then
					self.Zombie3:VJ_ACT_PLAYACTIVITY("slumprise_a", true, false, false)
				elseif SpawnAnimation == 2 then
					self.Zombie3:VJ_ACT_PLAYACTIVITY("slumprise_a2", true, false, false)
				elseif SpawnAnimation == 3 then
					self.Zombie3:VJ_ACT_PLAYACTIVITY("slumprise_b", true, false, false)
				end
			end
	
			if !IsValid(self.Zombie4) then
				self.Zombie4 = ents.Create("npc_vj_bbohg_hobo")
				self.Zombie4:SetPos(self:GetPos() +self:GetForward()*-45 +self:GetUp()*5)
				self.Zombie4:SetAngles(self:GetAngles())
				self.Zombie4:Spawn()
				-- timer.Simple(0.3,function() if IsValid(self.Zombie4) then self.Zombie4:SetNoDraw(false) end end)
				local SpawnAnimation = math.random(1,3)
				if SpawnAnimation == 1 then
					self.Zombie4:VJ_ACT_PLAYACTIVITY("slumprise_a", true, false, false)
				elseif SpawnAnimation == 2 then
					self.Zombie4:VJ_ACT_PLAYACTIVITY("slumprise_a2", true, false, false)
				elseif SpawnAnimation == 3 then
					self.Zombie4:VJ_ACT_PLAYACTIVITY("slumprise_b", true, false, false)
				end
			end

				self.AlreadySpawned = false
				self.CanSummonHelp = true
				self.NextZombieSpawnT = CurTime() + 20
				self.MovementType = VJ_MOVETYPE_GROUND
		self.CanAnnounceSpawnage = true
			end end)
			end
			end
		end
	end
	if self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_ZOOM) && self.PlayerKillMinionCooldown == false then
		self.PlayerKillMinionCooldown = true
		if self.VJ_IsBeingControlled == true && !IsValid(self.Zombie1) && !IsValid(self.Zombie2) && !IsValid(self.Zombie3) && !IsValid(self.Zombie4) then
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"No minions to kill!")
			if self.CanPlayTheSounds == true then
				VJ_EmitSound(self.VJ_TheController,{"buttons/button10.wav"},50,100)
				self.CanPlayTheSounds = false
				timer.Simple(1,function() if IsValid(self) then
					self.CanPlayTheSounds = true
				end end)
			end
		end
		if self.VJ_IsBeingControlled == true then
			if IsValid(self.Zombie1) or IsValid(self.Zombie2) or IsValid(self.Zombie3) or IsValid(self.Zombie4) then
				self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Killing Minions...")
				VJ_EmitSound(self.VJ_TheController,{"buttons/button19.wav"},50,100)
			end
		end
		if IsValid(self.Zombie1) then
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self.Zombie1)
			d:SetDamageType(DMG_GENERIC) 
			self.Zombie1:TakeDamageInfo(d)
		end
		if IsValid(self.Zombie2) then
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self.Zombie2)
			d:SetDamageType(DMG_GENERIC) 
			self.Zombie2:TakeDamageInfo(d)
		end
		if IsValid(self.Zombie3) then
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self.Zombie3)
			d:SetDamageType(DMG_GENERIC) 
			self.Zombie3:TakeDamageInfo(d)
		end
		if IsValid(self.Zombie4) then
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self.Zombie4)
			d:SetDamageType(DMG_GENERIC) 
			self.Zombie4:TakeDamageInfo(d)
		end
		timer.Simple(1,function() if IsValid(self) then
			self.PlayerKillMinionCooldown = false
		end end)
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSetupWeaponHoldTypeAnims(hType)
	if hType == "pistol" or hType == "revolver" then
		self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_PISTOL
		self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK_PISTOL
		self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 				= ACT_RANGE_ATTACK_PISTOL_LOW
		self.WeaponAnimTranslations[ACT_RELOAD] 						= ACT_RELOAD_PISTOL
		self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= ACT_RELOAD_PISTOL
		
		self.WeaponAnimTranslations[ACT_IDLE] 							= ACT_IDLE
		self.WeaponAnimTranslations[ACT_IDLE_ANGRY] 					= ACT_IDLE_ANGRY
		
		self.WeaponAnimTranslations[ACT_WALK] 							= ACT_WALK_RIFLE
		self.WeaponAnimTranslations[ACT_WALK_AIM] 						= ACT_WALK_AIM_RIFLE
		self.WeaponAnimTranslations[ACT_WALK_CROUCH] 					= ACT_WALK_CROUCH_RPG
		self.WeaponAnimTranslations[ACT_WALK_CROUCH_AIM] 				= ACT_WALK_CROUCH_AIM_RIFLE
		
		self.WeaponAnimTranslations[ACT_RUN] 							= ACT_RUN_RIFLE
		self.WeaponAnimTranslations[ACT_RUN_AIM] 						= ACT_RUN_AIM_RIFLE
		self.WeaponAnimTranslations[ACT_RUN_CROUCH] 					= ACT_RUN_CROUCH_RPG
		self.WeaponAnimTranslations[ACT_RUN_CROUCH_AIM] 				= ACT_RUN_CROUCH_AIM_RIFLE
		self.CanCrouchOnWeaponAttack = false
		return true
	else
		self.CanCrouchOnWeaponAttack = true
		return false
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply, controlEnt)
	ply:ChatPrint("CROUCH - Summon Hobos (if possible)")
	ply:ChatPrint("SUIT ZOOM - Kill all minions")
	ply:ChatPrint("MELEE + RELOAD - Change weapon")
	ply:ChatPrint("MELEE + TAB - Change voicepack")
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	if self.Dead == false then
		if IsValid(self.Zombie1) then self.Zombie1:Remove() end
		if IsValid(self.Zombie2) then self.Zombie2:Remove() end
		if IsValid(self.Zombie3) then self.Zombie3:Remove() end
		if IsValid(self.Zombie4) then self.Zombie4:Remove() end
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	if GetConVarNumber("vj_BBOHG_BossNotifications") == 1 then
		PrintMessage(HUD_PRINTCENTER, "The Hobo King has been killed!")
	end
	self.CanSummonHelp = false
	if IsValid(self) && GetConVarNumber("vj_BBOHG_BossCleanup") == 1 then
		if IsValid(self.Zombie1) then
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self.Zombie1)
			d:SetDamageType(DMG_GENERIC) 
			self.Zombie1:TakeDamageInfo(d)
		end
		if IsValid(self.Zombie2) then
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self.Zombie2)
			d:SetDamageType(DMG_GENERIC) 
			self.Zombie2:TakeDamageInfo(d)
		end
		if IsValid(self.Zombie3) then
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self.Zombie3)
			d:SetDamageType(DMG_GENERIC) 
			self.Zombie3:TakeDamageInfo(d)
		end
		if IsValid(self.Zombie4) then
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self.Zombie4)
			d:SetDamageType(DMG_GENERIC) 
			self.Zombie4:TakeDamageInfo(d)
		end
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
		end
	end)
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/