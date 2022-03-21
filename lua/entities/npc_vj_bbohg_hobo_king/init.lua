AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/monster/subject.mdl"} 
ENT.StartHealth = 1000
ENT.HullType = HULL_HUMAN
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
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_HOBO"} 
ENT.BloodColor = "Red"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDamage = math.Rand(5,10)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 28
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.6
-- ENT.HasOnKilledEnemySound = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.GrenadeAttackEntity = "obj_vj_bbohg_boot" -- The entity that the SNPC throws | Half Life 2 Grenade: "npc_grenade_frag"
ENT.GrenadeAttackModel = {} -- Picks a random model from this table to override the model of the grenade
ENT.GrenadeAttackAttachment = "anim_attachment_RH" -- The attachment that the grenade will spawn at | false = Custom position
	-- ====== Animation Variables ====== --
ENT.AnimTbl_GrenadeAttack = {"throw1"} -- Grenade Attack Animations
ENT.GrenadeAttackAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.GrenadeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the grenade attack animation?
	-- ====== Distance & Chance Variables ====== --
ENT.NextThrowGrenadeTime = VJ_Set(5, 10) -- Time until it can throw a grenade again
ENT.ThrowGrenadeChance = 1 -- Chance that it will throw the grenade | Set to 1 to throw all the time
ENT.GrenadeAttackThrowDistance = 1500 -- How far it can throw grenades
ENT.GrenadeAttackThrowDistanceClose = 1 -- How close until it stops throwing grenades
	-- ====== Timer Variables ====== --
ENT.TimeUntilGrenadeIsReleased = 0.85 -- Time until the grenade is released
ENT.GrenadeAttackAnimationStopAttacks = true -- Should it stop attacks for a certain amount of time?
	-- To let the base automatically detect the attack duration, set this to false:
ENT.GrenadeAttackAnimationStopAttacksTime = false -- How long should it stop attacks?
ENT.GrenadeAttackFussTime = 3 -- Time until the grenade explodes
	-- ====== Grenade Detection & Throwing Back Variables ====== --
ENT.CanDetectGrenades = true -- Set to false to disable the SNPC from running away from grenades
ENT.RunFromGrenadeDistance = 400 -- If the entity is this close to the it, then run!
	-- NOTE: The ability to throw grenades back only work if the SNPC can detect grenades AND has a grenade attack!
ENT.CanThrowBackDetectedGrenades = true -- Should it try to pick up the detected grenade and throw it back to the enemy?
	-- ====== Control Variables ====== --
ENT.DisableGrenadeAttackAnimation = false -- if true, it will disable the animation code when doing grenade attack
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = false
ENT.DeathAnimationChance = 1
ENT.AnimTbl_Death = {"deathpose_back",
	"deathpose_front",
	"deathpose_left",
	"deathpose_right"}
ENT.HasDeathRagdoll = false
ENT.FootStepSoundLevel = 70
ENT.MeleeAttackSoundLevel = 75
ENT.GeneralSoundPitch1 = 85
ENT.GeneralSoundPitch2 = 75
ENT.IdleSoundChance = 5
ENT.CombatIdleSoundChance = 4
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5
ENT.IdleDialogueDistance = 175
	ENT.HasSoundTrack = true
	ENT.SoundTbl_SoundTrack = {"music/Supermassive_Big_Dick.mp3"}

ENT.Weapon_NoSpawnMenu = true
ENT.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}

ENT.Crowbar = false
ENT.move = false
ENT.move2 = false
ENT.move3 = false
ENT.infect = true
ENT.infect2 = false
ENT.MoveToCorpose = false
ENT.HasEnemy = false
ENT.Suck = false
ENT.HasWeapon = false
ENT.HatType = 0
ENT.NST = 0
ENT.IsSitting = false
ENT.AlsoIsSitting = 0
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"player/footsteps/concrete1.wav",
	"player/footsteps/concrete2.wav",
	"player/footsteps/concrete3.wav",
	"player/footsteps/concrete4.wav",}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
