AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/skeleton/skeleton_bloody.mdl"} 
ENT.StartHealth = 50
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
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 28
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
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
-- ENT.HasDeathAnimation = true
-- ENT.DeathAnimationTime = false
-- ENT.DeathAnimationChance = 2
-- ENT.AnimTbl_Death = {}

-- ENT.FootStepSoundLevel = 70
-- ENT.MeleeAttackSoundLevel = 75
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 90
-- ENT.IdleSoundChance = 5
-- ENT.CombatIdleSoundChance = 4
-- ENT.IdleSoundLevel = 45
-- ENT.CombatIdleSoundLevel = 60
ENT.FootStepTimeRun = 0.5
ENT.FootStepTimeWalk = 0.5


ENT.PainSoundChance = 3
ENT.NextZombieSpawnT = 0
ENT.AlreadySpawned = false
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"boner/bonestep_1.mp3",
	"boner/bonestep_2.mp3",
	"boner/bonestep_3.mp3",
	"boner/bonestep_4.mp3"}
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
	self:SetSkin(3)
			self.AnimTbl_IdleStand = {"taunt_dance","taunt_muscle","taunt_robot"}
	end
		
		
	
	


	
	
	
	
	
	
	
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


-- end
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetKeyValue("rendercolor","159 118 167 255")
	self.AnimTbl_Run = {ACT_WALK}
	if GetConVarNumber("vj_npc_noidleparticle") == 0 then		
		local eyeglow1 = ents.Create("env_sprite")
		eyeglow1:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		eyeglow1:SetKeyValue("scale","0.5")
		eyeglow1:SetKeyValue("rendermode","5")
		eyeglow1:SetKeyValue("rendercolor","122 0 146 255")
		eyeglow1:SetKeyValue("spawnflags","1") -- If animated
		eyeglow1:SetParent(self)
		eyeglow1:Fire("SetParentAttachment","chest",0)
		eyeglow1:Spawn()
		eyeglow1:Activate()
		self:DeleteOnRemove(eyeglow1)
	end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if IsValid(self:GetEnemy()) && CurTime() > self.NextZombieSpawnT then
		if !IsValid(self.Zombie1) && !IsValid(self.Zombie2) && !IsValid(self.Zombie3) && !IsValid(self.Zombie4) && self.AlreadySpawned == false then
			self.AlreadySpawned = true
			self:VJ_ACT_PLAYACTIVITY("taunt_dance_base", true, false, false)
			
			VJ_EmitSound(self,{"boner/dance.mp3"},75,math.random(100,100))
			VJ_EmitSound(self,{"boner/dance.mp3"},75,math.random(100,100))
			VJ_EmitSound(self,{"ambient/energy/weld1.wav","ambient/energy/weld2.wav"},100,math.random(100,95))
			effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(240, 255, 255, 255), {material="sprites/bluelight1", framerate=20})
	        effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(240, 255, 255, 255), {material="sprites/bluelight1", framerate=20})
			
			self.Zombie1 = ents.Create("npc_vj_bbohg_boner")
			self.Zombie1:SetPos(self:GetPos() +self:GetRight()*45 +self:GetUp()*5)
			self.Zombie1:SetAngles(self:GetAngles())
			self.Zombie1:Spawn()
			self.Zombie1:SetNoDraw(true)
			timer.Simple(0.3,function() if IsValid(self.Zombie1) then self.Zombie1:SetNoDraw(false) end end)
			self.Zombie1:VJ_ACT_PLAYACTIVITY("taunt_dance_base",true,8,false,0,{SequenceDuration=8})
			
			self.Zombie2 = ents.Create("npc_vj_bbohg_boner")
			self.Zombie2:SetPos(self:GetPos() +self:GetRight()*-45 +self:GetUp()*5)
			self.Zombie2:SetAngles(self:GetAngles())
			self.Zombie2:Spawn()
			self.Zombie2:SetNoDraw(true)
			timer.Simple(0.3,function() if IsValid(self.Zombie2) then self.Zombie2:SetNoDraw(false) end end)
			self.Zombie2:VJ_ACT_PLAYACTIVITY("taunt_dance_base",true,8,false,0,{SequenceDuration=8})
			
			self.Zombie3 = ents.Create("npc_vj_bbohg_boner")
			self.Zombie3:SetPos(self:GetPos() +self:GetForward()*45 +self:GetUp()*5)
			self.Zombie3:SetAngles(self:GetAngles())
			self.Zombie3:Spawn()
			self.Zombie3:SetNoDraw(true)
			timer.Simple(0.3,function() if IsValid(self.Zombie3) then self.Zombie3:SetNoDraw(false) end end)
			self.Zombie3:VJ_ACT_PLAYACTIVITY("taunt_dance_base",true,8,false,0,{SequenceDuration=8})
			
			self.Zombie4 = ents.Create("npc_vj_bbohg_boner")
			self.Zombie4:SetPos(self:GetPos() +self:GetForward()*-45 +self:GetUp()*5)
			self.Zombie4:SetAngles(self:GetAngles())
			self.Zombie4:Spawn()
			self.Zombie4:SetNoDraw(true)
			timer.Simple(0.3,function() if IsValid(self.Zombie4) then self.Zombie4:SetNoDraw(false) end end)
			self.Zombie4:VJ_ACT_PLAYACTIVITY("taunt_dance_base",true,8,false,0,{SequenceDuration=8})
						
			self.AlreadySpawned = false
			self.NextZombieSpawnT = CurTime() + 20
			end
		end
		
		
		
		
	for _,v in ipairs(ents.FindInSphere(self:GetPos(),1000)) do
		if self.infect == true && self.MoveToCorpose == false && self.MeleeAttacking == false then
			if IsValid(v) && v:GetClass() == "prop_ragdoll" &&
			v:GetClass() != "prop_physics" &&
			v:GetModel() != "models/combine_strider.mdl" &&
			v:GetModel() != "models/lamarr.mdl" &&
			v:GetModel() != "models/combine_scanner.mdl" &&
			v:GetModel() != "models/manhack.mdl" &&
			v:GetModel() != "models/antlion.mdl" &&
			v:GetModel() != "models/antlion_guard.mdl" &&
			v:GetModel() != "models/headcrabclassic.mdl" &&
			v:GetModel() != "models/headcrab.mdl" &&
			v:GetModel() != "models/headcrabblack.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			v:GetModel() != "models/zombie/classic_legs.mdl" &&
			v:GetModel() != "models/zombie/classic_torso.mdl" &&
			v:GetModel() != "models/humans/charple03.mdl" &&
			v:GetModel() != "models/combine_dropship.mdl" &&
			v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			v:GetModel() != "models/shield_scanner.mdl" &&
			v:GetModel() != "models/gunship.mdl" &&
			v:GetModel() != "models/hunter.mdl" &&
			v:GetModel() != "models/Humans/Charple02.mdl"  &&
			v:GetModel() != "models/Humans/Charple01.mdl" &&
			v:GetModel() != "models/Humans/Charple04.mdl" &&
			v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			v:GetModel() != "models/dog.mdl" then
			
				self.infect2 = true
				self.MoveToCorpose = true
				self:SetTarget(v)
				self:VJ_TASK_GOTO_TARGET("TASK_RUN_PATH")
				timer.Simple(math.random(1.2,2.5),function() if IsValid(self) then self.MoveToCorpose = false end end)
			end
		end
	end
	if self.infect2 == true && self.MeleeAttacking == false then 
		for _,v in ipairs(ents.FindInSphere(self:GetPos(),20)) do
			if IsValid(v) &&
			v:GetClass() == "prop_ragdoll" &&
			v:GetClass() != "prop_physics" &&
			v:GetModel() != "models/combine_strider.mdl" &&
			v:GetModel() != "models/lamarr.mdl" &&
			v:GetModel() != "models/combine_scanner.mdl" &&
			v:GetModel() != "models/manhack.mdl" &&
			v:GetModel() != "models/antlion.mdl" &&
			v:GetModel() != "models/antlion_guard.mdl" &&
			v:GetModel() != "models/headcrabclassic.mdl" &&
			v:GetModel() != "models/headcrab.mdl" &&
			v:GetModel() != "models/headcrabblack.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			v:GetModel() != "models/zombie/classic_legs.mdl" &&
			v:GetModel() != "models/zombie/classic_torso.mdl" &&
			v:GetModel() != "models/humans/charple03.mdl" &&
			v:GetModel() != "models/combine_dropship.mdl" &&
			v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			v:GetModel() != "models/shield_scanner.mdl" &&
			v:GetModel() != "models/gunship.mdl" &&
			v:GetModel() != "models/hunter.mdl" &&
			v:GetModel() != "models/Humans/Charple02.mdl"  &&
			v:GetModel() != "models/Humans/Charple01.mdl" &&
			v:GetModel() != "models/Humans/Charple04.mdl" &&
			v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			v:GetModel() != "models/dog.mdl" then
			
			self:VJ_ACT_PLAYACTIVITY("taunt_dance_base",true,8,false)
				
			timer.Simple(0.01,function() if IsValid(self) && IsValid(v) then
			VJ_EmitSound(self,{"boner/dance.mp3"},75,math.random(100,100))
			VJ_EmitSound(self,{"boner/dance.mp3"},75,math.random(100,100))
			end end)
			-- timer.Simple(1,function() if IsValid(self) && IsValid(v) then
				-- VJ_EmitSound(self,"physics/flesh/flesh_bloody_impact_hard1.wav",75,65) end end)
				
			timer.Simple(8,function() if IsValid(self) then
				VJ_EmitSound(self,"boner/revived.mp3",75,100) end end)
			
			timer.Simple(0.2,function() if IsValid(self) && IsValid(v) then
			self:FaceCertainEntity(v) end end)
			v:SetPersistent(true) 
			v:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

	self.MovementType = VJ_MOVETYPE_STATIONARY
	self.CanTurnWhileStationary = false
	self.infect = false
	self.DisableChasingEnemy = true
	self.DisableFindEnemy = true
	self.infect2 = false
	
	timer.Simple(8,function()
		if IsValid(self) && IsValid(v) then
			if IsValid(v) && v:GetClass() == "prop_ragdoll" &&
			v:GetClass() != "prop_physics" &&
			v:GetModel() != "models/combine_strider.mdl" &&
			v:GetModel() != "models/lamarr.mdl" &&
			v:GetModel() != "models/combine_scanner.mdl" &&
			v:GetModel() != "models/manhack.mdl" &&
			v:GetModel() != "models/antlion.mdl" &&
			v:GetModel() != "models/antlion_guard.mdl" &&
			v:GetModel() != "models/headcrabclassic.mdl" &&
			v:GetModel() != "models/headcrab.mdl" &&
			v:GetModel() != "models/headcrabblack.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			v:GetModel() != "models/zombie/classic_legs.mdl" &&
			v:GetModel() != "models/zombie/classic_torso.mdl" &&
			v:GetModel() != "models/humans/charple03.mdl" &&
			v:GetModel() != "models/combine_dropship.mdl" &&
			v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			v:GetModel() != "models/shield_scanner.mdl" &&
			v:GetModel() != "models/gunship.mdl" &&
			v:GetModel() != "models/hunter.mdl" &&
			v:GetModel() != "models/Humans/Charple02.mdl" &&
			v:GetModel() != "models/Humans/Charple01.mdl" &&
			v:GetModel() != "models/Humans/Charple04.mdl" &&
			v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			v:GetModel() != "models/dog.mdl" then
				v:Remove()

		local spawn = math.random(1,1)
			if spawn == 1 then
				self.sworm13 = ents.Create("npc_vj_bbohg_boner_dance")
				self.sworm13:SetPos(v:GetPos() + self:GetUp()*10)
				self.sworm13:SetAngles(self:GetAngles())
				self.sworm13:Spawn()
			-- timer.Simple(0.15,function() if IsValid(self) && IsValid(self.sworm13) then
				-- VJ_EmitSound(self,"boner/revived.mp3",35,88) end end)
				self.sworm13:VJ_ACT_PLAYACTIVITY("zombie_slump_rise_01",true,2.8,false)
				self.sworm13:Activate()
				self.sworm13:SetOwner(self)
				-- self.sworm13:HasEntitiesToNoCollide = true
				-- self.sworm13:EntitiesToNoCollide = {"npc_vj_bbohg_shadowwalker"}
			end
	end
end end)

	timer.Simple(8,function() if IsValid(self) then 
		self.infect = true
		self.DisableChasingEnemy = false
		self.DisableFindEnemy = false
	end end)
		timer.Simple(8,function() if IsValid(self) then 
		self.MovementType = VJ_MOVETYPE_GROUND
	end end)
	end
end
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if !self.HasWeapon == true && !self.HasLeapAttack == true then
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
    self:AddFlags(FL_NOTARGET)
end
-------------------------------------------------------------------------------------------------------------------
-- function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	-- if self.HasWeapon == true then
		-- if self.Crowbar == true then
			-- self:CreateGibEntity("prop_physics","models/weapons/w_crowbar.mdl",{Pos=self:LocalToWorld(Vector(0,-10,35)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-5,5)+self:GetForward()*math.Rand(-5,5)+self:GetUp()*math.Rand(-5,5)})
		-- else
			-- self:CreateGibEntity("prop_physics","models/props_canal/mattpipe.mdl",{Pos=self:LocalToWorld(Vector(0,-10,35)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-5,5)+self:GetForward()*math.Rand(-5,5)+self:GetUp()*math.Rand(-5,5)})
		-- end
	-- end
-- end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/