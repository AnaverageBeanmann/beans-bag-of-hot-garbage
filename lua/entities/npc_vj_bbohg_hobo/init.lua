AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/monster/subject.mdl"} 
ENT.StartHealth = 100
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
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 28
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.6
-- ENT.HasOnKilledEnemySound = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = false
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_trash"
	-- ====== Animation Variables ====== --
ENT.AnimTbl_RangeAttack = {"throw1"}
ENT.RangeAttackAnimationDelay = 0
ENT.RangeAttackAnimationFaceEnemy = true
ENT.RangeAttackAnimationDecreaseLengthAmount = 0
ENT.RangeAttackAnimationStopMovement = true
	-- ====== Distance Variables ====== --
ENT.RangeDistance = 2000
ENT.RangeToMeleeDistance = 200
ENT.RangeAttackAngleRadius = 100
	-- ====== Timer Variables ====== --
	-- To use event-based attacks, set this to false:
ENT.TimeUntilRangeAttackProjectileRelease = 0.95
ENT.NextRangeAttackTime = 10
ENT.NextRangeAttackTime_DoRand = false
	-- To let the base automatically detect the attack duration, set this to false:
ENT.NextAnyAttackTime_Range = false
ENT.NextAnyAttackTime_Range_DoRand = false
ENT.RangeAttackReps = 1
ENT.RangeAttackExtraTimers = nil
	-- ====== Projectile Spawn Position Variables ====== --
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH"
ENT.RangeAttackPos_Up = 0
ENT.RangeAttackPos_Forward = 0
ENT.RangeAttackPos_Right = 0
	-- ====== Control Variables ====== --
ENT.DisableRangeAttackAnimation = false
ENT.DisableDefaultRangeAttackCode = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = false
ENT.FootStepSoundLevel = 70
ENT.MeleeAttackSoundLevel = 75
ENT.GeneralSoundPitch1 = 105
ENT.GeneralSoundPitch2 = 90
ENT.IdleSoundChance = 5
ENT.CombatIdleSoundChance = 4
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5
ENT.IdleDialogueDistance = 175

ENT.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}
ENT.HasDeathRagdoll = true
ENT.DeathCorpseEntityClass = "UseDefaultBehavior"
ENT.DeathCorpseModel = {"models/Humans/corpse1.mdl"}

ENT.move = false
ENT.move2 = false
ENT.move3 = false
ENT.infect = true
ENT.infect2 = false
ENT.MoveToCorpose = false
ENT.HasEnemy = false
ENT.Suck = false

ENT.Crowbar = false
ENT.HasWeapon = false
ENT.ZombieHobo = false
ENT.ZombineHobo = false
ENT.HasHat = false
ENT.HoboClass = 0
-- 1 = Standard
-- 2 = Armed
-- 3 = Zombie
-- 4 = Zombine



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
	self.HoboClass = 1

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
	self.SoundTbl_BeforeRangeAttack = {"hobo/voice1/cant_reach_1.mp3",
		"hobo/voice1/cant_reach_11.mp3",
		"hobo/voice1/cant_reach_4.mp3",
		"hobo/voice1/cidle_1.mp3",
		"hobo/voice1/cidle_5.mp3",
		"hobo/voice1/pain_1.mp3",
		"hobo/voice1/pain_4.mp3"}
	self.SoundTbl_RangeAttack = {"npc/zombie/claw_miss2.wav",
		"npc/zombie/claw_miss1.wav"}

	if math.random (1,4) == 1 then
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
	self.SoundTbl_BeforeRangeAttack = {"hobo/voice2/pain_1.mp3",
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
		if math.random(1,4) == 1 then
			self.SoundTbl_Pain = {"hobo/voice2/kill_1.mp3",
			"hobo/voice2/kill_2.mp3",
			"hobo/voice2/kill_3.mp3"}
			end
	end

	if math.random(1,5) == 1 then
				self.HasWeapon = true
				self.AnimTbl_MeleeAttack = {"swing"}
				self.HoboClass = 2
		
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
			
					self.MeleeAttackDamage = math.Rand(5,10)
					self.SoundTbl_MeleeAttack = {"physics/flesh/flesh_impact_bullet1.wav",
					"physics/flesh/flesh_impact_bullet2.wav",
					"physics/flesh/flesh_impact_bullet3.wav",
					"physics/flesh/flesh_impact_bullet4.wav",
					"physics/flesh/flesh_impact_bullet5.wav"}
					self.SoundTbl_MeleeAttackExtra = {}
					self.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
					self.Crowbar = true

				else
				
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

					self.MeleeAttackDamage = math.Rand(10,15)
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
					self.Crowbar = false
				end
			
	end
	
	if math.random(1,3) == 1 then
		self.HasRangeAttack = true
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
	if self.HoboClass == 1 then
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
  -- end
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer(seed)
	if math.random(1,30) == 1 then
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_boot"
	else
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_trash"
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	local ene = self:GetEnemy()
	return self:CalculateProjectile("Curve", projectile:GetPos(), ene:GetPos() + ene:OBBCenter(), 1500)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnResetEnemy()
	self.NST = CurTime() + math.Rand(5, 65)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnChangeMovementType(movType)	
	if VJ_AnimationExists(self,ACT_JUMP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP)) end
	if VJ_AnimationExists(self,ACT_CLIMB_UP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB)) end
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	if self.HasWeapon == true then
	if self.Crowbar == true then
		self:CreateGibEntity("prop_physics","models/weapons/w_crowbar.mdl",{Pos=self:LocalToWorld(Vector(0,-10,35)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-5,5)+self:GetForward()*math.Rand(-5,5)+self:GetUp()*math.Rand(-5,5)})
	else
		self:CreateGibEntity("prop_physics","models/props_canal/mattpipe.mdl",{Pos=self:LocalToWorld(Vector(0,-10,35)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-5,5)+self:GetForward()*math.Rand(-5,5)+self:GetUp()*math.Rand(-5,5)})
	end
	end
	if self.HasHat == true then
		self:CreateGibEntity("prop_physics","models/player/items/humans/top_hat.mdl",{Pos=self:LocalToWorld(Vector(0,-10,62)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetUp()*math.Rand(10,10)})
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/