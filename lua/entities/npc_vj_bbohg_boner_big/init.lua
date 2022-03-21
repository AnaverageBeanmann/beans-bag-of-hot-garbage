AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/skeleton/skeleton_decomp.mdl"} 
ENT.StartHealth = 1000
ENT.HullType = HULL_HUMAN
-- ENT.CanFlinch = 1
-- ENT.FlinchChance = 5
-- ENT.NextFlinchTime = 1.5
-- ENT.AnimTbl_Flinch = {"cower"}
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_b0ne(r)"} 
ENT.Bleeds = false 
-- ENT.BloodColor = "White"
ENT.HasWorldShakeOnMove = true -- Should the world shake when it's moving?
ENT.WorldShakeOnMoveAmplitude = 5 -- How much the screen will shake | From 1 to 16, 1 = really low 16 = really high
ENT.WorldShakeOnMoveRadius = 1000 -- How far the screen shake goes, in world units
ENT.WorldShakeOnMoveDuration = 0.4 -- How long the screen shake will last, in seconds
ENT.WorldShakeOnMoveFrequency = 100 -- Just leave it to 100
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CRUSH
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 80
ENT.MeleeAttackDamageDistance = 140
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 75
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.HasOnKilledEnemySound = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasLeapAttack = false -- Should the SNPC have a leap attack?
ENT.LeapAttackDamage = 15
ENT.LeapAttackDamageType = DMG_CLUB -- Type of Damage
	-- ====== Animation Variables ====== --
ENT.AnimTbl_LeapAttack = {"vjges_zombie_leap_mid"} -- Melee Attack Animations
ENT.LeapAttackAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.LeapAttackAnimationFaceEnemy = 2 -- true = Face the enemy the entire time! | 2 = Face the enemy UNTIL it jumps! | false = Don't face the enemy AT ALL!
ENT.LeapAttackAnimationDecreaseLengthAmount = 0 -- This will decrease the time until starts chasing again. Use it to fix animation pauses until it chases the enemy.
	-- ====== Distance Variables ====== --
ENT.LeapDistance = 250 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapToMeleeDistance = 200 -- How close does it have to be until it uses melee?
ENT.LeapAttackDamageDistance = 100 -- How far does the damage go?
ENT.LeapAttackAngleRadius = 60 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
	-- ====== Timer Variables ====== --
	-- To use event-based attacks, set this to false:
ENT.TimeUntilLeapAttackDamage = 0.2 -- How much time until it runs the leap damage code?
ENT.TimeUntilLeapAttackVelocity = 0.001 -- How much time until it runs the velocity code?
ENT.NextLeapAttackTime = 3 -- How much time until it can use a leap attack?
ENT.NextLeapAttackTime_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
	-- To let the base automatically detect the attack duration, set this to false:
ENT.NextAnyAttackTime_Leap = false -- How much time until it can use any attack again? | Counted in Seconds
ENT.NextAnyAttackTime_Leap_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.LeapAttackReps = 1 -- How many times does it run the leap attack code?
ENT.LeapAttackExtraTimers = nil -- Extra leap attack timers, EX: {1, 1.4} | it will run the damage code after the given amount of seconds
ENT.StopLeapAttackAfterFirstHit = true -- Should it stop the leap attack from running rest of timers when it hits an enemy?
	-- ====== Velocity Variables ====== --
ENT.LeapAttackVelocityForward = 350 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 235 -- How much upward force should it apply?
ENT.LeapAttackVelocityRight = 0 -- How much right force should it apply?
	-- ====== Control Variables ====== --
ENT.DisableLeapAttackAnimation = false -- if true, it will disable the animation code
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = false
ENT.DeathAnimationChance = 1
ENT.AnimTbl_Death = {"deathpose_back",
	"deathpose_front",
	"deathpose_left",
	"deathpose_right"}
ENT.HasDeathRagdoll = false

-- ENT.FootStepSoundLevel = 70
-- ENT.MeleeAttackSoundLevel = 75
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 90
-- ENT.IdleSoundChance = 5
-- ENT.CombatIdleSoundChance = 4
-- ENT.IdleSoundLevel = 45
-- ENT.CombatIdleSoundLevel = 60
ENT.FootStepSoundLevel = 100
ENT.FootStepPitch = VJ_Set(80, 100)
ENT.FootStepTimeRun = 0.5
ENT.FootStepTimeWalk = 0.5


ENT.PainSoundChance = 3

