AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Humans/Group02/male_08.mdl"} 
ENT.StartHealth = 20000
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 0
ENT.FlinchChance = 3
ENT.NextFlinchTime = 1.5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_IdleStand = {"d1_t01_BreakRoom_WatchBreen"} -- The idle animation table when AI is enabled | DEFAULT: {ACT_IDLE}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_THEROCK"} 
ENT.BloodColor = "Oil"
ENT.HasWorldShakeOnMove = true
ENT.WorldShakeOnMoveAmplitude = 1
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDamage = math.Rand(499,599)
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.HasOnKilledEnemySound = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_cinderblock" -- The entity that is spawned when range attacking
	-- ====== Animation Variables ====== --
ENT.AnimTbl_RangeAttack = {"throw1"} -- Range Attack Animations
ENT.RangeAttackAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.RangeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the range attack animation?
ENT.RangeAttackAnimationDecreaseLengthAmount = 0 -- This will decrease the time until starts chasing again. Use it to fix animation pauses until it chases the enemy.
ENT.RangeAttackAnimationStopMovement = true -- Should it stop moving when performing a range attack?
	-- ====== Distance Variables ====== --
ENT.RangeDistance = 2000 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 200 -- How close does it have to be until it uses melee?
ENT.RangeAttackAngleRadius = 100 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
	-- ====== Timer Variables ====== --
	-- To use event-based attacks, set this to false:
ENT.TimeUntilRangeAttackProjectileRelease = 0.95 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 10 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
	-- To let the base automatically detect the attack duration, set this to false:
ENT.NextAnyAttackTime_Range = false -- How much time until it can use any attack again? | Counted in Seconds
ENT.NextAnyAttackTime_Range_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.RangeAttackReps = 1 -- How many times does it run the projectile code?
ENT.RangeAttackExtraTimers = nil -- Extra range attack timers, EX: {1, 1.4} | it will run the projectile code after the given amount of seconds
	-- ====== Projectile Spawn Position Variables ====== --
ENT.RangeUseAttachmentForPos = false -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.RangeAttackPos_Up = 100 -- Up/Down spawning position for range attack
ENT.RangeAttackPos_Forward = 0 -- Forward/Backward spawning position for range attack
ENT.RangeAttackPos_Right = 0 -- Right/Left spawning position for range attack
	-- ====== Control Variables ====== --
ENT.DisableRangeAttackAnimation = false -- if true, it will disable the animation code
ENT.DisableDefaultRangeAttackCode = false -- When true, it won't spawn the range attack entity, allowing you to make your own
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.LeapAttackDamage = math.Rand(499,599)
ENT.LeapAttackDamageType = DMG_CRUSH -- Type of Damage
	-- ====== Animation Variables ====== --
ENT.AnimTbl_LeapAttack = {"headcrabbed"} -- Melee Attack Animations
ENT.LeapAttackAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.LeapAttackAnimationFaceEnemy = 2 -- true = Face the enemy the entire time! | 2 = Face the enemy UNTIL it jumps! | false = Don't face the enemy AT ALL!
ENT.LeapAttackAnimationDecreaseLengthAmount = 8.5 -- This will decrease the time until starts chasing again. Use it to fix animation pauses until it chases the enemy.
	-- ====== Distance Variables ====== --
ENT.LeapDistance = 350 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapToMeleeDistance = 300 -- How close does it have to be until it uses melee?
ENT.LeapAttackDamageDistance = 40 -- How far does the damage go?
ENT.LeapAttackAngleRadius = 65 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
	-- ====== Timer Variables ====== --
	-- To use event-based attacks, set this to false:
ENT.TimeUntilLeapAttackDamage = 0.45 -- How much time until it runs the leap damage code?
ENT.TimeUntilLeapAttackVelocity = 0.1 -- How much time until it runs the velocity code?
ENT.NextLeapAttackTime = 3 -- How much time until it can use a leap attack?
ENT.NextLeapAttackTime_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
	-- To let the base automatically detect the attack duration, set this to false:
ENT.NextAnyAttackTime_Leap = false -- How much time until it can use any attack again? | Counted in Seconds
ENT.NextAnyAttackTime_Leap_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.LeapAttackReps = 1 -- How many times does it run the leap attack code?
ENT.LeapAttackExtraTimers = nil -- Extra leap attack timers, EX: {1, 1.4} | it will run the damage code after the given amount of seconds
ENT.StopLeapAttackAfterFirstHit = true -- Should it stop the leap attack from running rest of timers when it hits an enemy?
	-- ====== Velocity Variables ====== --