"physics/body/body_medium_impact_hard2.wav",
"physics/body/body_medium_impact_hard3.wav",
"physics/body/body_medium_impact_hard4.wav",
"physics/body/body_medium_impact_hard5.wav"}
ENT.SoundTbl_MeleeAttackExtra = {}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav",
	"npc/zombie/claw_miss1.wav"}
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()

	self.NST = CurTime() + math.Rand(5, 65)
	self.SoundTbl_CombatIdle = {"hobo/voice1/cidle_1.mp3",
		"hobo/voice1/cidle_2.mp3",
		"hobo/voice1/cidle_3.mp3",
		"hobo/voice1/cidle_4.mp3",
		"hobo/voice1/cidle_5.mp3",
		"hobo/voice1/cidle_6.mp3",
		"hobo/voice1/alert_1.mp3",
		"hobo/voice1/alert_2.mp3",
		"hobo/voice1/cant_reach_10.mp3",
		"hobo/voice1/cant_reach_11.mp3",
		"hobo/voice1/cant_reach_13.mp3",
		"hobo/voice1/cant_reach_7.mp3",
		"hobo/voice1/cant_reach_8.mp3"}
	self.SoundTbl_Alert = {"hobo/voice1/alert_1.mp3",	
		"hobo/voice1/alert_2.mp3",
		"hobo/voice1/cidle_1.mp3",
		"hobo/voice1/cidle_2.mp3",
		"hobo/voice1/cidle_5.mp3",
		"hobo/voice1/cidle_6.mp3"}
	self.SoundTbl_OnKilledEnemy = {"hobo/voice1/alert_2.mp3",
		"hobo/voice1/cant_reach_11.mp3",
		"hobo/voice1/cant_reach_13.mp3",
		"hobo/voice1/cidle_4.mp3",
		"hobo/voice1/cidle_5.mp3",
		"hobo/voice1/death_3.mp3"}
	self.SoundTbl_LostEnemy = {"hobo/voice1/lost_1.mp3",
		"hobo/voice1/cant_reach_11.mp3",
		"hobo/voice1/cidle_1.mp3",
		"hobo/voice1/cidle_2.mp3",
		"hobo/voice1/cidle_3.mp3",
		"hobo/voice1/cidle_4.mp3",
		"hobo/voice1/cidle_5.mp3",
		"hobo/voice1/cidle_6.mp3",
		"hobo/voice1/death_1.mp3",
		"hobo/voice1/death_2.mp3",
		"hobo/voice1/death_3.mp3"}
	self.SoundTbl_Pain = {"hobo/voice1/pain_1.mp3",
		"hobo/voice1/pain_2.mp3",
		"hobo/voice1/pain_3.mp3",
		"hobo/voice1/pain_4.mp3",
		"hobo/voice1/cant_reach_10.mp3",
		"hobo/voice1/cant_reach_7.mp3",
		"hobo/voice1/cant_reach_8.mp3",
		"hobo/voice1/death_2.mp3"}
	self.SoundTbl_Death = {"hobo/voice1/death_1.mp3",
		"hobo/voice1/death_2.mp3",
		"hobo/voice1/death_3.mp3",
		"hobo/voice1/pain_1.mp3",
		"hobo/voice1/pain_2.mp3",
		"hobo/voice1/pain_3.mp3",
		"hobo/voice1/pain_4.mp3"}
	self.SoundTbl_IdleDialogue = {"hobo/voice1/alert_1.mp3",
		"hobo/voice1/cant_reach_13.mp3",
		"hobo/voice1/cidle_2.mp3",
		"hobo/voice1/cidle_4.mp3"}
	self.SoundTbl_IdleDialogueAnswer = {"hobo/voice1/cant_reach_10.mp3",
		"hobo/voice1/cant_reach_7.mp3",
		"hobo/voice1/cant_reach_8.mp3",
		"hobo/voice1/cidle_4.mp3",
		"hobo/voice1/cidle_5.mp3"}
	self.SoundTbl_Investigate = {"hobo/voice1/cidle_1.mp3",
		"hobo/voice1/cidle_2.mp3",
		"hobo/voice1/cidle_3.mp3",
		"hobo/voice1/cidle_4.mp3",
		"hobo/voice1/cidle_5.mp3",
		"hobo/voice1/cidle_6.mp3",
		"hobo/voice1/alert_1.mp3",
		"hobo/voice1/alert_2.mp3",
		"hobo/voice1/cant_reach_10.mp3",
		"hobo/voice1/cant_reach_11.mp3",
		"hobo/voice1/cant_reach_13.mp3",
		"hobo/voice1/cant_reach_7.mp3",
		"hobo/voice1/cant_reach_8.mp3"}
	self.SoundTbl_CallForHelp = {"hobo/voice1/cant_reach_1.mp3",
		"hobo/voice1/cant_reach_11.mp3",
		"hobo/voice1/cant_reach_13.mp3",
		"hobo/voice1/cant_reach_12.mp3",
		"hobo/voice1/cant_reach_2.mp3",
		"hobo/voice1/cant_reach_3.mp3",
		"hobo/voice1/cant_reach_4.mp3",
		"hobo/voice1/cant_reach_5.mp3",
		"hobo/voice1/cant_reach_6.mp3",
		"hobo/voice1/cant_reach_7.mp3"}
	self.SoundTbl_BeforeMeleeAttack = {"hobo/voice1/pain_1.mp3",
		"hobo/voice1/pain_2.mp3",
		"hobo/voice1/pain_3.mp3",
		"hobo/voice1/pain_4.mp3"}
	self.SoundTbl_GrenadeAttack = {"hobo/voice1/cant_reach_1.mp3",
		"hobo/voice1/cant_reach_11.mp3",
		"hobo/voice1/cant_reach_4.mp3",
		"hobo/voice1/cidle_1.mp3",
		"hobo/voice1/cidle_5.mp3",
		"hobo/voice1/pain_1.mp3",
		"hobo/voice1/pain_4.mp3"}
	self.SoundTbl_OnGrenadeSight = {"hobo/voice1/cant_reach_11.mp3",
		"hobo/voice1/cidle_4.mp3",
		"hobo/voice1/cidle_5.mp3",
		"hobo/voice1/death_1.mp3",
		"hobo/voice1/death_2.mp3",
		"hobo/voice1/death_3.mp3",
		"hobo/voice1/pain_1.mp3",
		"hobo/voice1/pain_2.mp3"}
	self.SoundTbl_RangeAttack = {"npc/zombie/claw_miss2.wav",
		"npc/zombie/claw_miss1.wav"}