---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"boner/bigstep.mp3"}
ENT.SoundTbl_Idle = {}
ENT.SoundTbl_IdleDialogue = {}
ENT.SoundTbl_IdleDialogueAnswer = {}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_MedicBeforeHeal = {}
ENT.SoundTbl_MedicAfterHeal = {"npc/headcrab_poison/ph_hiss1.wav"}
ENT.SoundTbl_MedicReceiveHeal = {}
ENT.SoundTbl_Investigate = {}
ENT.SoundTbl_LostEnemy = {}
ENT.SoundTbl_Alert = {"boner/alert.mp3",
	"boner/doot.mp3"}
ENT.SoundTbl_CallForHelp = {}
ENT.SoundTbl_BecomeEnemyToPlayer = {}
ENT.SoundTbl_BeforeMeleeAttack = {"boner/step1.mp3",
	"boner/step2.mp3"}
ENT.SoundTbl_MeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav",
	"npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_MeleeAttackSlowPlayer = {"vj_player/heartbeat.wav"}
-- ENT.SoundTbl_BeforeRangeAttack = {}
-- ENT.SoundTbl_RangeAttack = {}
-- ENT.SoundTbl_BeforeLeapAttack = {}
ENT.SoundTbl_LeapAttackJump = {"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_LeapAttackDamage = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav"}
ENT.SoundTbl_LeapAttackDamageMiss = {"npc/zombie/claw_miss2.wav",
	"npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_AllyDeath = {"boner/alert.mp3"}
ENT.SoundTbl_Pain = {"boner/alert.mp3"}
ENT.SoundTbl_Death = {"boner/death.mp3",
	"boner/doot.mp3"}
ENT.SoundTbl_SoundTrack = {}

ENT.HasWeapon = false
ENT.Crowbar = false
ENT.Reviver = false
ENT.move = false
ENT.move2 = false
ENT.move3 = false
ENT.infect = true
ENT.infect2 = false
ENT.MoveToCorpose = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	-- self:SetSkin(math.random(0,3))
	
	
	
	self:SetModel( Model("models/skeleton/skeleton_bleached.mdl") ) 
	self:SetModelScale(3)
	self:Activate()
	self:SetPlaybackRate(0.7)
	-- self:SetCollisionBounds(Vector(1, 1, 1), Vector(-1, -1, 1))
	-- self:SetKeyValue("rendercolor","146 219 221 255")
	self:SetSkin(math.random(0,3))
	-- self.AnimTbl_Death = {"vjseq_nz_death_3"}

	
	
		-- if math.random(1,10) == 1 then
			-- self:SetSkin(3)
			-- self.Reviver = true
			-- self.IsMedicSNPC = true
			-- self.AnimTbl_Medic_GiveHealth = {"cheer2"}
			-- self.Medic_TimeUntilHeal = 2.02
			-- self.Medic_CheckDistance = 1000
			-- self.Medic_HealDistance = 150
			-- self.Medic_HealthAmount = 25
			-- self.Medic_NextHealTime = VJ_Set(5, 10)
			-- self.Medic_SpawnPropOnHeal = false
			
		-- elseif math.random(1,10) == 2 then
			-- self.AnimTbl_IdleStand = {ACT_HL2MP_IDLE_ANGRY}
			-- self.AnimTbl_Walk = {ACT_WALK_CROUCH}
			-- self.AnimTbl_Run = {ACT_RUN_CROUCH}
			-- self.AnimTbl_MeleeAttack = {"vjges_zombie_attack_frenzy"}
			-- self.TimeUntilMeleeAttackDamage = 0.1
			-- self.MeleeAttackReps = 2
			-- self.MeleeAttackDamage = math.Rand(5,10)
			-- self.HasLeapAttack = true
			-- self:SetSkin(2)
			
		-- elseif math.random(1,10) == 3 then
			-- self.AnimTbl_IdleStand = {ACT_HL2MP_IDLE_ANGRY}
			-- self.AnimTbl_Walk = {ACT_WALK_CROUCH}
			-- self.AnimTbl_Run = {ACT_RUN_CROUCH}
			-- self.AnimTbl_MeleeAttack = {"vjges_zombie_attack_frenzy"}
			-- self.TimeUntilMeleeAttackDamage = 0.1
			-- self.MeleeAttackReps = 2
			-- self.MeleeAttackDamage = math.Rand(5,10)
			-- self.HasLeapAttack = true
			-- self:SetSkin(2)
		
		-- elseif math.random(1,10) == 4 then
			-- self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY_MELEE,ACT_HL2MP_IDLE_KNIFE}
			-- self.AnimTbl_Walk = {ACT_WALK}
			-- self.AnimTbl_Run = {ACT_RUN}
			-- self.AnimTbl_MeleeAttack = {"swing"}
			-- self.HasWeapon = true
			-- self:SetSkin(1)
			-- self.StartHealth = 100
		
			-- local Weapon = math.random(1,3)
			-- if Weapon == 1 then
				-- self.Weapon = ents.Create("prop_physics")
				-- self.Weapon:SetModel("models/weapons/w_crowbar.mdl")
				-- self.Weapon:SetLocalPos(self:GetPos())
				-- //self.Weapon:SetPos(self:GetPos())
				-- self.Weapon:SetOwner(self)
				-- self.Weapon:SetParent(self)
				-- self.Weapon:SetLocalAngles(Angle(-120,45,90))
				-- self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
				-- self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
				-- self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
				-- self.Weapon:Spawn()
				-- self.Weapon:Activate()
				-- self.Weapon:SetSolid(SOLID_NONE)
				-- self.Weapon:AddEffects(EF_BONEMERGE)
			
				-- self.MeleeAttackDamage = math.Rand(5,10)
				-- self.SoundTbl_MeleeAttack = {"physics/flesh/flesh_impact_bullet1.wav",
					-- "physics/flesh/flesh_impact_bullet2.wav",
					-- "physics/flesh/flesh_impact_bullet3.wav",
					-- "physics/flesh/flesh_impact_bullet4.wav",
					-- "physics/flesh/flesh_impact_bullet5.wav"}
				-- self.SoundTbl_MeleeAttackExtra = {}
				-- self.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
				-- self.Crowbar = true

			-- elseif Weapon == 2 then
				-- self.Weapon = ents.Create("prop_physics")
				-- self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
				-- self.Weapon:SetLocalPos(self:GetPos())
				-- //self.Weapon:SetPos(self:GetPos())
				-- self.Weapon:SetOwner(self)
				-- self.Weapon:SetParent(self)
				-- self.Weapon:SetLocalAngles(Angle(-120,45,90))
				-- self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
				-- self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
				-- self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
				-- self.Weapon:Spawn()
				-- self.Weapon:Activate()
				-- self.Weapon:SetSolid(SOLID_NONE)
				-- self.Weapon:AddEffects(EF_BONEMERGE)

				-- self.MeleeAttackDamage = math.Rand(10,15)
				-- self.SoundTbl_MeleeAttack = {"physics/metal/metal_canister_impact_hard1.wav",
					-- "physics/metal/metal_canister_impact_hard2.wav",
					-- "physics/metal/metal_canister_impact_hard3.wav"}
				-- self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
					-- "physics/flesh/flesh_impact_hard2.wav",
					-- "physics/flesh/flesh_impact_hard3.wav",
					-- "physics/flesh/flesh_impact_hard4.wav",
					-- "physics/flesh/flesh_impact_hard5.wav",
					-- "physics/flesh/flesh_impact_hard6.wav"}
				-- self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
					-- "npc/zombie/claw_miss2.wav"}
				-- self.Crowbar = false

			-- elseif Weapon == 3 then
				-- self.Weapon = ents.Create("prop_physics")
				-- self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
				-- self.Weapon:SetLocalPos(self:GetPos())
				-- //self.Weapon:SetPos(self:GetPos())
				-- self.Weapon:SetOwner(self)
				-- self.Weapon:SetParent(self)
				-- self.Weapon:SetLocalAngles(Angle(-120,45,90))
				-- self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
				-- self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
				-- self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
				-- self.Weapon:Spawn()
				-- self.Weapon:Activate()
				-- self.Weapon:SetSolid(SOLID_NONE)
				-- self.Weapon:AddEffects(EF_BONEMERGE)

				-- self.MeleeAttackDamage = math.Rand(10,15)
				-- self.SoundTbl_MeleeAttack = {"physics/metal/metal_canister_impact_hard1.wav",
					-- "physics/metal/metal_canister_impact_hard2.wav",
					-- "physics/metal/metal_canister_impact_hard3.wav"}
				-- self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
					-- "physics/flesh/flesh_impact_hard2.wav",
					-- "physics/flesh/flesh_impact_hard3.wav",
					-- "physics/flesh/flesh_impact_hard4.wav",
					-- "physics/flesh/flesh_impact_hard5.wav",
					-- "physics/flesh/flesh_impact_hard6.wav"}
				-- self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
					-- "npc/zombie/claw_miss2.wav"}
				-- self.Crowbar = false
			-- end
		
		-- elseif math.random(1,10) == 5 then
			-- self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY_MELEE,ACT_HL2MP_IDLE_KNIFE}
			-- self.AnimTbl_Walk = {ACT_WALK}
			-- self.AnimTbl_Run = {ACT_RUN}
			-- self.AnimTbl_MeleeAttack = {"swing"}
			-- self.HasWeapon = true
			-- self:SetSkin(1)
			-- self.StartHealth = 100
		
			-- local Weapon = math.random(1,3)
			-- if Weapon == 1 then
				-- self.Weapon = ents.Create("prop_physics")
				-- self.Weapon:SetModel("models/weapons/w_crowbar.mdl")
				-- self.Weapon:SetLocalPos(self:GetPos())
				-- //self.Weapon:SetPos(self:GetPos())
				-- self.Weapon:SetOwner(self)
				-- self.Weapon:SetParent(self)
				-- self.Weapon:SetLocalAngles(Angle(-120,45,90))
				-- self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
				-- self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
				-- self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
				-- self.Weapon:Spawn()
				-- self.Weapon:Activate()
				-- self.Weapon:SetSolid(SOLID_NONE)
				-- self.Weapon:AddEffects(EF_BONEMERGE)
			
				-- self.MeleeAttackDamage = math.Rand(5,10)
				-- self.SoundTbl_MeleeAttack = {"physics/flesh/flesh_impact_bullet1.wav",
					-- "physics/flesh/flesh_impact_bullet2.wav",
					-- "physics/flesh/flesh_impact_bullet3.wav",
					-- "physics/flesh/flesh_impact_bullet4.wav",
					-- "physics/flesh/flesh_impact_bullet5.wav"}
				-- self.SoundTbl_MeleeAttackExtra = {}
				-- self.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
				-- self.Crowbar = true

			-- elseif Weapon == 2 then
				-- self.Weapon = ents.Create("prop_physics")
				-- self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
				-- self.Weapon:SetLocalPos(self:GetPos())
				-- //self.Weapon:SetPos(self:GetPos())
				-- self.Weapon:SetOwner(self)
				-- self.Weapon:SetParent(self)
				-- self.Weapon:SetLocalAngles(Angle(-120,45,90))
				-- self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
				-- self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
				-- self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
				-- self.Weapon:Spawn()
				-- self.Weapon:Activate()
				-- self.Weapon:SetSolid(SOLID_NONE)
				-- self.Weapon:AddEffects(EF_BONEMERGE)

				-- self.MeleeAttackDamage = math.Rand(10,15)
				-- self.SoundTbl_MeleeAttack = {"physics/metal/metal_canister_impact_hard1.wav",
					-- "physics/metal/metal_canister_impact_hard2.wav",
					-- "physics/metal/metal_canister_impact_hard3.wav"}
				-- self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
					-- "physics/flesh/flesh_impact_hard2.wav",
					-- "physics/flesh/flesh_impact_hard3.wav",
					-- "physics/flesh/flesh_impact_hard4.wav",
					-- "physics/flesh/flesh_impact_hard5.wav",
					-- "physics/flesh/flesh_impact_hard6.wav"}
				-- self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
					-- "npc/zombie/claw_miss2.wav"}
				-- self.Crowbar = false

			-- elseif Weapon == 3 then
				-- self.Weapon = ents.Create("prop_physics")
				-- self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
				-- self.Weapon:SetLocalPos(self:GetPos())
				-- //self.Weapon:SetPos(self:GetPos())
				-- self.Weapon:SetOwner(self)
				-- self.Weapon:SetParent(self)
				-- self.Weapon:SetLocalAngles(Angle(-120,45,90))
				-- self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
				-- self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
				-- self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
				-- self.Weapon:Spawn()
				-- self.Weapon:Activate()
				-- self.Weapon:SetSolid(SOLID_NONE)
				-- self.Weapon:AddEffects(EF_BONEMERGE)

				-- self.MeleeAttackDamage = math.Rand(10,15)
				-- self.SoundTbl_MeleeAttack = {"physics/metal/metal_canister_impact_hard1.wav",
					-- "physics/metal/metal_canister_impact_hard2.wav",
					-- "physics/metal/metal_canister_impact_hard3.wav"}
				-- self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
					-- "physics/flesh/flesh_impact_hard2.wav",
					-- "physics/flesh/flesh_impact_hard3.wav",
					-- "physics/flesh/flesh_impact_hard4.wav",
					-- "physics/flesh/flesh_impact_hard5.wav",
					-- "physics/flesh/flesh_impact_hard6.wav"}
				-- self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
					-- "npc/zombie/claw_miss2.wav"}
				-- self.Crowbar = false
			-- end
		
		-- elseif math.random(1,10) == 6 then
			-- self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY_MELEE,ACT_HL2MP_IDLE_KNIFE}
			-- self.AnimTbl_Walk = {ACT_WALK}
			-- self.AnimTbl_Run = {ACT_RUN}
			-- self.AnimTbl_MeleeAttack = {"swing"}
			-- self.HasWeapon = true
			-- self:SetSkin(1)
			-- self.StartHealth = 100
		
			-- local Weapon = math.random(1,3)
			-- if Weapon == 1 then
				-- self.Weapon = ents.Create("prop_physics")
				-- self.Weapon:SetModel("models/weapons/w_crowbar.mdl")
				-- self.Weapon:SetLocalPos(self:GetPos())
				-- //self.Weapon:SetPos(self:GetPos())
				-- self.Weapon:SetOwner(self)
				-- self.Weapon:SetParent(self)
				-- self.Weapon:SetLocalAngles(Angle(-120,45,90))
				-- self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
				-- self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
				-- self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
				-- self.Weapon:Spawn()
				-- self.Weapon:Activate()
				-- self.Weapon:SetSolid(SOLID_NONE)
				-- self.Weapon:AddEffects(EF_BONEMERGE)
			
				-- self.MeleeAttackDamage = math.Rand(5,10)
				-- self.SoundTbl_MeleeAttack = {"physics/flesh/flesh_impact_bullet1.wav",
					-- "physics/flesh/flesh_impact_bullet2.wav",
					-- "physics/flesh/flesh_impact_bullet3.wav",
					-- "physics/flesh/flesh_impact_bullet4.wav",
					-- "physics/flesh/flesh_impact_bullet5.wav"}
				-- self.SoundTbl_MeleeAttackExtra = {}
				-- self.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
				-- self.Crowbar = true

			-- elseif Weapon == 2 then
				-- self.Weapon = ents.Create("prop_physics")
				-- self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
				-- self.Weapon:SetLocalPos(self:GetPos())
				-- //self.Weapon:SetPos(self:GetPos())
				-- self.Weapon:SetOwner(self)
				-- self.Weapon:SetParent(self)
				-- self.Weapon:SetLocalAngles(Angle(-120,45,90))
				-- self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
				-- self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
				-- self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
				-- self.Weapon:Spawn()
				-- self.Weapon:Activate()
				-- self.Weapon:SetSolid(SOLID_NONE)
				-- self.Weapon:AddEffects(EF_BONEMERGE)

				-- self.MeleeAttackDamage = math.Rand(10,15)
				-- self.SoundTbl_MeleeAttack = {"physics/metal/metal_canister_impact_hard1.wav",
					-- "physics/metal/metal_canister_impact_hard2.wav",
					-- "physics/metal/metal_canister_impact_hard3.wav"}
				-- self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
					-- "physics/flesh/flesh_impact_hard2.wav",
					-- "physics/flesh/flesh_impact_hard3.wav",
					-- "physics/flesh/flesh_impact_hard4.wav",
					-- "physics/flesh/flesh_impact_hard5.wav",
					-- "physics/flesh/flesh_impact_hard6.wav"}
				-- self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
					-- "npc/zombie/claw_miss2.wav"}
				-- self.Crowbar = false

			-- elseif Weapon == 3 then
				-- self.Weapon = ents.Create("prop_physics")
				-- self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
				-- self.Weapon:SetLocalPos(self:GetPos())
				-- //self.Weapon:SetPos(self:GetPos())
				-- self.Weapon:SetOwner(self)
				-- self.Weapon:SetParent(self)
				-- self.Weapon:SetLocalAngles(Angle(-120,45,90))
				-- self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
				-- self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
				-- self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
				-- self.Weapon:Spawn()
				-- self.Weapon:Activate()
				-- self.Weapon:SetSolid(SOLID_NONE)
				-- self.Weapon:AddEffects(EF_BONEMERGE)

				-- self.MeleeAttackDamage = math.Rand(10,15)
				-- self.SoundTbl_MeleeAttack = {"physics/metal/metal_canister_impact_hard1.wav",
					-- "physics/metal/metal_canister_impact_hard2.wav",
					-- "physics/metal/metal_canister_impact_hard3.wav"}
				-- self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
					-- "physics/flesh/flesh_impact_hard2.wav",
					-- "physics/flesh/flesh_impact_hard3.wav",
					-- "physics/flesh/flesh_impact_hard4.wav",
					-- "physics/flesh/flesh_impact_hard5.wav",
					-- "physics/flesh/flesh_impact_hard6.wav"}
				-- self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
					-- "npc/zombie/claw_miss2.wav"}
				-- self.Crowbar = false
			-- end
		
		
	
	


	
	
	
	
			self.AnimTbl_Run = {ACT_WALK}
	
	
	