ENT.LeapAttackVelocityForward = 600 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 200 -- How much upward force should it apply?
ENT.LeapAttackVelocityRight = 0 -- How much right force should it apply?
	-- ====== Control Variables ====== --
ENT.DisableLeapAttackAnimation = false -- if true, it will disable the animation code
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.IsMedicSNPC = true
ENT.AnimTbl_Medic_GiveHealth = {"ThrowItem"}
ENT.Medic_TimeUntilHeal = 1
ENT.Medic_HealthAmount = math.Rand(200,250)
ENT.Medic_NextHealTime = VJ_Set(5, 10)
ENT.Medic_SpawnPropOnHeal = true
ENT.Medic_SpawnPropOnHealModel = "models/props_junk/cinderblock01a.mdl"
ENT.Medic_SpawnPropOnHealAttachment = "anim_attachment_LH"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 0.6
ENT.DeathAnimationChance = 1
ENT.AnimTbl_Death = {"preSkewer"} 
ENT.HasDeathRagdoll = false

ENT.FootStepSoundLevel = 70
ENT.MeleeAttackSoundLevel = 75
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95
ENT.IdleSoundChance = 5
ENT.CombatIdleSoundChance = 4
ENT.IdleSoundLevel = 45
ENT.CombatIdleSoundLevel = 60
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"physics/concrete/rock_impact_soft1.wav",
	"physics/concrete/rock_impact_soft2.wav",
	"physics/concrete/rock_impact_soft3.wav"}
ENT.SoundTbl_Idle = {}
ENT.SoundTbl_Alert = {}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_BeforeMeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {"physics/concrete/boulder_impact_hard1.wav",
	"physics/concrete/boulder_impact_hard2.wav",
	"physics/concrete/boulder_impact_hard3.wav",
	"physics/concrete/boulder_impact_hard4.wav",
	}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav","npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_MeleeAttackSlowPlayer = {}

ENT.SoundTbl_BeforeLeapAttack = {}
ENT.SoundTbl_LeapAttackJump = {"therock/slide.mp3"}
ENT.SoundTbl_LeapAttackDamage = {"physics/concrete/boulder_impact_hard1.wav",
	"physics/concrete/boulder_impact_hard2.wav",
	"physics/concrete/boulder_impact_hard3.wav",
	"physics/concrete/boulder_impact_hard4.wav"}
ENT.SoundTbl_LeapAttackDamageMiss = {}
ENT.SoundTbl_MedicBeforeHeal = {}
ENT.SoundTbl_MedicAfterHeal = {"physics/concrete/rock_impact_soft1.wav",
	"physics/concrete/rock_impact_soft2.wav",
	"physics/concrete/rock_impact_soft3.wav"}
ENT.SoundTbl_MedicReceiveHeal = {}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_Death = {"physics/concrete/concrete_break2.wav",
	"physics/concrete/concrete_break3.wav"}