-- self.SoundTbl_Idle = {}
-- self.SoundTbl_MeleeAttack = {}
-- self.SoundTbl_MeleeAttackExtra = {}
-- self.SoundTbl_MeleeAttackMiss = {}
-- self.SoundTbl_MeleeAttackSlowPlayer = {"vj_player/heartbeat.wav"}
-- self.SoundTbl_GrenadeAttack = {}
-- self.SoundTbl_RangeAttack = {}
-- self.SoundTbl_BeforeLeapAttack = {}
-- self.SoundTbl_LeapAttackJump = {}
-- self.SoundTbl_LeapAttackDamage = {}
-- self.SoundTbl_LeapAttackDamageMiss = {}
-- self.SoundTbl_OnKilledEnemy = {}


	if math.random (1,4) == 1 then
		-- self.CombatIdleSoundPitch = VJ_Set(62, 62)
		-- self.AlertSoundPitch = VJ_Set(62, 62)
		-- self.LostEnemySoundPitch = VJ_Set(62, 62)

	self.SoundTbl_CombatIdle = {"hobo/voice2/cidle_1.mp3",
		"hobo/voice2/cidle_2.mp3",
		"hobo/voice2/cidle_3.mp3",
		"hobo/voice2/cidle_4.mp3",
		"hobo/voice2/cidle_5.mp3",
		"hobo/voice2/cidle_6.mp3",
		"hobo/voice2/cidle_7.mp3"}
	self.SoundTbl_Idle = {"hobo/voice2/idle_1.mp3",
		"hobo/voice2/idle_2.mp3"}
	self.SoundTbl_Alert = {"hobo/voice2/cidle_1.mp3",
		"hobo/voice2/cidle_2.mp3",
		"hobo/voice2/cidle_3.mp3",
		"hobo/voice2/cidle_4.mp3",
		"hobo/voice2/cidle_5.mp3",
		"hobo/voice2/cidle_6.mp3",
		"hobo/voice2/cidle_7.mp3"}
	self.SoundTbl_OnKilledEnemy = {"hobo/voice2/kill_1.mp3",
		"hobo/voice2/kill_2.mp3",
		"hobo/voice2/kill_3.mp3",
		"hobo/voice2/kill_4.mp3",
		"hobo/voice2/kill_5.mp3"}
	self.SoundTbl_LostEnemy = {"hobo/voice2/pain_1.mp3",
		"hobo/voice2/pain_2.mp3",
		"hobo/voice2/pain_3.mp3",
		"hobo/voice2/pain_4.mp3",
		"hobo/voice2/pain_5.mp3",
		"hobo/voice2/pain_6.mp3",
		"hobo/voice2/pain_7.mp3",
		"hobo/voice2/pain_8.mp3",
		"hobo/voice2/pain_9.mp3",
		"hobo/voice2/pain_10.mp3",
		"hobo/voice2/pain_11.mp3"}
	self.SoundTbl_Pain = {"hobo/voice2/pain_1.mp3",
		"hobo/voice2/pain_2.mp3",
		"hobo/voice2/pain_3.mp3",
		"hobo/voice2/pain_4.mp3",
		"hobo/voice2/pain_5.mp3",
		"hobo/voice2/pain_6.mp3",
		"hobo/voice2/pain_7.mp3",
		"hobo/voice2/pain_8.mp3",
		"hobo/voice2/pain_9.mp3",
		"hobo/voice2/pain_10.mp3",
		"hobo/voice2/pain_11.mp3"}
	self.SoundTbl_Death = {"hobo/voice2/pain_1.mp3",
		"hobo/voice2/pain_2.mp3",
		"hobo/voice2/pain_3.mp3",
		"hobo/voice2/pain_4.mp3",
		"hobo/voice2/pain_5.mp3",
		"hobo/voice2/pain_6.mp3",
		"hobo/voice2/pain_7.mp3",
		"hobo/voice2/pain_8.mp3",
		"hobo/voice2/pain_9.mp3",
		"hobo/voice2/pain_10.mp3",
		"hobo/voice2/pain_11.mp3"}
	self.SoundTbl_IdleDialogue = {"hobo/voice2/cidle_1.mp3",
		"hobo/voice2/cidle_2.mp3",
		"hobo/voice2/cidle_3.mp3",
		"hobo/voice2/cidle_4.mp3",
		"hobo/voice2/cidle_5.mp3",
		"hobo/voice2/cidle_6.mp3",
		"hobo/voice2/cidle_7.mp3"}
	self.SoundTbl_IdleDialogueAnswer = {"hobo/voice2/pain_1.mp3",
		"hobo/voice2/pain_2.mp3",
		"hobo/voice2/pain_3.mp3",
		"hobo/voice2/pain_4.mp3",
		"hobo/voice2/pain_5.mp3",
		"hobo/voice2/pain_6.mp3",
		"hobo/voice2/pain_7.mp3",
		"hobo/voice2/pain_8.mp3",
		"hobo/voice2/pain_9.mp3",
		"hobo/voice2/pain_10.mp3",
		"hobo/voice2/pain_11.mp3"}
	self.SoundTbl_Investigate = {"hobo/voice2/cidle_1.mp3",
		"hobo/voice2/cidle_2.mp3",
		"hobo/voice2/cidle_3.mp3",
		"hobo/voice2/cidle_4.mp3",
		"hobo/voice2/cidle_5.mp3",
		"hobo/voice2/cidle_6.mp3",
		"hobo/voice2/cidle_7.mp3"}
	self.SoundTbl_CallForHelp = {"hobo/voice2/cidle_1.mp3",
		"hobo/voice2/cidle_2.mp3",
		"hobo/voice2/cidle_3.mp3",
		"hobo/voice2/cidle_4.mp3",
		"hobo/voice2/cidle_5.mp3",
		"hobo/voice2/cidle_6.mp3",
		"hobo/voice2/cidle_7.mp3"}
	self.SoundTbl_BeforeMeleeAttack = {"hobo/voice2/pain_1.mp3",
		"hobo/voice2/pain_2.mp3",
		"hobo/voice2/pain_3.mp3",
		"hobo/voice2/pain_4.mp3",
		"hobo/voice2/pain_5.mp3",
		"hobo/voice2/pain_6.mp3",
		"hobo/voice2/pain_7.mp3",
		"hobo/voice2/pain_8.mp3",
		"hobo/voice2/pain_9.mp3",
		"hobo/voice2/pain_10.mp3",
		"hobo/voice2/pain_11.mp3"}
	self.SoundTbl_GrenadeAttack = {"hobo/voice2/pain_1.mp3",
		"hobo/voice2/pain_2.mp3",
		"hobo/voice2/pain_3.mp3",
		"hobo/voice2/pain_4.mp3",
		"hobo/voice2/pain_5.mp3",
		"hobo/voice2/pain_6.mp3",
		"hobo/voice2/pain_7.mp3",
		"hobo/voice2/pain_8.mp3",
		"hobo/voice2/pain_9.mp3",
		"hobo/voice2/pain_10.mp3",
		"hobo/voice2/pain_11.mp3"}
	self.SoundTbl_RangeAttack = {"npc/zombie/claw_miss2.wav",
		"npc/zombie/claw_miss1.wav"}
	self.Suck = true
	
	
	if math.random(1,4) == 1 then
		self.SoundTbl_Pain = {"hobo/voice2/kill_1.mp3",
		"hobo/voice2/kill_2.mp3",
		"hobo/voice2/kill_3.mp3"}
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
				
	local WeaponToSpawnWith = math.random(1,3)
		if WeaponToSpawnWith == 1 then
			self:Give("weapon_vj_357")
		else self:Give("weapon_vj_9mmpistol")
		end