-- self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}
-- self.AnimTbl_Walk = {ACT_WALK}
-- self.AnimTbl_Run = {ACT_HL2MP_RUN,ACT_RUN}

-- self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY_MELEE,ACT_HL2MP_IDLE_KNIFE}
-- self.AnimTbl_Walk = {ACT_WALK}
-- self.AnimTbl_Run = {"run_all_02","run_all_charging"}

-- self.AnimTbl_IdleStand = {"vjges_scaredidle"}
-- self.AnimTbl_Walk = {"vjseq_pace_all"}
-- self.AnimTbl_Run = {"run_all_panicked_02"}

-- self.AnimTbl_IdleStand = {ACT_HL2MP_IDLE_ANGRY}
-- self.AnimTbl_Walk = {ACT_WALK_CROUCH}
-- self.AnimTbl_Run = {ACT_RUN_CROUCH}

-- ENT.AnimTbl_IdleStand = {ACT_IDLE}
-- ENT.AnimTbl_Walk = {ACT_WALK}
-- ENT.AnimTbl_Run = {ACT_RUN}

-- ENT.AnimTbl_IdleStand = {ACT_IDLE}
-- ENT.AnimTbl_Walk = {ACT_WALK}
-- ENT.AnimTbl_Run = {ACT_RUN}