ENT.HasSoundTrack = true 
ENT.SoundTbl_SoundTrack = {"music/Can't_Stop_The_Rock.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
	if GetConVarNumber("vj_BBOHG_ReasonableRock") == 1 then
		self.StartHealth = 5000
		self.LeapAttackDamage = math.Rand(15,20)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetMaterial("models/props_c17/column02a")
	self:SetModelScale(1.20)
	self:SetCollisionBounds(Vector(13, 13, 70), Vector(-13, -13, 0))
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
    if math.random(1,5) == 1 then
        self:PlaySoundSystem("Alert", {"therock/spawned.mp3"}) 	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()	
		if IsValid(self:GetEnemy()) then
			self.SoundTbl_FootStep = {"physics/concrete/concrete_impact_hard1.wav",
	"physics/concrete/concrete_impact_hard2.wav",
	"physics/concrete/concrete_impact_hard3.wav"}
	    else
		    self.SoundTbl_FootStep = {"physics/concrete/rock_impact_soft1.wav",
	"physics/concrete/rock_impact_soft2.wav",
	"physics/concrete/rock_impact_soft3.wav"}	
	end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local randattack_stand = math.random(1,8)

	if randattack_stand == 1 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackKnockBack_Forward1 = 5
		self.MeleeAttackKnockBack_Forward2 = 5
		self.MeleeAttackKnockBack_Up1 = 0
		self.MeleeAttackKnockBack_Up2 = 0
		
		if GetConVarNumber("vj_BBOHG_ReasonableRock") == 1 then
			self.MeleeAttackDamage = math.Rand(30,35)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = false
		end
		
	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackKnockBack_Forward1 = 5
		self.MeleeAttackKnockBack_Forward2 = 5
		self.MeleeAttackKnockBack_Up1 = 0
		self.MeleeAttackKnockBack_Up2 = 0
				
		if GetConVarNumber("vj_BBOHG_ReasonableRock") == 1 then
			self.MeleeAttackDamage = math.Rand(30,35)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = false
		end
		
	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackKnockBack_Forward1 = 5
		self.MeleeAttackKnockBack_Forward2 = 5
		self.MeleeAttackKnockBack_Up1 = 0
		self.MeleeAttackKnockBack_Up2 = 0
							
		if GetConVarNumber("vj_BBOHG_ReasonableRock") == 1 then
			self.MeleeAttackDamage = math.Rand(30,35)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = false
		end
		
	elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackKnockBack_Forward1 = 5
		self.MeleeAttackKnockBack_Forward2 = 5
		self.MeleeAttackKnockBack_Up1 = 0
		self.MeleeAttackKnockBack_Up2 = 0
						
		if GetConVarNumber("vj_BBOHG_ReasonableRock") == 1 then
			self.MeleeAttackDamage = math.Rand(30,35)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = false
		end
		
	elseif randattack_stand == 5 then
		self.AnimTbl_MeleeAttack = {"throw1"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackKnockBack_Forward1 = 20
		self.MeleeAttackKnockBack_Forward2 = 20
		self.MeleeAttackKnockBack_Up1 = 0
		self.MeleeAttackKnockBack_Up2 = 0
						
		if GetConVarNumber("vj_BBOHG_ReasonableRock") == 1 then
			self.MeleeAttackDamage = math.Rand(50,55)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = false
		end
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"ThrowItem"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackKnockBack_Forward1 = 20
		self.MeleeAttackKnockBack_Forward2 = 20
		self.MeleeAttackKnockBack_Up1 = 5
		self.MeleeAttackKnockBack_Up2 = 5
							
		if GetConVarNumber("vj_BBOHG_ReasonableRock") == 1 then
			self.MeleeAttackDamage = math.Rand(30,35)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 100
			self.MeleeAttackKnockBack_Forward2 = 100
			self.MeleeAttackKnockBack_Up1 = 150
			self.MeleeAttackKnockBack_Up2 = 160
		end
		
	elseif randattack_stand == 7 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackKnockBack_Forward1 = 40
		self.MeleeAttackKnockBack_Forward2 = 40
		self.MeleeAttackKnockBack_Up1 = 10
		self.MeleeAttackKnockBack_Up2 = 10
								
		if GetConVarNumber("vj_BBOHG_ReasonableRock") == 1 then
			self.MeleeAttackDamage = math.Rand(25,30)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 100
			self.MeleeAttackKnockBack_Forward2 = 100
			self.MeleeAttackKnockBack_Up1 = 70
			self.MeleeAttackKnockBack_Up2 = 60
		end
		
	elseif randattack_stand == 8 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackKnockBack_Forward1 = 40
		self.MeleeAttackKnockBack_Forward2 = 40
		self.MeleeAttackKnockBack_Up1 = 10
		self.MeleeAttackKnockBack_Up2 = 10
					
		if GetConVarNumber("vj_BBOHG_ReasonableRock") == 1 then
			self.MeleeAttackDamage = math.Rand(25,30)
			self.MeleeAttackDamageType = DMG_CLUB
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackKnockBack_Forward1 = 100
			self.MeleeAttackKnockBack_Forward2 = 100
			self.MeleeAttackKnockBack_Up1 = 70
			self.MeleeAttackKnockBack_Up2 = 60
		end
		
	end
	
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	local ene = self:GetEnemy()
		return self:CalculateProjectile("Curve", projectile:GetPos(), ene:GetPos() + ene:OBBCenter(), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
	timer.Simple(0.6,function() if IsValid(self) then

	VJ_EmitSound(self,{"physics/concrete/concrete_break2.wav",
	"physics/concrete/concrete_break3.wav"},100,math.random(100,100))
	self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})
	self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(0,10,50)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})
	self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(10,0,50)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})
	self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(0,0,40)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})
	self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(0,0,25)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})
	self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(0,0,5)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})

	end
end)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnChangeMovementType(movType)	
	if VJ_AnimationExists(self,ACT_JUMP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP)) end
	if VJ_AnimationExists(self,ACT_CLIMB_UP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB)) end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/