end
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if !self.Alerted && !IsValid(self:GetEnemy()) && !self:IsMoving() && CurTime() > self.NST && !self.IsSitting && !self:IsBusy() then
		local sitt = math.Rand(15,65)
		self.IsSitting = true
		self.AnimTbl_IdleStand = {ACT_BUSY_SIT_GROUND}
		self.AlsoIsSitting = 1
		self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_SIT_GROUND_ENTRY, true, false, false)
		self:SetState(VJ_STATE_ONLY_ANIMATION, sitt)
		timer.Simple(sitt, function()
			if IsValid(self) && self.IsSitting == true then 
				self.IsSitting = false
				self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_SIT_GROUND_EXIT, true, false, false)
				self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}
				self.NST = CurTime() + math.Rand(5, 65)
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(ent)
	if self.IsSitting == true then
		if self:GetState() == VJ_STATE_ONLY_ANIMATION then self:SetState() end
		self.IsSitting = false
		self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_SIT_GROUND_EXIT, true, false, false)
		self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}
		self.NST = CurTime() + 5
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if !self.HasWeapon == true then
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
		self.TimeUntilMeleeAttackDamage = 1
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
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnGrenadeAttack_ThrowVelocity(grEnt, grTargetPos) 
	local ene = self:GetEnemy()
		if IsValid(ene) then
		return self:CalculateProjectile("Curve", grEnt:GetPos(), ene:GetPos() + ene:OBBCenter(), 1500)
		else return end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnChangeMovementType(movType)	
	if VJ_AnimationExists(self,ACT_JUMP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP)) end
	if VJ_AnimationExists(self,ACT_CLIMB_UP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB)) end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnResetEnemy()
	self.NST = CurTime() + math.Rand(5, 65)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo, hitgroup)
	self.NST = CurTime() + math.Rand(5, 35)
	if self.IsSitting == true then
		if self:GetState() == VJ_STATE_ONLY_ANIMATION then self:SetState() end
		self.IsSitting = false
		self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_SIT_GROUND_EXIT, true, false, false)
		self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	timer.Simple(0.0001,function()
	if IsValid(self) then
    self:AddFlags(FL_NOTARGET)
	self:SetRenderFX( kRenderFxDistort )
		if GetConVarNumber("vj_npc_noidleparticle") == 0 then
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
		end	
	end end)
	timer.Simple(0.1,function()
	if IsValid(self) then
	local STabb = math.random(1,2)
		if STabb == 1 then
			VJ_EmitSound(self,"boner/bigdeath1.mp3",100,100)
		else
			VJ_EmitSound(self,"boner/bigdeath2.mp3",100,100)
		end
		VJ_EmitSound(self,"boner/bigdeathextra.mp3",100,100)
		VJ_EmitSound(self,"boner/bigdeathextra.mp3",100,100)
	
	
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
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
		end	end)
		timer.Simple(2.5,function()
		self:SetKeyValue("rendercolor","55 55 55 45") end)
		timer.Simple(3,function()
		self:SetKeyValue("rendercolor","0 0 0 1") end)
		timer.Simple(5.9,function()
		PrintMessage( HUD_PRINTTALK, "Hobo King has been banned permanently." )
		PrintMessage( HUD_PRINTTALK, "Reason: RDM." ) end)
		end
	end)
		-- self:SetKeyValue("ColorAlpha","255 255 255 88")
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/