-- Stand_to_crouch ACT_TRANSITION
-- Sit_Ground ACT_BUSY_SIT_GROUND
-- sit_zen 
-- Sit_Ground_to_Idle ACT_BUSY_SIT_GROUND_EXIT

-- death_01 ACT_GMOD_DEATH
-- death_02 ACT_GMOD_DEATH
-- death_03 ACT_GMOD_DEATH
-- death_04 ACT_GMOD_DEATH


end
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	-- if self.Reviver == true then
	-- for _,v in ipairs(ents.FindInSphere(self:GetPos(),1000)) do
		-- if self.infect == true && self.MoveToCorpose == false && self.MeleeAttacking == false then
			-- if IsValid(v) && v:GetClass() == "prop_ragdoll" &&
			-- v:GetClass() != "prop_physics" &&
			-- v:GetModel() != "models/combine_strider.mdl" &&
			-- v:GetModel() != "models/lamarr.mdl" &&
			-- v:GetModel() != "models/combine_scanner.mdl" &&
			-- v:GetModel() != "models/manhack.mdl" &&
			-- v:GetModel() != "models/antlion.mdl" &&
			-- v:GetModel() != "models/antlion_guard.mdl" &&
			-- v:GetModel() != "models/headcrabclassic.mdl" &&
			-- v:GetModel() != "models/headcrab.mdl" &&
			-- v:GetModel() != "models/headcrabblack.mdl" &&
			-- v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			-- v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			-- v:GetModel() != "models/zombie/classic_legs.mdl" &&
			-- v:GetModel() != "models/zombie/classic_torso.mdl" &&
			-- v:GetModel() != "models/humans/charple03.mdl" &&
			-- v:GetModel() != "models/combine_dropship.mdl" &&
			-- v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			-- v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			-- v:GetModel() != "models/shield_scanner.mdl" &&
			-- v:GetModel() != "models/gunship.mdl" &&
			-- v:GetModel() != "models/hunter.mdl" &&
			-- v:GetModel() != "models/Humans/Charple02.mdl"  &&
			-- v:GetModel() != "models/Humans/Charple01.mdl" &&
			-- v:GetModel() != "models/Humans/Charple04.mdl" &&
			-- v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			-- v:GetModel() != "models/dog.mdl" then
			
				-- self.infect2 = true
				-- self.MoveToCorpose = true
				-- self:SetTarget(v)
				-- self:VJ_TASK_GOTO_TARGET("TASK_RUN_PATH")
				-- timer.Simple(math.random(1.2,2.5),function() if IsValid(self) then self.MoveToCorpose = false end end)
			-- end
		-- end
	-- end
	-- if self.infect2 == true && self.MeleeAttacking == false then 
		-- for _,v in ipairs(ents.FindInSphere(self:GetPos(),20)) do
			-- if IsValid(v) &&
			-- v:GetClass() == "prop_ragdoll" &&
			-- v:GetClass() != "prop_physics" &&
			-- v:GetModel() != "models/combine_strider.mdl" &&
			-- v:GetModel() != "models/lamarr.mdl" &&
			-- v:GetModel() != "models/combine_scanner.mdl" &&
			-- v:GetModel() != "models/manhack.mdl" &&
			-- v:GetModel() != "models/antlion.mdl" &&
			-- v:GetModel() != "models/antlion_guard.mdl" &&
			-- v:GetModel() != "models/headcrabclassic.mdl" &&
			-- v:GetModel() != "models/headcrab.mdl" &&
			-- v:GetModel() != "models/headcrabblack.mdl" &&
			-- v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			-- v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			-- v:GetModel() != "models/zombie/classic_legs.mdl" &&
			-- v:GetModel() != "models/zombie/classic_torso.mdl" &&
			-- v:GetModel() != "models/humans/charple03.mdl" &&
			-- v:GetModel() != "models/combine_dropship.mdl" &&
			-- v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			-- v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			-- v:GetModel() != "models/shield_scanner.mdl" &&
			-- v:GetModel() != "models/gunship.mdl" &&
			-- v:GetModel() != "models/hunter.mdl" &&
			-- v:GetModel() != "models/Humans/Charple02.mdl"  &&
			-- v:GetModel() != "models/Humans/Charple01.mdl" &&
			-- v:GetModel() != "models/Humans/Charple04.mdl" &&
			-- v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			-- v:GetModel() != "models/dog.mdl" then
			
			-- self:VJ_ACT_PLAYACTIVITY("cheer2",true,4.6999999019504,false)
				
			-- timer.Simple(0.01,function() if IsValid(self) && IsValid(v) then
				-- VJ_EmitSound(self,"npc/vort/health_charge.wav",75,150)end end)
				
			-- timer.Simple(2.02,function() if IsValid(self) then
				-- VJ_EmitSound(self,"boner/revived.mp3",75,100) end end)
			
			-- timer.Simple(0.2,function() if IsValid(self) && IsValid(v) then
			-- self:FaceCertainEntity(v) end end)
			-- v:SetPersistent(true) 
			-- v:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

	-- self.MovementType = VJ_MOVETYPE_STATIONARY
	-- self.CanTurnWhileStationary = false
	-- self.infect = false
	-- self.DisableChasingEnemy = true
	-- self.DisableFindEnemy = true
	-- self.infect2 = false
	
	-- timer.Simple(2.02,function()
		-- if IsValid(self) && IsValid(v) then
			-- if IsValid(v) && v:GetClass() == "prop_ragdoll" &&
			-- v:GetClass() != "prop_physics" &&
			-- v:GetModel() != "models/combine_strider.mdl" &&
			-- v:GetModel() != "models/lamarr.mdl" &&
			-- v:GetModel() != "models/combine_scanner.mdl" &&
			-- v:GetModel() != "models/manhack.mdl" &&
			-- v:GetModel() != "models/antlion.mdl" &&
			-- v:GetModel() != "models/antlion_guard.mdl" &&
			-- v:GetModel() != "models/headcrabclassic.mdl" &&
			-- v:GetModel() != "models/headcrab.mdl" &&
			-- v:GetModel() != "models/headcrabblack.mdl" &&
			-- v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			-- v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			-- v:GetModel() != "models/zombie/classic_legs.mdl" &&
			-- v:GetModel() != "models/zombie/classic_torso.mdl" &&
			-- v:GetModel() != "models/humans/charple03.mdl" &&
			-- v:GetModel() != "models/combine_dropship.mdl" &&
			-- v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			-- v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			-- v:GetModel() != "models/shield_scanner.mdl" &&
			-- v:GetModel() != "models/gunship.mdl" &&
			-- v:GetModel() != "models/hunter.mdl" &&
			-- v:GetModel() != "models/Humans/Charple02.mdl" &&
			-- v:GetModel() != "models/Humans/Charple01.mdl" &&
			-- v:GetModel() != "models/Humans/Charple04.mdl" &&
			-- v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			-- v:GetModel() != "models/dog.mdl" then
				-- v:Remove()

		-- local spawn = math.random(1,1)
			-- if spawn == 1 then
				-- self.sworm13 = ents.Create("npc_vj_bbohg_boner")
				-- self.sworm13:SetPos(v:GetPos() + self:GetUp()*10)
				-- self.sworm13:SetAngles(self:GetAngles())
				-- self.sworm13:Spawn()
				-- self.sworm13:VJ_ACT_PLAYACTIVITY("zombie_slump_rise_01",true,2.8,false)
				-- self.sworm13:Activate()
				-- self.sworm13:SetOwner(self)
			-- end
	-- end
-- end end)

	-- timer.Simple(4.6999999019504,function() if IsValid(self) then 
		-- self.infect = true
		-- self.DisableChasingEnemy = false
		-- self.DisableFindEnemy = false
	-- end end)
		-- timer.Simple(3,function() if IsValid(self) then 
		-- self.MovementType = VJ_MOVETYPE_GROUND
	-- end end)
	-- end
