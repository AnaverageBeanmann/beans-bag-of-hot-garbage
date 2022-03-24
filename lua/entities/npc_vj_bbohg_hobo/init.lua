AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/monster/subject.mdl"} 
ENT.StartHealth = 100
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}


---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_HOBO"} 
---------------------------------------------------------------------------------------------------------------------------------------------

ENT.BloodColor = "Red"
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
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = false
ENT.AnimTbl_RangeAttack = {"throw1"}
ENT.RangeToMeleeDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = 0.9
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 15
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH"
---------------------------------------------------------------------------------------------------------------------------------------------

ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.IdleSoundChance = 5
ENT.CombatIdleSoundChance = 4

ENT.GeneralSoundPitch1 = 105
ENT.GeneralSoundPitch2 = 90

-- ENT.FootStepSoundLevel = 70
-- ENT.MeleeAttackSoundLevel = 75
ENT.IdleDialogueDistance = 175

ENT.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}
ENT.HasDeathRagdoll = true
ENT.DeathCorpseEntityClass = "UseDefaultBehavior"
ENT.DeathCorpseModel = {"models/Humans/corpse1.mdl"}

ENT.HasHat = false
ENT.HoboClass = 0
-- 0 = Standard
-- 1 = Armed
ENT.HoboWeapon = 0
-- 0 = None
-- 1 = Crowbar
-- 2 = Pipe
-- 3 = Stunstick
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
ENT.SoundTbl_RangeAttack = {"npc/zombie/claw_miss2.wav",
	"npc/zombie/claw_miss1.wav"}
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
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
		"npc/hobo/voice1/cant_reach_10.mp3",
		"npc/hobo/voice1/cant_reach_7.mp3",
		"npc/hobo/voice1/cant_reach_8.mp3",
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
	self.SoundTbl_BeforeRangeAttack = {"npc/hobo/voice1/cant_reach_1.mp3",
		"npc/hobo/voice1/cant_reach_11.mp3",
		"npc/hobo/voice1/cant_reach_4.mp3",
		"npc/hobo/voice1/cidle_1.mp3",
		"npc/hobo/voice1/cidle_5.mp3",
		"npc/hobo/voice1/pain_1.mp3",
		"npc/hobo/voice1/pain_4.mp3"}

	local VoicePack = math.random(1,6)
	if VoicePack == 1 then
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
			"npc/hobo/voice2/pain_10.mp3",
			"npc/hobo/voice2/pain_11.mp3"}
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
			"npc/hobo/voice2/pain_10.mp3",
			"npc/hobo/voice2/pain_11.mp3"}
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
		self.SoundTbl_BeforeRangeAttack = {"npc/hobo/voice2/pain_1.mp3",
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
	elseif VoicePack == 2 then
		self.SoundTbl_CombatIdle = {"npc/hobo/voice3/ass.mp3",
			"npc/hobo/voice3/banana.mp3",
			"npc/hobo/voice3/bosshark.mp3",
			"npc/hobo/voice3/laugh (1).mp3",
			"npc/hobo/voice3/laugh (2).mp3",
			"npc/hobo/voice3/laugh (3).mp3",
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
		self.SoundTbl_BeforeMeleeAttack = {"npc/hobo/voice3/bosshark.mp3",
			"npc/hobo/voice3/btch (1).mp3",
			"npc/hobo/voice3/btch (2).mp3",
			"npc/hobo/voice3/f (5).mp3",
			"npc/hobo/voice3/f (6).mp3",
			"npc/hobo/voice3/f (7).mp3",
			"npc/hobo/voice3/kissmyass.mp3",
			}
		self.SoundTbl_BeforeRangeAttack = {"npc/hobo/voice3/ass.mp3",
			"npc/hobo/voice3/btch (1).mp3",
			"npc/hobo/voice3/consumeshort.mp3",
			"npc/hobo/voice3/f (7).mp3",
			"npc/hobo/voice3/foff.mp3",
			"npc/hobo/voice3/hey.mp3",
			"npc/hobo/voice3/mfs.mp3",
			"npc/hobo/voice3/shoes.mp3",
			"npc/hobo/voice3/shut (1).mp3"}
	elseif VoicePack == 3 then
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
		self.SoundTbl_BeforeMeleeAttack = {"npc/hobo/voice4/cidle (1).wav",
			"npc/hobo/voice4/cidle (2).wav",
			"npc/hobo/voice4/cidle (3).wav"}
		self.SoundTbl_BeforeRangeAttack = {"npc/hobo/voice4/cidle (1).wav",
			"npc/hobo/voice4/cidle (2).wav",
			"npc/hobo/voice4/cidle (3).wav"}
	end

	if math.random(1,5) == 1 then
		self.HasWeapon = true
		self.AnimTbl_MeleeAttack = {"swing"}
		self.HoboClass = 1
		
		local Weapon = math.random(1,3)
		if Weapon == 1 then
			self.Weapon = ents.Create("prop_physics")
			self.Weapon:SetModel("models/weapons/w_crowbar.mdl")
			self.Weapon:SetLocalPos(self:GetPos())
			//self.Weapon:SetPos(self:GetPos())
			self.Weapon:SetOwner(self)
			self.Weapon:SetParent(self)
			self.Weapon:SetLocalAngles(Angle(-120,45,90))
			self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
			self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.Weapon:Spawn()
			self.Weapon:Activate()
			self.Weapon:SetSolid(SOLID_NONE)
			self.Weapon:AddEffects(EF_BONEMERGE)
		
			self.MeleeAttackDamage = math.Rand(10,15)
			self.MeleeAttackDamageType = DMG_SLASH
			self.SoundTbl_MeleeAttack = {"physics/flesh/flesh_impact_bullet1.wav",
				"physics/flesh/flesh_impact_bullet2.wav",
				"physics/flesh/flesh_impact_bullet3.wav",
				"physics/flesh/flesh_impact_bullet4.wav",
				"physics/flesh/flesh_impact_bullet5.wav"}
			self.SoundTbl_MeleeAttackExtra = {}
			self.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
			self.HoboWeapon = 1
			
		elseif Weapon == 2 then
			self.Weapon = ents.Create("prop_physics")
			self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
			self.Weapon:SetLocalPos(self:GetPos())
			//self.Weapon:SetPos(self:GetPos())
			self.Weapon:SetOwner(self)
			self.Weapon:SetParent(self)
			self.Weapon:SetLocalAngles(Angle(-120,45,90))
			self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
			self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.Weapon:Spawn()
			self.Weapon:Activate()
			self.Weapon:SetSolid(SOLID_NONE)
			self.Weapon:AddEffects(EF_BONEMERGE)
			
			self.MeleeAttackDamage = math.Rand(15,20)
			self.HasExtraMeleeAttackSounds = true
			self.ExtraMeleeAttackSoundLevel = 80
			self.SoundTbl_MeleeAttack = {"physics/metal/metal_canister_impact_hard1.wav",
				"physics/metal/metal_canister_impact_hard2.wav",
				"physics/metal/metal_canister_impact_hard3.wav"}
			self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
				"physics/flesh/flesh_impact_hard2.wav",
				"physics/flesh/flesh_impact_hard3.wav",
				"physics/flesh/flesh_impact_hard4.wav",
				"physics/flesh/flesh_impact_hard5.wav",
				"physics/flesh/flesh_impact_hard6.wav"}
			self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
				"npc/zombie/claw_miss2.wav"}
			self.HoboWeapon = 2
			
		elseif Weapon == 3 then
			self.Weapon = ents.Create("prop_physics")
			self.Weapon:SetModel("models/weapons/w_stunbaton.mdl")
			self.Weapon:SetLocalPos(self:GetPos())
			//self.Weapon:SetPos(self:GetPos())
			self.Weapon:SetOwner(self)
			self.Weapon:SetParent(self)
			self.Weapon:SetLocalAngles(Angle(-120,45,90))
			self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
			self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.Weapon:Spawn()
			self.Weapon:Activate()
			self.Weapon:SetSolid(SOLID_NONE)
			self.Weapon:AddEffects(EF_BONEMERGE)

			self.MeleeAttackDamage = math.Rand(10,15)
			self.MeleeAttackDamageType = DMG_SHOCK
			self.HasExtraMeleeAttackSounds = true
			
			self.MeleeAttackSoundLevel = 80
			self.ExtraMeleeAttackSoundLevel = 80
			self.SoundTbl_MeleeAttack = {"weapons/stunstick/stunstick_fleshhit1.wav",
				"weapons/stunstick/stunstick_fleshhit2.wav"}
			self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
				"physics/flesh/flesh_impact_hard2.wav",
				"physics/flesh/flesh_impact_hard3.wav",
				"physics/flesh/flesh_impact_hard4.wav",
				"physics/flesh/flesh_impact_hard5.wav",
				"physics/flesh/flesh_impact_hard6.wav"}
			self.SoundTbl_MeleeAttackMiss = {"weapons/stunstick/stunstick_swing1.wav",
				"weapons/stunstick/stunstick_swing2.wav"}
			self.HoboWeapon = 3
			
			
		end
			
	end
	
	if math.random(1,3) == 1 then
		self.HasRangeAttack = true
		if self.HoboClass == 1 then
			self.AnimTbl_RangeAttack = {"ThrowItem"}
			self.TimeUntilRangeAttackProjectileRelease = 1.05
			self.NextRangeAttackTime = 5
		end
	end
	
	if math.random(1,30) == 1 then
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
		self.HasHat = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if self.HasWeapon == true then return end
	local randattack_stand = math.random(1,8)

	if randattack_stand == 1 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 5 then
		self.AnimTbl_MeleeAttack = {"throw1"}
		self.TimeUntilMeleeAttackDamage = 0.95
		self.MeleeAttackDamage = math.Rand(10,15)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"ThrowItem"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 100
		self.MeleeAttackKnockBack_Up2 = 100
		
	elseif randattack_stand == 7 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45

	elseif randattack_stand == 8 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(5,10)
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
	if math.random(1,20) == 1 then
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_boot"
	else
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_trash"
	end
	if math.random(1,150) == 1 then
		local TheFunny = math.random(1,3)
		if TheFunny == 1 then
			self.RangeAttackEntityToSpawn = "obj_vj_bbohg_cola"
		elseif TheFunny == 2 then
			self.RangeAttackEntityToSpawn = "obj_vj_bbohg_pepsi"
		elseif TheFunny == 3 then
			self.RangeAttackEntityToSpawn = "obj_vj_bbohg_arbys_sandwich"
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	if self.HoboWeapon == 1 then
		self:CreateGibEntity("prop_physics","models/weapons/w_crowbar.mdl")
	elseif self.HoboWeapon == 2 then
		self:CreateGibEntity("prop_physics","models/props_canal/mattpipe.mdl")
	elseif self.HoboWeapon == 3 then
		self:CreateGibEntity("prop_physics","models/weapons/w_stunbaton.mdl")
	end
	if self.HasHat == true then
		self:CreateGibEntity("prop_physics","models/player/items/humans/top_hat.mdl")
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		effectBlood:SetColor(VJ_Color2Byte(Color(130,19,10)))
		effectBlood:SetScale(120)
		util.Effect("VJ_Blood1",effectBlood)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
	
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_01.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_02.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_03.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_04.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_scapula.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_spine.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/lung_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/liver_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/eye_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/eye_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,60))})
	if self.HoboWeapon == 1 then
		self:CreateGibEntity("prop_physics","models/weapons/w_crowbar.mdl")
	elseif self.HoboWeapon == 2 then
		self:CreateGibEntity("prop_physics","models/props_canal/mattpipe.mdl")
	elseif self.HoboWeapon == 3 then
		self:CreateGibEntity("prop_physics","models/weapons/w_stunbaton.mdl")
	end
	if self.HasHat == true then
		self:CreateGibEntity("prop_physics","models/player/items/humans/top_hat.mdl")
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