-- end
-- end
-- end
end
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(11, 11, 71), Vector(-11, -11, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if !self.HasWeapon == true && !self.HasLeapAttack == true then
		local randattack_stand = math.random(1,8)

		if randattack_stand == 1 then
			self.AnimTbl_MeleeAttack = {"swing"}
			self.TimeUntilMeleeAttackDamage = 0.4
			self.MeleeAttackDamage = math.Rand(50,55)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 175
			self.MeleeAttackKnockBack_Forward2 = 200
			self.MeleeAttackKnockBack_Up1 = 125
			self.MeleeAttackKnockBack_Up2 = 150
		
		elseif randattack_stand == 2 then
			self.AnimTbl_MeleeAttack = {"swing"}
			self.TimeUntilMeleeAttackDamage = 0.4
			self.MeleeAttackDamage = math.Rand(50,55)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 175
			self.MeleeAttackKnockBack_Forward2 = 200
			self.MeleeAttackKnockBack_Up1 = 125
			self.MeleeAttackKnockBack_Up2 = 150
		
		elseif randattack_stand == 3 then
			self.AnimTbl_MeleeAttack = {"swing"}
			self.TimeUntilMeleeAttackDamage = 0.4
			self.MeleeAttackDamage = math.Rand(50,55)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 175
			self.MeleeAttackKnockBack_Forward2 = 200
			self.MeleeAttackKnockBack_Up1 = 125
			self.MeleeAttackKnockBack_Up2 = 150
		
		elseif randattack_stand == 4 then
			self.AnimTbl_MeleeAttack = {"swing"}
			self.TimeUntilMeleeAttackDamage = 0.4
			self.MeleeAttackDamage = math.Rand(50,55)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 175
			self.MeleeAttackKnockBack_Forward2 = 200
			self.MeleeAttackKnockBack_Up1 = 125
			self.MeleeAttackKnockBack_Up2 = 150
		
		elseif randattack_stand == 5 then
			self.AnimTbl_MeleeAttack = {"throw1"}
			self.TimeUntilMeleeAttackDamage = 1
			self.MeleeAttackDamage = math.Rand(60,65)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 175
			self.MeleeAttackKnockBack_Forward2 = 200
			self.MeleeAttackKnockBack_Up1 = 125
			self.MeleeAttackKnockBack_Up2 = 150
		
		elseif randattack_stand == 6 then
			self.AnimTbl_MeleeAttack = {"ThrowItem"}
			self.TimeUntilMeleeAttackDamage = 1
			self.MeleeAttackDamage = math.Rand(50,55)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 175
			self.MeleeAttackKnockBack_Forward2 = 200
			self.MeleeAttackKnockBack_Up1 = 125
			self.MeleeAttackKnockBack_Up2 = 150
		
		elseif randattack_stand == 7 then
			self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
			self.TimeUntilMeleeAttackDamage = 0.5
			self.MeleeAttackDamage = math.Rand(50,55)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 175
			self.MeleeAttackKnockBack_Forward2 = 200
			self.MeleeAttackKnockBack_Up1 = 125
			self.MeleeAttackKnockBack_Up2 = 150

		
		elseif randattack_stand == 8 then
			self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
			self.TimeUntilMeleeAttackDamage = 0.5
			self.MeleeAttackDamage = math.Rand(50,55)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 175
			self.MeleeAttackKnockBack_Forward2 = 200
			self.MeleeAttackKnockBack_Up1 = 125
			self.MeleeAttackKnockBack_Up2 = 150
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
-- function ENT:CustomOnChangeMovementType(movType)	
	-- if VJ_AnimationExists(self,ACT_JUMP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP)) end
	-- if VJ_AnimationExists(self,ACT_CLIMB_UP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB)) end
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMedic_BeforeHeal()
	VJ_EmitSound(self,"npc/vort/health_charge.wav",75,150)
end
---------------------------------------------------------------------------------------------------------------------------------------------
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
		end
	end)
		-- self:SetKeyValue("ColorAlpha","255 255 255 88")
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	if self.HasWeapon == true then
		if self.Crowbar == true then
			self:CreateGibEntity("prop_physics","models/weapons/w_crowbar.mdl",{Pos=self:LocalToWorld(Vector(0,-10,35)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-5,5)+self:GetForward()*math.Rand(-5,5)+self:GetUp()*math.Rand(-5,5)})
		else
			self:CreateGibEntity("prop_physics","models/props_canal/mattpipe.mdl",{Pos=self:LocalToWorld(Vector(0,-10,35)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-5,5)+self:GetForward()*math.Rand(-5,5)+self:GetUp()*math.Rand(-5,5)})
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/